/****** Object:  StoredProcedure [dbo].[spLSC_POSTSUBMISSION_TIG_UPDATE_DATE_RECEIVED]    Script Date: 04/20/2011 10:25:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLSC_POSTSUBMISSION_TIG_UPDATE_DATE_RECEIVED]
	@WfTaskAssignmentID INT
AS

Declare @status_id int, @success bit, @status_message varchar(250)

UPDATE LSC_GRANTEE_PROJECT_TIG
	SET date_received = wfta.submitted_date
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN LSC_GRANTEE_PROJECT_TIG gpt ON wfta.grantee_project_id = gpt.grantee_project_id
	WHERE wfta.wf_task_assignment_id = @WfTaskAssignmentID

set @status_id = 1
set @success = 1
set @status_message = 'SUCCESS'

select @status_id As StatusID, @success as Success, @status_message As StatusMessage

