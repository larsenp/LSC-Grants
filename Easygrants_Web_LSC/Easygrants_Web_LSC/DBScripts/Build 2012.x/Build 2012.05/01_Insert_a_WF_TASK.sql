INSERT a_WF_TASK
	(id,
	abbr,
	description,
	wf_task_type_id,
	sort_order,
	create_date,
	is_copy_allowed,
	is_external_help_url,
	include_submission_communication)
	VALUES(78,
		'Submit Form D-2',
		'Submit Form D-2 (Interim Expenses)',
		3,
		78,
		GETDATE(),
		0,
		0,
		0)

INSERT a_WF_TASK
	(id,
	abbr,
	description,
	wf_task_type_id,
	sort_order,
	create_date,
	is_copy_allowed,
	is_external_help_url,
	include_submission_communication)
	VALUES(79,
		'Submit Form D-4',
		'Submit Form D-4 (Interim Support and Revenue)',
		3,
		79,
		GETDATE(),
		0,
		0,
		0)

INSERT a_WF_TASK
	(id,
	abbr,
	description,
	wf_task_type_id,
	sort_order,
	create_date,
	is_copy_allowed,
	is_external_help_url,
	include_submission_communication)
	VALUES(80,
		'Submit Form G-1',
		'Submit Form G-1 (Interim Case Services)',
		3,
		80,
		GETDATE(),
		0,
		0,
		0)

INSERT a_WF_TASK
	(id,
	abbr,
	description,
	wf_task_type_id,
	sort_order,
	create_date,
	is_copy_allowed,
	is_external_help_url,
	include_submission_communication)
	VALUES(81,
		'Submit Form G-1(d)',
		'Submit Form G-1(d) (Interim Case Services - PAI)',
		3,
		81,
		GETDATE(),
		0,
		0,
		0)

INSERT a_WF_TASK
	(id,
	abbr,
	description,
	wf_task_type_id,
	sort_order,
	create_date,
	is_copy_allowed,
	is_external_help_url,
	include_submission_communication)
	VALUES(82,
		'Submit Form E-2',
		'Submit Form E-2 (Interim Staffing - Recipient Only)',
		3,
		82,
		GETDATE(),
		0,
		0,
		0)

UPDATE s_ID_GEN
	SET next_id = 83
	WHERE table_name = 'a_WF_TASK'
