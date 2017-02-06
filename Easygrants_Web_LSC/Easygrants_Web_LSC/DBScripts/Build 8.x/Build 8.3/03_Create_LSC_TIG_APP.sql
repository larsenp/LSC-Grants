SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_TIG_APP](
	[lsc_tig_app_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[other_similar_projects] [varchar](max) NULL,
	[curr_proj_difference] [varchar](max) NULL,
	[stmt_additional_funds] [varchar](max) NULL,
	[grant_term_months] [int] NULL,
	[grant_request] [int] NULL,
	[project_budget] [int] NULL,
	[brief_description] [varchar](max) NULL,
	[secondary_contact_person_id] [int] NULL,
	[secondary_contact_first_name] [varchar](100) NULL,
	[secondary_contact_middle_name] [varchar](50) NULL,
	[secondary_contact_last_name] [varchar](100) NULL,
	[secondary_contact_address_1] [varchar](150) NULL,
	[secondary_contact_address_2] [varchar](150) NULL,
	[secondary_contact_city] [varchar](50) NULL,
	[secondary_contact_state_province_id] [int] NULL,
	[secondary_contact_zip] [varchar](50) NULL,
	[secondary_contact_phone] [varchar](50) NULL,
	[secondary_contact_fax] [varchar](50) NULL,
	[secondary_contact_email] [varchar](100) NULL,
 CONSTRAINT [PK_LSC_TIG_APP] PRIMARY KEY CLUSTERED 
(
	[lsc_tig_app_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_TIG_APP'
           ,1
           ,0)