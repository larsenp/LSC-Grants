SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_c_EXAMPLE_TYPE](
	[lsc_example_type_id] [int] IDENTITY(1,1) NOT NULL,
	[abbr] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[accomplishments_type_id] [int] NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_EXAMPLE_TYPE] PRIMARY KEY CLUSTERED 
(
	[lsc_example_type_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]




Insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_c_EXAMPLE_TYPE',
		1,
		1,
		2)