CREATE VIEW vLSC_TIG_BUDGET_BY_FUNDING_TYPE_PCT

AS

SELECT tbft.lsc_tig_budget_by_funding_type_id,
	tbft.funding_type_total,
	tb.budget_total,
	cast(tbft.funding_type_total as decimal) / cast(tb.budget_total as decimal) budget_pct
	FROM vLSC_TIG_BUDGET_BY_FUNDING_TYPE tbft
		JOIN vLSC_TIG_BUDGET tb ON tbft.lsc_tig_budget_id = tb.lsc_tig_budget_id


