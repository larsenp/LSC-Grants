CREATE VIEW vLSC_TIG_BUDGET_BY_FUNDING_TYPE_PCT_PIVOT

AS

SELECT lsc_tig_budget_id,
	[1], [2], [3], [4]
	FROM (SELECT lsc_tig_budget_id,
		lsc_tig_budget_funding_type_id,
		budget_pct
		FROM vLSC_TIG_BUDGET_BY_FUNDING_TYPE_PCT tbftp
			JOIN vLSC_TIG_BUDGET_BY_FUNDING_TYPE tbft ON tbftp.lsc_tig_budget_by_funding_type_id = tbft.lsc_tig_budget_by_funding_type_id) AS lines
	PIVOT (SUM(budget_pct)
		FOR lsc_tig_budget_funding_type_id IN ([1], [2], [3], [4])
		) AS pvt
