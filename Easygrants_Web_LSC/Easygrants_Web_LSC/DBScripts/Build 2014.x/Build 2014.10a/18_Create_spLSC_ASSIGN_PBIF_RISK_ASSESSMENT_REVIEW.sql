set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go



CREATE  PROCEDURE [dbo].[spLSC_ASSIGN_PBIF_RISK_ASSESSMENT_REVIEW]
	 @WfTaskAssignmentID INT 

AS

DECLARE @status_id INT, @success BIT, @status_message VARCHAR(250)

DECLARE 
    @grantee_project_id INT,
    @risk_assessment_wfta_id INT,
    @primary_review_status INT,
    @secondary_review_status INT

   SELECT @grantee_project_id = grantee_project_id 
     FROM WF_TASK_ASSIGNMENT
     WHERE wf_task_assignment_id = @WfTaskAssignmentID

   SELECT @risk_assessment_wfta_id = wf_task_assignment_id
	FROM WF_TASK_ASSIGNMENT
	WHERE grantee_project_id = @grantee_project_id and wf_task_id = 110

	SELECT @primary_review_status = wf_task_status_id
	FROM WF_TASK_ASSIGNMENT
	WHERE grantee_project_id = @grantee_project_id and wf_task_id = 106

	SELECT @secondary_review_status = wf_task_status_id
	FROM WF_TASK_ASSIGNMENT
	WHERE grantee_project_id = @grantee_project_id and wf_task_id = 107

--Create task assignment for risk assessment review only if primary and secondary review
--status is completed and risk assessment task does not exist


IF @risk_assessment_wfta_id IS NULL

 BEGIN

   IF @primary_review_status = 2 and @secondary_review_status = 2

	BEGIN

		EXEC @risk_assessment_wfta_id = getid_sel @table='WF_TASK_ASSIGNMENT',
		@mode = 2

		INSERT WF_TASK_ASSIGNMENT
			(wf_task_assignment_id,
			wf_task_id,
			wf_task_status_id,
			wf_task_outcome_id,
			grantee_project_id,
			workgroup_id,
			wf_task_role_id,
			create_date)
		  VALUES (@risk_assessment_wfta_id,
			110,
			1,
			261,
			@grantee_project_id,
			11,
			7,
			getdate())

     END
  END




set @status_id = 1
set @success = 1
set @status_message = 'SUCCESS'

select @status_id As StatusID, @success as Success, @status_message As StatusMessage


