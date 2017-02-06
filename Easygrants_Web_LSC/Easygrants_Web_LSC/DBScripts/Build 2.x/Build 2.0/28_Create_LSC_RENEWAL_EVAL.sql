/****** Object:  Table [dbo].[LSC_RENEWAL_EVAL]    Script Date: 06/16/2008 11:47:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_RENEWAL_EVAL](
	[lsc_renewal_eval_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[comment_a] [varchar](max) NULL,
	[form_d] [bit] NULL,
	[comment_d] [varchar](max) NULL,
	[form_g] [bit] NULL,
	[comment_g] [varchar](max) NULL,
	[form_i] [bit] NULL,
	[comment_i] [varchar](max) NULL,
	[form_k] [bit] NULL,
	[comment_k] [varchar](max) NULL,
	[form_l] [bit] NULL,
	[comment_l] [varchar](max) NULL,
	[management] [bit] NULL,
	[intake] [bit] NULL,
	[techno] [bit] NULL,
	[pro_se] [bit] NULL,
	[pai] [bit] NULL,
	[foreclosure] [bit] NULL,
	[coordination] [bit] NULL,
	[resource_development] [bit] NULL,
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
	[compliance_memo] [bit] NULL,
	[compliance_memo_comment] [varchar](max) NULL,
	[program_profile] [bit] NULL,
	[program_profile_comment] [varchar](max) NULL,
	[other_docs] [bit] NULL,
	[other_docs_comment] [varchar](max) NULL,
	[cert_primary_reader_person_id] [int] NULL,
	[cert_primary_reader_date] [datetime] NULL,
	[cert_secondary_reader_person_id] [int] NULL,
	[cert_secondary_reader_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_RENEWAL_EVAL] PRIMARY KEY CLUSTERED 
(
	[lsc_renewal_eval_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_RENEWAL_EVAL', 1, 0)