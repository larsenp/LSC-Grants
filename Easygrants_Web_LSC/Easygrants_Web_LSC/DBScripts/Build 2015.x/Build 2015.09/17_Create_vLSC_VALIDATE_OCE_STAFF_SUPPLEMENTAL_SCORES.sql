CREATE VIEW vLSC_VALIDATE_OCE_STAFF_SUPPLEMENTAL_SCORES

AS

SELECT cwosy.wf_task_assignment_id
	,CASE caf.lsc_finance_report_review_interval_id WHEN 4 THEN 1 ELSE 0 END finance_report_review_interval_is_other
	,rcaos.lsc_finance_report_review_interval_other_score
	,CASE caf.lsc_acctg_ctrl_policy_review_interval_id WHEN 3 THEN 1 ELSE 0 END acctg_ctrl_policy_review_interval_is_other
	,rcaos.lsc_acctg_ctrl_policy_review_interval_other_score
	FROM LSC_REVIEW_COMP_APPL_OCE_STAFF rcaos
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON rcaos.wf_task_assignment_id = cwosy.wf_task_assignment_id
		JOIN LSC_COMP_APPL_FISCAL caf ON cwosy.organization_id = caf.organization_id
			AND cwosy.time_period_id = caf.time_period_id
	WHERE cwosy.wf_task_id = 83
