declare @new_id int

exec @new_id = getid_sel @table = 'a_wf_task'

insert a_wf_task
	(id,
	abbr,
	description,
	wf_task_type_id,
	sort_order,
	parent_task_id,
	is_copy_allowed)
	values
		(@new_id,
		'Submit Renewal Application Review',
		'Submit Renewal Application Review',
		4,
		6,
		4,
		2)
