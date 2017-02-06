/****** Object:  StoredProcedure [dbo].[spCOPY_REVIEW_WfTA]    Script Date: 06/10/2008 10:44:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCOPY_REVIEW_WfTA]
	(@source_wf_task_assignment_id int,
	@target_wf_task_assignment_id int)

AS

DECLARE @source_task_id INT, @target_task_id INT

SELECT  @source_task_id = wf_task_id
	FROM WF_TASK_ASSIGNMENT
	WHERE wf_task_assignment_id = @source_wf_task_assignment_id

SELECT @target_task_id = wf_task_id
	FROM WF_TASK_ASSIGNMENT
	WHERE wf_task_assignment_id = @target_wf_task_assignment_id

IF @source_task_id <> @target_task_id
	RETURN

IF @source_task_id <> 5 AND @source_task_id <> 6
	RETURN

IF @source_task_id = 5
BEGIN
	EXEC spCOPY_APPLICATION_REVIEW_WfTA @source_wf_task_assignment_id, @target_wf_task_assignment_id
	RETURN
END

IF @source_task_id = 6
BEGIN
	EXEC spCOPY_RENEWAL_REVIEW_WfTA @source_wf_task_assignment_id, @target_wf_task_assignment_id
	RETURN
END
