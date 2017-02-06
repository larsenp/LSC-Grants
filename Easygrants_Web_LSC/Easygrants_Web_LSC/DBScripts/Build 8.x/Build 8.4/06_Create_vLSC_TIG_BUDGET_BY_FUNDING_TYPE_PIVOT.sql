CREATE VIEW vLSC_TIG_BUDGET_BY_FUNDING_TYPE_PIVOT

AS

SELECT lsc_tig_budget_id,
	[1], [2], [3], [4]
	FROM (SELECT lsc_tig_budget_id,
		lsc_tig_budget_funding_type_id,
		funding_type_total
		FROM vLSC_TIG_BUDGET_BY_FUNDING_TYPE) AS lines
	PIVOT (SUM(funding_type_total)
		FOR lsc_tig_budget_funding_type_id IN ([1], [2], [3], [4])
		) AS pvt
