	insert a_wf_task
	(id,
	abbr,
	description,
	wf_task_type_id,
	is_copy_allowed,
	is_external_help_url)
	values(74,
		'Submit Application Review - OCE Director',
		'Submit Application Review - OCE Director',
		4,
		2,
		0)
		
		
insert a_wf_task
	(id,
	abbr,
	description,
	wf_task_type_id,
	is_copy_allowed,
	is_external_help_url)
	values(75,
		'Submit Renewal Review - OCE Director',
		'Submit Renewal Review - OCE Director',
		4,
		2,
		0)

update s_ID_GEN
	set next_id = 76
	where table_name = 'a_wf_task'