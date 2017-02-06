INSERT a_WF_TASK
	(id
	,abbr
	,description
	,wf_task_type_id
	,is_copy_allowed)
	VALUES(87
		,'Submit Application Review - Vice President'
		,'Submit Application Review - Vice President'
		,4
		,0)


INSERT a_WF_TASK
	(id
	,abbr
	,description
	,wf_task_type_id
	,is_copy_allowed)
	VALUES(88
		,'Submit Renewal Review - Vice President'
		,'Submit Renewal Review - Vice President'
		,4
		,0)

UPDATE s_ID_GEN
	SET next_id = 89
	WHERE table_name = 'a_WF_TASK'