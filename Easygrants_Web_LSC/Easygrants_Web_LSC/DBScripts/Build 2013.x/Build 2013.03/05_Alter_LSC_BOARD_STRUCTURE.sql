ALTER TABLE LSC_BOARD_STRUCTURE
	ADD lsc_board_info_source_id INT NULL
		,reasons_not_in_compliance VARCHAR(MAX)
		,efforts_made VARCHAR(MAX)
		,how_proposes_to_fill VARCHAR(MAX)
		,expected_dates VARCHAR(MAX)
GO

UPDATE LSC_BOARD_STRUCTURE
	SET lsc_board_info_source_id = 1
	WHERE is_nic_data = 0

UPDATE LSC_BOARD_STRUCTURE
	SET lsc_board_info_source_id = 2
	WHERE is_nic_data = 1

