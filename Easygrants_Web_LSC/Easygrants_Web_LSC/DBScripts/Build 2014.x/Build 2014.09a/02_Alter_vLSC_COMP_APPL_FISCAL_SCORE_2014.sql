ALTER VIEW [dbo].[vLSC_COMP_APPL_FISCAL_SCORE_2014]

AS

SELECT lsc_comp_appl_fiscal_id
	,time_period_id
	,CASE WHEN bod_finance_committee = 1 THEN 1 ELSE 0 END bod_finance_committee
	,CASE WHEN bod_finance_charter = 1 THEN 1 ELSE 0 END bod_finance_charter
	,CASE WHEN bod_audit_committee = 1 THEN 1 ELSE 0 END bod_audit_committee
	,CASE WHEN bod_audit_charter = 1 THEN 1 ELSE 0 END bod_audit_charter
	,CASE WHEN finance_revise_budget = 1 THEN 1 ELSE 0 END finance_revise_budget
	,CASE WHEN finance_review_report = 1 THEN 1 ELSE 0 END finance_review_report
	,CASE WHEN finance_review_accounting_policy = 1 THEN 1 ELSE 0 END finance_review_accounting_policy
	,CASE WHEN finance_review_financial_stmts = 1 THEN 1 ELSE 0 END finance_review_financial_stmts
	,CASE WHEN finance_review_investment_policy = 1 THEN 1 ELSE 0 END finance_review_investment_policy
	,CASE WHEN finance_board_financial_training = 1 THEN 1 ELSE 0 END finance_board_financial_training
	,CASE WHEN audit_bod_hire_auditor = 1 THEN 1 ELSE 0 END audit_bod_hire_auditor
	,CASE WHEN audit_bod_auditor_comp = 1 THEN 1 ELSE 0 END audit_bod_auditor_comp
	,CASE WHEN audit_bod_oversee_auditor = 1 THEN 1 ELSE 0 END audit_bod_oversee_auditor
	,CASE WHEN audit_review_financial_stmts = 1 THEN 1 ELSE 0 END audit_review_financial_stmts
	,CASE WHEN audit_bod_complaint_rule = 1 THEN 1 ELSE 0 END audit_bod_complaint_rule
	,CASE WHEN audit_bod_review_990 = 1 THEN 1 ELSE 0 END audit_bod_review_990
	,CASE WHEN audit_bod_ensure_ethics = 1 THEN 1 ELSE 0 END audit_bod_ensure_ethics
	,CASE WHEN bod_gaap = 1 THEN 1 ELSE 0 END bod_gaap
	,CASE WHEN bod_gaap_statements = 1 THEN 1 ELSE 0 END bod_gaap_statements
	,CASE WHEN bod_controls = 1 THEN 1 ELSE 0 END bod_controls
	,CASE WHEN bod_rule_interp = 1 THEN 1 ELSE 0 END bod_rule_interp
	,CASE WHEN cash_flow_monthly = 1 THEN 2 ELSE 0 END cash_flow_monthly
	,CASE WHEN prepare_fin_rpts = 1 THEN 1 ELSE 0 END prepare_fin_rpts
	,CASE WHEN financial_report_frequency_id = 1 THEN 1 ELSE 0 END financial_report_frequency
	,CASE WHEN budget_ctrl_mthly = 1 THEN 2 ELSE 0 END budget_ctrl_mthly
	,CASE WHEN explain_budget_var_mngt = 1 THEN 1 ELSE 0 END explain_budget_var_mngt
	,CASE WHEN explain_budget_var_bod = 1 THEN 1 ELSE 0 END explain_budget_var_bod
	,CASE WHEN explain_budget_var_ipa = 1 THEN 1 ELSE 0 END explain_budget_var_ipa
	,dbo.fnLSC_FRP_FISCAL_QUALIFICATION_SCORE_2014(lsc_comp_appl_fiscal_id) frp_fiscal_qualifications
	,CASE WHEN frp_acctg_experience_id = 1 THEN 4
		WHEN frp_acctg_experience_id = 2 THEN 2
		WHEN  frp_acctg_experience_id = 3 THEN 1
		ELSE 0 END frp_acctg_experience
	,CASE WHEN frp_most_recent_lsc_trng_id = 1 THEN 3
		WHEN frp_most_recent_lsc_trng_id = 2 THEN 2
		ELSE 0 END frp_most_recent_lsc_trng
	,CASE WHEN frp_background_check = 1 THEN 1 ELSE 0 END frp_background_check
	,CASE WHEN policy_five_days_vacation = 1 THEN 1 ELSE 0 END policy_five_days_vacation
	,CASE WHEN vacation_other_employee = 1 THEN 1 ELSE 0 END vacation_other_employee
	,CASE WHEN accounting_manual_revised = 1 THEN 1 ELSE 0 END accounting_manual_revised
	,CASE WHEN prior_approval_policy = 1 THEN 1 ELSE 0 END prior_approval_policy
	,CASE WHEN subgrant_usage_funding_source = 1 THEN 1 ELSE 0 END subgrant_usage_funding_source
	,CASE WHEN subgrantee_site_visits = 1 THEN 1 ELSE 0 END subgrantee_site_visits
	,CASE WHEN pai_allocation_meth = 1 THEN 1 ELSE 0 END pai_allocation_meth
	,CASE WHEN funder_recent_site_visit = 1 THEN 2 ELSE 0 END funder_recent_site_visit
	,CASE WHEN corrective_actions_identified = 2 THEN 3 ELSE 0 END corrective_actions_identified
	,CASE WHEN other_funder_sgc = 2 THEN 5 ELSE 0 END other_funder_sgc
	,CASE WHEN recent_fraud = 0 THEN 5 ELSE 0 END recent_fraud
	,CASE WHEN sw_track_fund_source = 1 THEN 2 ELSE 0 END sw_track_fund_source
	,CASE WHEN sw_general_ledger = 1 THEN 1 ELSE 0 END sw_general_ledger
	,CASE WHEN sw_own_password = 1 THEN 1 ELSE 0 END sw_own_password
	,CASE WHEN sw_prohibit_sharing_pwds = 1 THEN 1 ELSE 0 END sw_prohibit_sharing_pwds
	FROM LSC_COMP_APPL_FISCAL caf
	WHERE time_period_id = 19