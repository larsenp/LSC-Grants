CREATE VIEW vLSC_BOARD_VACANCIES_CALC

AS

SELECT bs.lsc_board_structure_id,
	bs.mccollum_atty_bylaw - bc.mccollum_atty_count mccollum_atty_vacancies,
	bs.other_atty_bylaw - bc.other_atty_count other_atty_vacancies,
	bs.client_member_bylaw - bc.client_member_count client_member_vacancies,
	bs.other_member_bylaw - bc.other_member_count other_member_vacancies,
	bs.mccollum_atty_bylaw - bc.mccollum_atty_count + bs.other_atty_bylaw - bc.other_atty_count +
		bs.client_member_bylaw - bc.client_member_count + bs.other_member_bylaw - bc.other_member_count total_vacancies
	FROM LSC_BOARD_STRUCTURE bs
		JOIN vLSC_BOARD_COUNTS bc ON bs.organization_id = bc.organization_id
			AND bs.time_period_id = bc.time_period_id
			AND bs.is_nic_data = bc.is_nic_data