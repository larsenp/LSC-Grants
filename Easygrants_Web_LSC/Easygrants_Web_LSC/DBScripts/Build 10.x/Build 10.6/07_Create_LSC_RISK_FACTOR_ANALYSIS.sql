/****** Object:  Table [dbo].[LSC_RISK_FACTOR_ANALYSIS]    Script Date: 06/09/2011 09:00:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_RISK_FACTOR_ANALYSIS](
	[lsc_risk_factor_analysis_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[last_opp_visit] [bit] NULL,
	[last_opp_visit_comment] [varchar](max) NULL,
	[sig_prog_issues] [bit] NULL,
	[sig_prog_issues_comment] [varchar](max) NULL,
	[other_sig_issues] [bit] NULL,
	[other_sig_issues_comment] [varchar](max) NULL,
	[issues_lsc_contacts] [bit] NULL,
	[issues_lsc_contacts_comment] [varchar](max) NULL,
	[issues_oce_opp] [bit] NULL,
	[issues_oce_opp_comment] [varchar](max) NULL,
	[sig_complaints] [bit] NULL,
	[sig_complaints_comment] [varchar](max) NULL,
	[oce_opp_areas_interest] [bit] NULL,
	[oce_opp_areas_interest_comment] [varchar](max) NULL,
	[program_size_issues] [bit] NULL,
	[program_size_issues_comment] [varchar](max) NULL,
	[req_rptg_issues] [bit] NULL,
	[req_rptg_issues_comment] [varchar](max) NULL,
	[issues_other_funders] [bit] NULL,
	[issues_other_funders_comment] [varchar](max) NULL,
	[leadership_transition] [bit] NULL,
	[leadership_transition_comment] [varchar](max) NULL,
	[financial_reviews] [bit] NULL,
	[financial_reviews_comment] [varchar](max) NULL,
	[oig_issues] [bit] NULL,
	[oig_issues_comment] [varchar](max) NULL,
	[other] [bit] NULL,
	[other_comment] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_RISK_FACTOR_ANALYSIS] PRIMARY KEY CLUSTERED 
(
	[lsc_risk_factor_analysis_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

GO

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_RISK_FACTOR_ANALYSIS'
           ,1
           ,0)