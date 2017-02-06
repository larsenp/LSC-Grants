/****** Object:  Table [dbo].[LSC_TIG_BUDGET_ITEM]    Script Date: 03/15/2010 09:56:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_TIG_BUDGET_ITEM](
	[lsc_tig_budget_item_id] [int] NOT NULL,
	[lsc_tig_budget_id] [int] NULL,
	[lsc_tig_budget_line_id] [int] NULL,
	[lsc_tig_budget_funding_type_id] [int] NULL,
	[amount] [int] NULL,
	[comment] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_TIG_BUDGET_ITEM] PRIMARY KEY CLUSTERED 
(
	[lsc_tig_budget_item_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_TIG_BUDGET_ITEM'
           ,1
           ,0)
