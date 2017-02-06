/****** Object:  Table [dbo].[LSC_a_TIG_BUDGET_LINE]    Script Date: 03/15/2010 09:53:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_a_TIG_BUDGET_LINE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](200) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_a_TIG_BUDGET_LINE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [LSC_a_TIG_BUDGET_LINE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (1
           ,'1'
           ,'Personnel'
           ,1)

INSERT INTO [LSC_a_TIG_BUDGET_LINE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (2
           ,'2'
           ,'Fringe Benefits'
           ,2)

INSERT INTO [LSC_a_TIG_BUDGET_LINE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (3
           ,'3'
           ,'Space Cost (Rent/Lease)'
           ,3)

INSERT INTO [LSC_a_TIG_BUDGET_LINE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (4
           ,'4'
           ,'Travel'
           ,4)

INSERT INTO [LSC_a_TIG_BUDGET_LINE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (5
           ,'5'
           ,'Equipment (Purchase)'
           ,5)

INSERT INTO [LSC_a_TIG_BUDGET_LINE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (6
           ,'6'
           ,'Equipment (Rental)'
           ,6)

INSERT INTO [LSC_a_TIG_BUDGET_LINE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (7
           ,'7'
           ,'Telecommunications bandwidth charges'
           ,7)

INSERT INTO [LSC_a_TIG_BUDGET_LINE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (8
           ,'8'
           ,'Communications (Other)'
           ,8)

INSERT INTO [LSC_a_TIG_BUDGET_LINE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (9
           ,'9'
           ,'Software'
           ,9)

INSERT INTO [LSC_a_TIG_BUDGET_LINE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (10
           ,'10'
           ,'Supplies'
           ,10)

INSERT INTO [LSC_a_TIG_BUDGET_LINE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (11
           ,'11'
           ,'Contracts'
           ,11)

INSERT INTO [LSC_a_TIG_BUDGET_LINE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (12
           ,'12'
           ,'Project Evaluation Costs'
           ,12)

INSERT INTO [LSC_a_TIG_BUDGET_LINE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (13
           ,'13'
           ,'Training'
           ,13)

INSERT INTO [LSC_a_TIG_BUDGET_LINE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (14
           ,'14'
           ,'Project Audit Costs'
           ,14)

INSERT INTO [LSC_a_TIG_BUDGET_LINE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (15
           ,'15'
           ,'Other'
           ,15)

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_a_TIG_BUDGET_LINE'
           ,16
           ,1)
