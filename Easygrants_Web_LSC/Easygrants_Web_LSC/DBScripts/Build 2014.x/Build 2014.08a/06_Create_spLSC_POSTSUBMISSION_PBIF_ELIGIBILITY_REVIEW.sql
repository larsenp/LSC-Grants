CREATE PROCEDURE [dbo].[spLSC_POSTSUBMISSION_PBIF_ELIGIBILITY_REVIEW]
	@WfTaskAssignmentID INT

AS

Declare @status_id int, @success bit, @status_message varchar(250)

UPDATE GRANTEE_PROJECT
	SET grant_status_id = 8
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN GRANTEE_PROJECT gp on wfta.grantee_project_id = gp.grantee_project_id
	WHERE wfta.wf_task_assignment_id = @WfTaskAssignmentID
		AND wfta.wf_task_outcome_id = 240

set @status_id = 1
set @success = 1
set @status_message = 'SUCCESS'

select @status_id As StatusID, @success as Success, @status_message As StatusMessage
