CREATE VIEW [dbo].[vLSC_COMP_APPL_FISCAL_SCORE_2017]

AS

SELECT lsc_comp_appl_fiscal_id
	,caf.organization_id
	,caf.time_period_id
	,cwosy.wf_task_assignment_id oce_staff_review_wfta_id
	,CASE WHEN bod_finance_committee = 1 THEN 1 ELSE 0 END bod_finance_committee --I.1
	,CASE WHEN bod_finance_charter = 1 THEN 1 ELSE 0 END bod_finance_charter --I.1.a
	,CASE WHEN bod_audit_committee = 1 THEN 1 ELSE 0 END bod_audit_committee --I.2
	,CASE WHEN bod_audit_charter = 1 THEN 1 ELSE 0 END bod_audit_charter --I.2.a
	,CASE WHEN bod_audit_finance = 1 THEN 1 ELSE 0 END bod_audit_finance --I.3
	,CASE WHEN bod_audit_finance_charter = 1 THEN 1 ELSE 0 END bod_audit_finance_charter --I.3.a
	,CASE WHEN finance_revise_budget = 1 THEN 1 ELSE 0 END finance_revise_budget --I.4
	,CASE WHEN finance_review_report = 1 THEN 1 ELSE 0 END finance_review_report --I.5
	,CASE WHEN lsc_finance_report_review_interval_id = 1 THEN 2 
		WHEN lsc_finance_report_review_interval_id = 2 THEN 1 ELSE 0 END lsc_finance_report_review_interval_applicant --I.5.a (applicant response)
	,ISNULL(rcaos.lsc_finance_report_review_interval_other_score, 0) lsc_finance_report_review_interval_other_score --I.5.a (reviewer score if other)
	,CASE WHEN lsc_finance_report_review_interval_id = 1 THEN 2 
		WHEN lsc_finance_report_review_interval_id = 2 THEN 1 ELSE 0 END 
		+ ISNULL(rcaos.lsc_finance_report_review_interval_other_score, 0) lsc_finance_report_review_interval --I.5.a (total)
	,CASE WHEN finance_review_accounting_policy = 1 THEN 1 ELSE 0 END finance_review_accounting_policy --I.5.b
	,CASE WHEN lsc_acctg_ctrl_policy_review_interval_id = 1 THEN 2
		WHEN lsc_acctg_ctrl_policy_review_interval_id = 2 THEN 1 ELSE 0 END lsc_acctg_ctrl_policy_review_interval_applicant --I.5.c (applicant response)
	,ISNULL(rcaos.lsc_acctg_ctrl_policy_review_interval_other_score, 0) lsc_acctg_ctrl_policy_review_interval_other_score --I.5.c (reviewer score if other)
	,CASE WHEN lsc_acctg_ctrl_policy_review_interval_id = 1 THEN 2
		WHEN lsc_acctg_ctrl_policy_review_interval_id = 2 THEN 1 ELSE 0 END 
		+ ISNULL(rcaos.lsc_acctg_ctrl_policy_review_interval_other_score, 0) lsc_acctg_ctrl_policy_review_interval --I.5.c (total)
	,CASE WHEN finance_review_financial_stmts = 1 THEN 1 ELSE 0 END finance_review_financial_stmts --I.6
	,CASE WHEN finance_review_investment_policy = 1 THEN 1 ELSE 0 END finance_review_investment_policy --I.7
	,CASE WHEN lsc_acct_manual_last_training_id = 1 THEN 2
		WHEN lsc_acct_manual_last_training_id = 2 THEN 1 
		WHEN lsc_acct_manual_last_training_id = 3 THEN 0.5 ELSE 0 END lsc_acct_manual_last_training_id --I.8.a
	,CASE WHEN lsc_acct_manual_training = 1 AND lsc_acct_manual_training_orientation = 1 THEN 1 ELSE 0 END lsc_acct_manual_training_orientation --I.8.b (Submission-level validation does not prevent user from answering "Yes" to I.8.b after answering "No" to I.8, so the scoring view ensures that no points are given for the "No-Yes" combination.)
	,CASE WHEN auditor_selection_body_id = 1 THEN 0
		WHEN auditor_selection_body_id = 2 THEN 1 
		WHEN auditor_selection_body_id = 3 THEN 1 
		WHEN auditor_selection_body_id = 4 THEN 1 
		WHEN auditor_selection_body_id = 5 THEN 1 
		WHEN auditor_selection_body_id = 6 THEN 1 ELSE 0 END auditor_selection_body --I.9
	,CASE WHEN auditor_set_compensation_body_id = 1 THEN 0
		WHEN auditor_set_compensation_body_id = 2 THEN 1 
		WHEN auditor_set_compensation_body_id = 3 THEN 1 
		WHEN auditor_set_compensation_body_id = 4 THEN 1 
		WHEN auditor_set_compensation_body_id = 5 THEN 1 
		WHEN auditor_set_compensation_body_id = 6 THEN 1 ELSE 0 END auditor_set_compensation_body --I.10
	,CASE WHEN auditor_oversight_body_id = 1 THEN 0
		WHEN auditor_oversight_body_id = 2 THEN 1 
		WHEN auditor_oversight_body_id = 3 THEN 1 
		WHEN auditor_oversight_body_id = 4 THEN 1 
		WHEN auditor_oversight_body_id = 5 THEN 1 
		WHEN auditor_oversight_body_id = 6 THEN 1 ELSE 0 END auditor_oversight_body --I.11
	,CASE WHEN lsc_auditor_solicitation_interval_id = 1 THEN 2
		WHEN lsc_auditor_solicitation_interval_id = 2 THEN 1 ELSE 0 END lsc_auditor_solicitation_interval --I.12
	,CASE WHEN lsc_audit_partner_change_interval_id = 1 THEN 1
		WHEN lsc_audit_partner_change_interval_id = 2 THEN 0.5 ELSE 0 END lsc_audit_partner_change_interval --I.12.a
	,CASE WHEN set_ipa_rules = 1 THEN 1 ELSE 0 END set_ipa_rules --I.13
	,CASE WHEN review_form_990 = 1 THEN 1 ELSE 0 END review_form_990 --I.14
	,CASE WHEN review_ceo_compensation = 1 THEN 1 ELSE 0 END review_ceo_compensation --I.15
	,dbo.fnCEO_COMPENSATION_JUSTIFICATION_SCORE(lsc_comp_appl_fiscal_id) ceo_compensation_justification --I.16
	,ISNULL(rcaos.lsc_ceo_compensation_justification_other_score, 0) lsc_ceo_compensation_justification_other_score --I.16 (reviewer score if other)
	,CASE WHEN lsc_ceo_compensation_last_review_id = 1 THEN 1 ELSE 0 END lsc_ceo_compensation_last_review --I.16.a
	,CASE WHEN audit_bod_ensure_ethics = 1 THEN 2 ELSE 0 END audit_bod_ensure_ethics --I.17
	,CASE WHEN bod_gaap = 1 THEN 1 ELSE 0 END bod_gaap --I.18.a
	,CASE WHEN bod_gaap_statements = 1 THEN 1 ELSE 0 END bod_gaap_statements --I.18.b
	,CASE WHEN bod_controls = 1 THEN 1 ELSE 0 END bod_controls --I.18.c
	,CASE WHEN bod_rule_interp = 1 THEN 1 ELSE 0 END bod_rule_interp --I.18.d
	,CASE WHEN prepare_fin_rpts = 1 THEN 2 ELSE 0 END prepare_fin_rpts --I.19
	,CASE financial_report_frequency_id WHEN 1 THEN 2 WHEN 2 THEN 1 ELSE 0 END financial_report_frequency --I.20
	,CASE WHEN budget_ctrl_mthly = 1 THEN 1 ELSE 0 END budget_ctrl_mthly --I.21
	,CASE WHEN explain_budget_var_mngt = 1 THEN 1 ELSE 0 END explain_budget_var_mngt --I.22: END PART I
	,dbo.fnLSC_FRP_FISCAL_QUALIFICATION_SCORE_2016(lsc_comp_appl_fiscal_id) frp_fiscal_qualifications --II.2
	,CASE WHEN frp_acctg_experience_id = 1 THEN 3
		WHEN frp_acctg_experience_id = 2 THEN 2
		WHEN  frp_acctg_experience_id = 4 THEN 1
		ELSE 0 END frp_acctg_experience --II.3
	,CASE WHEN frp_most_recent_lsc_trng_id = 4 THEN 2
		WHEN frp_most_recent_lsc_trng_id = 1 THEN 1
		ELSE 0 END frp_most_recent_lsc_trng --II.4
	,CASE WHEN frp_background_check = 1 THEN 2 ELSE 0 END frp_background_check --II.5
	,dbo.fnLSC_FRP_BACKGROUND_CHECK_AREAS_INQUIRY_SCORE(lsc_comp_appl_fiscal_id) frp_background_check_areas_inquiry --II.5a
	,CASE WHEN policy_five_days_vacation = 1 THEN 1 ELSE 0 END policy_five_days_vacation --II.6
	,CASE WHEN vacation_other_employee_int = 1 THEN 1 ELSE 0 END vacation_other_employee --II.6a: END PART II
	,dbo.fnLSC_FISCAL_INTERNAL_CONTROLS_INSTITUTED_SCORE(lsc_comp_appl_fiscal_id) fiscal_internal_controls_instituted --III.2
	,CASE WHEN has_lsc_subgrants = 0 THEN 4 ELSE 0 END has_lsc_subgrants --III.4
	,CASE WHEN subgrantee_site_visits = 1 THEN 1 ELSE 0 END subgrantee_site_visits --III.4.a.1
	,CASE WHEN subgrantee_fin_rpt_review = 1 THEN 1 ELSE 0 END subgrantee_fin_rpt_review --III.4.a.2
	,CASE WHEN subgrantee_fin_stmt_review = 1 THEN 1 ELSE 0 END subgrantee_fin_stmt_review --III.4.a.3
	,CASE WHEN subgrantee_cost_alloc_review = 1 THEN 1 ELSE 0 END subgrantee_cost_alloc_review --III.4.a.4
	,CASE WHEN cost_allocation_policy = 1 THEN 2 ELSE 0 END cost_allocation_policy --III.5
	,CASE WHEN pai_allocation_meth = 1 THEN 2 ELSE 0 END pai_allocation_meth --III.6: END PART III
	,CASE lsc_funder_most_recent_site_visit_id WHEN  1 THEN 3
		WHEN 2 THEN 2
		WHEN 3 THEN 1
		ELSE 0 END lsc_funder_most_recent_site_visit ---IV.1
	,CASE WHEN corrective_actions_identified = 2 THEN 2 ELSE 0 END corrective_actions_identified --IV.2
	,CASE WHEN corrective_actions_resolved = 1 THEN 2 ELSE 0 END corrective_actions_resolved --IV.3: END PART IV
	,CASE WHEN lsc_deficit_status_id = 4 THEN 2 ELSE 0 END lsc_deficit_status --V.1
	,CASE WHEN net_asset_fund_balance = 1 AND lsc_net_asset_fund_balance_range_id = 1 THEN 3 ELSE 0 END lsc_net_asset_fund_balance_range --V.2a (includes validation to ensure V.2 = "Yes". This validation was missing from the app)
	,CASE WHEN net_asset_fund_balance = 1 AND net_asset_fund_balance_waiver = 1 AND lsc_net_asset_fund_balance_range_id = 2 AND lsc_net_asset_fund_balance_range_waiver_id = 1 THEN 2
		WHEN net_asset_fund_balance = 1 AND net_asset_fund_balance_waiver = 1  AND lsc_net_asset_fund_balance_range_id = 2 AND lsc_net_asset_fund_balance_range_waiver_id = 2 THEN 1 ELSE 0 END lsc_net_asset_fund_balance_range_waiver --V.2c (includes validation to ensure V.2 = "Yes" and V.2.a = "Greater than 10%" and V.2.b = "Yes". This validation was missing from the app)
	,CASE WHEN lsc_funding_svc_delivery_pct_id = 2 THEN 2
		WHEN lsc_funding_svc_delivery_pct_id = 3 THEN 3
		WHEN lsc_funding_svc_delivery_pct_id = 4 THEN 4 ELSE 0 END lsc_funding_svc_delivery_pct --V.3: END PART V
	,CASE WHEN exp_fraud = 0 THEN 1 ELSE 0 END exp_fraud --VI.1
	,CASE WHEN exp_misapprop = 0 THEN 1 ELSE 0 END exp_misapprop --VI.1
	,CASE WHEN exp_embezzlement = 0 THEN 1 ELSE 0 END exp_embezzlement --VI.1
	,CASE WHEN exp_theft = 0 THEN 1 ELSE 0 END exp_theft --VI.1
	,CASE WHEN lsc_fraud_insurance_policy_limit_id = 2 THEN 0.5
		WHEN lsc_fraud_insurance_policy_limit_id = 3 THEN 1 ELSE 0 END lsc_fraud_insurance_policy_limit--VI.4: END PART VI
	,CASE WHEN sw_track_fund_source = 1 THEN 1 ELSE 0 END sw_track_fund_source --VII.2
	,[dbo].[fnLSC_FISCAL_SW_MODULES_INSTALLED_SCORE](lsc_comp_appl_fiscal_id) fiscal_sw_modules_installed --VII.3
	,CASE WHEN sw_own_password = 1 THEN 1 ELSE 0 END sw_own_password --VII.5
	,CASE WHEN network_security = 1 THEN 1 ELSE 0 END network_security --VII.6
	,CASE WHEN lsc_fin_data_backup_interval_id = 1 THEN 2
		WHEN lsc_fin_data_backup_interval_id = 2 THEN 1 ELSE 0 END lsc_fin_data_backup_interval --VII.7
	FROM LSC_COMP_APPL_FISCAL caf
		LEFT JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON caf.organization_id = cwosy.organization_id
			AND caf.time_period_id = cwosy.time_period_id
			AND cwosy.wf_task_id = 83
		LEFT JOIN LSC_REVIEW_COMP_APPL_OCE_STAFF rcaos ON cwosy.wf_task_assignment_id = rcaos.wf_task_assignment_id
	WHERE caf.time_period_id = 22
