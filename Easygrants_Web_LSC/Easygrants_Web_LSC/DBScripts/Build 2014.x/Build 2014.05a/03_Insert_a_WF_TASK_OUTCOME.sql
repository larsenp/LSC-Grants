INSERT a_WF_TASK_OUTCOME
	(id
	,task_id
	,role_id
	,abbr
	,description)
	VALUES
		(236
		,102
		,1
		,'IN PROC'
		,'In Process')

INSERT a_WF_TASK_OUTCOME
	(id
	,task_id
	,role_id
	,abbr
	,description)
	VALUES
		(237
		,102
		,1
		,'SUBMITTED'
		,'Submitted')

UPDATE s_ID_GEN
	SET next_id = 238
	WHERE table_name = 'a_WF_TASK_OUTCOME'