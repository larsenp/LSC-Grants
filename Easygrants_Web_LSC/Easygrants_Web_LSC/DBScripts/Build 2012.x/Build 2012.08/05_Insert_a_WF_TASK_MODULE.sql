Insert a_wf_task_module
	(wf_task_module_id,
	wf_task_id,
	wf_task_role_id,
	module_name,
	module_config_filename,
	outcome_config_filename)
	values(92,
		83,
		7,
		'ApplReview_OCEStaff',
		'ApplReviewModule_OCEStaffConfig',
		'ApplReviewOutcome_OCEStaffConfig')
		

--Insert a_wf_task_module
--	(wf_task_module_id,
--	wf_task_id,
--	wf_task_role_id,
--	module_name,
--	module_config_filename,
--	outcome_config_filename)
--	values(93,
--		84,
--		7,
--		'RenewalReview_OCEStaff',
--		'RenewalReviewModule_OCEStaffConfig',
--		'RenewalReviewOutcome_OCEStaffConfig')

update s_ID_GEN
	set next_id = 93
	where table_name = 'a_wf_task_module'