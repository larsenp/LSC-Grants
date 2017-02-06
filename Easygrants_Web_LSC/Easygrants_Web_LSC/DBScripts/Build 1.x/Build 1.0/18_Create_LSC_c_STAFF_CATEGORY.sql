USE [Easygrants]
GO
/****** Object:  Table [dbo].[LSC_c_STAFF_CATEGORY]    Script Date: 02/01/2008 09:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_STAFF_CATEGORY](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_STAFF_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[lsc_staff_category_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_c_STAFF_CATEGORY', 1, 1)