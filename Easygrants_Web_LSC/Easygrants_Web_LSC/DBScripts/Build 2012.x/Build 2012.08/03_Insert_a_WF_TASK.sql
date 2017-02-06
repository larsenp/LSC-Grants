INSERT a_wf_task
	(id,
	abbr,
	description,
	wf_task_type_id,
	is_copy_allowed,
	is_external_help_url)
	Values(83,
		'Submit Application Review - OCE Staff',
		'Submit Application Review - OCE Staff',
		4,
		2,
		0)
		
		
--INSERT a_wf_task
--	(id,
--	abbr,
--	description,
--	wf_task_type_id,
--	is_copy_allowed,
--	is_external_help_url)
--	VALUES(84,
--		'Submit Renewal Review - OCE Staff',
--		'Submit Renewal Review - OCE Staff',
--		4,
--		2,
--		0)

UPDATE s_ID_GEN
	SET next_id = 84
	WHERE table_name = 'a_wf_task'