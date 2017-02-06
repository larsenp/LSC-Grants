insert a_wf_task
	(id,
	abbr,
	description,
	wf_task_type_id,
	sort_order)
	values(7,
		'Upload Certification',
		'Upload Certification',
		1,
		7)

update s_id_gen
	set next_id = 8
	where table_name = 'a_wf_task'
	

