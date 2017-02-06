/****** Object:  StoredProcedure [dbo].[spLSC_POSTSUBMISSION_TIG_COPY_PAYMENT_SCHEDULE_TO_GRANT]    Script Date: 04/20/2011 10:24:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLSC_POSTSUBMISSION_TIG_COPY_PAYMENT_SCHEDULE_TO_GRANT]
	@WfTaskAssignmentID INT
AS

Declare @status_id int, @success bit, @status_message varchar(250)

EXEC spLSC_TIG_COPY_PAYMENT_SCHEDULE_TO_GRANT
	@wfta_id = @WfTaskAssignmentID,
	@select = 0

set @status_id = 1
set @success = 1
set @status_message = 'SUCCESS'

select @status_id As StatusID, @success as Success, @status_message As StatusMessage

