CREATE TABLE [dbo].[LSC_COMP_APPL_FISCAL](
	[lsc_comp_appl_fiscal_id] [int] NOT NULL,
	[organization_id] [int] NULL,
	[time_period_id] [int] NULL,
	[bod_finance_committee] [bit] NULL,
	[bod_finance_charter] [int] NULL,
	[bod_audit_committee] [bit] NULL,
	[bod_audit_charter] [int] NULL,
	[finance_revise_budget] [bit] NULL,
	[finance_review_report] [bit] NULL,
	[finance_review_accounting_policy] [bit] NULL,
	[finance_review_financial_stmts] [int] NULL,
	[finance_review_investment_policy] [bit] NULL,
	[finance_board_financial_training] [bit] NULL,
	[audit_bod_hire_auditor] [bit] NULL,
	[audit_bod_auditor_comp] [bit] NULL,
	[audit_bod_oversee_auditor] [bit] NULL,
	[audit_review_financial_stmts] [int] NULL,
	[audit_bod_complaint_rule] [bit] NULL,
	[audit_bod_review_990] [bit] NULL,
	[audit_bod_ensure_ethics] [bit] NULL,
	[bod_gaap] [bit] NULL,
	[bod_gaap_statements] [bit] NULL,
	[bod_controls] [bit] NULL,
	[bod_rule_interp] [bit] NULL,
	[cash_flow_monthly] [bit] NULL,
	[prepare_fin_rpts] [bit] NULL,
	[financial_report_frequency_id] [int] NULL,
	[budget_ctrl_mthly] [bit] NULL,
	[explain_budget_var] [bit] NULL,
	[explain_budget_var_mngt] [bit] NULL,
	[explain_budget_var_bod] [bit] NULL,
	[explain_budget_var_ipa] [bit] NULL,
	[frp_title_id] [int] NULL,
	[frp_title_other] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[frp_qualification_other] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[frp_acctg_experience_id] [int] NULL,
	[frp_most_recent_lsc_trng_id] [int] NULL,
	[frp_background_check] [bit] NULL,
	[frp_financial_issues] [int] NULL,
	[policy_five_days_vacation] [bit] NULL,
	[vacation_other_employee] [bit] NULL,
	[accounting_manual_revised] [int] NULL,
	[prior_approval_policy] [bit] NULL,
	[has_subgrants] [bit] NULL,
	[subgrant_usage_funding_source] [int] NULL,
	[subgrantee_site_visits] [int] NULL,
	[pai_allocation_meth] [bit] NULL,
	[funder_recent_site_visit] [bit] NULL,
	[corrective_actions_identified] [int] NULL,
	[corrective_actions] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[other_funder_sgc] [int] NULL,
	[unresolved_sgc] [int] NULL,
	[recent_fraud] [bit] NULL,
	[fraud_reported_oig] [int] NULL,
	[fraud_recovered_funds] [int] NULL,
	[fraud_recovered_reallocated] [int] NULL,
	[accounting_sw] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sw_track_fund_source] [bit] NULL,
	[sw_general_ledger] [bit] NULL,
	[sw_num_users_id] [int] NULL,
	[sw_own_password] [bit] NULL,
	[sw_prohibit_sharing_pwds] [bit] NULL,
 CONSTRAINT [PK_LSC_COMP_APPL_FISCAL] PRIMARY KEY CLUSTERED 
(
	[lsc_comp_appl_fiscal_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


INSERT s_ID_GEN
	(table_name
	,next_id
	,is_code_table
	,lookup_table_type_id)
	VALUES
		('LSC_COMP_APPL_FISCAL'
		,1
		,1
		,1)