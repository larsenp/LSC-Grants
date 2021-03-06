
CREATE TABLE [dbo].[LSC_TIGAPP_AREAS_OF_INTEREST](
	[lsc_tigapp_areas_of_interest_id] [int] NOT NULL,
	[lsc_areas_of_interest_id] [int] NULL,
	[lsc_tig_app_id] [int] NULL,
 CONSTRAINT [PK_LSC_TIGAPP_AREAS_OF_INTEREST] PRIMARY KEY CLUSTERED 
(
	[lsc_tigapp_areas_of_interest_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]



INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table]
           ,[lookup_table_type_id])
     VALUES
           ('LSC_TIGAPP_AREAS_OF_INTEREST'
           ,1
           ,0
           ,1)
