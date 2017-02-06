

/****** Object:  View [dbo].[vLSC_PBIF_BUDGET_CATEGORY_TOTAL_BY_FUNDING_TYPE_PIVOT]    Script Date: 03-02-2015 19:10:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[vLSC_PBIF_BUDGET_CATEGORY_TOTAL_BY_FUNDING_TYPE_PIVOT]

AS
SELECT lsc_pbif_budget_id,
  	[1_1], [1_2], [1_3], [1_4],[1_5],
	[4_1], [4_2], [4_3], [4_4],[4_5],
	[13_1], [13_2], [13_3], [13_4],[13_5]

	FROM
	(SELECT bctft.lsc_pbif_budget_id,
	   		CAST(tbl.sort_order AS VARCHAR(10)) + '_' + CAST(tbft.id AS VARCHAR(2)) line_funding_type,
		ISNULL(bctft.amount, 0) amount
		FROM vLSC_PBIF_BUDGET_CATEGORY_TOTAL_BY_FUNDING_TYPE bctft
			join LSC_PBIF_BUDGET tb ON bctft.lsc_pbif_budget_id = tb.lsc_pbif_budget_id
			join a_BUDGET_CATEGORY tbl ON bctft.budget_category_id = tbl.budget_category_id
			join LSC_a_PBIF_BUDGET_FUNDING_TYPE tbft ON bctft.lsc_pbif_budget_funding_type_id = tbft.id) AS lines
		PIVOT
			(SUM(amount)
				FOR line_funding_type in 
					([1_1], [1_2], [1_3], [1_4],[1_5],
	[4_1], [4_2], [4_3], [4_4],[4_5],
	[13_1], [13_2], [13_3], [13_4],[13_5])
		         	) AS pvt



GO


