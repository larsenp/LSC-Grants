UPDATE WF_TASK_ASSIGNMENT
	SET wf_task_status_id = 3
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN c_GRANT_STATUS gs ON gp.grant_status_id = gs.id
	WHERE wfta.wf_task_id = 30
		AND gp.grant_status_id = 8
		AND wfta.wf_task_status_id = 1
