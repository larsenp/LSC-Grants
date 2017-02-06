SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_PRO_BONO_RISK_ASSESSMENT_REVIEW](
	[lsc_pro_bono_risk_assessment_review_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[audited_financial_statements] [bit] NULL,
	[audited_financial_statements_desc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[pai_waivers] [bit] NULL,
	[pai_waivers_desc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[tig_performance] [bit] NULL,
	[tig_performance_desc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[special_grant_conditions] [bit] NULL,
	[special_grant_conditions_desc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[oce_compliance_fiscal_reviews] [bit] NULL,
	[oce_compliance_fiscal_reviews_desc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[opp_quality_reviews] [bit] NULL,
	[opp_quality_reviews_desc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[irs_form_990] [bit] NULL,
	[irs_form_990_desc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[oig_investigation_matters] [bit] NULL,
	[oig_investigation_matters_desc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[issue_contractor_subgrantee] [bit] NULL,
	[issue_contractor_subgrantee_desc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[other_comments] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_LSC_PRO_BONO_RISK_ASSESSMENT_REVIEW] PRIMARY KEY CLUSTERED 
(
	[lsc_pro_bono_risk_assessment_review_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO s_ID_GEN (table_name,next_id, is_code_table)
 VALUES ('LSC_PRO_BONO_RISK_ASSESSMENT_REVIEW',1,0)