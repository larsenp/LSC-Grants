/****** Object:  Table [dbo].[LSC_c_FISCAL_INTERNAL_CONTROL_AREA]    Script Date: 03/22/2013 16:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_FISCAL_INTERNAL_CONTROL_AREA](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](200) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_FISCAL_INTERNAL_CONTROL_AREA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [LSC_c_FISCAL_INTERNAL_CONTROL_AREA]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (1
           ,'Personnel and Payroll'
           ,'Personnel and Payroll'
           ,1)

INSERT INTO [LSC_c_FISCAL_INTERNAL_CONTROL_AREA]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (2
           ,'Consultants & Contract Services'
           ,'Consultants & Contract Services'
           ,2)

INSERT INTO [LSC_c_FISCAL_INTERNAL_CONTROL_AREA]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (3
           ,'Bank reconciliation procedures'
           ,'Bank reconciliation procedures'
           ,3)

INSERT INTO [LSC_c_FISCAL_INTERNAL_CONTROL_AREA]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (4
           ,'Client trust accounts'
           ,'Client trust accounts'
           ,4)

INSERT INTO [LSC_c_FISCAL_INTERNAL_CONTROL_AREA]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (5
           ,'Property control'
           ,'Property control'
           ,5)

INSERT INTO [LSC_c_FISCAL_INTERNAL_CONTROL_AREA]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (6
           ,'Travel'
           ,'Travel'
           ,6)

INSERT INTO [LSC_c_FISCAL_INTERNAL_CONTROL_AREA]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (7
           ,'Segregation of Duties'
           ,'Segregation of Duties'
           ,7)

INSERT INTO [LSC_c_FISCAL_INTERNAL_CONTROL_AREA]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (8
           ,'Electronic banking'
           ,'Electronic banking'
           ,8)

INSERT INTO [LSC_c_FISCAL_INTERNAL_CONTROL_AREA]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (9
           ,'Procurements'
           ,'Procurements'
           ,9)

INSERT INTO [LSC_c_FISCAL_INTERNAL_CONTROL_AREA]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (10
           ,'Cash receipts'
           ,'Cash receipts'
           ,10)

INSERT INTO [LSC_c_FISCAL_INTERNAL_CONTROL_AREA]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (11
           ,'Petty cash controls'
           ,'Petty cash controls'
           ,11)

INSERT INTO [LSC_c_FISCAL_INTERNAL_CONTROL_AREA]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (12
           ,'Cash disbursements (all types)'
           ,'Cash disbursements (all types)'
           ,12)

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table]
           ,[lookup_table_type_id])
     VALUES
           ('LSC_c_FISCAL_INTERNAL_CONTROL_AREA'
           ,13
           ,1
           ,2)
