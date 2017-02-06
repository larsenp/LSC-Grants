ALTER VIEW [dbo].[vLSC_COMP_APPL_FISCAL_SCORE] AS
SELECT lsc_comp_appl_fiscal_id
	,time_period_id
	,bod_finance_committee
	,bod_finance_charter
	,bod_audit_committee
	,bod_audit_charter
	,finance_revise_budget
	,finance_review_report
	,finance_review_accounting_policy
	,finance_review_financial_stmts
	,finance_review_investment_policy
	,finance_board_financial_training
	,audit_bod_hire_auditor
	,audit_bod_auditor_comp
	,audit_bod_oversee_auditor
	,audit_review_financial_stmts
	,audit_bod_complaint_rule
	,audit_bod_review_990
	,audit_bod_ensure_ethics
	,bod_gaap
	,bod_gaap_statements
	,bod_controls
	,bod_rule_interp
	,cash_flow_monthly
	,prepare_fin_rpts
	,financial_report_frequency
	,budget_ctrl_mthly
	,explain_budget_var_mngt
	,explain_budget_var_bod
	,explain_budget_var_ipa
	,frp_fiscal_qualifications
	,frp_acctg_experience
	,frp_most_recent_lsc_trng
	,frp_background_check
	,policy_five_days_vacation
	,vacation_other_employee
	,accounting_manual_revised
	,prior_approval_policy
	,subgrant_usage_funding_source
	,subgrantee_site_visits
	,pai_allocation_meth
	,NULL AS lsc_funder_most_recent_site_visit
	,funder_recent_site_visit
	,corrective_actions_identified
	,other_funder_sgc
	,recent_fraud
	,sw_track_fund_source
	,sw_general_ledger
	,sw_own_password
	,sw_prohibit_sharing_pwds
	,NULL AS bod_audit_finance
	,NULL AS bod_audit_finance_charter
	,NULL AS lsc_finance_report_review_interval
	,NULL AS lsc_acctg_ctrl_policy_review_interval
	,NULL AS lsc_acct_manual_last_training_id
	,NULL AS lsc_acct_manual_training_orientation
	,NULL AS auditor_selection_body
	,NULL AS auditor_set_compensation_body
	,NULL AS auditor_oversight_body
	,NULL AS lsc_auditor_solicitation_interval
	,NULL AS lsc_audit_partner_change_interval
	,NULL AS set_ipa_rules
	,NULL AS review_form_990
	,NULL AS review_ceo_compensation
	,NULL AS lsc_ceo_compensation_last_review
	,NULL AS frp_background_check_areas_inquiry
	,NULL AS fiscal_internal_controls_instituted
	,NULL AS has_lsc_subgrants
	,NULL AS subgrantee_fin_rpt_review
	,NULL AS subgrantee_fin_stmt_review
	,NULL AS subgrantee_cost_alloc_review
	,NULL AS cost_allocation_policy
	,NULL AS corrective_actions_resolved
	,NULL AS lsc_deficit_status
	,NULL AS lsc_net_asset_fund_balance_range
	,NULL AS lsc_net_asset_fund_balance_range_waiver
	,NULL AS cert_good_standing
	,NULL AS lsc_funding_svc_delivery_pct
	,NULL AS other_funder_sgc_resolved
	,NULL AS exp_fraud
	,NULL AS exp_misapprop
	,NULL AS exp_embezzlement
	,NULL AS exp_theft
	,NULL AS lsc_fraud_insurance_policy_limit
	,NULL AS fiscal_sw_modules_installed
	,NULL AS network_security
	,NULL AS lsc_fin_data_backup_interval
	,NULL AS ceo_compensation_justification
	,NULL AS lsc_ceo_compensation_justification_other_score
	FROM vLSC_COMP_APPL_FISCAL_SCORE_2014

UNION ALL

