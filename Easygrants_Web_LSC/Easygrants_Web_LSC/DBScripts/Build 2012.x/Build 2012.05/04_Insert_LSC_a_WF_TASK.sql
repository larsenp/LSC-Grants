DECLARE @new_id INT

EXEC @new_id = getid_sel @table='LSC_a_WF_TASK'

INSERT LSC_a_WF_TASK
	(id,
	wf_task_id,
	form_number,
	form_name,
	use_service_area_type,
	is_pai,
	assign_report_per_service_area,
	EditableView_PageKey,
	lsc_gar_form_group_id)
	SELECT @new_id,
		78,
		form_number,
		REPLACE(form_name, 'Projected', 'Interim'),
		use_service_area_type,
		is_pai,
		assign_report_per_service_area,
		EditableView_PageKey,
		3
		FROM LSC_a_WF_TASK
		WHERE wf_task_id = 19

EXEC @new_id = getid_sel @table='LSC_a_WF_TASK'

INSERT LSC_a_WF_TASK
	(id,
	wf_task_id,
	form_number,
	form_name,
	use_service_area_type,
	is_pai,
	assign_report_per_service_area,
	EditableView_PageKey,
	lsc_gar_form_group_id)
	SELECT @new_id,
		79,
		form_number,
		REPLACE(form_name, 'Projected', 'Interim'),
		use_service_area_type,
		is_pai,
		assign_report_per_service_area,
		EditableView_PageKey,
		3
		FROM LSC_a_WF_TASK
		WHERE wf_task_id = 20

EXEC @new_id = getid_sel @table='LSC_a_WF_TASK'

INSERT LSC_a_WF_TASK
	(id,
	wf_task_id,
	form_number,
	form_name,
	use_service_area_type,
	is_pai,
	assign_report_per_service_area,
	EditableView_PageKey,
	lsc_gar_form_group_id)
	SELECT @new_id,
		80,
		form_number,
		REPLACE(form_name, 'Projected', 'Interim'),
		use_service_area_type,
		is_pai,
		assign_report_per_service_area,
		EditableView_PageKey,
		3
		FROM LSC_a_WF_TASK
		WHERE wf_task_id = 21

EXEC @new_id = getid_sel @table='LSC_a_WF_TASK'

INSERT LSC_a_WF_TASK
	(id,
	wf_task_id,
	form_number,
	form_name,
	use_service_area_type,
	is_pai,
	assign_report_per_service_area,
	EditableView_PageKey,
	lsc_gar_form_group_id)
	SELECT @new_id,
		81,
		form_number,
		REPLACE(form_name, 'Projected', 'Interim'),
		use_service_area_type,
		is_pai,
		assign_report_per_service_area,
		EditableView_PageKey,
		3
		FROM LSC_a_WF_TASK
		WHERE wf_task_id = 22


EXEC @new_id = getid_sel @table='LSC_a_WF_TASK'

INSERT LSC_a_WF_TASK
	(id,
	wf_task_id,
	form_number,
	form_name,
	use_service_area_type,
	is_pai,
	assign_report_per_service_area,
	EditableView_PageKey,
	lsc_gar_form_group_id)
	SELECT @new_id,
		82,
		'E-2',
		REPLACE(form_name, 'Projected', 'Interim'),
		use_service_area_type,
		is_pai,
		assign_report_per_service_area,
		'Form_E2',
		3
		FROM LSC_a_WF_TASK
		WHERE wf_task_id = 28

