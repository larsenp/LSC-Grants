CREATE VIEW vLSC_SUBMITTED_FILE_MILESTONE

AS

SELECT sf.submitted_file_id,
	sf.entity_id,
	sf.source_filename,
	sf.submit_date,
	m.lsc_milestone_id,
	m.milestone_number,
	p.payment_id,
	p.payment_number,
	wfta.wf_task_assignment_id,
	gp.grantee_project_id,
	gp.legacy_grant_id,
	wfptu.wf_project_task_upload_id,
	wfptu.upload_id
	FROM SUBMITTED_FILE sf
		JOIN LSC_MILESTONE m ON sf.entity_id = m.lsc_milestone_id
			AND sf.entity_dataobject_key = 'LscMilestone'
		JOIN PAYMENT p ON m.payment_id = p.payment_id
		JOIN PAYMENT_CONTINGENCY_TASKS pct ON p.payment_id = pct.payment_id
		JOIN WF_TASK_ASSIGNMENT wfta ON pct.contingency_task_assignment_id = wfta.wf_task_assignment_id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT_TASK_UPLOAD wfptu ON sf.upload_id = wfptu.wf_project_task_upload_id