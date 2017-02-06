
CREATE TABLE [dbo].[LSC_WFTA_SUBGRANT_REVIEW_OPP](
	[lsc_wfta_subgrant_review_opp_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[fullappr_comments] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fullappr_recommend_reporting_reqs] [bit] NULL,
	[fullappr_report_info] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fullappr_report_interval_months] [int] NULL,
	[fullappr_report_due_date] [datetime] NULL,
	[partappr_recommend_concerns] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[partappr_revised_start_date] [datetime] NULL,
	[partappr_revised_end_date] [datetime] NULL,
	[partappr_revised_subgrant_amount] [int] NULL,
	[partappr_recommend_reporting_reqs] [bit] NULL,
	[partappr_report_info] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[partappr_report_interval_months] [int] NULL,
	[partappr_report_due_date] [datetime] NULL,
	[partappr_comments] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[provappr_pending_item] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[provappr_due_date] [datetime] NULL,
	[provappr_comments] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[denial_reason] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_LSC_WFTA_SUBGRANT_REVIEW_OPP] PRIMARY KEY CLUSTERED 
(
	[lsc_wfta_subgrant_review_opp_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]



INSERT s_ID_GEN
	(table_name
	,next_id
	,is_code_table
	,lookup_table_type_id)
	VALUES('LSC_WFTA_SUBGRANT_REVIEW_OPP'
		,1
		,1
		,1)