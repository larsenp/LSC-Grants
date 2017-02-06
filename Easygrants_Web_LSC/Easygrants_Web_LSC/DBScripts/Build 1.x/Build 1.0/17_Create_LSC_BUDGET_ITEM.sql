USE [Easygrants]
GO
/****** Object:  Table [dbo].[LSC_BUDGET_ITEM]    Script Date: 01/28/2008 14:40:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_BUDGET_ITEM](
	[lsc_budget_item_id] [int] NOT NULL,
	[budget_item_id] [int] NULL,
	[lsc_expenditures] [float] NULL,
	[non_lsc_expenditures] [float] NULL
) ON [PRIMARY]


/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
GO
ALTER TABLE dbo.LSC_BUDGET_ITEM ADD CONSTRAINT
	PK_LSC_BUDGET_ITEM PRIMARY KEY CLUSTERED 
	(
	lsc_budget_item_id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO


insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_BUDGET_ITEM', 1, 0)