SELECT lsc_comp_appl_fiscal_id
	,time_period_id
	,bod_finance_committee
	,bod_finance_charter
	,bod_audit_committee
	,bod_audit_charter
	,finance_revise_budget
	,finance_review_report
	,finance_review_accounting_policy
	,finance_review_financial_stmts
	,finance_review_investment_policy
	,NULL AS finance_board_financial_training
	,NULL AS audit_bod_hire_auditor
	,NULL AS audit_bod_auditor_comp
	,NULL AS audit_bod_oversee_auditor
	,NULL AS audit_review_financial_stmts
	,NULL AS audit_bod_complaint_rule
	,NULL AS audit_bod_review_990
	,audit_bod_ensure_ethics
	,bod_gaap
	,bod_gaap_statements
	,bod_controls
	,bod_rule_interp
	,NULL AS cash_flow_monthly
	,prepare_fin_rpts
	,financial_report_frequency
	,budget_ctrl_mthly
	,explain_budget_var_mngt
	,NULL AS explain_budget_var_bod
	,NULL AS explain_budget_var_ipa
	,frp_fiscal_qualifications
	,frp_acctg_experience
	,frp_most_recent_lsc_trng
	,frp_background_check
	,policy_five_days_vacation
	,vacation_other_employee
	,NULL AS accounting_manual_revised
	,NULL AS prior_approval_policy
	,NULL AS subgrant_usage_funding_source
	,subgrantee_site_visits
	,pai_allocation_meth
	,NULL AS lsc_funder_most_recent_site_visit
	,NULL AS funder_recent_site_visit
	,corrective_actions_identified
	,NULL AS other_funder_sgc
	,NULL AS recent_fraud
	,sw_track_fund_source
	,NULL AS sw_general_ledger
	,sw_own_password
	,NULL AS sw_prohibit_sharing_pwds
	,bod_audit_finance
	,bod_audit_finance_charter
	,lsc_finance_report_review_interval
	,lsc_acctg_ctrl_policy_review_interval
	,lsc_acct_manual_last_training_id
	,lsc_acct_manual_training_orientation
	,auditor_selection_body
	,auditor_set_compensation_body
	,auditor_oversight_body
	,lsc_auditor_solicitation_interval
	,lsc_audit_partner_change_interval
	,set_ipa_rules
	,review_form_990
	,review_ceo_compensation
	,lsc_ceo_compensation_last_review
	,frp_background_check_areas_inquiry
	,fiscal_internal_controls_instituted
	,has_lsc_subgrants
	,subgrantee_fin_rpt_review
	,subgrantee_fin_stmt_review
	,subgrantee_cost_alloc_review
	,cost_allocation_policy
	,corrective_actions_resolved
	,lsc_deficit_status
	,lsc_net_asset_fund_balance_range
	,lsc_net_asset_fund_balance_range_waiver
	,cert_good_standing
	,lsc_funding_svc_delivery_pct
	,other_funder_sgc_resolved
	,exp_fraud
	,exp_misapprop
	,exp_embezzlement
	,exp_theft
	,lsc_fraud_insurance_policy_limit
	,fiscal_sw_modules_installed
	,network_security
	,lsc_fin_data_backup_interval
	,NULL AS ceo_compensation_justification
	,NULL AS lsc_ceo_compensation_justification_other_score
	FROM vLSC_COMP_APPL_FISCAL_SCORE_2015

UNION ALL

SELECT lsc_comp_appl_fiscal_id
	,time_period_id
	,bod_finance_committee
	,bod_finance_charter
	,bod_audit_committee
	,bod_audit_charter
	,finance_revise_budget
	,finance_review_report
	,finance_review_accounting_policy
	,finance_review_financial_stmts
	,finance_review_investment_policy
	,NULL AS finance_board_financial_training
	,NULL AS audit_bod_hire_auditor
	,NULL AS audit_bod_auditor_comp
	,NULL AS audit_bod_oversee_auditor
	,NULL AS audit_review_financial_stmts
	,NULL AS audit_bod_complaint_rule
	,NULL AS audit_bod_review_990
	,audit_bod_ensure_ethics
	,bod_gaap
	,bod_gaap_statements
	,bod_controls
	,bod_rule_interp
	,NULL AS cash_flow_monthly
	,prepare_fin_rpts
	,financial_report_frequency
	,budget_ctrl_mthly
	,explain_budget_var_mngt
	,NULL AS explain_budget_var_bod
	,NULL AS explain_budget_var_ipa
	,frp_fiscal_qualifications
	,frp_acctg_experience
	,frp_most_recent_lsc_trng
	,frp_background_check
	,policy_five_days_vacation
	,vacation_other_employee
	,NULL AS accounting_manual_revised
	,NULL AS prior_approval_policy
	,NULL AS subgrant_usage_funding_source
	,subgrantee_site_visits
	,pai_allocation_meth
	,lsc_funder_most_recent_site_visit
	,NULL AS funder_recent_site_visit
	,corrective_actions_identified
	,NULL AS other_funder_sgc
	,NULL AS recent_fraud
	,sw_track_fund_source
	,NULL AS sw_general_ledger
	,sw_own_password
	,NULL AS sw_prohibit_sharing_pwds
	,bod_audit_finance
	,bod_audit_finance_charter
	,lsc_finance_report_review_interval
	,lsc_acctg_ctrl_policy_review_interval
	,lsc_acct_manual_last_training_id
	,lsc_acct_manual_training_orientation
	,auditor_selection_body
	,auditor_set_compensation_body
	,auditor_oversight_body
	,lsc_auditor_solicitation_interval
	,lsc_audit_partner_change_interval
	,set_ipa_rules
	,review_form_990
	,review_ceo_compensation
	,lsc_ceo_compensation_last_review
	,frp_background_check_areas_inquiry
	,fiscal_internal_controls_instituted
	,has_lsc_subgrants
	,subgrantee_fin_rpt_review
	,subgrantee_fin_stmt_review
	,subgrantee_cost_alloc_review
	,cost_allocation_policy
	,corrective_actions_resolved
	,lsc_deficit_status
	,lsc_net_asset_fund_balance_range
	,lsc_net_asset_fund_balance_range_waiver
	,NULL AS cert_good_standing
	,lsc_funding_svc_delivery_pct
	,NULL AS other_funder_sgc_resolved
	,exp_fraud
	,exp_misapprop
	,exp_embezzlement
	,exp_theft
	,lsc_fraud_insurance_policy_limit
	,fiscal_sw_modules_installed
	,network_security
	,lsc_fin_data_backup_interval
	,ceo_compensation_justification
	,NULL AS lsc_ceo_compensation_justification_other_score
	FROM vLSC_COMP_APPL_FISCAL_SCORE_2016

