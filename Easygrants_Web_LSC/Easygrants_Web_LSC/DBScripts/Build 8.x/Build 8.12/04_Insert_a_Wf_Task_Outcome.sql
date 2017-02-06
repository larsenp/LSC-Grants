insert a_wf_task_outcome
	(id,
	task_id,
	description)
values 
       (122,
		57,
		'In Process')

insert a_wf_task_outcome
	(id,
	task_id,
	description)
values 
       (123,
		57,
		'Submitted')



insert a_wf_task_outcome
	(id,
	task_id,
	description)
values 
       (128,
		56,
		'Fund')

insert a_wf_task_outcome
	(id,
	task_id,
	description)
values 
       (129,
		56,
		'Do Not Fund')



update s_id_gen
	set next_id = 130
	where table_name = 'a_wf_task_outcome'
	
	
	
	