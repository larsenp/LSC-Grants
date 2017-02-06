
/****** Object:  View [dbo].[vLSC_PBIF_BUDGET_PIVOT]    Script Date: 03-02-2015 18:47:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[vLSC_PBIF_BUDGET_PIVOT]

AS

SELECT lsc_pbif_budget_id,
	[1_1], [1_2], [1_3], [1_4],[1_5],
	[2_1], [2_2], [2_3], [2_4],[2_5],
	[3_1], [3_2], [3_3], [3_4],[3_5],
	[4_1], [4_2], [4_3], [4_4],[4_5],
	[5_1], [5_2], [5_3], [5_4],[5_5],
	[6_1], [6_2], [6_3], [6_4],[6_5],
	[7_1], [7_2], [7_3], [7_4],[7_5],
	[8_1], [8_2], [8_3], [8_4],[8_5],
	[9_1], [9_2], [9_3], [9_4],[9_5],
	[10_1], [10_2], [10_3], [10_4],[10_5],
	[11_1], [11_2], [11_3], [11_4],[11_5],
	[12_1], [12_2], [12_3], [12_4],[12_5],
	[13_1], [13_2], [13_3], [13_4],[13_5],
	[14_1], [14_2], [14_3], [14_4],[14_5],
	[15_1], [15_2], [15_3], [15_4],[15_5],
	[16_1], [16_2], [16_3], [16_4],[16_5]
	FROM
	(SELECT tbi.lsc_pbif_budget_id,
		CAST(tbl.sort_order AS VARCHAR(2)) + '_' + CAST(tbft.id AS VARCHAR(2)) line_funding_type,
		ISNULL(tbi.amount, 0) amount
		FROM LSC_PBIF_BUDGET_ITEM tbi
			join LSC_PBIF_BUDGET tb ON tbi.lsc_pbif_budget_id = tb.lsc_pbif_budget_id
			join a_BUDGET_CATEGORY tbl ON tbi.budget_category_id = tbl.budget_category_id
			join LSC_a_PBIF_BUDGET_FUNDING_TYPE tbft ON tbi.lsc_pbif_budget_funding_type_id = tbft.id) AS lines
		PIVOT
			(SUM(amount)
				FOR line_funding_type in 
					([1_1], [1_2], [1_3], [1_4],[1_5],
	[2_1], [2_2], [2_3], [2_4],[2_5],
	[3_1], [3_2], [3_3], [3_4],[3_5],
	[4_1], [4_2], [4_3], [4_4],[4_5],
	[5_1], [5_2], [5_3], [5_4],[5_5],
	[6_1], [6_2], [6_3], [6_4],[6_5],
	[7_1], [7_2], [7_3], [7_4],[7_5],
	[8_1], [8_2], [8_3], [8_4],[8_5],
	[9_1], [9_2], [9_3], [9_4],[9_5],
	[10_1], [10_2], [10_3], [10_4],[10_5],
	[11_1], [11_2], [11_3], [11_4],[11_5],
	[12_1], [12_2], [12_3], [12_4],[12_5],
	[13_1], [13_2], [13_3], [13_4],[13_5],
	[14_1], [14_2], [14_3], [14_4],[14_5],
	[15_1], [15_2], [15_3], [15_4],[15_5],
	[16_1], [16_2], [16_3], [16_4],[16_5])
			) AS pvt




GO


