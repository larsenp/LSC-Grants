/****** Object:  Table [dbo].[LSC_c_FINANCIAL_TRNG_INTERVAL]    Script Date: 03/22/2013 16:21:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_FINANCIAL_TRNG_INTERVAL](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](200) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_FINANCIAL_TRNG_INTERVAL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [LSC_c_FINANCIAL_TRNG_INTERVAL]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (1
           ,'12-24 months'
           ,'Between 12 months to 24 months'
           ,1)

INSERT INTO [LSC_c_FINANCIAL_TRNG_INTERVAL]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (2
           ,'25-48 months'
           ,'Between 25 months to 48 months'
           ,2)

INSERT INTO [LSC_c_FINANCIAL_TRNG_INTERVAL]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (3
           ,'4 years +'
           ,'More than 4 years'
           ,3)

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table]
           ,[lookup_table_type_id])
     VALUES
           ('LSC_c_FINANCIAL_TRNG_INTERVAL'
           ,4
           ,1
           ,2)
