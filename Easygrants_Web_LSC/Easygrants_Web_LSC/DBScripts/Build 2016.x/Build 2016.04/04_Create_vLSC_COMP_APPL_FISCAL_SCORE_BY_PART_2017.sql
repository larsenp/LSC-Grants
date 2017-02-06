CREATE VIEW [dbo].[vLSC_COMP_APPL_FISCAL_SCORE_BY_PART_2017]

AS

SELECT lsc_comp_appl_fiscal_id
	,bod_finance_committee 
		+ bod_finance_charter 
		+ bod_audit_committee 
		+ bod_audit_charter 
		+ bod_audit_finance 
		+ bod_audit_finance_charter 
		+ finance_revise_budget 
		+ finance_review_report 
		+ lsc_finance_report_review_interval 
		+ finance_review_accounting_policy 
		+ lsc_acctg_ctrl_policy_review_interval 
		+ finance_review_financial_stmts 
		+ finance_review_investment_policy 
		+ lsc_acct_manual_last_training_id 
		+ lsc_acct_manual_training_orientation 
		+ auditor_selection_body 
		+ auditor_set_compensation_body 
		+ auditor_oversight_body 
		+ lsc_auditor_solicitation_interval 
		+ lsc_audit_partner_change_interval 
		+ set_ipa_rules 
		+ review_form_990 
		+ review_ceo_compensation 
		+ ceo_compensation_justification
		+ cafs.lsc_ceo_compensation_justification_other_score
		+ lsc_ceo_compensation_last_review 
		+ audit_bod_ensure_ethics 
		+ bod_gaap 
		+ bod_gaap_statements 
		+ bod_controls 
		+ bod_rule_interp 
		+ prepare_fin_rpts 
		+ financial_report_frequency 
		+ budget_ctrl_mthly 
		+ explain_budget_var_mngt subtotal_part_i 
	,frp_fiscal_qualifications 
		+ frp_acctg_experience 
		+ frp_most_recent_lsc_trng 
		+ frp_background_check 
		+ frp_background_check_areas_inquiry 
		+ policy_five_days_vacation 
		+ vacation_other_employee subtotal_part_ii 
	,fiscal_internal_controls_instituted 
		+ has_lsc_subgrants 
		+ subgrantee_site_visits 
		+ subgrantee_fin_rpt_review 
		+ subgrantee_fin_stmt_review 
		+ subgrantee_cost_alloc_review 
		+ cost_allocation_policy 
		+ pai_allocation_meth subtotal_part_iii 
	,lsc_funder_most_recent_site_visit
		+ corrective_actions_identified 
		+ corrective_actions_resolved subtotal_part_iv 
	,lsc_deficit_status 
		+ lsc_net_asset_fund_balance_range 
		+ lsc_net_asset_fund_balance_range_waiver 
		+ lsc_funding_svc_delivery_pct subtotal_part_v 
	,exp_fraud 
		+ exp_misapprop
		+ exp_embezzlement
		+ exp_theft
		+ lsc_fraud_insurance_policy_limit subtotal_part_vi
	,sw_track_fund_source 
		+ fiscal_sw_modules_installed 
		+ sw_own_password 
		+ network_security 
		+ lsc_fin_data_backup_interval subtotal_part_vii 
	FROM vLSC_COMP_APPL_FISCAL_SCORE_2017 cafs
