EXEC spUPDATE_IDGEN @select = 0

GO

DECLARE @new_id int

EXEC @new_id = getid_sel @table = 'a_WF_TASK_OUTCOME'

INSERT a_WF_TASK_OUTCOME
	(id
	,task_id
	,role_id
	,abbr
	,description)
	VALUES(@new_id
		,87
		,7
		,'IN PROC'
		,'In Process')

EXEC @new_id = getid_sel @table = 'a_WF_TASK_OUTCOME'

INSERT a_WF_TASK_OUTCOME
	(id
	,task_id
	,role_id
	,abbr
	,description)
	VALUES(@new_id
		,87
		,7
		,'Fund'
		,'Fund')

EXEC @new_id = getid_sel @table = 'a_WF_TASK_OUTCOME'

INSERT a_WF_TASK_OUTCOME
	(id
	,task_id
	,role_id
	,abbr
	,description)
	VALUES(@new_id
		,87
		,7
		,'Do Not Fund'
		,'Do Not Fund')


---Renewal review - VP

EXEC @new_id = getid_sel @table = 'a_WF_TASK_OUTCOME'

INSERT a_WF_TASK_OUTCOME
	(id
	,task_id
	,role_id
	,abbr
	,description)
	VALUES(@new_id
		,88
		,7
		,'IN PROC'
		,'In Process')

EXEC @new_id = getid_sel @table = 'a_WF_TASK_OUTCOME'

INSERT a_WF_TASK_OUTCOME
	(id
	,task_id
	,role_id
	,abbr
	,description)
	VALUES(@new_id
		,88
		,7
		,'Fund'
		,'Fund')

EXEC @new_id = getid_sel @table = 'a_WF_TASK_OUTCOME'

INSERT a_WF_TASK_OUTCOME
	(id
	,task_id
	,role_id
	,abbr
	,description)
	VALUES(@new_id
		,88
		,7
		,'Do Not Fund'
		,'Do Not Fund')




