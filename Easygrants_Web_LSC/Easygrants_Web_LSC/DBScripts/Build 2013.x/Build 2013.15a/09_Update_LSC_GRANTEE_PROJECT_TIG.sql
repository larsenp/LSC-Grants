UPDATE LSC_GRANTEE_PROJECT_TIG
	SET OLA_review = tr.OLA_review
		,administrative_plan_req = tr.administrative_plan_req
	FROM LSC_TIG_REVIEW_OPEN_REP_WEB_IMPR tr
		JOIN WF_TASK_ASSIGNMENT wfta ON tr.wf_task_assignment_id = wfta.wf_task_assignment_id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN LSC_GRANTEE_PROJECT_TIG gpt ON wfta.grantee_project_id = gpt.grantee_project_id
	WHERE (tr.OLA_review IS NOT NULL
		AND tr.administrative_plan_req IS NOT NULL)
		AND wfta.review_assignment_type_id = 1
		AND wfta.wf_task_status_id = 2
		AND gp.grant_status_id = 1
