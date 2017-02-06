/****** Object:  Table [dbo].[LSC_a_REVIEW_INQUIRY]    Script Date: 05/06/2008 12:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_a_REVIEW_INQUIRY](
	[id] [int] NOT NULL,
	[lsc_review_criterion_id] [int] NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](1000) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
	[weighting] [int] NULL,
	[new_applicants_only] [bit] NULL,
	[existing_applicants_only] [bit] NULL,
 CONSTRAINT [PK_LSC_a_REVIEW_INQUIRY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT LSC_a_REVIEW_INQUIRY
	SELECT * FROM [LSC-EGDEV].Easygrants.dbo.LSC_a_REVIEW_INQUIRY

DECLARE @next_id INT

SELECT @next_id = MAX(id) + 1
	FROM LSC_a_REVIEW_INQUIRY

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_a_REVIEW_INQUIRY', @next_id, 0)
