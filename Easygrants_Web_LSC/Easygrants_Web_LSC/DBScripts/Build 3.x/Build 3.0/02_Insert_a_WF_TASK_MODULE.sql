insert a_wf_task_module
	(wf_task_module_id,
	wf_task_id,
	wf_task_role_id,
	module_name,
	module_config_filename,
	outcome_config_filename)
	values (7,
		7,
		1,
		'UploadCertification',
		'UploadCertificationModuleConfig',
		'UploadCertificationOutcomeConfig')

update s_id_gen
	set next_id = 8
	where table_name = 'a_wf_task_module'
