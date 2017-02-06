UPDATE a_WF_PROJECT_TASK_PDF
	SET report_output_definition_type_id = 1
	FROM a_WF_PROJECT_TASK_PDF wfptp
		JOIN a_WF_PROJECT_TASK wfpt ON wfptp.wf_project_task_id = wfpt.id
	WHERE wfpt.wf_task_id = 89
