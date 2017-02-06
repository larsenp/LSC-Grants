ALTER VIEW [dbo].[vLSC_BOARD_STRUCTURE_TOTALS]
AS

SELECT lsc_board_structure_id,
	ISNULL(mccollum_atty_bylaw, 0) + ISNULL(other_atty_bylaw, 0) + ISNULL(client_member_bylaw, 0) + ISNULL(other_member_bylaw, 0) AS bylaw_total,
	ISNULL(mccollum_atty_less_90, 0) + ISNULL(mccollum_atty_90_day_1_yr, 0) + ISNULL(mccollum_atty_greater_1_yr, 0) AS mccollum_atty_vacancy_total,
	ISNULL(other_atty_less_90, 0) + ISNULL(other_atty_90_day_1_yr, 0) + ISNULL(other_atty_greater_1_yr, 0) AS other_atty_vacancy_total,
	ISNULL(client_member_less_90, 0) + ISNULL(client_member_90_day_1_yr, 0) + ISNULL(client_member_greater_1_yr, 0)  AS client_member_vacancy_total,
	ISNULL(other_member_less_90, 0) + ISNULL(other_member_90_day_1_yr, 0) + ISNULL(other_member_greater_1_yr, 0)  AS other_member_vacancy_total
	FROM LSC_BOARD_STRUCTURE
