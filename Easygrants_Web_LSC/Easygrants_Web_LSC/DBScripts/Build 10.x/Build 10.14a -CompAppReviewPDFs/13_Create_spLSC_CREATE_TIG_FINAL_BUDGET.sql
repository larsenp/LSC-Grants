CREATE PROCEDURE spLSC_CREATE_TIG_FINAL_BUDGET
	(@wfta_id INT)

AS

DECLARE @gp_id INT,
	@final_budget_id INT,
	@prospective_budget_id INT,
	@rowcount INT,
	@new_id INT

--Check for existence of TIG final budget
SELECT @gp_id = grantee_project_id
	FROM WF_TASK_ASSIGNMENT	
	WHERE wf_task_assignment_id = @wfta_id

--If budget exists, quit
SELECT @final_budget_id = lsc_tig_budget_id
	FROM lsc_tig_budget
	WHERE grantee_project_id = @gp_id
		AND lsc_tig_budget_type_id = 2

IF @final_budget_id IS NOT NULL
	RETURN

--Create new budget
EXEC @final_budget_id = getid_sel @table = 'LSC_TIG_BUDGET'

INSERT INTO [LSC_TIG_BUDGET]
           ([lsc_tig_budget_id]
           ,[grantee_project_id]
           ,[lsc_tig_budget_type_id])
     VALUES
           (@final_budget_id
           ,@gp_id
           ,2)

--Create new budget items
CREATE TABLE #bi(
	ident int identity(0,1),
	[lsc_tig_budget_item_id] [int] NULL,
	[lsc_tig_budget_id] [int] NULL,
	[lsc_tig_budget_line_id] [int] NULL,
	[lsc_tig_budget_funding_type_id] [int] NULL,
	[amount] [int] NULL)

---Create new item for each current budget line
INSERT #bi(
	[lsc_tig_budget_id] ,
	[lsc_tig_budget_line_id] ,
	[lsc_tig_budget_funding_type_id])
	SELECT @final_budget_id,
		id,
		1
		FROM LSC_a_TIG_BUDGET_LINE
		WHERE end_date > getdate()
			OR end_date is null

---populate amount for conference fee from prospective budget
SELECT @prospective_budget_id = lsc_tig_budget_id
	FROM lsc_tig_budget
	WHERE grantee_project_id = @gp_id
		AND lsc_tig_budget_type_id = 1

IF @prospective_budget_id IS NOT NULL
	UPDATE #bi
		SET amount = bi.amount
		FROM LSC_TIG_BUDGET_ITEM bi
			JOIN LSC_TIG_BUDGET b ON bi.lsc_tig_budget_id = b.lsc_tig_budget_id
			JOIN #bi ON bi.lsc_tig_budget_line_id = #bi.lsc_tig_budget_line_id
		WHERE bi.lsc_tig_budget_line_id = 16
			AND b.lsc_tig_budget_id = @prospective_budget_id

--Set IDs and insert budget items
SELECT @rowcount = COUNT(*) 
	FROM #bi

EXEC spUpdate_IDGen @select = 0

EXEC @new_id = spGETID_RANGE_SEL
   @table = 'LSC_TIG_BUDGET_ITEM'
  ,@count = @rowcount
  ,@mode = 2

UPDATE #bi
	SET [lsc_tig_budget_item_id] = ident + @new_id

INSERT INTO [LSC_TIG_BUDGET_ITEM]
           ([lsc_tig_budget_item_id]
           ,[lsc_tig_budget_id]
           ,[lsc_tig_budget_line_id]
           ,[lsc_tig_budget_funding_type_id]
           ,[amount])
     SELECT lsc_tig_budget_item_id
           ,lsc_tig_budget_id
           ,lsc_tig_budget_line_id
           ,lsc_tig_budget_funding_type_id
           ,amount
	FROM #bi
