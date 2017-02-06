CREATE TABLE [dbo].[LSC_RFP_OUTCOME_PREV_PRIORITIES](
	[id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[first_significant_priority] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[first_priority_outcomes] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[first_priority_outcomes_met] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[first_priority_outcomes_not_met] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[second_significant_priority] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[second_priority_outcomes] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[second_priority_outcomes_met] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[second_priority_outcomes_not_met] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[third_significant_priority] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[third_priority_outcomes] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[third_priority_outcomes_met] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[third_priority_outcomes_not_met] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fourth_significant_priority] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fourth_priority_outcomes] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fourth_priority_outcomes_met] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fourth_priority_outcomes_not_met] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_LSC_RFP_OUTCOME_PREV_PRIORITIES] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]



INSERT s_ID_GEN
	(table_name
	,next_id
	,is_code_table
	,lookup_table_type_id)
	VALUES
		('LSC_RFP_OUTCOME_PREV_PRIORITIES'
		,1
		,1
		,1)
