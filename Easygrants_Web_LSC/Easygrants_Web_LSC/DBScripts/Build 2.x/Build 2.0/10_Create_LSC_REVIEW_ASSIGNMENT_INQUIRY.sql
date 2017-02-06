/****** Object:  Table [dbo].[LSC_REVIEW_ASSIGNMENT_INQUIRY]    Script Date: 05/06/2008 12:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_REVIEW_ASSIGNMENT_INQUIRY](
	[lsc_review_assignment_inquiry_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[lsc_review_inquiry_id] [int] NULL,
	[lsc_review_inquiry_score_id] [int] NULL,
	[comment] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_REVIEW_ASSIGNMENT_INQUIRY] PRIMARY KEY CLUSTERED 
(
	[lsc_review_assignment_inquiry_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_REVIEW_ASSIGNMENT_INQUIRY', 1, 0)
