INSERT a_WF_TASK
	(id
	,abbr
	,description
	,wf_task_type_id
	,is_copy_allowed
	,is_external_help_url)
	VALUES
		(102
		,'Submit Funding Application - Fiscal Component'
		,'Submit Funding Application - Fiscal Component'
		,1
		,0
		,0)

UPDATE s_ID_GEN
	SET next_id = 103
	WHERE table_name = 'a_WF_TASK'
