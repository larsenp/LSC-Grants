/****** Object:  Table [dbo].[LSC_c_FISCAL_SW_MODULE]    Script Date: 03/22/2013 16:23:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_FISCAL_SW_MODULE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](200) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_FISCAL_SW_MODULE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [LSC_c_FISCAL_SW_MODULE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (1
           ,'AR'
           ,'Accounts receivable (AR)'
           ,1)

INSERT INTO [LSC_c_FISCAL_SW_MODULE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (2
           ,'AP'
           ,'Accounts  payable (AP)'
           ,2)

INSERT INTO [LSC_c_FISCAL_SW_MODULE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (3
           ,'Payroll'
           ,'Payroll'
           ,3)

INSERT INTO [LSC_c_FISCAL_SW_MODULE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (4
           ,'Fixed Assets'
           ,'Fixed Assets'
           ,4)

INSERT INTO [LSC_c_FISCAL_SW_MODULE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (5
           ,'Purchasing'
           ,'Purchasing'
           ,5)

INSERT INTO [LSC_c_FISCAL_SW_MODULE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (6
           ,'None of the above'
           ,'None of the above'
           ,6)

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table]
           ,[lookup_table_type_id])
     VALUES
           ('[LSC_c_FISCAL_SW_MODULE]'
           ,6
           ,1
           ,2)
