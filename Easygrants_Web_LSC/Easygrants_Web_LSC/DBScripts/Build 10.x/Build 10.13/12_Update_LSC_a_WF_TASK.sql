--Configure new single-page Form M as editable view

UPDATE LSC_a_WF_TASK
	SET EditableView_PageKey = 'Form_M'
	WHERE wf_task_id = 16
