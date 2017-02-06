/****** Object:  Table [dbo].[LSC_TIG_LOI_REVIEW_OPP]    Script Date: 01/29/2010 16:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_TIG_LOI_REVIEW_OPP](
	[lsc_tig_loi_review_opp_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[project_description_comment] [varchar](max) NULL,
	[project_description_score] [int] NULL,
	[benefits_comment] [varchar](max) NULL,
	[benefits_score] [int] NULL,
	[costs_comment] [varchar](max) NULL,
	[costs_score] [int] NULL,
	[partners_comment] [varchar](max) NULL,
	[partners_score] [int] NULL,
	[innovation_comment] [varchar](max) NULL,
	[innovation_score] [int] NULL,
 CONSTRAINT [PK_LSC_TIG_LOI_COMMITTEE_REVIEW] PRIMARY KEY CLUSTERED 
(
	[lsc_tig_loi_review_opp_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_TIG_LOI_REVIEW_OPP'
           ,1
           ,0)
