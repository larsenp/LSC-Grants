DECLARE @new_id INT

EXEC @new_id = GETID_SEL @table = 'a_WF_PROJECT_TASK_PDF', @mode = 2

INSERT a_WF_PROJECT_TASK_PDF
	(id,
	wf_project_task_id ,
	report_output_definition_type_id ,
	final_pdf_report_key ,
	description ,
	generation_id )
	SELECT @new_id
		,wfpt.id
		,1
		,'SandyApplication'
		,'Submit Sandy Grant Application'
		,0
		FROM a_WF_PROJECT_TASK wfpt
		WHERE wfpt.wf_task_id = 90
