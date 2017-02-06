SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_TIG_PRIOR_AWARDS](
	[lsc_tig_prior_awards_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[tig] [varchar](5) NULL,
	[comment] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_TIG_PRIOR_AWARDS] PRIMARY KEY CLUSTERED 
(
	[lsc_tig_prior_awards_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_TIG_PRIOR_AWARDS'
           ,1
           ,0)