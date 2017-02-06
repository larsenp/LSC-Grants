USE [Easygrants]
GO
/****** Object:  Table [dbo].[LSC_REVIEW_ASSIGNMENT_AREA_OF_INQUIRY]    Script Date: 02/25/2008 11:54:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_REVIEW_ASSIGNMENT_AREA_OF_INQUIRY](
	[lsc_review_assignment_area_of_inquiry_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[lsc_review_area_of_inquiry_id] [int] NULL,
	[lsc_review_area_of_inquiry_score_id] [int] NULL,
	[comment] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_LSC_REVIEW_ASSIGNMENT_AREA_OF_INQUIRY] PRIMARY KEY CLUSTERED 
(
	[lsc_review_assignment_area_of_inquiry_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_REVIEW_ASSIGNMENT_AREA_OF_INQUIRY', 1, 0)
