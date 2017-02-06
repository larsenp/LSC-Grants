CREATE VIEW vWFTA_CLIENT_SERVICES

AS

SELECT wfta.wf_task_assignment_id,
	lpt.description legal_problem_type,
	lcs.cases_closed_limited_svc,
	lcs.cases_closed_extended_svc,
	lcs.cases_open
	FROM (WF_TASK_ASSIGNMENT wfta
		CROSS JOIN LSC_c_LEGAL_PROBLEM_TYPE lpt)
		LEFT JOIN LSC_CLIENT_SERVICES lcs ON wfta.wf_task_assignment_id = lcs.wf_task_assignment_id
			AND lpt.id = lcs.lsc_legal_problem_type_id
