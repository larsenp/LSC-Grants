/****** Object:  Table [dbo].[LSC_TIG_PROJECT_NARRATIVE]    Script Date: 04/14/2010 10:12:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_TIG_PROJECT_NARRATIVE](
	[lsc_tig_project_narrative_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[description] [varchar](max) NULL,
	[need] [varchar](max) NULL,
	[goals] [varchar](max) NULL,
	[justice_partnerships] [varchar](max) NULL,
	[project_replication] [varchar](max) NULL,
	[capacity_staffing] [varchar](max) NULL,
	[past_performance] [varchar](max) NULL,
	[sustainability] [varchar](max) NULL
 CONSTRAINT [PK_LSC_TIG_PROJECT_NARRATIVE] PRIMARY KEY CLUSTERED 
(
	[lsc_tig_project_narrative_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_TIG_PROJECT_NARRATIVE'
           ,1
           ,0)
