/****** Object:  StoredProcedure [dbo].[spLSC_XFER_TIG_BUDGET_TO_WFTA]    Script Date: 05/23/2012 16:33:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--transfer grant budget data to task assignment for revision
ALTER PROCEDURE [dbo].[spLSC_XFER_TIG_BUDGET_TO_WFTA]
	@WfTaskAssignmentID INT --task assignment to which budget is being transferred

AS

Declare @GranteeProjectID int, @wfta_budget_id int, @gp_budget_id int, 
	@min_budget_item_id int, @new_budget_item_id int, @item_count int

SELECT @GranteeProjectID = grantee_project_id
	FROM WF_TASK_ASSIGNMENT
	WHERE wf_task_assignment_id = @WfTaskAssignmentID

SELECT @gp_budget_id = lsc_tig_budget_id
	FROM LSC_TIG_BUDGET
	WHERE grantee_project_id = @GranteeProjectID
		AND lsc_tig_budget_type_id = 1

BEGIN TRAN

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

	--Copy contracts data to new task assignment
	EXEC spLSC_XFER_TIG_CONTRACTS_TO_WFTA @wf_task_assignment_id = @WfTaskAssignmentID

COMMIT TRAN

RETURN @wfta_budget_id

