
DELETE a_WF_PROJECT_TASK_UPLOAD
	FROM a_WF_PROJECT_TASK_UPLOAD wfptu
		JOIN a_WF_PROJECT_TASK wfpt ON wfptu.wf_project_task_id = wfpt.id
		JOIN a_WF_PROJECT wfp ON wfpt.wf_project_id = wfp.id
	WHERE wfp.time_period_id = 20
		AND wfpt.wf_task_id = 2
		AND wfptu.upload_id in (2, 7)