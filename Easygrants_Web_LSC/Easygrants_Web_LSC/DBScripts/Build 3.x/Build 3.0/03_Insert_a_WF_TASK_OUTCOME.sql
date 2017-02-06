insert a_wf_task_outcome
	(id,
	task_id,
	role_id,
	abbr,
	description,
	sort_order)
	values (13,
		7,
		1,
		'IN PROC',
		'In Process',
		13)

insert a_wf_task_outcome
	(id,
	task_id,
	role_id,
	abbr,
	description,
	sort_order)
	values (14,
		7,
		1,
		'SUBMITTED',
		'Submitted',
		14)

update s_id_gen
	set next_id = 15
	where table_name = 'a_wf_task_outcome'
