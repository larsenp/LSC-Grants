USE [Easygrants]
GO
/****** Object:  Table [dbo].[LSC_EXPENDITURE_BY_TYPE]    Script Date: 02/06/2008 11:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_EXPENDITURE_BY_TYPE](
	[lsc_expenditure_by_type_id] [int] NOT NULL,
	[grantee_project_id] [int] NULL,
	[lsc_expenditure_type_id] [int] NULL,
	[amount] [float] NULL,
 CONSTRAINT [PK_LSC_EXPENDITURE_BY_TYPE] PRIMARY KEY CLUSTERED 
(
	[lsc_expenditure_by_type_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_EXPENDITURE_BY_TYPE', 1, 0)