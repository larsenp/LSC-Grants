USE [Easygrants]
GO
/****** Object:  Table [dbo].[LSC_a_REVIEW_ELEMENT]    Script Date: 02/25/2008 11:55:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_a_REVIEW_ELEMENT](
	[lsc_review_element_id] [int] NOT NULL,
	[lsc_review_area_of_inquiry_id] [int] NULL,
	[lsc_review_element_type_id] [int] NULL,
	[sort_order] [int] NULL,
	[abbr] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_a_REVIEW_ELEMENT] PRIMARY KEY CLUSTERED 
(
	[lsc_review_element_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_a_REVIEW_ELEMENT', 1, 1)
