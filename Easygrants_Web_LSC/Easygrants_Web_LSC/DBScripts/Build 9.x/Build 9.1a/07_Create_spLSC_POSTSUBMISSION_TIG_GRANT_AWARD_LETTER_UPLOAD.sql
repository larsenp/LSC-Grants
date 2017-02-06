CREATE PROCEDURE [dbo].[spLSC_POSTSUBMISSION_TIG_GRANT_AWARD_LETTER_UPLOAD]
	@WfTaskAssignmentID INT

AS
UPDATE GRANTEE_PROJECT
	SET grant_status_id = 1
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
	WHERE wfta.wf_task_assignment_id = @WfTaskAssignmentID


UPDATE LSC_GRANTEE_PROJECT_TIG
	SET date_contr_recd = wfta.submitted_date
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN LSC_GRANTEE_PROJECT_TIG gpt ON wfta.grantee_project_id = gpt.grantee_project_id
	WHERE wfta.wf_task_assignment_id = @WfTaskAssignmentID

Declare @status_id int, @success bit, @status_message varchar(250)

set @status_id = 1
set @success = 1
set @status_message = 'SUCCESS'

