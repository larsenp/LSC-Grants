CREATE procedure [dbo].[spPRESUBMISSION_BUDGET_CHECK]
	(
		@WfTaskAssignmentID INT
	)
AS
set nocount on

	Declare @status_id int, @success bit, @status_message varchar(250)
	Declare @ReturnCode INT, @NewID int, @GranteeProjectID int, @budget_total money
	
	select @GranteeProjectID = grantee_project_id from WF_TASK_ASSIGNMENT where wf_task_assignment_id = @WfTaskAssignmentID
	select @budget_total = total 
		from budget where grantee_project_id = @GranteeProjectID

	IF @budget_total > 1000000
		BEGIN
			set @status_id = 0
			set @success = 0
			set @status_message = 'Budget total exceeds 1000000.'
			print @@ERROR
		END
	ELSE
		BEGIN
			set @status_id = 1
			set @success = 1
			set @status_message = 'Budget total is within the 1000000 limit.'
		END

	exec @ReturnCode = getid_sel @table = 'NOTES', @id = @NewID OUTPUT, @mode = 2
	insert into NOTES (id, entity_id, entity_type_id, subject) values (@NewID, @GranteeProjectID, 3, @status_message)


	select @status_id As StatusID, @success as Success, @status_message As StatusMessage