CREATE TABLE [dbo].[LSC_TIG_APP_REVIEW_SCORE](
	[lsc_tig_app_review_score_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[budget_clear_link] [int] NULL,
	[budget_adequate] [int] NULL,
	[budget_reasonable_cost] [int] NULL,
	[budget_narrative_supports] [int] NULL,
	[budget_support_from_other] [int] NULL,
	[need_clearly_described] [int] NULL,
	[need_address_limitations] [int] NULL,
	[need_demonstrate_relevance] [int] NULL,
	[need_address_area_of_interest] [int] NULL,
	[goals_clearly_articulated] [int] NULL,
	[goals_identify_strategies] [int] NULL,
	[goals_specify_evaluation] [int] NULL,
	[partner_justice_community] [int] NULL,
	[repl_common_problem] [int] NULL,
	[repl_advantage_over_existing] [int] NULL,
	[repl_ease] [int] NULL,
	[repl_how_replicates] [int] NULL,
	[repl_how_improves] [int] NULL,
	[cap_team_members] [int] NULL,
	[cap_organization] [int] NULL,
	[past_tig] [int] NULL,
	[sust_clear_strategy] [int] NULL,
 CONSTRAINT [PK_LSC_TIG_APP_REVIEW_SCORE] PRIMARY KEY CLUSTERED 
(
	[lsc_tig_app_review_score_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


INSERT s_ID_GEN
	(table_name
	,next_id
	,is_code_table
	,lookup_table_type_id)
	VALUES
		('LSC_TIG_APP_REVIEW_SCORE'
		,1
		,0
		,1)
