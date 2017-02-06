/****** Object:  Table [dbo].[LSC_c_FISCAL_ROLE]    Script Date: 03/22/2013 16:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_FISCAL_ROLE](
	[id] [int] NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](200) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [LSC_c_FISCAL_ROLE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (1
           ,'Chief Financial Officer'
           ,'Chief Financial Officer'
           ,1)

INSERT INTO [LSC_c_FISCAL_ROLE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (2
           ,'Comptroller'
           ,'Comptroller'
           ,2)

INSERT INTO [LSC_c_FISCAL_ROLE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (3
           ,'Director of Finance'
           ,'Director of Finance'
           ,3)

INSERT INTO [LSC_c_FISCAL_ROLE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (4
           ,'Finance Administrator'
           ,'Finance Administrator'
           ,4)

INSERT INTO [LSC_c_FISCAL_ROLE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (5
           ,'Other'
           ,'Other'
           ,5)

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table]
           ,[lookup_table_type_id])
     VALUES
           ('LSC_c_FISCAL_ROLE'
           ,6
           ,1
           ,2)
