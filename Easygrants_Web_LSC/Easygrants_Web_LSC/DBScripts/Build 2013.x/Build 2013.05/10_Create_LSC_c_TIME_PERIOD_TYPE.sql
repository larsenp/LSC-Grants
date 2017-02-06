CREATE TABLE [dbo].[LSC_c_TIME_PERIOD_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](30) NULL,
	[description] [varchar](60) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_TIME_PERIOD_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]



INSERT s_ID_GEN
	(table_name
	,next_id
	,is_code_table
	,lookup_table_type_id)
	VALUES
		('LSC_c_TIME_PERIOD_TYPE'
		,1
		,1
		,2)


INSERT INTO [LSC_c_TIME_PERIOD_TYPE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (1
           ,'Minutes'
           ,'Minutes'
           ,1)

INSERT INTO [LSC_c_TIME_PERIOD_TYPE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (2
           ,'Hours'
           ,'Hours'
           ,2)


INSERT INTO [LSC_c_TIME_PERIOD_TYPE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (3
           ,'Days'
           ,'Days'
           ,3)
