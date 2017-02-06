ALTER TABLE LSC_a_WF_TASK
	ADD gar_is_early_due_date bit NULL

GO

UPDATE LSC_a_WF_TASK
	SET gar_is_early_due_date = 0
	WHERE wf_task_id in (8, 9, 15, 16, 18, 19, 20, 23, 24, 25, 26, 27, 28, 29)

UPDATE LSC_a_WF_TASK
	SET gar_is_early_due_date = 1
	WHERE wf_task_id in (10, 11, 12, 13, 14, 17, 21, 22)

