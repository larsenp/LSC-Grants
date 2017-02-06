--transfer WfTA budget data to grant budget on submission
CREATE PROCEDURE [dbo].[spLSC_POSTSUBMISSION_TIG_BUDGET]
	@WfTaskAssignmentID INT

AS

Declare @status_id int, @success bit, @status_message varchar(250)
Declare @ReturnCode INT, @NewID int, @GranteeProjectID int, @wfta_budget_id int, @gp_budget_id int, 
	@min_budget_item_id int, @new_budget_item_id int, @item_count int

SELECT @GranteeProjectID = grantee_project_id
	FROM WF_TASK_ASSIGNMENT
	WHERE wf_task_assignment_id = @WfTaskAssignmentID

SELECT @wfta_budget_id = lsc_tig_budget_id
	FROM LSC_TIG_BUDGET
	WHERE wf_task_assignment_id = @WfTaskAssignmentID

SELECT @gp_budget_id = lsc_tig_budget_id
	FROM LSC_TIG_BUDGET
	WHERE grantee_project_id = @GranteeProjectID

BEGIN TRAN

	--If no grant budget exists, create it
	IF @gp_budget_id IS NULL
	BEGIN

		EXEC @gp_budget_id = getid_sel 
			@table='LSC_TIG_BUDGET',
			@mode = 2

		INSERT LSC_TIG_BUDGET
			(lsc_tig_budget_id,
			grantee_project_id)
			VALUES(@gp_budget_id,
				@GranteeProjectID)

	END

	--Clear out existing budget items
	DELETE LSC_TIG_BUDGET_ITEM
		WHERE lsc_tig_budget_id = @gp_budget_id

	--Find lowest budget item ID from WfTA budget - this will be used in setting IDs for new budget items
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

COMMIT TRAN

set @status_id = 1
set @success = 1
set @status_message = 'SUCCESS'

select @status_id As StatusID, @success as Success, @status_message As StatusMessage

