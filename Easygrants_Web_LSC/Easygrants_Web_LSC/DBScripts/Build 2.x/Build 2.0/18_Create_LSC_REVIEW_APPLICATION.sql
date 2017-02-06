/****** Object:  Table [dbo].[LSC_REVIEW_APPLICATION]    Script Date: 06/06/2008 14:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_REVIEW_APPLICATION](
	[lsc_review_application_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[lsc_funding_term_id] [int] NULL,
	[grant_proposal_summary] [varchar](max) NULL,
	[violation_pl] [bit] NULL,
	[comment2] [varchar](max) NULL,
	[violation_other] [bit] NULL,
	[comment3] [varchar](max) NULL,
	[claims] [bit] NULL,
	[comment4] [varchar](max) NULL,
	[conflicts1] [bit] NULL,
	[comment5] [varchar](max) NULL,
	[conflicts2] [bit] NULL,
	[comment6] [varchar](max) NULL,
	[sg1] [bit] NULL,
	[sg2] [bit] NULL,
	[certification] [int] NULL,
	[comment7] [varchar](max) NULL,
	[forms] [int] NULL,
	[comment8] [varchar](max) NULL,
	[other] [int] NULL,
	[comment9] [varchar](max) NULL,
	[app_overview_format] [bit] NULL,
	[app_overview_comprehensive] [bit] NULL,
	[app_overview_comment] [varchar](max) NULL,
	[staffing_data] [bit] NULL,
	[csr_data] [bit] NULL,
	[non_lsc_funding_data] [bit] NULL,
	[grantee_profile_comment] [varchar](max) NULL,
	[corrective_action_requirements] [bit] NULL,
	[applicant_complaints] [bit] NULL,
	[oce_report_comment] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_REVIEW_APPLICATION] PRIMARY KEY CLUSTERED 
(
	[lsc_review_application_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_REVIEW_APPLICATION', 1, 0)
