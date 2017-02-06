CREATE VIEW [dbo].[vLSC_COMP_APPL_FISCAL_SCORE_BY_PART_2015]
AS

SELECT lsc_comp_appl_fiscal_id
	,bod_finance_committee --I.1
		+ bod_finance_charter --I.1.A
		+ bod_audit_committee --I.2
		+ bod_audit_charter --I.2.a
		+ bod_audit_finance --I.3
		+ bod_audit_finance_charter --I.3.a
		+ finance_revise_budget --I.4
		+ finance_review_report --I.5
		+ lsc_finance_report_review_interval --I.5.a
		+ finance_review_accounting_policy --I.5.b
		+ lsc_acctg_ctrl_policy_review_interval --I.5.c
		+ finance_review_financial_stmts --I.6
		+ finance_review_investment_policy --I.7
		+ lsc_acct_manual_last_training_id --I.8.a
		+ lsc_acct_manual_training_orientation --I.8.b
		+ auditor_selection_body --I.9
		+ auditor_set_compensation_body --I.10
		+ auditor_oversight_body --I.11
		+ lsc_auditor_solicitation_interval --I.12
		+ lsc_audit_partner_change_interval --i.12.A
		+ set_ipa_rules --I.13
		+ review_form_990 --I.14
		+ review_ceo_compensation --I.15
		+ lsc_ceo_compensation_last_review --I.16.a
		+ audit_bod_ensure_ethics --I.17
		+ bod_gaap --I.18.a
		+ bod_gaap_statements --I.18.b
		+ bod_controls --I.18.c
		+ bod_rule_interp --I.18.d
		+ prepare_fin_rpts --I.19
		+ financial_report_frequency --I.20
		+ budget_ctrl_mthly --I.21
		+ explain_budget_var_mngt subtotal_part_i --I.22
	,frp_fiscal_qualifications --II.2
		+ frp_acctg_experience --II.3
		+ frp_most_recent_lsc_trng --II.4
		+ frp_background_check --II.5
		+ frp_background_check_areas_inquiry --II.5.a
		+ policy_five_days_vacation --II.6
		+ vacation_other_employee subtotal_part_ii --II.7
	,fiscal_internal_controls_instituted --III.2
		+ has_lsc_subgrants --III.4
		+ subgrantee_site_visits --III.4.a.1
		+ subgrantee_fin_rpt_review --III.4.a.2
		+ subgrantee_fin_stmt_review --III.4.a.3
		+ subgrantee_cost_alloc_review --III.4.a.4
		+ cost_allocation_policy ---III.5
		+ pai_allocation_meth subtotal_part_iii --III.6
	,corrective_actions_identified --IV.2
		+ corrective_actions_resolved subtotal_part_iv --IV.3
	,lsc_deficit_status --V.1
		+ lsc_net_asset_fund_balance_range --V.2.a
		+ lsc_net_asset_fund_balance_range_waiver --V.2.c
		+ cert_good_standing --V.3
		+ lsc_funding_svc_delivery_pct subtotal_part_v --V.4
	,other_funder_sgc_resolved subtotal_part_vi --VI.2
	,exp_fraud --VII.1
		+ exp_misapprop
		+ exp_embezzlement
		+ exp_theft
		+ lsc_fraud_insurance_policy_limit subtotal_part_vii --VII.5
	,sw_track_fund_source --VIII.2
		+ fiscal_sw_modules_installed --VIII.3
		+ sw_own_password --viii.5
		+ network_security --VIII.6
		+ lsc_fin_data_backup_interval subtotal_part_viii --VIII.7
	FROM vLSC_COMP_APPL_FISCAL_SCORE_2015
