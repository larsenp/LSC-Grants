/****** Object:  Table [dbo].[LSC_WFTA_SUBGRANT_REVIEW_DD]    Script Date: 11/16/2010 15:39:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_WFTA_SUBGRANT_REVIEW_DD](
	[lsc_wfta_subgrant_review_dd_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[is_new] [bit] NULL,
	[meets_reg_reqs] [bit] NULL,
	[recommend_reporting_reqs] [bit] NULL,
	[report_info] [varchar](max) NULL,
	[report_interval_months] [int] NULL,
	[report_due_date] [datetime] NULL,
	[denial_reason] [varchar](max) NULL,
	[recommend_partial_approval] [bit] NULL,
	[partial_approval_concerns] [varchar](max) NULL,
	[revised_start_date] [datetime] NULL,
	[revised_end_date] [datetime] NULL,
	[revised_subgrant_amount] [int] NULL,
	[recommend_provisional_approval] [bit] NULL,
	[provisional_approval_pending_item] [varchar](max) NULL,
	[provisional_due_date] [datetime] NULL,
        [overall_comments] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_WFTA_SUBGRANT_REVIEW_DD] PRIMARY KEY CLUSTERED 
(
	[lsc_wfta_subgrant_review_dd_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_WFTA_SUBGRANT_REVIEW_DD',
		1,
		0,
		1)