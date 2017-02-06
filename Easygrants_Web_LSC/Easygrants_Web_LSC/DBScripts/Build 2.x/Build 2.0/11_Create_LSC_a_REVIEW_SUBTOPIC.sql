/****** Object:  Table [dbo].[LSC_a_REVIEW_SUBTOPIC]    Script Date: 05/06/2008 12:21:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_a_REVIEW_SUBTOPIC](
	[id] [int] NOT NULL,
	[lsc_review_inquiry_id] [int] NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](200) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_a_REVIEW_SUBTOPIC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT LSC_a_REVIEW_SUBTOPIC
	SELECT * FROM [LSC-EGDEV].Easygrants.dbo.LSC_a_REVIEW_SUBTOPIC

DECLARE @next_id INT

SELECT @next_id = MAX(id) + 1
	FROM LSC_a_REVIEW_SUBTOPIC

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_a_REVIEW_SUBTOPIC', @next_id, 0)
