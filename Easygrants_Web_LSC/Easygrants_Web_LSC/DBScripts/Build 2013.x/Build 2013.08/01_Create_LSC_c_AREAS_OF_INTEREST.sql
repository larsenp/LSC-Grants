CREATE TABLE [dbo].[LSC_c_AREAS_OF_INTEREST](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
	[time_period_id] [int] NULL,
 CONSTRAINT [PK_LSC_c_AREAS_OF_INTEREST] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]



INSERT INTO LSC_c_AREAS_OF_INTEREST
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order]
           ,[time_period_id])
     VALUES
           (1
           ,'Key Initiatives'
           ,'Key Initiatives from LSC’s 2012-2013 Summit on the Use of Technology to Expand Access to Justice'
           ,1
           ,18)

INSERT INTO LSC_c_AREAS_OF_INTEREST
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order]
           ,[time_period_id])
     VALUES
           (2
           ,'Leveraging Technology'
           ,'Leveraging Technology to Increase Pro Bono Attorney and Law Student Involvement'
           ,2
           ,18)

INSERT INTO LSC_c_AREAS_OF_INTEREST
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order]
           ,[time_period_id])
     VALUES
           (3
           ,'Use of Data'
           ,'Use of Data to Analyze Service Delivery and Develop Advocacy Strategies'
           ,3
           ,18)

INSERT INTO LSC_c_AREAS_OF_INTEREST
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order]
           ,[time_period_id])
     VALUES
           (4
           ,'Does Not Address'
           ,'This technology project does not address a 2013 TIG area of interest.'
           ,4
           ,18)


INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table]
           ,[lookup_table_type_id])
     VALUES
           ('LSC_c_AREAS_OF_INTEREST'
           ,5
           ,1
           ,2)