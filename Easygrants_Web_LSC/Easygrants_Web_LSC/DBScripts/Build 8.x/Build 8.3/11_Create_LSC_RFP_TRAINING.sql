
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_RFP_TRAINING](
	[lsc_rfp_training_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[type1_attorneys] [int] NULL,
	[type1_paralegals] [int] NULL,
	[type1_managers] [int] NULL,
	[type1_admins] [int] NULL,
	[type1_staff] [int] NULL,
	[type2_attorneys] [int] NULL,
	[type2_paralegals] [int] NULL,
	[type2_managers] [int] NULL,
	[type2_admins] [int] NULL,
	[type2_staff] [int] NULL,
	[type3_attorneys] [int] NULL,
	[type3_paralegals] [int] NULL,
	[type3_managers] [int] NULL,
	[type3_admins] [int] NULL,
	[type3_staff] [int] NULL,
	[type4_attorneys] [int] NULL,
	[type4_paralegals] [int] NULL,
	[type4_managers] [int] NULL,
	[type4_admins] [int] NULL,
	[type4_staff] [int] NULL,
	[type5_attorneys] [int] NULL,
	[type5_paralegals] [int] NULL,
	[type5_managers] [int] NULL,
	[type5_admins] [int] NULL,
	[type5_staff] [int] NULL,
	[type6_attorneys] [int] NULL,
	[type6_paralegals] [int] NULL,
	[type6_managers] [int] NULL,
	[type6_admins] [int] NULL,
	[type6_staff] [int] NULL,
	[type7_attorneys] [int] NULL,
	[type7_paralegals] [int] NULL,
	[type7_managers] [int] NULL,
	[type7_admins] [int] NULL,
	[type7_staff] [int] NULL,
	[type8_name] [varchar](max) NULL,
	[type8_attorneys] [int] NULL,
	[type8_paralegals] [int] NULL,
	[type8_managers] [int] NULL,
	[type8_admins] [int] NULL,
	[type8_staff] [int] NULL,
 CONSTRAINT [PK_LSC_RFP_TRAINING] PRIMARY KEY CLUSTERED 
(
	[lsc_rfp_training_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_RFP_TRAINING'
           ,1
           ,0)