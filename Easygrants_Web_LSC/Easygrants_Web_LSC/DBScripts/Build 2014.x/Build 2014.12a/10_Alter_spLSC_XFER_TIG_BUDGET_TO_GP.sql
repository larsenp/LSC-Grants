set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

--transfer revised grant budget data from task assignment back to grant
ALTER PROCEDURE [dbo].[spLSC_XFER_TIG_BUDGET_TO_GP]
	@WfTaskAssignmentID INT --task assignment in which budget data was revised

AS

Declare @ReturnCode INT, @NewID int, @GranteeProjectID int, @wfta_budget_id int, @gp_budget_id int,  @Year int, @min_budget_item_id int,
	@new_budget_item_id int, @item_count int, @lsc_tig_budget_type_id int

SELECT @GranteeProjectID = grantee_project_id
	FROM WF_TASK_ASSIGNMENT
	WHERE wf_task_assignment_id = @WfTaskAssignmentID

SELECT @Year = tp.abbr
   FROM GRANTEE_PROJECT gp 
      JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
      JOIN c_TIME_PERIOD tp ON wfp.time_period_id = tp.id
   WHERE grantee_project_id = @GranteeProjectID

SELECT @wfta_budget_id = lsc_tig_budget_id,
	@lsc_tig_budget_type_id = lsc_tig_budget_type_id
	FROM LSC_TIG_BUDGET
	WHERE wf_task_assignment_id = @WfTaskAssignmentID

SELECT @gp_budget_id = lsc_tig_budget_id
	FROM LSC_TIG_BUDGET
	WHERE grantee_project_id = @GranteeProjectID
		AND lsc_tig_budget_type_id = @lsc_tig_budget_type_id

IF @Year > 2013 
BEGIN

BEGIN TRAN

	--If no grant budget exists, create it
	IF @gp_budget_id IS NULL
	BEGIN

		EXEC @gp_budget_id = getid_sel 
			@table='LSC_TIG_BUDGET',
			@mode = 2

		INSERT LSC_TIG_BUDGET
			(lsc_tig_budget_id,
			grantee_project_id,
			lsc_tig_budget_type_id)
			VALUES(@gp_budget_id,
				@GranteeProjectID,
				@lsc_tig_budget_type_id)

	END

	--Clear out existing budget items
	DELETE LSC_TIG_BUDGET_ITEM
		WHERE lsc_tig_budget_id = @gp_budget_id

	--Find lowest budget item ID from WfTA budget - this will be used in setting IDs for new budget items
	--NOTE: This methodology can cause problems if existing budget items do not have contiguous IDs. Needs to be fixed.
