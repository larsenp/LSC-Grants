ALTER TABLE LSC_COMP_APPL_FISCAL
	ADD bod_audit_finance INT
		,bod_audit_finance_charter INT
		,budget_review_body VARCHAR(50)
		,finance_report_review_body VARCHAR(50)
		,lsc_finance_report_review_interval_id INT
		,finance_review_accounting_policy_body VARCHAR(50)
		,lsc_acctg_ctrl_policy_review_interval_id INT
		,finance_review_investment_policy_body VARCHAR(50)
		,lsc_acct_manual_training BIT
		,lsc_acct_manual_last_training_id INT
		,lsc_acct_manual_training_orientation BIT
		,auditor_selection_body_id INT
		,auditor_set_compensation_body_id INT
		,auditor_oversight_body_id INT
		,lsc_auditor_solicitation_interval_id INT
		,lsc_audit_partner_change_interval_id INT
		,set_ipa_rules BIT
		,set_ipa_rules_body VARCHAR(50)
		,review_form_990 BIT
		,review_form_990_body VARCHAR(50)
		,review_ceo_compensation BIT
		,review_ceo_compensation_body VARCHAR(50)
		,ceo_compensation_justification_other VARCHAR(50)
		,lsc_ceo_compensation_last_review_id INT
		,audit_bod_ensure_ethics_body VARCHAR(50)
		,variance_analysis_preparer_mgmt_other INT
		,variance_analysis_preparer_ipa_other INT
		,frp_most_recent_lsc_trng_desc VARCHAR(MAX)
		,frp_financial_issues_addressed INT
		,frp_financial_issues_explanation VARCHAR(MAX)
		,vacation_other_employee_int INT
		,subgrantee_fin_rpt_review INT
		,subgrantee_fin_stmt_review INT
		,subgrantee_cost_alloc_review INT
		,cost_allocation_policy BIT
		,corrective_actions_resolved INT
		,lsc_deficit_status_id INT
		,deficit_liquidated_lsc_funds INT
		,net_asset_fund_balance BIT
		,lsc_net_asset_fund_balance_range_id INT
		,net_asset_fund_balance_waiver INT
		,lsc_net_asset_fund_balance_range_waiver_id INT
		,cert_good_standing BIT
		,lsc_funding_svc_delivery_pct_id INT
		,other_funder_sgc_desc VARCHAR(MAX)
		,fraud_reported_authorities INT
		,fraud_desc VARCHAR(MAX)
		,fraud_insurance_policy BIT
		,lsc_fraud_insurance_policy_limit_id INT
		,network_security BIT
		,lsc_fin_data_backup_interval_id INT
		,fin_record_retention BIT
		,has_lsc_subgrants BIT

CREATE TABLE [dbo].[LSC_c_FINANCE_REPORT_REVIEW_INTERVAL](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_FINANCE_REPORT_REVIEW_INTERVAL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT LSC_c_FINANCE_REPORT_REVIEW_INTERVAL
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'Monthly'
		,'Monthly'
		,1)

INSERT LSC_c_FINANCE_REPORT_REVIEW_INTERVAL
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'Quarterly'
		,'Quarterly'
		,2)

INSERT LSC_c_FINANCE_REPORT_REVIEW_INTERVAL
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(3
		,'Annually'
		,'Annually'
		,3)

INSERT LSC_c_FINANCE_REPORT_REVIEW_INTERVAL
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(4
		,'Other'
		,'Other'
		,4)

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_c_FINANCE_REPORT_REVIEW_INTERVAL',5,1,1)


CREATE TABLE [dbo].LSC_c_ACCTG_CTRL_POLICY_INTERVAL(
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_ACCTG_CTRL_POLICY_INTERVAL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT LSC_c_ACCTG_CTRL_POLICY_INTERVAL
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'At Least Annually'
		,'At Least Annually'
		,1)

INSERT LSC_c_ACCTG_CTRL_POLICY_INTERVAL
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'As Needed'
		,'As Needed'
		,2)

INSERT LSC_c_ACCTG_CTRL_POLICY_INTERVAL
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(3
		,'Other'
		,'Other'
		,3)

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_c_ACCTG_CTRL_POLICY_INTERVAL',4,1,1)


CREATE TABLE [dbo].[LSC_c_ACCT_MANUAL_LAST_TRAINING](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_ACCT_MANUAL_LAST_TRAINING] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT LSC_c_ACCT_MANUAL_LAST_TRAINING
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'Last year'
		,'Within the last year'
		,1)

INSERT LSC_c_ACCT_MANUAL_LAST_TRAINING
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'Last 3 years'
		,'Within the last 3 years'
		,2)

