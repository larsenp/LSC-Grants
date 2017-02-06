--Remove duplicate entries for upload_id 22
--Mantis 2886

CREATE TABLE #wfptu
	(wf_project_task_upload_id int)

INSERT #wfptu
	(wf_project_task_upload_id)
	SELECT MIN(wfptu.wf_project_task_upload_id)
		FROM a_WF_PROJECT_TASK_UPLOAD wfptu
			JOIN a_WF_PROJECT_TASK wfpt on wfptu.wf_project_task_id = wfpt.id
		WHERE wfptu.upload_id = 22
		GROUP BY wfpt.description, upload_id
		HAVING COUNT(*) > 1

DELETE a_WF_PROJECT_TASK_UPLOAD
	FROM a_WF_PROJECT_TASK_UPLOAD wfptu
		JOIN #wfptu ON wfptu.wf_project_task_upload_id = #wfptu.wf_project_task_upload_id

DROP TABLE #wfptu

