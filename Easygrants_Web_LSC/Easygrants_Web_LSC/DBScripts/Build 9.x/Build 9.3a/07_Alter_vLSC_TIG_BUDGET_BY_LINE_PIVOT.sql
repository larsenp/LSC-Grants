ALTER VIEW [dbo].[vLSC_TIG_BUDGET_BY_LINE_PIVOT]

AS

SELECT lsc_tig_budget_id,
	[1], [2], [3], [4], [5]
	, [6], [7], [8], [9], [10]
	, [11], [12], [13], [14], [15], [16]
	FROM (SELECT lsc_tig_budget_id,
		lsc_tig_budget_line_id,
		line_total
		FROM vLSC_TIG_BUDGET_BY_LINE) AS lines
	PIVOT (SUM(line_total)
		FOR lsc_tig_budget_line_id IN ([1], [2], [3], [4], [5]
			, [6], [7], [8], [9], [10]
			, [11], [12], [13], [14], [15], [16])
		) AS pvt


