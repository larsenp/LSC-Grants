insert a_wf_task_outcome
	(id,
	task_id,
	role_id,
	abbr,
	description)
	values(181,
		83,
		7,
		'IN PROC',
		'In Process')

insert a_wf_task_outcome
	(id,
	task_id,
	role_id,
	abbr,
	description)
	values(182,
		83,
		7,
		'SUBMITTED',
		'Submitted')
		

		
		
		
--insert a_wf_task_outcome
--	(id,
--	task_id,
--	role_id,
--	abbr,
--	description)
--	values(183,
--		84,
--		7,
--		'IN PROC',
--		'In Process')
--
--insert a_wf_task_outcome
--	(id,
--	task_id,
--	role_id,
--	abbr,
--	description)
--	values(184,
--		84,
--		7,
--		'SUBMITTED',
--		'Submitted')


update s_ID_GEN
	set next_id = 183
	where table_name = 'a_wf_task_outcome'