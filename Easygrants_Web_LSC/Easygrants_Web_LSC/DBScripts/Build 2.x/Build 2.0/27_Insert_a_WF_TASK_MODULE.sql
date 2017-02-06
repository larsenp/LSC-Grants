
insert a_wf_task_module
	(wf_task_module_id,
	wf_task_id,
	wf_task_role_id,
	module_name,
	module_config_filename,
	outcome_config_filename)
	values
		(6,
		6,
		7,
		'RenewalReview',
		'RenewalReviewModuleConfig',
		'RenewalReviewOutcomeConfig')

update s_id_gen
	set next_id = 7
	where table_name = 'a_wf_task_module'
	
	
update a_wf_task_module
	set wf_task_role_id = 7
	where wf_task_module_id = 5