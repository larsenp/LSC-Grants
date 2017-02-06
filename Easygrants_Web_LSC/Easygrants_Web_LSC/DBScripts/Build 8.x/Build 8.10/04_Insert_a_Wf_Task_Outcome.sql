insert a_wf_task_outcome
	(id,
	task_id,
	description)
values 
       (120,
		52,
		'In Process')

insert a_wf_task_outcome
	(id,
	task_id,
	description)
values 
       (121,
		52,
		'Submitted')



update s_id_gen
	set next_id = 122
	where table_name = 'a_wf_task_outcome'