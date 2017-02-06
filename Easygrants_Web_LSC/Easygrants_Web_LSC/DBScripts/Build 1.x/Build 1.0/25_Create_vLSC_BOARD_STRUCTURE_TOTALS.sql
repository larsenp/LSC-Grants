CREATE VIEW vLSC_BOARD_STRUCTURE_TOTALS
AS

SELECT lsc_board_structure_id,
ISNULL(mccollum_atty_bylaw, 0) + ISNULL(other_atty_bylaw, 0) + ISNULL(client_member_bylaw, 0) + ISNULL(other_member_bylaw, 0) AS bylaw_total
FROM LSC_BOARD_STRUCTURE