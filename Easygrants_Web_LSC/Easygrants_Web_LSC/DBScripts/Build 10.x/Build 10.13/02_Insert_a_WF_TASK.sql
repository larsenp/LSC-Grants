--Create task for Form G-2, including related table rows

--Task
INSERT a_WF_TASK
	(id,
	abbr,
	description,
	wf_task_type_id,
	sort_order,
	is_copy_allowed,
	is_external_help_url)
	VALUES(76,
		'Submit Form G-2',
		'Submit Form G-2 (Additional Information Relating to Cases)',
		3,
		75,
		0,
		0)

update s_ID_GEN
	set next_id = 77
	where table_name = 'a_wf_task'
	

--Outcomes	
INSERT a_WF_TASK_OUTCOME
	(id,
	task_id,
	role_id,
	abbr,
	description)
	VALUES(167,
		76,
		8,
		'IN PROC',
		'In Process')

INSERT a_WF_TASK_OUTCOME
	(id,
	task_id,
	role_id,
	abbr,
	description)
	VALUES(168,
		76,
		8,
		'SUBMITTED',
		'Submitted')

update s_ID_GEN
	set next_id = 169
	where table_name = 'a_wf_task_outcome'


--Module
DECLARE @new_id INT

EXEC @new_id = getid_sel 
	@table='a_WF_TASK_MODULE',
	@mode = 2

INSERT a_WF_TASK_MODULE
	(wf_task_module_id,
	wf_task_id,
	wf_task_role_id,
	module_name,
	module_config_filename,
	outcome_config_filename)
	VALUES(@new_id,
		76,
		8,
		'GAR',
		'AdditionalInformationModuleConfig',
		'AdditionalInformationOutcomeConfig')

--LSC-specific task information
EXEC @new_id = getid_sel 
	@table='LSC_a_WF_TASK',
	@mode = 2

INSERT LSC_a_WF_TASK
	(id,
	wf_task_id,
	is_projected,
	form_number,
	form_name,
	use_service_area_type,
	is_pai,
	assign_report_per_service_area,
	PrintableView_PageKey,
	gar_is_early_due_date,
	EditableView_PageKey)
	VALUES (@new_id,
		76,
		0,
		'G-2',
		'Additional Information Relating to Cases',
		0,
		0,
		0,
		'PV_Gar_G2',
		0,
		'Form_G2')