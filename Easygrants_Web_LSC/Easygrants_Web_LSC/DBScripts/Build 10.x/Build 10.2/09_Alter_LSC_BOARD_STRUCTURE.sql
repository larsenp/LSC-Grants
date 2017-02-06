--change these two data points (formerly collected in LSC_WF_TASK_ASSIGNMENT) 
--from the per-task-assignment model to the per-organization-and-year model

ALTER TABLE LSC_BOARD_STRUCTURE
	ADD new_applicant_no_board BIT NULL,
		board_chair_contact_id INT NULL,
		organization_id INT NULL,
		time_period_id INT NULL
