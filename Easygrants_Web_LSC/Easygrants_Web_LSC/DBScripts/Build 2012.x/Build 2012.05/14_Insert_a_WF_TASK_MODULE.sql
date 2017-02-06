DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'a_WF_TASK_MODULE'

INSERT a_WF_TASK_MODULE
	(wf_task_module_id,
	wf_task_id,
	wf_task_role_id,
	module_name,
	module_config_filename,
	outcome_config_filename)
	VALUES (@new_id,
		78,
		8,
		'GAR',
		'InterimExpensesModuleConfig',
		'InterimExpensesOutcomeConfig')

EXEC @new_id = getid_sel @table = 'a_WF_TASK_MODULE'

INSERT a_WF_TASK_MODULE
	(wf_task_module_id,
	wf_task_id,
	wf_task_role_id,
	module_name,
	module_config_filename,
	outcome_config_filename)
	VALUES (@new_id,
		79,
		8,
		'GAR',
		'InterimRevenueModuleConfig',
		'InterimRevenueOutcomeConfig')

EXEC @new_id = getid_sel @table = 'a_WF_TASK_MODULE'

INSERT a_WF_TASK_MODULE
	(wf_task_module_id,
	wf_task_id,
	wf_task_role_id,
	module_name,
	module_config_filename,
	outcome_config_filename)
	VALUES (@new_id,
		80,
		8,
		'GAR',
		'InterimCaseServModuleConfig',
		'InterimCaseServOutcomeConfig')

EXEC @new_id = getid_sel @table = 'a_WF_TASK_MODULE'

INSERT a_WF_TASK_MODULE
	(wf_task_module_id,
	wf_task_id,
	wf_task_role_id,
	module_name,
	module_config_filename,
	outcome_config_filename)
	VALUES (@new_id,
		81,
		8,
		'GAR',
		'InterimCaseServPAIModuleConfig',
		'InterimCaseServPAIOutcomeConfig')

EXEC @new_id = getid_sel @table = 'a_WF_TASK_MODULE'

INSERT a_WF_TASK_MODULE
	(wf_task_module_id,
	wf_task_id,
	wf_task_role_id,
	module_name,
	module_config_filename,
	outcome_config_filename)
	VALUES (@new_id,
		82,
		8,
		'GAR',
		'InterimStaffingModuleConfig',
		'InterimStaffingOutcomeConfig')

