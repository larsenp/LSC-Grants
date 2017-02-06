/****** Object:  Table [dbo].[LSC_c_FISCAL_QUALIFICATION]    Script Date: 03/22/2013 16:20:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_FISCAL_QUALIFICATION](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](200) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_FISCAL_QUALIFICATION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [LSC_c_FISCAL_QUALIFICATION]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (1
           ,'CPA'
           ,'Certified Public Accountant'
           ,1)


INSERT INTO [LSC_c_FISCAL_QUALIFICATION]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (2
           ,'MBA'
           ,'Masters in Business Administration'
           ,2)

INSERT INTO [LSC_c_FISCAL_QUALIFICATION]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (3
           ,'CIA'
           ,'Certified Internal Auditor'
           ,3)

INSERT INTO [LSC_c_FISCAL_QUALIFICATION]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (4
           ,'Bachelor''s in Accounting'
           ,'Bachelor''s in Accounting'
           ,4)

INSERT INTO [LSC_c_FISCAL_QUALIFICATION]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (5
           ,'Bachelor''s in Finance'
           ,'Bachelor''s in Finance'
           ,5)

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table]
           ,[lookup_table_type_id])
     VALUES
           ('LSC_c_FISCAL_QUALIFICATION'
           ,6
           ,1
           ,2)
