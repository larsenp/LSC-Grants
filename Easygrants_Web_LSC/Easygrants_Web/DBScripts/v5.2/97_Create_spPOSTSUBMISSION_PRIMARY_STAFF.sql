CREATE procedure [dbo].[spPOSTSUBMISSION_PRIMARY_STAFF]
	(
		@WfTaskAssignmentID INT
	)
AS
set nocount on

	Declare @status_id int, @success bit, @status_message varchar(250)
	Declare @ReturnCode INT, @NewID int, @GranteeProjectID int, @name_last varchar(100)
	
	select @name_last = name_last from person p inner join WF_TASK_ASSIGNMENT wta on p.person_id  = wta.person_id
		where wf_task_assignment_id = @WfTaskAssignmentID

	select @GranteeProjectID = grantee_project_id from WF_TASK_ASSIGNMENT where wf_task_assignment_id = @WfTaskAssignmentID
	print @name_last
	print @GranteeProjectID
	IF CharIndex('a', lower(@name_last), 0) = 0
		BEGIN
			set @status_id = 0
			set @success = 0
			set @status_message = 'Last name does not contain a.'
		END
	ELSE
		BEGIN
			-- make altum admin primary staff person
			update GRANTEE_PROJECT_STAFF_AFFILIATION set is_primary = 0 where grantee_project_id = @GranteeProjectID
			if exists (select * from GRANTEE_PROJECT_STAFF_AFFILIATION where grantee_project_id = @GranteeProjectID
				and person_id = 1)
				BEGIN
					update GRANTEE_PROJECT_STAFF_AFFILIATION set is_primary = 1 
						where grantee_project_id = @GranteeProjectID and person_id = 1
				END
			else
				BEGIN
					exec @ReturnCode = getid_sel @table = 'GRANTEE_PROJECT_STAFF_AFFILIATION', @id = @NewID OUTPUT, @mode = 2
					insert into GRANTEE_PROJECT_STAFF_AFFILIATION (staff_affiliation_id, grantee_project_id, person_id, affiliation_type_id, is_primary)
						values (@NewID, @GranteeProjectID, 1, 2, 1)
				END
			set @status_id = 1
			set @success = 1
			set @status_message = 'Last name contains a.'
		END

	exec @ReturnCode = getid_sel @table = 'NOTES', @id = @NewID OUTPUT, @mode = 2
	insert into NOTES (id, entity_id, entity_type_id, subject) values (@NewID, @GranteeProjectID, 3, @status_message)


	select @status_id As StatusID, @success as Success, @status_message As StatusMessage