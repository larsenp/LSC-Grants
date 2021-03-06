
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_RFP_CASE_DEVELOP_ACTIVITY](
	[lsc_case_development_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[case_develop_activity_1] [int] NULL,
	[case_develop_activity_2] [int] NULL,
	[case_develop_activity_3] [int] NULL,
	[case_develop_activity_4] [int] NULL,
	[case_develop_activity_5] [int] NULL,
	[case_develop_activity_6] [int] NULL,
	[case_develop_activity_7] [int] NULL,
	[case_develop_activity_8] [int] NULL,
 CONSTRAINT [PK_LSC_RFP_CASE_DEVELOP_ACTIVITY] PRIMARY KEY CLUSTERED 
(
	[lsc_case_development_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_RFP_CASE_DEVELOP_ACTIVITY'
           ,1
           ,0)