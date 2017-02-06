ALTER TABLE LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS
	ADD is_nic_data BIT NULL

GO

UPDATE LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS
	SET is_nic_data = 0
	where affiliation_type_id = 3
		and time_period_id = 17