INSERT LSC_c_ACCT_MANUAL_LAST_TRAINING
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(3
		,'Last 5 years'
		,'Within the last 5 years'
		,3)

INSERT LSC_c_ACCT_MANUAL_LAST_TRAINING
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(4
		,'More than 5 years'
		,'More than 5 years ago'
		,4)

INSERT LSC_c_ACCT_MANUAL_LAST_TRAINING
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(5
		,'N/A'
		,'N/A'
		,5)

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_c_ACCT_MANUAL_LAST_TRAINING',6,1,1)

CREATE TABLE [dbo].LSC_c_FINANCIAL_GOV_BODY(
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_FINANCIAL_GOV_BODY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT LSC_c_FINANCIAL_GOV_BODY
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'Management'
		,'Management'
		,1)

INSERT LSC_c_FINANCIAL_GOV_BODY
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'Finance Committee'
		,'Finance Committee'
		,2)

INSERT LSC_c_FINANCIAL_GOV_BODY
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(3
		,'Audit Committee'
		,'Audit Committee'
		,3)

INSERT LSC_c_FINANCIAL_GOV_BODY
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(4
		,'Finance/Audit'
		,'Finance/Audit Committee'
		,4)

INSERT LSC_c_FINANCIAL_GOV_BODY
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(5
		,'Executive Committee'
		,'Executive Committee'
		,5)

INSERT LSC_c_FINANCIAL_GOV_BODY
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(6
		,'Full BOD'
		,'Full BOD'
		,6)

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_c_FINANCIAL_GOV_BODY',7,1,1)

CREATE TABLE [dbo].LSC_c_AUDITOR_SOLICITATION_INTERVAL(
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_AUDITOR_SOLICITATION_INTERVAL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT LSC_c_AUDITOR_SOLICITATION_INTERVAL
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'1 - 5 Years'
		,'1 - 5 Years'
		,1)

INSERT LSC_c_AUDITOR_SOLICITATION_INTERVAL
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'6 - 10 Years'
		,'6 - 10 Years'
		,2)

INSERT LSC_c_AUDITOR_SOLICITATION_INTERVAL
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(3
		,'More than 10 years'
		,'More than 10 years'
		,3)

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_c_AUDITOR_SOLICITATION_INTERVAL',4,1,1)

CREATE TABLE [dbo].LSC_c_AUDIT_PARTNER_CHANGE_INTERVAL(
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_AUDIT_PARTNER_CHANGE_INTERVAL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT LSC_c_AUDIT_PARTNER_CHANGE_INTERVAL
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'Every 5 Years'
		,'At least every 5 Years'
		,1)

INSERT LSC_c_AUDIT_PARTNER_CHANGE_INTERVAL
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'6 - 10 Years'
		,'Every 6 - 10 Years'
		,2)

INSERT LSC_c_AUDIT_PARTNER_CHANGE_INTERVAL
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(3
		,'More than 10 years'
		,'More than 10 years between changes'
		,3)

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_c_AUDIT_PARTNER_CHANGE_INTERVAL',4,1,1)


CREATE TABLE [dbo].LSC_c_CEO_COMPENSATION_JUSTIFICATION(
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_CEO_COMPENSATION_JUSTIFICATION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT LSC_c_CEO_COMPENSATION_JUSTIFICATION
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'Ind. Consultant'
		,'Independent Compensation Consultant'
		,1)

INSERT LSC_c_CEO_COMPENSATION_JUSTIFICATION
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'Comparable studies'
		,'Comparable pay studies from other nonprofit organizations'
		,2)

INSERT LSC_c_CEO_COMPENSATION_JUSTIFICATION
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(3
		,'Survey'
		,'Compensation Survey'
		,3)

INSERT LSC_c_CEO_COMPENSATION_JUSTIFICATION
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(4
		,'Other'
		,'Other'
		,4)

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_c_CEO_COMPENSATION_JUSTIFICATION',5,1,1)

