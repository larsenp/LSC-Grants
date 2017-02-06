CREATE VIEW vLSC_TIG_BUDGET_BY_LINE

AS

SELECT CAST(lsc_tig_budget_id AS VARCHAR(6)) + '_' + CAST(lsc_tig_budget_line_id AS VARCHAR(4)) lsc_tig_budget_by_line_id,
	lsc_tig_budget_id,
	lsc_tig_budget_line_id,
	SUM(isnull(amount, 0)) line_total
	FROM LSC_TIG_BUDGET_ITEM
	GROUP BY lsc_tig_budget_id,
		lsc_tig_budget_line_id