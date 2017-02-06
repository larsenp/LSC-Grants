insert a_wf_task_outcome
	(id,
	task_id,
	role_id,
	abbr,
	description)
	values(159,
		74,
		7,
		'IN PROC',
		'In Process')

insert a_wf_task_outcome
	(id,
	task_id,
	role_id,
	abbr,
	description)
	values(160,
		74,
		7,
		'Fund',
		'Fund')
		
insert a_wf_task_outcome
	(id,
	task_id,
	role_id,
	abbr,
	description)
	values(161,
		74,
		7,
		'Do Not Fund',
		'Do Not Fund')
		
		
		
insert a_wf_task_outcome
	(id,
	task_id,
	role_id,
	abbr,
	description)
	values(162,
		75,
		7,
		'IN PROC',
		'In Process')

insert a_wf_task_outcome
	(id,
	task_id,
	role_id,
	abbr,
	description)
	values(163,
		75,
		7,
		'Fund',
		'Fund')
		
insert a_wf_task_outcome
	(id,
	task_id,
	role_id,
	abbr,
	description)
	values(164,
		75,
		7,
		'Do Not Fund',
		'Do Not Fund')

update s_ID_GEN
	set next_id = 165
	where table_name = 'a_wf_task_outcome'