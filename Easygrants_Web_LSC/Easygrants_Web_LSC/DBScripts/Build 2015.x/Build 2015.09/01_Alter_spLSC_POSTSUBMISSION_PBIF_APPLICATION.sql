ALTER PROCEDURE [dbo].[spLSC_POSTSUBMISSION_PBIF_APPLICATION]
	@WfTaskAssignmentID INT

AS

Declare @status_id int, @success bit, @status_message varchar(250)
Declare @title Varchar(max), @description varchar(max) , @grantee_project_id int

SELECT @title = LBP.project_title , @description = LBP.exec_summary , @grantee_project_id = WFTA.grantee_project_id  
FROM LSC_PBIF_APP LBP LEFT JOIN WF_TASK_ASSIGNMENT WFTA ON WFTA.wf_task_assignment_id = LBP.wf_task_assignment_id
WHERE LBP.wf_task_assignment_id = @WfTaskAssignmentID

-- Update the Project Title and Project Description from the application task fields 
UPDATE GRANTEE_PROJECT SET grant_title = @title , grant_description = @description WHERE grantee_project_id = @grantee_project_id

-- Create/reopen eligibility review task assignment
EXEC spLSC_ASSIGN_PBIF_ELIGIBILITY_REVIEW
	@grantee_project_id = @grantee_project_id

set @status_id = 1
set @success = 1
set @status_message = 'SUCCESS'

select @status_id As StatusID, @success as Success, @status_message As StatusMessage
