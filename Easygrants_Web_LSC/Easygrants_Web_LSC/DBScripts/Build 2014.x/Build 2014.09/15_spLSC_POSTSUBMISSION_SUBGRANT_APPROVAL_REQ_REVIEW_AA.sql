ALTER PROCEDURE [dbo].[spLSC_POSTSUBMISSION_SUBGRANT_APPROVAL_REQ_REVIEW_AA]
	@WfTaskAssignmentID INT  
AS

DECLARE @status_id INT, @success BIT, @status_message VARCHAR(250)

DECLARE 
	@grantee_project_id INT,
	@wf_task_id INT,
	@new_wf_task_id INT,
	@due_date DATETIME,
    @RegCompReviewTaskID INT,
	@wf_task_outcome_id INT


    SELECT @grantee_project_id = grantee_project_id
		,@wf_task_id = wf_task_id
		FROM WF_TASK_ASSIGNMENT
		WHERE wf_task_assignment_id = @WfTaskAssignmentID

	SET @new_wf_task_id = CASE WHEN @wf_task_id = 64 THEN 65 WHEN @wf_task_id = 104 THEN 109 END

	SELECT @due_date = oce_staff_review_due
		FROM vLSC_SUBGRANT_REVIEW_DUE_DATES
		WHERE grantee_project_id = @grantee_project_id

    SELECT @RegCompReviewTaskID = wf_task_assignment_id
		FROM WF_TASK_ASSIGNMENT
		WHERE grantee_project_id = @grantee_project_id and wf_task_id = @new_wf_task_id

    
-- If Regulatory Compliance review task does not exist then Create one

IF @RegCompReviewTaskID IS NULL
	BEGIN

	SELECT @wf_task_outcome_id = id
		FROM a_WF_TASK_OUTCOME
		WHERE task_id = @new_wf_task_id
			AND description = 'In Process'

	EXEC @RegCompReviewTaskID = getid_sel @table='WF_TASK_ASSIGNMENT',
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
		VALUES(@RegCompReviewTaskID,
			@new_wf_task_id,
			1,
			@wf_task_outcome_id,
			@grantee_project_id,
			@due_date,
			7, 
			7,
			getdate())
     END

 ELSE
  
     BEGIN

		UPDATE WF_TASK_ASSIGNMENT
			SET wf_task_status_id = 1
			WHERE wf_task_assignment_id = @RegCompReviewTaskID
     END


set @status_id = 1
set @success = 1
set @status_message = 'SUCCESS'

select @status_id As StatusID, @success as Success, @status_message As StatusMessage

