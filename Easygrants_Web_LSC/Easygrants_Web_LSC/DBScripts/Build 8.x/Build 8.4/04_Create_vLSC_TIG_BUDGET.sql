CREATE VIEW vLSC_TIG_BUDGET

AS

SELECT tb.[lsc_tig_budget_id]
	,tb.wf_task_assignment_id
	,gp.grantee_project_id
	,gp.legacy_grant_id tig
      , tbp.[1_1] personnel_1
      , tbp.[1_2] personnel_2
      , tbp.[1_3] personnel_3
      , tbp.[1_4] personnel_4
      , tbp.[2_1] fringe_1
      , tbp.[2_2] fringe_2
      , tbp.[2_3] fringe_3
      , tbp.[2_4] fringe_4
      , tbp.[3_1] space_cost_1
      , tbp.[3_2] space_cost_2
      , tbp.[3_3] space_cost_3
      , tbp.[3_4] space_cost_4
      , tbp.[4_1] travel_1
      , tbp.[4_2] travel_2
      , tbp.[4_3] travel_3
      , tbp.[4_4] travel_4
      , tbp.[5_1] equip_purchase_1
      , tbp.[5_2] equip_purchase_2
      , tbp.[5_3] equip_purchase_3
      , tbp.[5_4] equip_purchase_4
      , tbp.[6_1] equip_rent_1
      , tbp.[6_2] equip_rent_2
      , tbp.[6_3] equip_rent_3
      , tbp.[6_4] equip_rent_4
      , tbp.[7_1] telecom_1
      , tbp.[7_2] telecom_2
      , tbp.[7_3] telecom_3
      , tbp.[7_4] telecom_4
      , tbp.[8_1] comm_1
      , tbp.[8_2] comm_2
      , tbp.[8_3] comm_3
      , tbp.[8_4] comm_4
      , tbp.[9_1] software_1
      , tbp.[9_2] software_2
      , tbp.[9_3] software_3
      , tbp.[9_4] software_4
      , tbp.[10_1] supplies_1
      , tbp.[10_2] supplies_2
      , tbp.[10_3] supplies_3
      , tbp.[10_4] supplies_4
      , tbp.[11_1] contracts_1
      , tbp.[11_2] contracts_2
      , tbp.[11_3] contracts_3
      , tbp.[11_4] contracts_4
      , tbp.[12_1] eval_cost_1
      , tbp.[12_2] eval_cost_2
      , tbp.[12_3] eval_cost_3
      , tbp.[12_4] eval_cost_4
      , tbp.[13_1] training_1
      , tbp.[13_2] training_2
      , tbp.[13_3] training_3
      , tbp.[13_4] training_4
      , tbp.[14_1] audit_cost_1
      , tbp.[14_2] audit_cost_2
      , tbp.[14_3] audit_cost_3
      , tbp.[14_4] audit_cost_4
      , tbp.[15_1] other_1
      , tbp.[15_2] other_2
      , tbp.[15_3] other_3
      , tbp.[15_4] other_4
  FROM [vLSC_TIG_BUDGET_PIVOT] tbp
	JOIN LSC_TIG_BUDGET tb ON tbp.lsc_tig_budget_id = tb.lsc_tig_budget_id
	JOIN WF_TASK_ASSIGNMENT wfta ON tb.wf_task_assignment_id = wfta.wf_task_assignment_id
	JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id

UNION ALL

SELECT tb.[lsc_tig_budget_id]
	,NULL wf_task_assignment_id
	,gp.grantee_project_id
	,gp.legacy_grant_id tig
      , tbp.[1_1] personnel_1
      , tbp.[1_2] personnel_2
      , tbp.[1_3] personnel_3
      , tbp.[1_4] personnel_4
      , tbp.[2_1] fringe_1
      , tbp.[2_2] fringe_2
      , tbp.[2_3] fringe_3
      , tbp.[2_4] fringe_4
      , tbp.[3_1] space_cost_1
      , tbp.[3_2] space_cost_2
      , tbp.[3_3] space_cost_3
      , tbp.[3_4] space_cost_4
      , tbp.[4_1] travel_1
      , tbp.[4_2] travel_2
      , tbp.[4_3] travel_3
      , tbp.[4_4] travel_4
      , tbp.[5_1] equip_purchase_1
      , tbp.[5_2] equip_purchase_2
      , tbp.[5_3] equip_purchase_3
      , tbp.[5_4] equip_purchase_4
      , tbp.[6_1] equip_rent_1
      , tbp.[6_2] equip_rent_2
      , tbp.[6_3] equip_rent_3
      , tbp.[6_4] equip_rent_4
      , tbp.[7_1] telecom_1
      , tbp.[7_2] telecom_2
      , tbp.[7_3] telecom_3
      , tbp.[7_4] telecom_4
      , tbp.[8_1] comm_1
      , tbp.[8_2] comm_2
      , tbp.[8_3] comm_3
      , tbp.[8_4] comm_4
      , tbp.[9_1] software_1
      , tbp.[9_2] software_2
      , tbp.[9_3] software_3
      , tbp.[9_4] software_4
      , tbp.[10_1] supplies_1
      , tbp.[10_2] supplies_2
      , tbp.[10_3] supplies_3
      , tbp.[10_4] supplies_4
      , tbp.[11_1] contracts_1
      , tbp.[11_2] contracts_2
      , tbp.[11_3] contracts_3
      , tbp.[11_4] contracts_4
      , tbp.[12_1] eval_cost_1
      , tbp.[12_2] eval_cost_2
      , tbp.[12_3] eval_cost_3
      , tbp.[12_4] eval_cost_4
      , tbp.[13_1] training_1
      , tbp.[13_2] training_2
      , tbp.[13_3] training_3
      , tbp.[13_4] training_4
      , tbp.[14_1] audit_cost_1
      , tbp.[14_2] audit_cost_2
      , tbp.[14_3] audit_cost_3
      , tbp.[14_4] audit_cost_4
      , tbp.[15_1] other_1
      , tbp.[15_2] other_2
      , tbp.[15_3] other_3
      , tbp.[15_4] other_4
  FROM [vLSC_TIG_BUDGET_PIVOT] tbp
	JOIN LSC_TIG_BUDGET tb ON tbp.lsc_tig_budget_id = tb.lsc_tig_budget_id
	JOIN GRANTEE_PROJECT gp ON tb.grantee_project_id = gp.grantee_project_id