/*	SELECT @min_budget_item_id = MIN(lsc_tig_budget_item_id),
		@item_count = COUNT(*)
		FROM LSC_TIG_BUDGET_ITEM tbi
			WHERE lsc_tig_budget_id = @wfta_budget_id*/

	--Create temp table for budget items
	CREATE TABLE #tbi
		(ident int identity(0,1)
		,lsc_tig_budget_item_id int
		,lsc_tig_budget_id int
		,lsc_tig_budget_line_id int
		,budget_category_id int
		,lsc_tig_budget_funding_type_id int
		,amount int
		,comment varchar(max))

	--Create new budget items in grant budget based on WfTA budget
	INSERT INTO #tbi
			   ([lsc_tig_budget_id]
			   ,[lsc_tig_budget_line_id]
				,budget_category_id
			   ,[lsc_tig_budget_funding_type_id]
			   ,[amount]
			   ,[comment])
		 SELECT
			   @gp_budget_id
			   ,lsc_tig_budget_line_id
				,budget_category_id
			   ,lsc_tig_budget_funding_type_id
			   ,amount
			   ,comment
			FROM LSC_TIG_BUDGET_ITEM
			WHERE lsc_tig_budget_id = @wfta_budget_id

	SELECT @item_count = COUNT(*)
		FROM #tbi
	
	--Assign a range of IDs for new budget items
	EXEC @new_budget_item_id = spGETID_RANGE_SEL
				@table = 'LSC_TIG_BUDGET_ITEM',
				@count = @item_count,
				@mode = 2

	UPDATE #tbi
		SET lsc_tig_budget_item_id = ident + @new_budget_item_id

	--Create new budget items in grant budget based on WfTA budget
	INSERT INTO [LSC_TIG_BUDGET_ITEM]
			   (lsc_tig_budget_item_id
				,[lsc_tig_budget_id]
			   ,[lsc_tig_budget_line_id]
				,budget_category_id
			   ,[lsc_tig_budget_funding_type_id]
			   ,[amount]
			   ,[comment])
		 SELECT
			   lsc_tig_budget_item_id
				,[lsc_tig_budget_id]
			   ,[lsc_tig_budget_line_id]
				,budget_category_id
			   ,[lsc_tig_budget_funding_type_id]
			   ,[amount]
			   ,[comment]
			FROM #tbi

	--Copy updated contracts data to grant file
	EXEC spLSC_XFER_TIG_CONTRACTS_TO_GRANT @wf_task_assignment_id = @WfTaskAssignmentID

	--Correct s_ID_GEN table (see NOTE above)
	EXEC spUPDATE_IDGEN @select = 0
COMMIT TRAN

 END 

ELSE 
 BEGIN

BEGIN TRAN

	--If no grant budget exists, create it
	IF @gp_budget_id IS NULL
	BEGIN

		EXEC @gp_budget_id = getid_sel 
			@table='LSC_TIG_BUDGET',
			@mode = 2

		INSERT LSC_TIG_BUDGET
			(lsc_tig_budget_id,
			grantee_project_id,
			lsc_tig_budget_type_id)
			VALUES(@gp_budget_id,
				@GranteeProjectID,
				@lsc_tig_budget_type_id)

	END

	--Clear out existing budget items
	DELETE LSC_TIG_BUDGET_ITEM
		WHERE lsc_tig_budget_id = @gp_budget_id

	--Find lowest budget item ID from WfTA budget - this will be used in setting IDs for new budget items
	--NOTE: This methodology can cause problems if existing budget items do not have contiguous IDs. Needs to be fixed.
	SELECT @min_budget_item_id = MIN(lsc_tig_budget_item_id),
		@item_count = COUNT(*)
		FROM LSC_TIG_BUDGET_ITEM tbi
			WHERE lsc_tig_budget_id = @wfta_budget_id

	--Assign a range of IDs for new budget items
	EXEC @new_budget_item_id = spGETID_RANGE_SEL
				@table = 'LSC_TIG_BUDGET_ITEM',
				@count = @item_count,
				@mode = 2

	--Create new budget items in grant budget based on WfTA budget
	INSERT INTO [LSC_TIG_BUDGET_ITEM]
			   ([lsc_tig_budget_item_id]
			   ,[lsc_tig_budget_id]
			   ,[lsc_tig_budget_line_id]
			   ,[lsc_tig_budget_funding_type_id]
			   ,[amount]
			   ,[comment])
		 SELECT
			   lsc_tig_budget_item_id - @min_budget_item_id + @new_budget_item_id
			   ,@gp_budget_id
			   ,lsc_tig_budget_line_id
			   ,lsc_tig_budget_funding_type_id
			   ,amount
			   ,comment
			FROM LSC_TIG_BUDGET_ITEM
			WHERE lsc_tig_budget_id = @wfta_budget_id

	--Copy updated contracts data to grant file
	EXEC spLSC_XFER_TIG_CONTRACTS_TO_GRANT @wf_task_assignment_id = @WfTaskAssignmentID

	--Correct s_ID_GEN table (see NOTE above)
	EXEC spUPDATE_IDGEN @select = 0
COMMIT TRAN

END