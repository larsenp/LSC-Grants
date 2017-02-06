USE [Easygrants]
GO
/****** Object:  Table [dbo].[LSC_SOFTWARE_QUESTION]    Script Date: 02/07/2008 16:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_SOFTWARE_QUESTION](
	[lsc_software_question_id] [int] NOT NULL,
	[grantee_project_id] [int] NULL,
	[case_management_single_db] [bit] NULL,
	[dedicated_timekeeping_sw] [bit] NULL,
	[timekeeping_sw_name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[dedicated_server_count] [int] NULL,
	[remote_access_sw] [bit] NULL,
	[vpn] [bit] NULL,
	[backup_protocol_network] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[backup_protocol_pc] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[backup_storage_location] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[backup_last_restore] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[backup_access] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[web_software_product_id] [int] NULL,
	[web_software_product_other] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[web_db_software_product_id] [int] NULL,
	[web_db_software_product_other] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[swws_url] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[swws_coord_name_first] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[swws_coord_name_last] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[swws_coord_phone] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[swws_coord_email] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[hotdocs_use] [bit] NULL,
	[hotdocs_use_description] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[swws_financial_contribution] [bit] NULL,
	[swws_financial_contribution_amount] [float] NULL,
	[swws_content_contribution] [bit] NULL,
	[swws_content_description] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[swws_program_priorities] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[swws_content_update_protocols] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[swws_content_languages] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[swws_stakeholder_mtgs] [bit] NULL,
	[swws_outreach] [bit] NULL,
	[swws_outreach_description] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[swws_staff_familiar] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[swws_usage_monitoring] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[swws_usage_info_evaluation] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[swws_accessibility] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[swws_delivery_role] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[program_web_site] [bit] NULL,
	[pws_url] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[pws_lsc_funded] [bit] NULL,
	[program_tech_contact_name_first] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[program_tech_contact_name_last] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[program_tech_contact_phone] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[program_tech_contact_email] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sw_tech_contact_name_first] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sw_tech_contact_name_last] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sw_tech_contact_phone] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sw_tech_contact_email] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[program_legalmeetings_host] [bit] NULL,
	[program_legalmeetings_usage] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[applicant_internet_usage] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_LSC_SOFTWARE_QUESTION] PRIMARY KEY CLUSTERED 
(
	[lsc_software_question_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_SOFTWARE_QUESTION', 1, 0)