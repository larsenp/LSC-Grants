CREATE PROCEDURE [dbo].[spLSC_POSTSUBMISSION_TIG_REVIEW_GRANT_AWARD_PACKAGE]
	@WfTaskAssignmentID INT

AS

UPDATE LSC_GRANTEE_PROJECT_TIG
	SET date_notified = wfta.submitted_date
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN LSC_GRANTEE_PROJECT_TIG gpt ON wfta.grantee_project_id = gpt.grantee_project_id
	WHERE wfta.wf_task_assignment_id = @WfTaskAssignmentID

Declare @status_id int, @success bit, @status_message varchar(250)

set @status_id = 1
set @success = 1
set @status_message = 'SUCCESS'

select @status_id As StatusID, @success as Success, @status_message As StatusMessage
