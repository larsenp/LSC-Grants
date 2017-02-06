
CREATE VIEW [dbo].[vLSC_PBIF_BUDGET_BY_CATEGORY_PIVOT]

AS

SELECT lsc_PBIF_budget_id,
	[1], [2], [3], [4], [5]
	, [6], [7], [8], [9], [10]
	, [11], [12], [13],[14],[15]
	FROM (SELECT lsc_PBIF_budget_id,
		sort_order,
		category_total
		FROM vLSC_PBIF_BUDGET_BY_CATEGORY) AS categories
	PIVOT (SUM(category_total)
		FOR sort_order IN ([1], [2], [3], [4], [5]
			, [6], [7], [8], [9], [10]
			, [11], [12], [13], [14], [15], [16])
		) AS pvt


GO

CREATE VIEW [dbo].[vLSC_PBIF_BUDGET_PIVOT]

AS

SELECT lsc_pbif_budget_id,
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
	[15_1], [15_2], [15_3], [15_4],
	[16_1], [16_2], [16_3], [16_4]
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
					[15_1], [15_2], [15_3], [15_4],
					[16_1], [16_2], [16_3], [16_4])
			) AS pvt


GO


CREATE VIEW [dbo].[vLSC_PBIF_BUDGET_BC]

AS

SELECT tb.[lsc_pbif_budget_id]
	,tb.lsc_pbif_budget_type_id
	,tb.wf_task_assignment_id
	,gp.grantee_project_id
	,gp.legacy_grant_id pbif
      , tbp.[1_1] per_exp_1
      , tbp.[1_2] per_exp_2
      , tbp.[1_3] per_exp_3
      , tbp.[1_4] per_exp_4
      , tbp.[2_1] sal_wage_1
      , tbp.[2_2] sal_wage_2
      , tbp.[2_3] sal_wage_3
      , tbp.[2_4] sal_wage_4
      , tbp.[3_1] fringe_1
      , tbp.[3_2] fringe_2
      , tbp.[3_3] fringe_3
      , tbp.[3_4] fringe_4
      , tbp.[4_1] proj_exp_1
      , tbp.[4_2] proj_exp_2
      , tbp.[4_3] proj_exp_3
      , tbp.[4_4] proj_exp_4
      , tbp.[5_1] travel_1
      , tbp.[5_2] travel_2
      , tbp.[5_3] travel_3
      , tbp.[5_4] travel_4
      , tbp.[6_1] equip_1
      , tbp.[6_2] equip_2
      , tbp.[6_3] equip_3
      , tbp.[6_4] equip_4
      , tbp.[7_1] software_1
      , tbp.[7_2] software_2
      , tbp.[7_3] software_3
      , tbp.[7_4] software_4
      , tbp.[8_1] supplies_1
      , tbp.[8_2] supplies_2
      , tbp.[8_3] supplies_3
      , tbp.[8_4] supplies_4
      , tbp.[9_1] comm_1
      , tbp.[9_2] comm_2
      , tbp.[9_3] comm_3
      , tbp.[9_4] comm_4
      , tbp.[10_1] train_1
      , tbp.[10_2] train_2
      , tbp.[10_3] train_3
      , tbp.[10_4] train_4
      , tbp.[11_1] eval_1
      , tbp.[11_2] eval_2
      , tbp.[11_3] eval_3
      , tbp.[11_4] eval_4
      , tbp.[12_1] other_1
      , tbp.[12_2] other_2
      , tbp.[12_3] other_3
      ,tbp.[12_4] other_4
	  ,tbp.[13_1] tp_1
	  ,tbp.[13_2] tp_2
	  ,tbp.[13_3] tp_3
	  ,tbp.[13_4] tp_4
	  ,tbp.[14_1] contract_1
	  ,tbp.[14_2] contract_2
	  ,tbp.[14_3] contract_3
	  ,tbp.[14_4] contract_4
	  ,tbp.[15_1] sub_contract_1
	  ,tbp.[15_2] sub_contract_2
	  ,tbp.[15_3] sub_contract_3
	  ,tbp.[15_4] sub_contract_4
	

  FROM [vLSC_PBIF_BUDGET_PIVOT] tbp
	JOIN LSC_PBIF_BUDGET tb ON tbp.lsc_pbif_budget_id = tb.lsc_pbif_budget_id
	JOIN WF_TASK_ASSIGNMENT wfta ON tb.wf_task_assignment_id = wfta.wf_task_assignment_id
	JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id

UNION ALL

SELECT tb.[lsc_pbif_budget_id]
	,tb.lsc_pbif_budget_type_id
	,NULL wf_task_assignment_id
	,gp.grantee_project_id
	,gp.legacy_grant_id tig
      , tbp.[1_1] per_exp_1
      , tbp.[1_2] per_exp_2
      , tbp.[1_3] per_exp_3
      , tbp.[1_4] per_exp_4
      , tbp.[2_1] sal_wage_1
      , tbp.[2_2] sal_wage_2
      , tbp.[2_3] sal_wage_3
      , tbp.[2_4] sal_wage_4
      , tbp.[3_1] fringe_1
      , tbp.[3_2] fringe_2
      , tbp.[3_3] fringe_3
      , tbp.[3_4] fringe_4
      , tbp.[4_1] proj_exp_1
      , tbp.[4_2] proj_exp_2
      , tbp.[4_3] proj_exp_3
      , tbp.[4_4] proj_exp_4
      , tbp.[5_1] travel_1
      , tbp.[5_2] travel_2
      , tbp.[5_3] travel_3
      , tbp.[5_4] travel_4
      , tbp.[6_1] equip_1
      , tbp.[6_2] equip_2
      , tbp.[6_3] equip_3
      , tbp.[6_4] equip_4
      , tbp.[7_1] software_1
      , tbp.[7_2] software_2
      , tbp.[7_3] software_3
      , tbp.[7_4] software_4
      , tbp.[8_1] supplies_1
      , tbp.[8_2] supplies_2
      , tbp.[8_3] supplies_3
      , tbp.[8_4] supplies_4
      , tbp.[9_1] comm_1
      , tbp.[9_2] comm_2
      , tbp.[9_3] comm_3
      , tbp.[9_4] comm_4
      , tbp.[10_1] train_1
      , tbp.[10_2] train_2
      , tbp.[10_3] train_3
      , tbp.[10_4] train_4
      , tbp.[11_1] eval_1
      , tbp.[11_2] eval_2
      , tbp.[11_3] eval_3
      , tbp.[11_4] eval_4
      , tbp.[12_1] other_1
      , tbp.[12_2] other_2
      , tbp.[12_3] other_3
      ,tbp.[12_4] other_4
	  ,tbp.[13_1] tp_1
	  ,tbp.[13_2] tp_2
	  ,tbp.[13_3] tp_3
	  ,tbp.[13_4] tp_4
	  ,tbp.[14_1] contract_1
	  ,tbp.[14_2] contract_2
	  ,tbp.[14_3] contract_3
	  ,tbp.[14_4] contract_4
	  ,tbp.[15_1] sub_contract_1
	  ,tbp.[15_2] sub_contract_2
	  ,tbp.[15_3] sub_contract_3
	  ,tbp.[15_4] sub_contract_4
  FROM [vLSC_PBIF_BUDGET_PIVOT] tbp
	JOIN LSC_PBIF_BUDGET tb ON tbp.lsc_pbif_budget_id = tb.lsc_pbif_budget_id
	JOIN GRANTEE_PROJECT gp ON tb.grantee_project_id = gp.grantee_project_id


GO


