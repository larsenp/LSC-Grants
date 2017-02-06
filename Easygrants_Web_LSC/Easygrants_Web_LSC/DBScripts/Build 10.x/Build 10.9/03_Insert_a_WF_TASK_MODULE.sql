Insert a_wf_task_module
	(wf_task_module_id,
	wf_task_id,
	wf_task_role_id,
	module_name,
	module_config_filename,
	outcome_config_filename)
	values(83,
		74,
		7,
		'ApplReview_OCEDir',
		'ApplReviewModule_OCEDirConfig',
		'ApplReviewOutcome_OCEDirConfig')
		

Insert a_wf_task_module
	(wf_task_module_id,
	wf_task_id,
	wf_task_role_id,
	module_name,
	module_config_filename,
	outcome_config_filename)
	values(84,
		75,
		7,
		'RenewalReview_OCEDir',
		'RenewalReviewModule_OCEDirConfig',
		'RenewalReviewOutcome_OCEDirConfig')

update s_ID_GEN
	set next_id = 85
	where table_name = 'a_wf_task_module'