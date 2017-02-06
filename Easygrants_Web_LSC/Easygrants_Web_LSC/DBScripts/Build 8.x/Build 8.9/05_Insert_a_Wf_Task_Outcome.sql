insert a_wf_task_outcome
	(id,
	task_id,
	description)
values 
       (111,
		47,
		'In Process')

insert a_wf_task_outcome
	(id,
	task_id,
	description)
values 
       (112,
		47,
		'Fund')

insert a_wf_task_outcome
	(id,
	task_id,
	description)
values 
       (113,
		47,
		'Do Not Fund')


update s_id_gen
	set next_id = 114
	where table_name = 'a_wf_task_outcome'

--select * from a_wf_task_outcome
--select * from a_wf_task