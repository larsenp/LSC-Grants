ALTER VIEW [dbo].[vLSC_COMP_APPL_FISCAL_SCORE_2015]
AS

SELECT lsc_comp_appl_fiscal_id
	,time_period_id
	,CASE WHEN bod_finance_committee = 1 THEN 1 ELSE 0 END bod_finance_committee
	,CASE WHEN bod_finance_charter = 1 THEN 1 ELSE 0 END bod_finance_charter
	,CASE WHEN bod_audit_committee = 1 THEN 1 ELSE 0 END bod_audit_committee
	,CASE WHEN bod_audit_charter = 1 THEN 1 ELSE 0 END bod_audit_charter
	,CASE WHEN bod_audit_finance = 1 THEN 1 ELSE 0 END bod_audit_finance
	,CASE WHEN bod_audit_finance_charter = 1 THEN 1 ELSE 0 END bod_audit_finance_charter
	,CASE WHEN finance_revise_budget = 1 THEN 1 ELSE 0 END finance_revise_budget --I.4
	,CASE WHEN finance_review_report = 1 THEN 1 ELSE 0 END finance_review_report
	,CASE WHEN lsc_finance_report_review_interval_id = 1 THEN 2
		WHEN lsc_finance_report_review_interval_id = 2 THEN 1 ELSE 0 END lsc_finance_report_review_interval
	,CASE WHEN finance_review_accounting_policy = 1 THEN 1 ELSE 0 END finance_review_accounting_policy
	,CASE WHEN lsc_acctg_ctrl_policy_review_interval_id = 1 THEN 2
		WHEN lsc_acctg_ctrl_policy_review_interval_id = 2 THEN 1 ELSE 0 END lsc_acctg_ctrl_policy_review_interval --I.5.c
	,CASE WHEN finance_review_financial_stmts = 1 THEN 1 ELSE 0 END finance_review_financial_stmts
	,CASE WHEN finance_review_investment_policy = 1 THEN 1 ELSE 0 END finance_review_investment_policy
	,CASE WHEN lsc_acct_manual_last_training_id = 1 THEN 2
		WHEN lsc_acct_manual_last_training_id = 2 THEN 1 
		WHEN lsc_acct_manual_last_training_id = 3 THEN 0.5 ELSE 0 END lsc_acct_manual_last_training_id --I.8.a
	,CASE WHEN lsc_acct_manual_training_orientation = 1 THEN 1 ELSE 0 END lsc_acct_manual_training_orientation
	,CASE WHEN auditor_selection_body_id = 1 THEN 0
		WHEN auditor_selection_body_id = 2 THEN 1 
		WHEN auditor_selection_body_id = 3 THEN 1 
		WHEN auditor_selection_body_id = 4 THEN 1 
		WHEN auditor_selection_body_id = 5 THEN 1 
		WHEN auditor_selection_body_id = 6 THEN 1 ELSE 0 END auditor_selection_body
	,CASE WHEN auditor_set_compensation_body_id = 1 THEN 0
		WHEN auditor_set_compensation_body_id = 2 THEN 1 
		WHEN auditor_set_compensation_body_id = 3 THEN 1 
		WHEN auditor_set_compensation_body_id = 4 THEN 1 
		WHEN auditor_set_compensation_body_id = 5 THEN 1 
		WHEN auditor_set_compensation_body_id = 6 THEN 1 ELSE 0 END auditor_set_compensation_body
	,CASE WHEN auditor_oversight_body_id = 1 THEN 0
		WHEN auditor_oversight_body_id = 2 THEN 1 
		WHEN auditor_oversight_body_id = 3 THEN 1 
		WHEN auditor_oversight_body_id = 4 THEN 1 
		WHEN auditor_oversight_body_id = 5 THEN 1 
		WHEN auditor_oversight_body_id = 6 THEN 1 ELSE 0 END auditor_oversight_body
	,CASE WHEN lsc_auditor_solicitation_interval_id = 1 THEN 2
		WHEN lsc_auditor_solicitation_interval_id = 2 THEN 1 ELSE 0 END lsc_auditor_solicitation_interval
	,CASE WHEN lsc_audit_partner_change_interval_id = 1 THEN 1
		WHEN lsc_audit_partner_change_interval_id = 2 THEN 0.5 ELSE 0 END lsc_audit_partner_change_interval
	,CASE WHEN set_ipa_rules = 1 THEN 1 ELSE 0 END set_ipa_rules
	,CASE WHEN review_form_990 = 1 THEN 1 ELSE 0 END review_form_990
	,CASE WHEN review_ceo_compensation = 1 THEN 1 ELSE 0 END review_ceo_compensation
	,CASE WHEN lsc_ceo_compensation_last_review_id = 1 THEN 1 ELSE 0 END lsc_ceo_compensation_last_review
	,CASE WHEN audit_bod_ensure_ethics = 1 THEN 1 ELSE 0 END audit_bod_ensure_ethics
	,CASE WHEN bod_gaap = 1 THEN 1 ELSE 0 END bod_gaap
	,CASE WHEN bod_gaap_statements = 1 THEN 1 ELSE 0 END bod_gaap_statements
	,CASE WHEN bod_controls = 1 THEN 1 ELSE 0 END bod_controls
	,CASE WHEN bod_rule_interp = 1 THEN 1 ELSE 0 END bod_rule_interp
	,CASE WHEN prepare_fin_rpts = 1 THEN 1 ELSE 0 END prepare_fin_rpts
	,CASE WHEN financial_report_frequency_id = 1 THEN 1 ELSE 0 END financial_report_frequency
	,CASE WHEN budget_ctrl_mthly = 1 THEN 1 ELSE 0 END budget_ctrl_mthly
	,CASE WHEN explain_budget_var_mngt = 1 THEN 1 ELSE 0 END explain_budget_var_mngt --END PART I
	,dbo.fnLSC_FRP_FISCAL_QUALIFICATION_SCORE(lsc_comp_appl_fiscal_id) frp_fiscal_qualifications
	,CASE WHEN frp_acctg_experience_id = 1 THEN 3
		WHEN frp_acctg_experience_id = 2 THEN 2
		WHEN  frp_acctg_experience_id = 4 THEN 1
		ELSE 0 END frp_acctg_experience
	,CASE WHEN frp_most_recent_lsc_trng_id = 4 THEN 2
		WHEN frp_most_recent_lsc_trng_id = 1 THEN 1
		ELSE 0 END frp_most_recent_lsc_trng
	,CASE WHEN frp_background_check = 1 THEN 3 ELSE 0 END frp_background_check
	,dbo.fnLSC_FRP_BACKGROUND_CHECK_AREAS_INQUIRY_SCORE(lsc_comp_appl_fiscal_id) frp_background_check_areas_inquiry
	,CASE WHEN policy_five_days_vacation = 1 THEN 1 ELSE 0 END policy_five_days_vacation
	,CASE WHEN vacation_other_employee_int = 1 THEN 1 ELSE 0 END vacation_other_employee
	,dbo.fnLSC_FISCAL_INTERNAL_CONTROLS_INSTITUTED_SCORE(lsc_comp_appl_fiscal_id) fiscal_internal_controls_instituted
	,CASE WHEN has_lsc_subgrants = 0 THEN 4 ELSE 0 END has_lsc_subgrants
	,CASE WHEN subgrantee_site_visits = 1 THEN 1 ELSE 0 END subgrantee_site_visits
	,CASE WHEN subgrantee_fin_rpt_review = 1 THEN 1 ELSE 0 END subgrantee_fin_rpt_review
	,CASE WHEN subgrantee_fin_stmt_review = 1 THEN 1 ELSE 0 END subgrantee_fin_stmt_review
	,CASE WHEN subgrantee_cost_alloc_review = 1 THEN 1 ELSE 0 END subgrantee_cost_alloc_review
	,CASE WHEN cost_allocation_policy = 1 THEN 2 ELSE 0 END cost_allocation_policy
	,CASE WHEN pai_allocation_meth = 1 THEN 2 ELSE 0 END pai_allocation_meth
	,CASE WHEN corrective_actions_identified = 2 THEN 5 
		WHEN corrective_actions_identified = 3 THEN 5 ELSE 0 END corrective_actions_identified
	,CASE WHEN corrective_actions_resolved = 1 THEN 5 ELSE 0 END corrective_actions_resolved
	,CASE WHEN lsc_deficit_status_id = 4 THEN 2 ELSE 0 END lsc_deficit_status
	,CASE WHEN lsc_net_asset_fund_balance_range_id = 1 THEN 3 ELSE 0 END lsc_net_asset_fund_balance_range
	,CASE WHEN lsc_net_asset_fund_balance_range_waiver_id = 1 THEN 2
		WHEN lsc_net_asset_fund_balance_range_waiver_id = 2 THEN 1 ELSE 0 END lsc_net_asset_fund_balance_range_waiver
	,CASE WHEN cert_good_standing = 1 THEN 1 ELSE 0 END cert_good_standing
	,CASE WHEN lsc_funding_svc_delivery_pct_id = 2 THEN 2
		WHEN lsc_funding_svc_delivery_pct_id = 3 THEN 3
		WHEN lsc_funding_svc_delivery_pct_id = 4 THEN 4 ELSE 0 END lsc_funding_svc_delivery_pct
	,CASE WHEN other_funder_sgc_resolved = 1 THEN 5
		WHEN other_funder_sgc_resolved = 3 THEN 5 ELSE 0 END other_funder_sgc_resolved
	,CASE WHEN exp_fraud = 0 THEN 1 ELSE 0 END exp_fraud
	,CASE WHEN exp_misapprop = 0 THEN 1 ELSE 0 END exp_misapprop
	,CASE WHEN exp_embezzlement = 0 THEN 1 ELSE 0 END exp_embezzlement
	,CASE WHEN exp_theft = 0 THEN 1 ELSE 0 END exp_theft
	,CASE WHEN lsc_fraud_insurance_policy_limit_id = 2 THEN 0.5
		WHEN lsc_fraud_insurance_policy_limit_id = 3 THEN 1 ELSE 0 END lsc_fraud_insurance_policy_limit
	,CASE WHEN sw_track_fund_source = 1 THEN 2 ELSE 0 END sw_track_fund_source
	,[dbo].[fnLSC_FISCAL_SW_MODULES_INSTALLED_SCORE](lsc_comp_appl_fiscal_id) fiscal_sw_modules_installed
	,CASE WHEN sw_own_password =1 THEN 1 ELSE 0 END sw_own_password
	,CASE WHEN network_security = 1 THEN 1 ELSE 0 END network_security
	,CASE WHEN lsc_fin_data_backup_interval_id = 1 THEN 2
		WHEN lsc_fin_data_backup_interval_id = 2 THEN 1 ELSE 0 END lsc_fin_data_backup_interval
	FROM LSC_COMP_APPL_FISCAL caf
	WHERE time_period_id = 20
