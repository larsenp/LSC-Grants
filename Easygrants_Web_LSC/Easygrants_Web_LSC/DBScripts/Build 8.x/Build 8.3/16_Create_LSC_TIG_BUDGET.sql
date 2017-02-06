/****** Object:  Table [dbo].[LSC_TIG_BUDGET]    Script Date: 03/15/2010 09:52:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_TIG_BUDGET](
	[lsc_tig_budget_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[grantee_project_id] [int] NULL,
 CONSTRAINT [PK_LSC_TIG_BUDGET] PRIMARY KEY CLUSTERED 
(
	[lsc_tig_budget_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_TIG_BUDGET'
           ,1
           ,0)