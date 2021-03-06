
/****** Object:  View [dbo].[vLSC_BUDGET_TIG]    Script Date: 10/23/2009 15:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vLSC_BUDGET_TIG]
AS
SELECT	lsc_budget_tig_id,
        grantee_project_id,
        personnel_1+fringe_1+space_cost_1+travel_1+equip_purchase_1+equip_rent_1+telecom_1+comm_1+software_1+supplies_1+contracts_1+eval_cost_1+training_1+audit_cost_1+other_1 lsc_grantrequest_total,
        personnel_2+fringe_2+space_cost_2+travel_2+equip_purchase_2+equip_rent_2+telecom_2+comm_2+software_2+supplies_2+contracts_2+eval_cost_2+training_2+audit_cost_2+other_2 programproject_total,
        personnel_3+fringe_3+space_cost_3+travel_3+equip_purchase_3+equip_rent_3+telecom_3+comm_3+software_3+supplies_3+contracts_3+eval_cost_3+training_3+audit_cost_3+other_3 other_lsc_funded_partners,
        personnel_4+fringe_4+space_cost_4+travel_4+equip_purchase_4+equip_rent_4+telecom_4+comm_4+software_4+supplies_4+contracts_4+eval_cost_4+training_4+audit_cost_4+other_4 non_lsc_funded_partners,
		personnel_1 + personnel_2 + personnel_3 + personnel_4 personnel_total,
		fringe_1 + fringe_2 + fringe_3 + fringe_4 fringe_total,
		space_cost_1 + space_cost_2 + space_cost_3 + space_cost_4 spacecost_total,
		travel_1 + travel_2 + travel_3 + travel_4 travel_total,
		equip_purchase_1 + equip_purchase_2 + equip_purchase_3 + equip_purchase_4 equipurchase_total,
		equip_rent_1 + equip_rent_2 + equip_rent_3 + equip_rent_4 equiprent_total,
		telecom_1 + telecom_2 + telecom_3 + telecom_4 telecom_total,
		comm_1 + comm_2 + comm_3 + comm_4 comm_total,
		software_1 + software_2 + software_3 + software_4 software_total,
		supplies_1 + supplies_2 + supplies_3 + supplies_4 supplies_total,
		contracts_1 + contracts_2 + contracts_3 + contracts_4 contracts_total,
		eval_cost_1 + eval_cost_2 + eval_cost_3 + eval_cost_4 eval_total,
		training_1 + training_2 + training_3 + training_4 training_total,
		audit_cost_1 + audit_cost_2 + audit_cost_3 + audit_cost_4 audit_total,
		other_1 + other_2 + other_3 + other_4 other_total,
        personnel_1+fringe_1+space_cost_1+travel_1+equip_purchase_1+equip_rent_1+telecom_1+comm_1+software_1+supplies_1+contracts_1+eval_cost_1+training_1+audit_cost_1+other_1 +
        personnel_2+fringe_2+space_cost_2+travel_2+equip_purchase_2+equip_rent_2+telecom_2+comm_2+software_2+supplies_2+contracts_2+eval_cost_2+training_2+audit_cost_2+other_2 +
        personnel_3+fringe_3+space_cost_3+travel_3+equip_purchase_3+equip_rent_3+telecom_3+comm_3+software_3+supplies_3+contracts_3+eval_cost_3+training_3+audit_cost_3+other_3 +
        personnel_4+fringe_4+space_cost_4+travel_4+equip_purchase_4+equip_rent_4+telecom_4+comm_4+software_4+supplies_4+contracts_4+eval_cost_4+training_4+audit_cost_4+other_4  TOTAL
FROM LSC_BUDGET_TIG












