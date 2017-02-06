/****** Object:  Table [dbo].[LSC_a_REVIEW_ELEMENT]    Script Date: 05/06/2008 12:22:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_a_REVIEW_ELEMENT](
	[id] [int] NOT NULL,
	[lsc_review_inquiry_id] [int] NULL,
	[lsc_review_subtopic_id] [int] NULL,
	[lsc_review_element_type_id] [int] NULL,
	[sort_order] [int] NULL,
	[description] [varchar](max) NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_a_REVIEW_ELEMENT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT LSC_a_REVIEW_ELEMENT
	SELECT * FROM [LSC-EGDEV].Easygrants.dbo.LSC_a_REVIEW_ELEMENT

DECLARE @next_id INT

SELECT @next_id = MAX(id) + 1
	FROM LSC_a_REVIEW_ELEMENT

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_a_REVIEW_ELEMENT', @next_id, 0)
