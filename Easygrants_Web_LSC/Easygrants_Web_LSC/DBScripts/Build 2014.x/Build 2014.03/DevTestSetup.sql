UPDATE a_WF_PROJECT_TASK
	SET start_date = DATEADD(d, -1, GETDATE())
		,open_date = DATEADD(d, -1, GETDATE())
	FROM a_WF_PROJECT_TASK wfpt
		JOIN a_WF_PROJECT wfp ON wfpt.wf_project_id = wfp.id
	WHERE wfpt.wf_task_id IN (1,2,66)
		AND wfp.time_period_id = 20

UPDATE WF_TASK_ASSIGNMENT
	SET start_date = DATEADD(d, -1, GETDATE())
		,open_date = DATEADD(d, -1, GETDATE())
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON wfta.wf_task_assignment_id = cwosy.wf_task_assignment_id
	WHERE wfta.wf_task_id in (4,67)
		AND cwosy.wfta_year = 2015