SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_c_SIGNIFICANT_ACCOMPLISHMENTS_TYPE](
	[id] [int] NOT NULL,
	[description] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_SIGNIFICANT_ACCOMPLISHMENTS_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


Insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_c_SIGNIFICANT_ACCOMPLISHMENTS_TYPE',
		1,
		1,
		2)
		
		
		
INSERT INTO [dbo].[LSC_c_SIGNIFICANT_ACCOMPLISHMENTS_TYPE]
           ([id]
           ,[description]
           ,[sort_order])
     VALUES
           (1
           ,'Accomplishments For Clients'
           ,1)
           
           

INSERT INTO [dbo].[LSC_c_SIGNIFICANT_ACCOMPLISHMENTS_TYPE]
           ([id]
           ,[description]
           ,[sort_order])
     VALUES
           (2
           ,'Accomplishments For Clients Through PAI'
           ,2)
           
           
           

INSERT INTO [dbo].[LSC_c_SIGNIFICANT_ACCOMPLISHMENTS_TYPE]
           ([id]
           ,[description]
           ,[sort_order])
     VALUES
           (3
           ,'Involvement With Justice And Advocacy Community'
           ,3)
           
           
           

INSERT INTO [dbo].[LSC_c_SIGNIFICANT_ACCOMPLISHMENTS_TYPE]
           ([id]
           ,[description]
           ,[sort_order])
     VALUES
           (4
           ,'Accomplishments For Clients With Other Providers'
           ,4)