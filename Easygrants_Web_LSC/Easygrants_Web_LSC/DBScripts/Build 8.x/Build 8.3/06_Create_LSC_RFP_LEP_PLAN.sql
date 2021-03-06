
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_RFP_LEP_PLAN](
	[lsc_rfp_lep_plan_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
    [LEP_have_written_plan] [bit] NULL,
	[LEP_1] [bit] NULL,
	[LEP_2] [bit] NULL,
	[LEP_3] [bit] NULL,
	[LEP_4] [bit] NULL,
	[LEP_5] [bit] NULL,
	[LEP_6] [bit] NULL,
	[LEP_7] [bit] NULL,
 CONSTRAINT [PK_LSC_RFP_LEP] PRIMARY KEY CLUSTERED 
(
	[lsc_rfp_lep_plan_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_RFP_LEP_PLAN'
           ,1
           ,0)