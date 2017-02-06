/****** Object:  View [dbo].[vLSC_TIG_BUDGET]    Script Date: 04/24/2014 14:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_TIG_BUDGET_BC]

AS

SELECT tb.[lsc_tig_budget_id]
	,tb.lsc_tig_budget_type_id
	,tb.wf_task_assignment_id
	,gp.grantee_project_id
	,gp.legacy_grant_id tig
      , tbp.[1_1] sal_wage_1
      , tbp.[1_2] sal_wage_2
      , tbp.[1_3] sal_wage_3
      , tbp.[1_4] sal_wage_4
      , tbp.[2_1] fringe_1
      , tbp.[2_2] fringe_2
      , tbp.[2_3] fringe_3
      , tbp.[2_4] fringe_4
      , tbp.[3_1] travel_1
      , tbp.[3_2] travel_2
      , tbp.[3_3] travel_3
      , tbp.[3_4] travel_4
      , tbp.[4_1] equipment_1
      , tbp.[4_2] equipment_2
      , tbp.[4_3] equipment_3
      , tbp.[4_4] equipment_4
      , tbp.[5_1] telecom_1
      , tbp.[5_2] telecom_2
      , tbp.[5_3] telecom_3
      , tbp.[5_4] telecom_4
      , tbp.[6_1] comm_1
      , tbp.[6_2] comm_2
      , tbp.[6_3] comm_3
      , tbp.[6_4] comm_4
      , tbp.[7_1] software_1
      , tbp.[7_2] software_2
      , tbp.[7_3] software_3
      , tbp.[7_4] software_4
      , tbp.[8_1] supplies_1
      , tbp.[8_2] supplies_2
      , tbp.[8_3] supplies_3
      , tbp.[8_4] supplies_4
      , tbp.[9_1] contracts_1
      , tbp.[9_2] contracts_2
      , tbp.[9_3] contracts_3
      , tbp.[9_4] contracts_4
      , tbp.[10_1] proj_eval_1
      , tbp.[10_2] proj_eval_2
      , tbp.[10_3] proj_eval_3
      , tbp.[10_4] proj_eval_4
      , tbp.[11_1] training_1
      , tbp.[11_2] training_2
      , tbp.[11_3] training_3
      , tbp.[11_4] training_4
      , tbp.[12_1] other_1
      , tbp.[12_2] other_2
      , tbp.[12_3] other_3
      , tbp.[12_4] other_4
      , tbp.[13_1] conf_fee_1
      , tbp.[13_2] conf_fee_2
      , tbp.[13_3] conf_fee_3
      , tbp.[13_4] conf_fee_4
  FROM [vLSC_TIG_BUDGET_PIVOT_BC] tbp
	JOIN LSC_TIG_BUDGET tb ON tbp.lsc_tig_budget_id = tb.lsc_tig_budget_id
	JOIN WF_TASK_ASSIGNMENT wfta ON tb.wf_task_assignment_id = wfta.wf_task_assignment_id
	JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id

UNION ALL

SELECT tb.[lsc_tig_budget_id]
	,tb.lsc_tig_budget_type_id
	,NULL wf_task_assignment_id
	,gp.grantee_project_id
	,gp.legacy_grant_id tig
      , tbp.[1_1] sal_wage_1
      , tbp.[1_2] sal_wage_2
      , tbp.[1_3] sal_wage_3
      , tbp.[1_4] sal_wage_4
      , tbp.[2_1] fringe_1
      , tbp.[2_2] fringe_2
      , tbp.[2_3] fringe_3
      , tbp.[2_4] fringe_4
      , tbp.[3_1] travel_1
      , tbp.[3_2] travel_2
      , tbp.[3_3] travel_3
      , tbp.[3_4] travel_4
      , tbp.[4_1] equipment_1
      , tbp.[4_2] equipment_2
      , tbp.[4_3] equipment_3
      , tbp.[4_4] equipment_4
      , tbp.[5_1] telecom_1
      , tbp.[5_2] telecom_2
      , tbp.[5_3] telecom_3
      , tbp.[5_4] telecom_4
      , tbp.[6_1] comm_1
      , tbp.[6_2] comm_2
      , tbp.[6_3] comm_3
      , tbp.[6_4] comm_4
      , tbp.[7_1] software_1
      , tbp.[7_2] software_2
      , tbp.[7_3] software_3
      , tbp.[7_4] software_4
      , tbp.[8_1] supplies_1
      , tbp.[8_2] supplies_2
      , tbp.[8_3] supplies_3
      , tbp.[8_4] supplies_4
      , tbp.[9_1] contracts_1
      , tbp.[9_2] contracts_2
      , tbp.[9_3] contracts_3
      , tbp.[9_4] contracts_4
      , tbp.[10_1] proj_eval_1
      , tbp.[10_2] proj_eval_2
      , tbp.[10_3] proj_eval_3
      , tbp.[10_4] proj_eval_4
      , tbp.[11_1] training_1
      , tbp.[11_2] training_2
      , tbp.[11_3] training_3
      , tbp.[11_4] training_4
      , tbp.[12_1] other_1
      , tbp.[12_2] other_2
      , tbp.[12_3] other_3
      , tbp.[12_4] other_4
      , tbp.[13_1] conf_fee_1
      , tbp.[13_2] conf_fee_2
      , tbp.[13_3] conf_fee_3
      , tbp.[13_4] conf_fee_4
  FROM [vLSC_TIG_BUDGET_PIVOT_BC] tbp
	JOIN LSC_TIG_BUDGET tb ON tbp.lsc_tig_budget_id = tb.lsc_tig_budget_id
	JOIN GRANTEE_PROJECT gp ON tb.grantee_project_id = gp.grantee_project_id
