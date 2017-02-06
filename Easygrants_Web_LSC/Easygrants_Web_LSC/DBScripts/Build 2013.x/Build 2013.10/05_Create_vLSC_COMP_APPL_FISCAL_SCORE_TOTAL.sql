CREATE VIEW vLSC_COMP_APPL_FISCAL_SCORE_TOTAL

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
		+ cafsp.subtotal_part_vii response_subtotal
	,rcaos.score reviewer_score
	,cafsp.subtotal_part_i 
		+ cafsp.subtotal_part_ii 
		+ cafsp.subtotal_part_iii 
		+ cafsp.subtotal_part_iv 
		+ cafsp.subtotal_part_v 
		+ cafsp.subtotal_part_vi 
		+ cafsp.subtotal_part_vii 
		+ ISNULL(rcaos.score, 0) total_score
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON wfta.wf_task_assignment_id = cwosy.wf_task_assignment_id
		JOIN LSC_COMP_APPL_FISCAL caf ON cwosy.organization_id = caf.organization_id
			AND cwosy.time_period_id = caf.time_period_id
		JOIN vLSC_COMP_APPL_FISCAL_SCORE_BY_PART cafsp ON caf.lsc_comp_appl_fiscal_id = cafsp.lsc_comp_appl_fiscal_id
		LEFT JOIN LSC_REVIEW_COMP_APPL_OCE_STAFF rcaos on wfta.wf_task_assignment_id = rcaos.wf_task_assignment_id
