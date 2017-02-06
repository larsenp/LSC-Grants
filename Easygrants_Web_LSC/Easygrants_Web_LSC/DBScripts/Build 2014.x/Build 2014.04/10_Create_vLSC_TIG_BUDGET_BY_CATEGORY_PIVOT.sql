SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_TIG_BUDGET_BY_CATEGORY_PIVOT]

AS

SELECT lsc_tig_budget_id,
	[1], [2], [3], [4], [5]
	, [6], [7], [8], [9], [10]
	, [11], [12], [13]
	FROM (SELECT lsc_tig_budget_id,
		sort_order,
		category_total
		FROM vLSC_TIG_BUDGET_BY_CATEGORY) AS categories
	PIVOT (SUM(category_total)
		FOR sort_order IN ([1], [2], [3], [4], [5]
			, [6], [7], [8], [9], [10]
			, [11], [12], [13], [14], [15], [16])
		) AS pvt
