USE [Easygrants]
GO
/****** Object:  Table [dbo].[LSC_a_EXPENDITURE_TYPE]    Script Date: 02/06/2008 11:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_a_EXPENDITURE_TYPE](
	[lsc_expenditure_type_id] [int] NOT NULL,
	[lsc_expenditure_section_id] [int] NULL,
	[abbr] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_a_PROJECTED_EXPENDITURE_TYPE] PRIMARY KEY CLUSTERED 
(
	[lsc_expenditure_type_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_a_EXPENDITURE_TYPE', 1, 1)