UNION ALL

SELECT lsc_comp_appl_fiscal_id
	,time_period_id
	,bod_finance_committee
	,bod_finance_charter
	,bod_audit_committee
	,bod_audit_charter
	,finance_revise_budget
	,finance_review_report
	,finance_review_accounting_policy
	,finance_review_financial_stmts
	,finance_review_investment_policy
	,NULL AS finance_board_financial_training
	,NULL AS audit_bod_hire_auditor
	,NULL AS audit_bod_auditor_comp
	,NULL AS audit_bod_oversee_auditor
	,NULL AS audit_review_financial_stmts
	,NULL AS audit_bod_complaint_rule
	,NULL AS audit_bod_review_990
	,audit_bod_ensure_ethics
	,bod_gaap
	,bod_gaap_statements
	,bod_controls
	,bod_rule_interp
	,NULL AS cash_flow_monthly
	,prepare_fin_rpts
	,financial_report_frequency
	,budget_ctrl_mthly
	,explain_budget_var_mngt
	,NULL AS explain_budget_var_bod
	,NULL AS explain_budget_var_ipa
	,frp_fiscal_qualifications
	,frp_acctg_experience
	,frp_most_recent_lsc_trng
	,frp_background_check
	,policy_five_days_vacation
	,vacation_other_employee
	,NULL AS accounting_manual_revised
	,NULL AS prior_approval_policy
	,NULL AS subgrant_usage_funding_source
	,subgrantee_site_visits
	,pai_allocation_meth
	,lsc_funder_most_recent_site_visit
	,NULL AS funder_recent_site_visit
	,corrective_actions_identified
	,NULL AS other_funder_sgc
	,NULL AS recent_fraud
	,sw_track_fund_source
	,NULL AS sw_general_ledger
	,sw_own_password
	,NULL AS sw_prohibit_sharing_pwds
	,bod_audit_finance
	,bod_audit_finance_charter
	,lsc_finance_report_review_interval
	,lsc_acctg_ctrl_policy_review_interval
	,lsc_acct_manual_last_training_id
	,lsc_acct_manual_training_orientation
	,auditor_selection_body
	,auditor_set_compensation_body
	,auditor_oversight_body
	,lsc_auditor_solicitation_interval
	,lsc_audit_partner_change_interval
	,set_ipa_rules
	,review_form_990
	,review_ceo_compensation
	,lsc_ceo_compensation_last_review
	,frp_background_check_areas_inquiry
	,fiscal_internal_controls_instituted
	,has_lsc_subgrants
	,subgrantee_fin_rpt_review
	,subgrantee_fin_stmt_review
	,subgrantee_cost_alloc_review
	,cost_allocation_policy
	,corrective_actions_resolved
	,lsc_deficit_status
	,lsc_net_asset_fund_balance_range
	,lsc_net_asset_fund_balance_range_waiver
	,NULL AS cert_good_standing
	,lsc_funding_svc_delivery_pct
	,NULL AS other_funder_sgc_resolved
	,exp_fraud
	,exp_misapprop
	,exp_embezzlement
	,exp_theft
	,lsc_fraud_insurance_policy_limit
	,fiscal_sw_modules_installed
	,network_security
	,lsc_fin_data_backup_interval
	,ceo_compensation_justification
	,lsc_ceo_compensation_justification_other_score
	FROM vLSC_COMP_APPL_FISCAL_SCORE_2017
