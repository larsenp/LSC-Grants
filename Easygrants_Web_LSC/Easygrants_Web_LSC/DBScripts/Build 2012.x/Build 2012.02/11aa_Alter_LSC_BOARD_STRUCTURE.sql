ALTER TABLE LSC_BOARD_STRUCTURE
	ADD is_nic_data BIT NULL,
	compliance_appt_orgs VARCHAR(MAX),
	compliance_vacancies	 VARCHAR(MAX),
	new_applicant_no_bylaws BIT NULL,
	bylaw_client_board_vacancies INT NULL,
	bylaw_atty_board_vacancies INT NULL,
	bylaw_mccollum_atty_vacancies INT NULL

GO

UPDATE LSC_BOARD_STRUCTURE
	SET is_nic_data = 0
	where time_period_id = 17
