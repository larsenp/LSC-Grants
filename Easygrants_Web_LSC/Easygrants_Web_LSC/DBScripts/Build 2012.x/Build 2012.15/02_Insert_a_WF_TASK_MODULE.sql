EXEC spUPDATE_IDGEN @select = 0

GO

DECLARE @new_id int

EXEC @new_id = getid_sel @table = 'a_WF_TASK_MODULE'

INSERT a_WF_TASK_MODULE
	(wf_task_module_id
	,wf_task_id
	,wf_task_role_id
	,module_name
	,module_config_filename
	,outcome_config_filename)
	VALUES(@new_id
		,87
		,7
		,'ApplReview_VP'
		,'ApplReview_VP_ModuleConfig'
		,'ApplReview_VP_OutcomeConfig')



EXEC spUPDATE_IDGEN @select = 0

GO

DECLARE @new_id int

EXEC @new_id = getid_sel @table = 'a_WF_TASK_MODULE'

INSERT a_WF_TASK_MODULE
	(wf_task_module_id
	,wf_task_id
	,wf_task_role_id
	,module_name
	,module_config_filename
	,outcome_config_filename)
	VALUES(@new_id
		,88
		,7
		,'RenewalReview_VP'
		,'RenewalReview_VP_ModuleConfig'
		,'RenewalReview_VP_OutcomeConfig')