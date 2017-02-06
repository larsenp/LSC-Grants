CREATE VIEW vLSC_TIG_BUDGET_BY_FUNDING_TYPE

AS

SELECT CAST(lsc_tig_budget_id AS VARCHAR(6)) + '_' + CAST(lsc_tig_budget_funding_type_id AS VARCHAR(4)) lsc_tig_budget_by_funding_type_id,
	lsc_tig_budget_id,
	lsc_tig_budget_funding_type_id,
	SUM(isnull(amount, 0)) funding_type_total
	FROM LSC_TIG_BUDGET_ITEM
	GROUP BY lsc_tig_budget_id,
		lsc_tig_budget_funding_type_id
