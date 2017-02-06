USE [Easygrants]
GO
/****** Object:  Table [dbo].[LSC_a_REVIEW_TOPIC]    Script Date: 02/25/2008 11:47:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_a_REVIEW_TOPIC](
	[lsc_review_topic_id] [int] NOT NULL,
	[time_period_id] [int] NULL,
	[abbr] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weighting] [int] NULL,
	[end_date] [datetime] NULL,
	[sort_order] [int] NULL,
 CONSTRAINT [PK_LSC_a_REVIEW_TOPIC] PRIMARY KEY CLUSTERED 
(
	[lsc_review_topic_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_a_REVIEW_TOPIC', 1, 1)