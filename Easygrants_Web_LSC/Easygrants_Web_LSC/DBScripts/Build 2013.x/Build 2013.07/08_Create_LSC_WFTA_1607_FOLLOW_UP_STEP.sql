/****** Object:  Table [dbo].[LSC_WFTA_1607_FOLLOW_UP_STEP]    Script Date: 04/18/2013 12:37:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_WFTA_1607_FOLLOW_UP_STEP](
	[lsc_wfta_1607_follow_up_step_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[lsc_1607_follow_up_step_id] [int] NULL,
 CONSTRAINT [PK_LSC_WFTA_1607_FOLLOW_UP_STEP] PRIMARY KEY CLUSTERED 
(
	[lsc_wfta_1607_follow_up_step_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT s_ID_GEN
	(table_name
	,next_id
	,is_code_table
	,lookup_table_type_id)
	VALUES
		('LSC_WFTA_1607_FOLLOW_UP_STEP'
		,1
		,0
		,1)