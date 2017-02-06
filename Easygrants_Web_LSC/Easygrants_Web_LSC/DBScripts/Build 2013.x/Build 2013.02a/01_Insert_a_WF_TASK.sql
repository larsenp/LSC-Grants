INSERT a_WF_TASK
	(id
	,abbr
	,description
	,wf_task_type_id
	,is_copy_allowed
	,is_external_help_url)
	VALUES
		(89
		,'Submit 1607 Compliance Report'
		,'Submit 1607 Compliance Report'
		,3
		,0
		,0)

UPDATE s_ID_GEN
	SET next_id = 90
	WHERE table_name = 'a_WF_TASK'
