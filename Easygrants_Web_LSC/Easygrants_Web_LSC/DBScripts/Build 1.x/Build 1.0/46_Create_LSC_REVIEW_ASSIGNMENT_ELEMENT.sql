USE [Easygrants]
GO
/****** Object:  Table [dbo].[LSC_REVIEW_ASSIGNMENT_ELEMENT]    Script Date: 02/25/2008 11:59:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_REVIEW_ASSIGNMENT_ELEMENT](
	[lsc_review_assignment_element_id] [int] NOT NULL,
	[lsc_review_element_id] [int] NULL,
	[wf_task_assignment_id] [int] NULL,
	[checked] [bit] NULL,
 CONSTRAINT [PK_LSC_REVIEW_ASSIGNMENT_ELEMENT] PRIMARY KEY CLUSTERED 
(
	[lsc_review_assignment_element_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_REVIEW_ASSIGNMENT_ELEMENT', 1, 0)
