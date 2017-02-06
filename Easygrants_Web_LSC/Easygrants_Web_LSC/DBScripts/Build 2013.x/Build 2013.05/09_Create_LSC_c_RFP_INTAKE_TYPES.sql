
CREATE TABLE [dbo].[LSC_c_RFP_INTAKE_TYPES](
	[id] [int] NOT NULL,
	[abbr] [varchar](30) NULL,
	[description] [varchar](60) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_RFP_INTAKE_TYPES] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]



INSERT INTO [LSC_c_RFP_INTAKE_TYPES]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (1
           ,'Telephone'
           ,'Telephone intake'
           ,1)

INSERT INTO [LSC_c_RFP_INTAKE_TYPES]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (2
           ,'Walk-in'
           ,'Walk-in intake'
           ,2)

INSERT INTO [LSC_c_RFP_INTAKE_TYPES]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (3
           ,'In-person'
           ,'In-person appointment intake'
           ,3)

INSERT INTO [LSC_c_RFP_INTAKE_TYPES]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (4
           ,'Internet'
           ,'Internet/Online intake'
           ,4)

INSERT INTO [LSC_c_RFP_INTAKE_TYPES]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (5
           ,'Outreach'
           ,'Outreach intake'
           ,5)

INSERT INTO [LSC_c_RFP_INTAKE_TYPES]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (6
           ,'Other'
           ,'Other type(s) of intake'
           ,6)

INSERT s_ID_GEN
	(table_name
	,next_id
	,is_code_table
	,lookup_table_type_id)
	VALUES
		('LSC_c_RFP_INTAKE_TYPES'
		,1
		,1
		,2)


