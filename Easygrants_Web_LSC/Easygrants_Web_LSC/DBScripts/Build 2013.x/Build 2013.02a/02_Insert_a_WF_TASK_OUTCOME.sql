INSERT a_WF_TASK_OUTCOME
	(id
	,task_id
	,role_id
	,abbr
	,description)
	VALUES
		(204
		,89
		,8
		,'IN PROC'
		,'In Process')

INSERT a_WF_TASK_OUTCOME
	(id
	,task_id
	,role_id
	,abbr
	,description)
	VALUES
		(205
		,89
		,8
		,'SUBMITTED'
		,'Submitted')

UPDATE s_ID_GEN
	SET next_id = 206
	WHERE table_name = 'a_WF_TASK_OUTCOME'