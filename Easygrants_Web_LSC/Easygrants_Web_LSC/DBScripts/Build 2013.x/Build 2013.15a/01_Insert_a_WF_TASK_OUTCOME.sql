--select * from a_wf_task where description like '%subgrant%'
--select * from a_wf_task_outcome where task_id = 86

ALTER TABLE a_wf_task_outcome
ADD end_date datetime

Update a_wf_task_outcome
set end_date = '10/28/2013'
where task_id = 86

Insert a_wf_task_outcome
	(id,
	task_id,
	description)
	values (223,
		86,
		'In Process')

Insert a_wf_task_outcome
	(id,
	task_id,
	description)
	values (224,
		86,
		'Full Approval')

Insert a_wf_task_outcome
	(id,
	task_id,
	description)
	values (225,
		86,
		'Partial Approval')

Insert a_wf_task_outcome
	(id,
	task_id,
	description)
	values (226,
		86,
		'Provisional Approval')

Insert a_wf_task_outcome
	(id,
	task_id,
	description)
	values (227,
		86,
		'Deny')