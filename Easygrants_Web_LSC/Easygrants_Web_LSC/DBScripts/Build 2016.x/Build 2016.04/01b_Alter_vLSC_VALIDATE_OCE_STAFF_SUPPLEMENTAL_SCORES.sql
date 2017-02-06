ALTER VIEW [dbo].[vLSC_VALIDATE_OCE_STAFF_SUPPLEMENTAL_SCORES]

AS

SELECT cwosy.wf_task_assignment_id
	,CASE caf.lsc_finance_report_review_interval_id WHEN 4 THEN 1 ELSE 0 END finance_report_review_interval_is_other
	,rcaos.lsc_finance_report_review_interval_other_score
	,CASE caf.lsc_acctg_ctrl_policy_review_interval_id WHEN 3 THEN 1 ELSE 0 END acctg_ctrl_policy_review_interval_is_other
	,rcaos.lsc_acctg_ctrl_policy_review_interval_other_score
	,CASE ccj.lsc_ceo_compensation_justification_lkp_id WHEN 4 THEN 1 ELSE 0 END lsc_ceo_compensation_justification_is_other
	,rcaos.lsc_ceo_compensation_justification_other_score
	FROM LSC_REVIEW_COMP_APPL_OCE_STAFF rcaos
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON rcaos.wf_task_assignment_id = cwosy.wf_task_assignment_id
		JOIN LSC_COMP_APPL_FISCAL caf ON cwosy.organization_id = caf.organization_id
			AND cwosy.time_period_id = caf.time_period_id
		LEFT JOIN LSC_CEO_COMPENSATION_JUSTIFICATION ccj ON caf.lsc_comp_appl_fiscal_id = ccj.lsc_comp_appl_fiscal_id
			AND ccj.lsc_ceo_compensation_justification_lkp_id = 4
	WHERE cwosy.wf_task_id = 83
