CREATE VIEW vLSC_OCE_DIR_REVIEW_AUDIT_COMPLIANCE

AS

SELECT wfta.wf_task_assignment_id,
	ra.compliance_issues,
	ra.compliance_issues_comment,
	ra.audit_issues,
	ra.audit_issues_comment
	FROM WF_TASK_ASSIGNMENT wfta
		LEFT JOIN LSC_REVIEW_APPLICATION ra ON wfta.wf_task_assignment_id = ra.wf_task_assignment_id
	WHERE wfta.wf_task_id = 74

UNION ALL

SELECT wfta.wf_task_assignment_id,
	rr.compliance_issues,
	rr.compliance_issues_comment,
	rr.audit_issues,
	rr.audit_issues_comment
	FROM WF_TASK_ASSIGNMENT wfta
		LEFT JOIN LSC_RENEWAL_REC rr ON wfta.wf_task_assignment_id = rr.wf_task_assignment_id
	WHERE wfta.wf_task_id = 75

