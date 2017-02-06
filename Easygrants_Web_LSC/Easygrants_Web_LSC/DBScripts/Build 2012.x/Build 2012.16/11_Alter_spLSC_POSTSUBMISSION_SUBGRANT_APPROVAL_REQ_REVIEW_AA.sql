ALTER PROCEDURE [dbo].[spLSC_POSTSUBMISSION_SUBGRANT_APPROVAL_REQ_REVIEW_AA]
	@WfTaskAssignmentID INT  
AS

DECLARE @status_id INT, @success BIT, @status_message VARCHAR(250)

DECLARE 
	@grantee_project_id INT,
    @new_id INT,
	@due_date DATETIME

   SELECT @grantee_project_id = grantee_project_id
	FROM WF_TASK_ASSIGNMENT
	WHERE wf_task_assignment_id = @WfTaskAssignmentID

	SELECT @due_date = oce_staff_review_due
		FROM vLSC_SUBGRANT_REVIEW_DUE_DATES
		WHERE grantee_project_id = @grantee_project_id

    --Create task assignment to Create the task for Regulatory Compliance
	EXEC @new_id = getid_sel @table='WF_TASK_ASSIGNMENT',
		@mode = 2

	INSERT WF_TASK_ASSIGNMENT
		(wf_task_assignment_id,
		wf_task_id,
		wf_task_status_id,
		wf_task_outcome_id,
		grantee_project_id,
		due_date,
		workgroup_id,
		wf_task_role_id,
		create_date)
		VALUES(@new_id,
			65,
			1,
			137,
			@grantee_project_id,
			@due_date,
			7, 
			7,
			getdate())




set @status_id = 1
set @success = 1
set @status_message = 'SUCCESS'

select @status_id As StatusID, @success as Success, @status_message As StatusMessage


