/****** Object:  StoredProcedure [dbo].[spLSC_POSTSUBMISSION_TIG_REVIEW_BUDGET_REVISION]    Script Date: 04/11/2012 09:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--transfer WfTA budget data to grant budget on submission
CREATE PROCEDURE [dbo].[spLSC_POSTSUBMISSION_TIG_APPLICATION]
	@WfTaskAssignmentID INT

AS

Declare @status_id int, @success bit, @status_message varchar(250)

--Transfer updated budget info to the grant file
EXEC spLSC_XFER_TIG_BUDGET_TO_GP 
	@WfTaskAssignmentID = @WfTaskAssignmentID

--Transfer payment schedule to the grant file
EXEC spLSC_TIG_COPY_PAYMENT_SCHEDULE_TO_GRANT
	@wfta_id = @WfTaskAssignmentID,
	@select = 0

--Update Date Received in TIG grant file 
UPDATE LSC_GRANTEE_PROJECT_TIG
	SET date_received = wfta.submitted_date
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN LSC_GRANTEE_PROJECT_TIG gpt ON wfta.grantee_project_id = gpt.grantee_project_id
	WHERE wfta.wf_task_assignment_id = @WfTaskAssignmentID


set @status_id = 1
set @success = 1
set @status_message = 'SUCCESS'

select @status_id As StatusID, @success as Success, @status_message As StatusMessage

