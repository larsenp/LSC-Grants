INSERT a_WF_TASK_OUTCOME
	(id
	,task_id
	,role_id
	,abbr
	,description)
	VALUES
		(316
		,39
		,1
		,'Highly Recommend'
		,'Highly Recommend')

UPDATE s_ID_GEN
	SET next_id = 317
	WHERE table_name = 'a_WF_TASK_OUTCOME'



update a_wf_task_outcome
set sort_order = 2
where id = 79

update a_wf_task_outcome
set sort_order = 3
where id = 80 

update a_wf_task_outcome
set sort_order = 4
where id = 78 

update a_wf_task_outcome
set sort_order = 5
where id = 77 