CREATE VIEW [dbo].[vLSC_COMP_APPL_FISCAL_SCORE_TOTAL_2015]

AS

SELECT	wfta.wf_task_assignment_id
	,cwosy.organization_id
	,cwosy.time_period_id
	,cafsp.subtotal_part_i 
		+ cafsp.subtotal_part_ii 
		+ cafsp.subtotal_part_iii 
		+ cafsp.subtotal_part_iv 
		+ cafsp.subtotal_part_v 
		+ cafsp.subtotal_part_vi 
		+ cafsp.subtotal_part_vii 
		+ cafsp.subtotal_part_viii total_score
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON wfta.wf_task_assignment_id = cwosy.wf_task_assignment_id
		JOIN LSC_COMP_APPL_FISCAL caf ON cwosy.organization_id = caf.organization_id
			AND cwosy.time_period_id = caf.time_period_id
		JOIN vLSC_COMP_APPL_FISCAL_SCORE_BY_PART_2015 cafsp ON caf.lsc_comp_appl_fiscal_id = cafsp.lsc_comp_appl_fiscal_id
	WHERE wfta.wf_task_id = 83
