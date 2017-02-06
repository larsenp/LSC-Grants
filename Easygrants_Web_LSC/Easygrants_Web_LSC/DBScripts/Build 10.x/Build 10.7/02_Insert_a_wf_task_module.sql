insert a_wf_task_module
	(wf_task_module_id,
	wf_task_id,
	wf_task_role_id,
	module_name,
	module_config_filename,
	outcome_config_filename)
	values(80,
		68,
		7,
		'ApplReview',
		'PPQVApplReviewModuleConfig.config',
		'PPQVApplReviewOutcomeConfig.config')


insert a_wf_task_module
	(wf_task_module_id,
	wf_task_id,
	wf_task_role_id,
	module_name,
	module_config_filename,
	outcome_config_filename)
	values(81,
		69,
		7,
		'RenewalReview',
		'PPQVRenewalReviewModuleConfig.config',
		'PPQVRenewalReviewOutcomeConfig.config')

update s_ID_GEN
	set next_id = 82
	where table_name = 'a_wf_task_module'