SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_TIG_REVIEW_OPEN_REP_WEB_IMPR](
	[lsc_tig_review_open_rep_web_impr_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[budget_comment] [varchar](max) NULL,
	[pn_need_comment] [varchar](max) NULL,
	[pn_goals_comment] [varchar](max) NULL,
	[pn_just_part_comment] [varchar](max) NULL,
	[pn_proj_rep_comment] [varchar](max) NULL,
	[pn_cap_staff_comment] [varchar](max) NULL,
	[pn_past_performance_comment] [varchar](max) NULL,
	[pn_sustainability_comment] [varchar](max) NULL,
	[pn_overall_comment] [varchar](max) NULL,
	[uploaded_files_comment] [varchar](max) NULL,
	[prior_tig_grants_comment] [varchar](max) NULL,
	[other_projects_comment] [varchar](max) NULL,
	[proposed_payment_schedule_comment] [varchar](max) NULL,
	[stmt_additional_funds_comment] [varchar](max) NULL,
	[funding_recommendation_id] [int] NULL,
	[recommended_funding_amount] [int] NULL,
	[overall_comment] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_TIG_REVIEW_OPEN_REP_WEB_IMPR] PRIMARY KEY CLUSTERED 
(
	[lsc_tig_review_open_rep_web_impr_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_TIG_REVIEW_OPEN_REP_WEB_IMPR',
		1,
		0,
		1)