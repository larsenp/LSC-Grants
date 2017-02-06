	insert a_wf_task
	(id,
	abbr,
	description,
	wf_task_type_id,
	is_copy_allowed,
	is_external_help_url)
	values(72,
		'Submit Risk Analysis',
		'Submit Risk Analysis',
		4,
		2,
		0)

update s_ID_GEN
	set next_id = 73
	where table_name = 'a_wf_task'

insert a_wf_task_outcome
	(id,
	task_id,
	role_id,
	abbr,
	description)
	values(155,
		72,
		7,
		'IN PROC',
		'In Process')

insert a_wf_task_outcome
	(id,
	task_id,
	role_id,
	abbr,
	description)
	values(156,
		72,
		7,
		'SUBMITTED',
		'Submitted')

update s_ID_GEN
	set next_id = 157
	where table_name = 'a_wf_task_outcome'

insert a_wf_task_module
	(wf_task_module_id,
	wf_task_id,
	wf_task_role_id,
	module_name,
	module_config_filename,
	outcome_config_filename)
	values(79,
		72,
		7,
		'RiskAnalysis',
		'RiskAnalysisModuleConfig',
		'RiskAnalysisOutcomeConfig')

update s_ID_GEN
	set next_id = 80
	where table_name = 'a_wf_task_module'