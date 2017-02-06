SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_FISCAL_OVERSIGHT](
	[lsc_fiscal_oversight_id] [int] NOT NULL,
	[org_id] [int] NULL,
	[time_period_id] [int] NULL,
	[applicant_exp_fraud_recently] [bit] NULL,
	[fraud_incident_job_title] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fraud_action_taken] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fraud_changes_made] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[accounting_manual] [bit] NULL,
	[accounting_changes_recently] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[accounting_management_involvement] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[accounting_reports_timely] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[accounting_staff] [decimal](10, 2) NULL,
	[accounting_staff_desc] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[board_exercised] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[board_audit_committee] [bit] NULL,
	[board_audit_committee_qualifications] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[board_finance_committee] [bit] NULL,
	[board_finance_committee_qualifications] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[budgeting] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[purchasing_procurement] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cash_receipts] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cash_disbursements] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[client_trust_funds] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[banking_electronic_reconciliation] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[contracting_consultants] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost_identification_allocation] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[payroll_timekeeping] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[travel] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[property_control] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[record_maintenance] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[internal_systems_procedures] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_LSC_FISCAL_OVERSIGHT] PRIMARY KEY CLUSTERED 
(
	[lsc_fiscal_oversight_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


Insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_FISCAL_OVERSIGHT',
		1,
		0,
		1)