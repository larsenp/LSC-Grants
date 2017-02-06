USE [Easygrants]
GO
/****** Object:  Table [dbo].[LSC_TECHNOLOGY]    Script Date: 01/17/2008 10:15:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_TECHNOLOGY](
	[lsc_technology_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[computer_capacity_desk] [bit] NULL,
	[computer_capacity_training] [bit] NULL,
	[computer_capacity_pdf] [bit] NULL,
	[access_email_case] [int] NULL,
	[access_email_staff] [int] NULL,
	[access_research_desktop] [int] NULL,
	[access_research_other] [int] NULL,
	[access_research_none] [int] NULL,
	[connectivity_wi_one] [bit] NULL,
	[connectivity_wi_all] [bit] NULL,
	[connectivity_bt_two] [bit] NULL,
	[connectivity_bt_all] [bit] NULL,
	[dial_up] [bit] NULL,
	[dsl] [bit] NULL,
	[isdn] [bit] NULL,
	[frame] [bit] NULL,
	[t1] [bit] NULL,
	[cable] [bit] NULL,
	[satellite] [bit] NULL,
	[voice_over_ip] [bit] NULL,
	[voice_over_ip_network] [varchar](50) NULL,
	[voice_over_ip_bandwidth] [varchar](50) NULL,
	[voice_over_ip_router] [varchar](50) NULL,
	[intake_phone] [int] NULL,
	[intake_direct] [bit] NULL,
	[intake_may] [bit] NULL,
	[intake_incoming] [int] NULL,
	[intake_maximum] [int] NULL,
	[voice_mail] [bit] NULL,
	[intake_automated] [bit] NULL,
	[call_distribution] [bit] NULL,
	[self_direct] [bit] NULL,
	[self_select] [bit] NULL,
	[callback] [bit] NULL,
	[return_call] [bit] NULL,
	[telephony] [bit] NULL,
	[interactive_voice] [bit] NULL,
 CONSTRAINT [PK_grantee_project1] PRIMARY KEY CLUSTERED 
(
	[lsc_technology_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

Insert into s_id_gen values ('LSC_TECHNOLOGY', 1, 0, null)