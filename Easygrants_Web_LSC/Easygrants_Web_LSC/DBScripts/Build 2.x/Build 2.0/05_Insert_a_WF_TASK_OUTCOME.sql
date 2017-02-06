declare @new_id int

exec @new_id = getid_sel @table = 'a_wf_task_outcome'

insert a_wf_task_outcome
	(id,
	task_id,
	role_id,
	abbr,
	description,
	sort_order)
	values
		(@new_id,
		5,
		7,
		'IN PROC',
		'In Process',
		9)

exec @new_id = getid_sel @table = 'a_wf_task_outcome'

insert a_wf_task_outcome
	(id,
	task_id,
	role_id,
	abbr,
	description,
	sort_order)
	values
		(@new_id,
		5,
		7,
		'SUBMITTED',
		'Submitted',
		10)

exec @new_id = getid_sel @table = 'a_wf_task_outcome'

insert a_wf_task_outcome
	(id,
	task_id,
	role_id,
	abbr,
	description,
	sort_order)
	values
		(@new_id,
		6,
		7,
		'IN PROC',
		'In Process',
		11)

exec @new_id = getid_sel @table = 'a_wf_task_outcome'

insert a_wf_task_outcome
	(id,
	task_id,
	role_id,
	abbr,
	description,
	sort_order)
	values
		(@new_id,
		6,
		7,
		'SUBMITTED',
		'Submitted',
		12)
