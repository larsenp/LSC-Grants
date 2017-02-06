CREATE VIEW vLSC_REVIEW_ASSIGNMENT_COMMENTS

AS

SELECT wfta.wf_task_assignment_id,
	dbo.fnLSCWfTAReviewComments(wfta.wf_task_assignment_id) comments_text,
	dbo.fnCRLF_to_br(dbo.fnLSCWfTAReviewComments(wfta.wf_task_assignment_id)) comments_html
	FROM WF_TASK_ASSIGNMENT wfta
	WHERE wfta.wf_task_id = 5
