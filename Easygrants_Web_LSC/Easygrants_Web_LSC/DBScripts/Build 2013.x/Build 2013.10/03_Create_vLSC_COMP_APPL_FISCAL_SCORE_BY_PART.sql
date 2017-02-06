CREATE VIEW vLSC_COMP_APPL_FISCAL_SCORE_BY_PART

AS

SELECT lsc_comp_appl_fiscal_id
      ,bod_finance_committee
      + bod_finance_charter
      + bod_audit_committee
      + bod_audit_charter
      + finance_revise_budget
      + finance_review_report
      + finance_review_accounting_policy
      + finance_review_financial_stmts
      + finance_review_investment_policy
      + finance_board_financial_training
      + audit_bod_hire_auditor
      + audit_bod_auditor_comp
      + audit_bod_oversee_auditor
      + audit_review_financial_stmts
      + audit_bod_complaint_rule
      + audit_bod_review_990
      + audit_bod_ensure_ethics
      + bod_gaap
      + bod_gaap_statements
      + bod_controls
      + bod_rule_interp
      + cash_flow_monthly
      + prepare_fin_rpts
      + financial_report_frequency
      + budget_ctrl_mthly
      + explain_budget_var_mngt
      + explain_budget_var_bod
      + explain_budget_var_ipa subtotal_part_i
      ,frp_fiscal_qualifications
      + frp_acctg_experience
      + frp_most_recent_lsc_trng
      + frp_background_check
      + policy_five_days_vacation
      + vacation_other_employee subtotal_part_ii
      ,accounting_manual_revised
      + prior_approval_policy
      + subgrant_usage_funding_source
      + subgrantee_site_visits
      + pai_allocation_meth subtotal_part_iii
      ,funder_recent_site_visit
      + corrective_actions_identified subtotal_part_iv
      ,other_funder_sgc subtotal_part_v
      ,recent_fraud subtotal_part_vi
      ,sw_track_fund_source
      + sw_general_ledger
      + sw_own_password
      + sw_prohibit_sharing_pwds subtotal_part_vii
  FROM vLSC_COMP_APPL_FISCAL_SCORE