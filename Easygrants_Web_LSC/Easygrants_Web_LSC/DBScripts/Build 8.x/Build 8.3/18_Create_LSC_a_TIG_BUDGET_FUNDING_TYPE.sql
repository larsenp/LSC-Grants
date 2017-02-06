/****** Object:  Table [dbo].[LSC_a_TIG_BUDGET_FUNDING_TYPE]    Script Date: 03/15/2010 09:55:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_a_TIG_BUDGET_FUNDING_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](200) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_a_TIG_BUDGET_FUNDING_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [LSC_a_TIG_BUDGET_FUNDING_TYPE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (1
           ,'A'
           ,'LSC Grant Request'
           ,1)

INSERT INTO [LSC_a_TIG_BUDGET_FUNDING_TYPE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (2
           ,'B'
           ,'Program Project Contributions'
           ,2)

INSERT INTO [LSC_a_TIG_BUDGET_FUNDING_TYPE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (3
           ,'C'
           ,'Funds from Other LSC-Funded Partners'
           ,3)

INSERT INTO [LSC_a_TIG_BUDGET_FUNDING_TYPE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (4
           ,'D'
           ,'Funds from NON-LSC Funded Partners'
           ,4)

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_a_TIG_BUDGET_FUNDING_TYPE'
           ,1
           ,5)
