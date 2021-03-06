
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_RFP_BOARD_POLICIES](
	[lsc_rfp_board_policies_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[rfp_board_policy_1] [bit] NULL,
	[rfp_board_policy_2] [bit] NULL,
	[rfp_board_policy_3] [bit] NULL,
	[rfp_board_policy_4] [bit] NULL,
	[rfp_board_policy_5] [bit] NULL,
	[rfp_board_policy_6] [bit] NULL,
	[rfp_board_policy_7] [bit] NULL,
	[rfp_board_policy_8] [bit] NULL,
	[rfp_board_policy_9] [bit] NULL,
 CONSTRAINT [PK_LSC_RFP_BOARD_POLICIES] PRIMARY KEY CLUSTERED 
(
	[lsc_rfp_board_policies_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_RFP_BOARD_POLICIES'
           ,1
           ,0)