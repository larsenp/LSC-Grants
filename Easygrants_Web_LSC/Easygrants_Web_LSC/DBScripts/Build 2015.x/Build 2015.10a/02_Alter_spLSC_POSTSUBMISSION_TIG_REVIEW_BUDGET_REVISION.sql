ALTER PROCEDURE [dbo].[spLSC_POSTSUBMISSION_TIG_REVIEW_BUDGET_REVISION]
	@WfTaskAssignmentID INT

AS

Declare @status_id int, @success bit, @status_message varchar(250)

--Transfer updated budget info to the grant file
EXEC spLSC_XFER_TIG_BUDGET_TO_GP @WfTaskAssignmentID = @WfTaskAssignmentID

DECLARE @grant_status_id INT

SELECT @grant_status_id = gp.grant_status_id
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id

--If this is an active grant, there's nothing more to do.
IF @grant_status_id = 1
BEGIN
	set @status_id = 1
	set @success = 1
	set @status_message = 'SUCCESS'

	select @status_id As StatusID, @success as Success, @status_message As StatusMessage
	RETURN
END


--Check to see if GAP has also been generated
DECLARE @gap_wfta_id int

SET @gap_wfta_id = 0

SELECT @gap_wfta_id = wfta_gap.wf_task_assignment_id
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN WF_TASK_ASSIGNMENT wfta_gap on wfta_gap.grantee_project_id = wfta.grantee_project_id
			AND wfta_gap.wf_task_id = 62
	WHERE wfta.wf_task_assignment_id = @WfTaskAssignmentID

IF @gap_wfta_id = 0
BEGIN

	--Check to see if payment schedule revision has also been submitted
	DECLARE @payment_wfta_id int

	SET @payment_wfta_id = 0

	SELECT @payment_wfta_id = wfta_payment.wf_task_assignment_id
		FROM WF_TASK_ASSIGNMENT wfta_budget
			JOIN WF_TASK_ASSIGNMENT wfta_payment on wfta_budget.grantee_project_id = wfta_payment.grantee_project_id
				AND wfta_payment.wf_task_id = 59
				AND wfta_payment.wf_task_status_id = 2
		WHERE wfta_budget.wf_task_assignment_id = @WfTaskAssignmentID

	--If so, create task assignment to review grant award package and generate package.
	IF @payment_wfta_id > 0
	BEGIN
		DECLARE @easygrants_user_id int, @grantee_project_id int

		SELECT @grantee_project_id = wfta.grantee_project_id,
			@easygrants_user_id = eu.easygrants_user_id
			FROM EASYGRANTS_USER eu
				JOIN WF_TASK_ASSIGNMENT wfta ON eu.person_id = wfta.person_id
			WHERE wfta.wf_task_assignment_id = @WfTaskAssignmentID

		EXEC spLSC_GENERATE_TIG_GRANT_AWARD_PACKAGE
			@grantee_project_id ,
			@easygrants_user_id 
	END
END

set @status_id = 1
set @success = 1
set @status_message = 'SUCCESS'

select @status_id As StatusID, @success as Success, @status_message As StatusMessage


RETURN

