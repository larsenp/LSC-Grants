
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_REVIEW_ASSIGNMENT_CATEGORY](
	[lsc_review_assignment_category_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[lsc_review_category_id] [int] NULL,
	[lsc_review_inquiry_score_id] [int] NULL,
	[comment] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_LSC_REVIEW_ASSIGNMENT_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[lsc_review_assignment_category_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


INSERT s_ID_GEN
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	VALUES('LSC_REVIEW_ASSIGNMENT_CATEGORY',
		1,
		0,
		1)
		
		
GO
SET ANSI_PADDING OFF