CREATE TABLE [dbo].LSC_CEO_COMPENSATION_JUSTIFICATION(
	[lsc_ceo_compensation_justification_id] [int] NOT NULL,
	[lsc_comp_appl_fiscal_id] [int] NULL,
	[lsc_ceo_compensation_justification_lkp_id] [int] NULL,
 CONSTRAINT [PK_LSC_CEO_COMPENSATION_JUSTIFICATION] PRIMARY KEY CLUSTERED 
(
	[lsc_ceo_compensation_justification_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_CEO_COMPENSATION_JUSTIFICATION',1,1,1)

CREATE TABLE [dbo].LSC_c_CEO_COMPENSATION_LAST_REVIEW(
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_CEO_COMPENSATION_LAST_REVIEW] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT LSC_c_CEO_COMPENSATION_LAST_REVIEW
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'0 - 3 Years'
		,'0 - 3 Years'
		,1)

INSERT LSC_c_CEO_COMPENSATION_LAST_REVIEW
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'More than 3 years'
		,'More than 3 years'
		,2)

INSERT LSC_c_CEO_COMPENSATION_LAST_REVIEW
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(3
		,'Never'
		,'Never'
		,3)

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_c_CEO_COMPENSATION_LAST_REVIEW',4,1,1)


CREATE TABLE [dbo].LSC_c_VARIANCE_ANALYSIS_PREPARER_MGMT(
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_VARIANCE_ANALYSIS_PREPARER_MGMT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT LSC_c_VARIANCE_ANALYSIS_PREPARER_MGMT
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'Finance/Accounting'
		,'Finance/Accounting Personnel'
		,1)

INSERT LSC_c_VARIANCE_ANALYSIS_PREPARER_MGMT
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'Financial Consultant'
		,'Financial Consultant'
		,2)

INSERT LSC_c_VARIANCE_ANALYSIS_PREPARER_MGMT
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(3
		,'Other'
		,'Other'
		,3)

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_c_VARIANCE_ANALYSIS_PREPARER_MGMT',4,1,1)

