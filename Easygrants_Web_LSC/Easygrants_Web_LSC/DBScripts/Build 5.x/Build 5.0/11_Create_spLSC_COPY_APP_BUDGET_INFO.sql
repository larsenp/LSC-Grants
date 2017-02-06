/****** Object:  StoredProcedure [dbo].[spLSC_COPY_APP_BUDGET_INFO]    Script Date: 03/17/2009 15:31:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLSC_COPY_APP_BUDGET_INFO]
	(@wf_task_assignment_id INT)

AS

SET NOCOUNT ON

DECLARE @grantee_project_id INT,
	@task_id INT,
	@award_term_id INT,
	@prev_wfta_id INT, 
	@prev_task_id INT,
	@prev_grantee_project_id INT,
	@prev_project_id INT,
	@new_project_id INT,
	@new_budget_type_id INT,
	@budget_id INT,
	@prev_budget_period_id INT,
	@new_budget_period_id INT

SELECT @grantee_project_id = grantee_project_id,
	@task_id = wf_task_id,
	@award_term_id = award_term_id
	FROM WF_TASK_ASSIGNMENT
	WHERE wf_task_assignment_id = @wf_task_assignment_id

IF @task_id = 2
	SET @new_budget_type_id = 1

IF @task_id = 4
	SET @new_budget_type_id = 2

SET @prev_wfta_id = [dbo].[fnLSCPrevYearAppWfTAID] (@wf_task_assignment_id)

IF @prev_wfta_id IS NULL
	RETURN

SELECT @prev_task_id = wf_task_id,
	@prev_grantee_project_id = grantee_project_id
	FROM WF_TASK_ASSIGNMENT
	WHERE wf_task_assignment_id = @prev_wfta_id

SELECT @new_project_id = wf_project_id
	FROM GRANTEE_PROJECT
	WHERE grantee_project_id = @grantee_project_id

IF @prev_grantee_project_id = @grantee_project_id
	SET @prev_project_id = @new_project_id
ELSE
	SELECT @prev_project_id = wf_project_id
		FROM GRANTEE_PROJECT
		WHERE grantee_project_id = @prev_grantee_project_id

IF @prev_task_id <> @task_id
BEGIN
	--Create new budget for this grantee project with type set according to current task; set @budget_id to ID of new budget
	EXEC @budget_id = getid_sel @table = 'BUDGET', @mode = 2

	INSERT BUDGET
		(budget_id,
		budget_type_id,
		grantee_project_id)
		VALUES(@budget_id,
			@new_budget_type_id,
			@grantee_project_id)
END
ELSE
BEGIN
	--retrieve existing renewal budget and set @budget_id from that
	SELECT @budget_id = budget_id
		FROM BUDGET
		WHERE grantee_project_id = @grantee_project_id
		AND budget_type_id = @new_budget_type_id
END

--Get previous budget period using vLSC_WFTA_BUDGET_PERIOD
SELECT @prev_budget_period_id = budget_period_id
	FROM vLSC_WFTA_BUDGET_PERIOD
	WHERE wf_task_assignment_id = @prev_wfta_id

--Create new budget period
EXEC @new_budget_period_id = getid_sel @table = 'BUDGET_PERIOD', @mode = 2

INSERT BUDGET_PERIOD
	(budget_period_id,
	budget_id,
	budget_period_name,
	budget_period_name_id,
	budget_period_description,
	budget_year,
	budget_period_description_id)
	VALUES(@new_budget_period_id,
		@budget_id,
		'Budget Period ' + CAST(@award_term_id AS VARCHAR(1)),
		@award_term_id,
		'Budget Period ' + CAST(@award_term_id AS VARCHAR(1)),
		'Year ' + CAST(@award_term_id AS VARCHAR(1)),
		@award_term_id)

	
--Copy budget items from previous to new budget period (including LSC_BUDGET_ITEM).

-- --Create temp table for budget items
CREATE TABLE #bi(
	ident int identity (0,1),
	prev_budget_item_id int ,
	new_budget_item_id int ,
	budget_period_id int  ,
	prev_budget_category_id int ,
	new_budget_category_id int ,
	amount float ,
	grantee_project_id int ,
	notes varchar(7000) ,
	category_type_id int ,
	create_user int ,
	create_date datetime ,
	modify_user int ,
	modify_date datetime )

-- --Insert rows from previous budget period
INSERT #bi
	(prev_budget_item_id ,
	budget_period_id ,
	prev_budget_category_id ,
	amount ,
	grantee_project_id ,
	notes  ,
	category_type_id ,
	create_date )
	SELECT budget_item_id ,
		@new_budget_period_id ,
		budget_category_id ,
		amount ,
		grantee_project_id ,
		notes  ,
		category_type_id,
		GETDATE()
	FROM BUDGET_ITEM
		WHERE budget_period_id = @prev_budget_period_id

-- --Set new budget category ID
IF @prev_grantee_project_id = @grantee_project_id
	--If this is not a new grantee project, budget category IDs have not changed
	UPDATE #bi
		SET new_budget_category_id = prev_budget_category_id

ELSE
BEGIN
	--For new grantee projects, set budget category IDs starting with top-level category
	UPDATE #bi
		SET new_budget_category_id = bcn.budget_category_id
		FROM #bi
			JOIN a_BUDGET_CATEGORY bcp ON #bi.prev_budget_category_id = bcp.budget_category_id
			JOIN a_BUDGET_CATEGORY bcn ON bcp.parent_id = bcn.parent_id
				AND bcn.parent_id = 0
				AND bcn.project_id = @new_project_id

	
	UPDATE #bi
		SET new_budget_category_id = bcn.budget_category_id
		FROM #bi
			JOIN a_BUDGET_CATEGORY bcp ON #bi.prev_budget_category_id = bcp.budget_category_id
			JOIN a_BUDGET_CATEGORY bcp_p ON bcp.parent_id = bcp_p.budget_category_id
				AND bcp_p.parent_id = 0
			JOIN a_BUDGET_CATEGORY bcn_p ON bcp_p.parent_id = bcn_p.parent_id
				AND bcn_p.project_id = @new_project_id
			JOIN a_BUDGET_CATEGORY bcn ON bcn_p.budget_category_id = bcn.parent_id
				AND bcn.category_type_id = bcp.category_type_id
				AND bcn.sort_order = bcp.sort_order
			
	UPDATE #bi
		SET new_budget_category_id = bcn.budget_category_id
		FROM #bi
			JOIN a_BUDGET_CATEGORY bcp ON #bi.prev_budget_category_id = bcp.budget_category_id
			JOIN a_BUDGET_CATEGORY bcp_p ON bcp.parent_id = bcp_p.budget_category_id
			JOIN a_BUDGET_CATEGORY bcp_gp ON bcp_p.parent_id = bcp_gp.budget_category_id
				AND bcp_gp.parent_id = 0
			JOIN a_BUDGET_CATEGORY bcn_gp ON bcp_gp.parent_id = bcn_gp.parent_id
				AND bcn_gp.project_id = @new_project_id
			JOIN a_BUDGET_CATEGORY bcn_p ON bcn_gp.budget_category_id = bcn_p.parent_id
				AND bcn_p.category_type_id = bcp_p.category_type_id
				AND bcn_p.sort_order = bcp_p.sort_order
			JOIN a_BUDGET_CATEGORY bcn ON bcn_p.budget_category_id = bcn.parent_id
				AND bcn.category_type_id = bcp.category_type_id
				AND bcn.sort_order = bcp.sort_order
			
	UPDATE #bi
		SET new_budget_category_id = bcn.budget_category_id
		FROM #bi
			JOIN a_BUDGET_CATEGORY bcp ON #bi.prev_budget_category_id = bcp.budget_category_id
			JOIN a_BUDGET_CATEGORY bcp_p ON bcp.parent_id = bcp_p.budget_category_id
			JOIN a_BUDGET_CATEGORY bcp_gp ON bcp_p.parent_id = bcp_gp.budget_category_id
			JOIN a_BUDGET_CATEGORY bcp_ggp ON bcp_gp.parent_id = bcp_ggp.budget_category_id
				AND bcp_ggp.parent_id = 0
			JOIN a_BUDGET_CATEGORY bcn_ggp ON bcp_ggp.parent_id = bcn_ggp.parent_id
				AND bcn_ggp.project_id = @new_project_id
			JOIN a_BUDGET_CATEGORY bcn_gp ON bcn_ggp.budget_category_id = bcn_gp.parent_id
				AND bcn_gp.category_type_id = bcp_gp.category_type_id
				AND bcn_gp.sort_order = bcp_gp.sort_order
			JOIN a_BUDGET_CATEGORY bcn_p ON bcn_gp.budget_category_id = bcn_p.parent_id
				AND bcn_p.category_type_id = bcp_p.category_type_id
				AND bcn_p.sort_order = bcp_p.sort_order
			JOIN a_BUDGET_CATEGORY bcn ON bcn_p.budget_category_id = bcn.parent_id
				AND bcn.category_type_id = bcp.category_type_id
				AND bcn.sort_order = bcp.sort_order
			

END

--Get IDs from the ID generation table and set in temp table. This will allow insertion into the actual data table.			
DECLARE @rowcount int, @first_new_id int

SELECT @rowcount = count(*) FROM #bi

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'BUDGET_ITEM', @count = @rowcount, @mode = 2

UPDATE #bi
	SET new_budget_item_id = ident + @first_new_id

-- --Create temp table for LSC_BUDGET_ITEM
CREATE TABLE #lbi(
	ident int identity(0,1),
	lsc_budget_item_id int ,
	budget_item_id int ,
	lsc_expenditures float ,
	non_lsc_expenditures float )

INSERT #lbi
	(budget_item_id ,
	lsc_expenditures ,
	non_lsc_expenditures )
	SELECT #bi.new_budget_item_id,
		lbi.lsc_expenditures ,
		lbi.non_lsc_expenditures 
	FROM LSC_BUDGET_ITEM lbi
		JOIN #bi ON #bi.prev_budget_item_id = lbi.budget_item_id

--Get IDs from the ID generation table and set in temp table. This will allow insertion into the actual data table.			
SELECT @rowcount = count(*) FROM #lbi

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'LSC_BUDGET_ITEM', @count = @rowcount, @mode = 2

UPDATE #lbi
	SET lsc_budget_item_id = ident + @first_new_id

-- --Insert rows to BUDGET_ITEM

INSERT BUDGET_ITEM
	(budget_item_id,
	budget_period_id,
	budget_category_id,
	amount,
	grantee_project_id,
	notes,
	category_type_id,
	create_date)
	SELECT new_budget_item_id ,
		budget_period_id ,
		new_budget_category_id ,
		amount ,
		grantee_project_id ,
		notes  ,
		category_type_id ,
		GETDATE()
		FROM #bi

-- --Insert rows to LSC_BUDGET_ITEM
INSERT LSC_BUDGET_ITEM(
	lsc_budget_item_id,
	budget_item_id,
	lsc_expenditures,
	non_lsc_expenditures)
	SELECT lsc_budget_item_id ,
		budget_item_id ,
		lsc_expenditures ,
		non_lsc_expenditures
		FROM #lbi

