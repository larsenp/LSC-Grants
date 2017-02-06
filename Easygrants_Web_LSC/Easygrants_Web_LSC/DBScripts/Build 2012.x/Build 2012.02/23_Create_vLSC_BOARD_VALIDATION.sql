CREATE VIEW vLSC_BOARD_VALIDATION

AS

SELECT bs.lsc_board_structure_id,
	CASE WHEN bs.new_applicant_no_bylaws = 1 THEN 1
		WHEN bst.mccollum_atty_vacancy_total = bvc.mccollum_atty_vacancies THEN 1 ELSE 0 END mccollum_atty_valid,
	CASE  WHEN bs.new_applicant_no_bylaws = 1 THEN 1
		WHEN bst.other_atty_vacancy_total = bvc.other_atty_vacancies THEN 1 ELSE 0 END other_atty_valid,
	CASE  WHEN bs.new_applicant_no_bylaws = 1 THEN 1
		WHEN bst.client_member_vacancy_total = bvc.client_member_vacancies THEN 1 ELSE 0 END client_member_valid,
	CASE  WHEN bs.new_applicant_no_bylaws = 1 THEN 1
		WHEN bst.other_member_vacancy_total = bvc.other_member_vacancies THEN 1 ELSE 0 END other_member_valid
	FROM LSC_BOARD_STRUCTURE bs
		JOIN vLSC_BOARD_STRUCTURE_TOTALS bst ON bs.lsc_board_structure_id = bst.lsc_board_structure_id
		JOIN vLSC_BOARD_VACANCIES_CALC bvc ON bst.lsc_board_structure_id = bvc.lsc_board_structure_id
