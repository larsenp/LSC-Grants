--Remove entries for upload_id 5 for renewals of 2012 grants (added prematurely)
--Mantis 2886

DELETE a_WF_PROJECT_TASK_UPLOAD
	FROM a_WF_PROJECT_TASK_UPLOAD wfptu
		JOIN a_WF_PROJECT_TASK wfpt ON wfptu.wf_project_task_id = wfpt.id
		JOIN a_WF_PROJECT wfp ON wfpt.wf_project_id = wfp.id
	WHERE wfp.time_period_id = 17
		AND wfpt.wf_task_id in (4,67)

