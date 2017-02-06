CREATE TABLE [dbo].[LSC_RFP_INTAKE_METHODS_BY_TYPE](
	[id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[intake_type_id] [int] NULL,
	[intake_type_other_desc] [varchar](50) NULL,
	[intake_percentage] [int] NULL,
	[speak_worker_time_amount] [int] NULL,
	[speak_worker_time_period_type_id] [int] NULL,
	[substantive_interview_time_amount] [int] NULL,
	[substantive_interview_time_period_type_id] [int] NULL,
	[counsel_advice_time_amount] [int] NULL,
	[counsel_advice_time_period_type_id] [int] NULL,
	[limited_action_time_amount] [int] NULL,
	[limited_action_time_period_type_id] [int] NULL,
	[investigation_eval_time_amount] [int] NULL,
	[investigation_eval_time_period_type_id] [int] NULL,
 CONSTRAINT [PK_LSC_RFP_INTAKE_METHODS_BY_TYPE] PRIMARY KEY CLUSTERED 
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
		('LSC_RFP_INTAKE_METHODS_BY_TYPE'
		,1
		,1
		,1)