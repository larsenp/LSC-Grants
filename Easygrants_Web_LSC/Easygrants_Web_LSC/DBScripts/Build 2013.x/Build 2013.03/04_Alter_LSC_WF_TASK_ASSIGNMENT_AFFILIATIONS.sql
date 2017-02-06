ALTER TABLE LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS
	ADD lsc_board_info_source_id INT NULL

GO

UPDATE LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS
	SET lsc_board_info_source_id = 1
	WHERE is_nic_data = 0

UPDATE LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS
	SET lsc_board_info_source_id = 2
	WHERE is_nic_data = 1

