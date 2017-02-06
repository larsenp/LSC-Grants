set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go





--transfer grant budget data to task assignment for revision
ALTER PROCEDURE [dbo].[spLSC_XFER_TIG_BUDGET_TO_WFTA]
	@WfTaskAssignmentID INT --task assignment to which budget is being transferred

AS

Declare @GranteeProjectID int, @wfta_budget_id int, @gp_budget_id int, 
	@min_budget_item_id int, @new_budget_item_id int, @item_count int, 
    @confee_budget_item1 int, @confee_budget_item2 int, @confee_budget_item3 int, @confee_budget_item4 int

SELECT @GranteeProjectID = grantee_project_id
	FROM WF_TASK_ASSIGNMENT
	WHERE wf_task_assignment_id = @WfTaskAssignmentID

SELECT @gp_budget_id = lsc_tig_budget_id
	FROM LSC_TIG_BUDGET
	WHERE grantee_project_id = @GranteeProjectID
		AND lsc_tig_budget_type_id = 1

SELECT @wfta_budget_id = lsc_tig_budget_id
	FROM LSC_TIG_BUDGET
	WHERE wf_task_assignment_id = @WfTaskAssignmentID
		AND lsc_tig_budget_type_id = 1

BEGIN TRAN

    --If no WFTA budget exists, create it
	IF @wfta_budget_id IS NULL
	BEGIN

	--Create new budget
	EXEC @wfta_budget_id = getid_sel 
		@table='LSC_TIG_BUDGET',
		@mode = 2

	INSERT LSC_TIG_BUDGET
		(lsc_tig_budget_id,
		wf_task_assignment_id,
		lsc_tig_budget_type_id)
		VALUES(@wfta_budget_id,
			@WfTaskAssignmentID,
			1)
     END

	--Clear out existing budget items
	DELETE LSC_TIG_BUDGET_ITEM
		WHERE lsc_tig_budget_id = @wfta_budget_id


	--Find lowest budget item ID from GP budget - this will be used in setting IDs for new budget items
	SELECT @min_budget_item_id = MIN(lsc_tig_budget_item_id),
		@item_count = COUNT(*)
		FROM LSC_TIG_BUDGET_ITEM tbi
			WHERE lsc_tig_budget_id = @gp_budget_id

	--Assign a range of IDs for new budget items
	EXEC @new_budget_item_id = spGETID_RANGE_SEL
				@table = 'LSC_TIG_BUDGET_ITEM',
				@count = @item_count,
				@mode = 2

	--Create new budget items in WfTA budget based on grant budget
	INSERT INTO [LSC_TIG_BUDGET_ITEM]
			   ([lsc_tig_budget_item_id]
			   ,[lsc_tig_budget_id]
			   ,[lsc_tig_budget_line_id]
			   ,[lsc_tig_budget_funding_type_id]
			   ,[amount]
			   ,[comment])
		 SELECT
			   lsc_tig_budget_item_id - @min_budget_item_id + @new_budget_item_id
			   ,@wfta_budget_id
			   ,lsc_tig_budget_line_id
			   ,lsc_tig_budget_funding_type_id
			   ,amount
			   ,comment
			FROM LSC_TIG_BUDGET_ITEM
			WHERE lsc_tig_budget_id = @gp_budget_id

    --Correct s_ID_GEN table 
	EXEC spUPDATE_IDGEN @select = 0


	--Add budget items in WfTA budget for Conference_fee budget item.
    SELECT @confee_budget_item1 = lsc_tig_budget_item_id
		FROM LSC_TIG_BUDGET_ITEM
		WHERE lsc_tig_budget_id = @wfta_budget_id
				AND lsc_tig_budget_line_id = 16 
                AND lsc_tig_budget_funding_type_id = 1
  
      IF @confee_budget_item1 IS NULL 
	    BEGIN
           DECLARE @new_id1 INT
           EXEC @new_id1 = getid_sel @table='LSC_TIG_BUDGET_ITEM'
	
			INSERT [LSC_TIG_BUDGET_ITEM]
			   ([lsc_tig_budget_item_id]
			   ,[lsc_tig_budget_id]
			   ,[lsc_tig_budget_line_id]
			   ,[lsc_tig_budget_funding_type_id]
			   ,[amount])
			Values
			   (@new_id1
			   ,@wfta_budget_id
			   ,16
			   ,1
			   ,null)
          END



      SELECT @confee_budget_item2 = lsc_tig_budget_item_id
		FROM LSC_TIG_BUDGET_ITEM
		WHERE lsc_tig_budget_id = @wfta_budget_id
				AND lsc_tig_budget_line_id = 16 
                AND lsc_tig_budget_funding_type_id = 2
  
      IF @confee_budget_item2 IS NULL 
	    BEGIN
           DECLARE @new_id2 INT
           EXEC @new_id2 = getid_sel @table='LSC_TIG_BUDGET_ITEM'
	
			INSERT [LSC_TIG_BUDGET_ITEM]
			   ([lsc_tig_budget_item_id]
			   ,[lsc_tig_budget_id]
			   ,[lsc_tig_budget_line_id]
			   ,[lsc_tig_budget_funding_type_id]
			   ,[amount])
			Values
			   (@new_id2
			   ,@wfta_budget_id
			   ,16
			   ,2
			   ,null)
          END



	  SELECT @confee_budget_item3 = lsc_tig_budget_item_id
		FROM LSC_TIG_BUDGET_ITEM
		WHERE lsc_tig_budget_id = @wfta_budget_id
				AND lsc_tig_budget_line_id = 16 
                AND lsc_tig_budget_funding_type_id = 3
  
      IF @confee_budget_item3 IS NULL 
	    BEGIN
           DECLARE @new_id3 INT
           EXEC @new_id3 = getid_sel @table='LSC_TIG_BUDGET_ITEM'
	
			INSERT [LSC_TIG_BUDGET_ITEM]
			   ([lsc_tig_budget_item_id]
			   ,[lsc_tig_budget_id]
			   ,[lsc_tig_budget_line_id]
			   ,[lsc_tig_budget_funding_type_id]
			   ,[amount])
			Values
			   (@new_id3
			   ,@wfta_budget_id
			   ,16
			   ,3
			   ,null)
          END


      SELECT @confee_budget_item4 = lsc_tig_budget_item_id
		FROM LSC_TIG_BUDGET_ITEM
		WHERE lsc_tig_budget_id = @wfta_budget_id
				AND lsc_tig_budget_line_id = 16 
                AND lsc_tig_budget_funding_type_id = 4
  
      IF @confee_budget_item4 IS NULL 
	    BEGIN
           DECLARE @new_id4 INT
           EXEC @new_id4 = getid_sel @table='LSC_TIG_BUDGET_ITEM'
	
			INSERT [LSC_TIG_BUDGET_ITEM]
			   ([lsc_tig_budget_item_id]
			   ,[lsc_tig_budget_id]
			   ,[lsc_tig_budget_line_id]
			   ,[lsc_tig_budget_funding_type_id]
			   ,[amount])
			Values
			   (@new_id4
			   ,@wfta_budget_id
			   ,16
			   ,4
			   ,null)
          END
	

	--Copy contracts data to new task assignment
	EXEC spLSC_XFER_TIG_CONTRACTS_TO_WFTA @wf_task_assignment_id = @WfTaskAssignmentID

COMMIT TRAN

RETURN @wfta_budget_id










