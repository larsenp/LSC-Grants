USE [Easygrants]
GO
/****** Object:  Table [dbo].[LSC_EXPENDITURE_BY_TYPE_PAI]    Script Date: 03/13/2008 16:12:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_EXPENDITURE_BY_TYPE_PAI](
	[lsc_expenditure_by_type_pai_id] [int] NOT NULL,
	[grantee_project_id] [int] NULL,
	[wf_task_assignment_id] [int] NULL,
	[lsc_expenditure_type_id] [int] NULL,
	[amount] [float] NULL
) ON [PRIMARY]


insert into [s_ID_GEN] values ('LSC_EXPENDITURE_BY_TYPE_PAI', 1, 0, null)
