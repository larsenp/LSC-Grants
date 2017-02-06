CREATE VIEW vLSC_TIG_BUDGET_PIVOT

AS

SELECT lsc_tig_budget_id,
	[1_1], [1_2], [1_3], [1_4],
	[2_1], [2_2], [2_3], [2_4],
	[3_1], [3_2], [3_3], [3_4],
	[4_1], [4_2], [4_3], [4_4],
	[5_1], [5_2], [5_3], [5_4],
	[6_1], [6_2], [6_3], [6_4],
	[7_1], [7_2], [7_3], [7_4],
	[8_1], [8_2], [8_3], [8_4],
	[9_1], [9_2], [9_3], [9_4],
	[10_1], [10_2], [10_3], [10_4],
	[11_1], [11_2], [11_3], [11_4],
	[12_1], [12_2], [12_3], [12_4],
	[13_1], [13_2], [13_3], [13_4],
	[14_1], [14_2], [14_3], [14_4],
	[15_1], [15_2], [15_3], [15_4]
	FROM
	(SELECT tbi.lsc_tig_budget_id,
		CAST(tbl.id AS VARCHAR(2)) + '_' + CAST(tbft.id AS VARCHAR(2)) line_funding_type,
		ISNULL(tbi.amount, 0) amount
		FROM lsc_tig_budget_item tbi
			join lsc_tig_budget tb ON tbi.lsc_tig_budget_id = tb.lsc_tig_budget_id
			join lsc_a_tig_budget_line tbl ON tbi.lsc_tig_budget_line_id = tbl.id
			join LSC_a_TIG_BUDGET_FUNDING_TYPE tbft ON tbi.lsc_tig_budget_funding_type_id = tbft.id) AS lines
		PIVOT
			(SUM(amount)
				FOR line_funding_type in 
					([1_1], [1_2], [1_3], [1_4],
					[2_1], [2_2], [2_3], [2_4],
					[3_1], [3_2], [3_3], [3_4],
					[4_1], [4_2], [4_3], [4_4],
					[5_1], [5_2], [5_3], [5_4],
					[6_1], [6_2], [6_3], [6_4],
					[7_1], [7_2], [7_3], [7_4],
					[8_1], [8_2], [8_3], [8_4],
					[9_1], [9_2], [9_3], [9_4],
					[10_1], [10_2], [10_3], [10_4],
					[11_1], [11_2], [11_3], [11_4],
					[12_1], [12_2], [12_3], [12_4],
					[13_1], [13_2], [13_3], [13_4],
					[14_1], [14_2], [14_3], [14_4],
					[15_1], [15_2], [15_3], [15_4])
			) AS pvt