CREATE TABLE [dbo].LSC_VARIANCE_ANALYSIS_PREPARER_MGMT(
	[lsc_variance_analysis_preparer_mgmt_id] [int] NOT NULL,
	[lsc_comp_appl_fiscal_id] [int] NULL,
	lsc_variance_analysis_preparer_mgmt_lkp_id [int] NULL,
 CONSTRAINT [PK_LSC_VARIANCE_ANALYSIS_PREPARER_MGMT] PRIMARY KEY CLUSTERED 
(
	[lsc_variance_analysis_preparer_mgmt_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_VARIANCE_ANALYSIS_PREPARER_MGMT',1,1,1)

CREATE TABLE [dbo].LSC_c_VARIANCE_ANALYSIS_PREPARER_IPA(
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_VARIANCE_ANALYSIS_PREPARER_IPA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT LSC_c_VARIANCE_ANALYSIS_PREPARER_IPA
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'Executive Director'
		,'Executive Director'
		,1)

INSERT LSC_c_VARIANCE_ANALYSIS_PREPARER_IPA
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'Finance/Accounting'
		,'Finance/Accounting Personnel'
		,2)

INSERT LSC_c_VARIANCE_ANALYSIS_PREPARER_IPA
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(3
		,'Financial Consultant'
		,'Financial Consultant'
		,3)

INSERT LSC_c_VARIANCE_ANALYSIS_PREPARER_IPA
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(4
		,'Other'
		,'Other'
		,4)

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_c_VARIANCE_ANALYSIS_PREPARER_IPA',5,1,1)

CREATE TABLE [dbo].LSC_VARIANCE_ANALYSIS_PREPARER_IPA(
	[lsc_variance_analysis_preparer_ipa_id] [int] NOT NULL,
	[lsc_comp_appl_fiscal_id] [int] NULL,
	lsc_variance_analysis_preparer_ipa_lkp_id [int] NULL,
 CONSTRAINT [PK_LSC_VARIANCE_ANALYSIS_PREPARER_IPA] PRIMARY KEY CLUSTERED 
(
	[lsc_variance_analysis_preparer_ipa_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_VARIANCE_ANALYSIS_PREPARER_IPA',1,1,1)


CREATE TABLE [dbo].LSC_c_FRP_BACKGROUND_CHECK_AREAS_INQUIRY(
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_FRP_BACKGROUND_CHECK_AREAS_INQUIRY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT LSC_c_FRP_BACKGROUND_CHECK_AREAS_INQUIRY
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'Previous Employment'
		,'Previous Employment'
		,1)

INSERT LSC_c_FRP_BACKGROUND_CHECK_AREAS_INQUIRY
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'Criminal charges'
		,'Criminal charges/convictions'
		,2)

INSERT LSC_c_FRP_BACKGROUND_CHECK_AREAS_INQUIRY
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(3
		,'Civil litigation'
		,'Civil litigation/judgments'
		,3)

INSERT LSC_c_FRP_BACKGROUND_CHECK_AREAS_INQUIRY
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(4
		,'Credit Check'
		,'Credit Check'
		,4)

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_c_FRP_BACKGROUND_CHECK_AREAS_INQUIRY',5,1,1)

CREATE TABLE [dbo].LSC_FRP_BACKGROUND_CHECK_AREAS_INQUIRY(
	lsc_frp_background_check_areas_inquiry_id [int] NOT NULL,
	[lsc_comp_appl_fiscal_id] [int] NULL,
	lsc_frp_background_check_areas_inquiry_lkp_id [int] NULL,
 CONSTRAINT [PK_LSC_FRP_BACKGROUND_CHECK_AREAS_INQUIRY] PRIMARY KEY CLUSTERED 
(
	lsc_frp_background_check_areas_inquiry_id ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_FRP_BACKGROUND_CHECK_AREAS_INQUIRY',1,1,1)



CREATE TABLE [dbo].LSC_c_DEFICIT_STATUS(
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_DEFICIT_STATUS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT LSC_c_DEFICIT_STATUS
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'Yes'
		,'Yes'
		,1)

INSERT LSC_c_DEFICIT_STATUS
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'No'
		,'No'
		,2)

INSERT LSC_c_DEFICIT_STATUS
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(3
		,'In Progress'
		,'In Progress'
		,3)

INSERT LSC_c_DEFICIT_STATUS
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(4
		,'Not Applicable'
		,'Not Applicable'
		,4)

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_c_DEFICIT_STATUS',5,1,1)

CREATE TABLE [dbo].LSC_c_NET_ASSET_FUND_BALANCE_RANGE(
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_NET_ASSET_FUND_BALANCE_RANGE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT LSC_c_NET_ASSET_FUND_BALANCE_RANGE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'Up to 10%'
		,'Up to 10%'
		,1)

INSERT LSC_c_NET_ASSET_FUND_BALANCE_RANGE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'Greater than 10%'
		,'Greater than 10%'
		,2)

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_c_NET_ASSET_FUND_BALANCE_RANGE',3,1,1)

CREATE TABLE [dbo].LSC_c_NET_ASSET_FUND_BALANCE_RANGE_WAIVER(
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_NET_ASSET_FUND_BALANCE_RANGE_WAIVER] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT LSC_c_NET_ASSET_FUND_BALANCE_RANGE_WAIVER
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'11% - 25%'
		,'Between 11% - 25% of LSC Support'
		,1)

INSERT LSC_c_NET_ASSET_FUND_BALANCE_RANGE_WAIVER
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'More than 25%'
		,'More than 25% of LSC Support'
		,2)

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_c_NET_ASSET_FUND_BALANCE_RANGE_WAIVER',3,1,1)

CREATE TABLE [dbo].LSC_c_FUNDING_SVC_DELIVERY_PCT(
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_FUNDING_SVC_DELIVERY_PCT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT LSC_c_FUNDING_SVC_DELIVERY_PCT
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'Less than 60%'
		,'Less than 60%'
		,1)

INSERT LSC_c_FUNDING_SVC_DELIVERY_PCT
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'60-69%'
		,'60-69%'
		,2)

INSERT LSC_c_FUNDING_SVC_DELIVERY_PCT
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(3
		,'70-79%'
		,'70-79%'
		,3)

INSERT LSC_c_FUNDING_SVC_DELIVERY_PCT
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(4
		,'80% or more'
		,'80% or more'
		,4)

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_c_FUNDING_SVC_DELIVERY_PCT',5,1,1)

CREATE TABLE [dbo].LSC_c_FRAUD_INSURANCE_POLICY_LIMIT(
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_FRAUD_INSURANCE_POLICY_LIMIT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT LSC_c_FRAUD_INSURANCE_POLICY_LIMIT
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'0-9%'
		,'0-9%'
		,1)

INSERT LSC_c_FRAUD_INSURANCE_POLICY_LIMIT
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'10-15%'
		,'10-15%'
		,2)

INSERT LSC_c_FRAUD_INSURANCE_POLICY_LIMIT
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(3
		,'16% or more'
		,'16% or more'
		,3)

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_c_FRAUD_INSURANCE_POLICY_LIMIT',4,1,1)


CREATE TABLE [dbo].LSC_c_FIN_DATA_BACKUP_INTERVAL(
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_FIN_DATA_BACKUP_INTERVAL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT LSC_c_FIN_DATA_BACKUP_INTERVAL
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'Daily'
		,'Daily'
		,1)

INSERT LSC_c_FIN_DATA_BACKUP_INTERVAL
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'Weekly'
		,'Weekly'
		,2)

INSERT LSC_c_FIN_DATA_BACKUP_INTERVAL
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(3
		,'Monthly'
		,'Monthly'
		,3)

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_c_FIN_DATA_BACKUP_INTERVAL',4,1,1)

