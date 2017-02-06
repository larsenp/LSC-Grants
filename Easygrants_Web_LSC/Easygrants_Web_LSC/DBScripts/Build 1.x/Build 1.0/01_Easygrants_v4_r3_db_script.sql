/****** Object:  Table [dbo].[c_CHOICE]    Script Date: 10/09/2007 11:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_CHOICE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_CHOICE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DATABASE_LOG]    Script Date: 10/09/2007 11:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DATABASE_LOG](
	[database_log_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[change_date] [datetime] NULL,
	[table_name] [varchar](50) NULL,
	[primary_key] [int] NULL,
	[original_values] [varchar](8000) NULL,
	[change_type] [varchar](50) NULL,
	[db_user_id] [varchar](50) NULL DEFAULT ('WebApp'),
	[from_trigger] [varchar](50) NULL DEFAULT ('false'),
 CONSTRAINT [PK_DATABASE_LOG] PRIMARY KEY CLUSTERED 
(
	[database_log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_SCIENCE_KATZ]    Script Date: 10/09/2007 11:42:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_SCIENCE_KATZ](
	[id] [int] NOT NULL,
	[category_id] [int] NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_SCIENCE_KATZ] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_WEB_ADDRESS_TYPE]    Script Date: 10/09/2007 11:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_WEB_ADDRESS_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NOT NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_WEB_ADDRESS_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_RESEARCH_CLASSIFICATION]    Script Date: 10/09/2007 11:42:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_RESEARCH_CLASSIFICATION](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_RESEARCH_CLASSIFICATION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERSON]    Script Date: 10/09/2007 11:47:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PERSON](
	[person_id] [int] NOT NULL,
	[name_last] [varchar](100) NULL,
	[name_first] [varchar](50) NULL,
	[name_first_preferred] [varchar](50) NULL,
	[name_middle] [varchar](50) NULL,
	[name_nick] [varchar](50) NULL,
	[name_suffix] [varchar](50) NULL,
	[name_honorific] [varchar](50) NULL,
	[suffix_id] [int] NULL,
	[assistant_name] [varchar](200) NULL,
	[spouse_name] [varchar](200) NULL,
	[ssn] [varchar](20) NULL,
	[create_user_id] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user_id] [int] NULL,
	[modify_date] [datetime] NULL,
	[gender_id] [int] NULL,
	[prefix_id] [int] NULL,
	[is_reviewer] [bit] NOT NULL CONSTRAINT [DF_PERSON_is_reviewer]  DEFAULT ((0)),
	[aha_name_id] [int] NULL,
	[aha_smart_id] [varchar](15) NULL,
	[lineage_id] [int] NULL,
	[ethnicity_id] [int] NULL,
	[race_id] [int] NULL,
	[tenure_id] [int] NULL,
	[title] [varchar](100) NULL,
	[degree_id] [int] NULL,
	[date_of_birth] [datetime] NULL,
	[tenure_year] [int] NULL,
	[legacy_person_id] [int] NULL,
	[degrees] [varchar](50) NULL,
	[is_donotcontact] [bit] NULL,
	[is_deceased] [bit] NULL,
 CONSTRAINT [PK_PERSON] PRIMARY KEY CLUSTERED 
(
	[person_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_EMAIL_TYPE]    Script Date: 10/09/2007 11:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_EMAIL_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_EMAIL_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_REVIEW_CYCLE]    Script Date: 10/09/2007 11:38:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_REVIEW_CYCLE](
	[id] [int] NOT NULL,
	[program_id] [int] NULL,
	[competition_id] [int] NULL,
	[competition_type_id] [int] NULL,
	[time_period_id] [int] NULL,
	[description] [varchar](300) NULL,
	[name] [varchar](200) NULL,
	[create_user] [int] NULL,
	[previous_review_cycle_id] [int] NULL,
	[list_order] [smallint] NULL,
 CONSTRAINT [PK_a_REVIEW_CYCLE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_EXTRANET_USER_TYPE]    Script Date: 10/09/2007 11:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_EXTRANET_USER_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[start_page] [varchar](100) NULL,
 CONSTRAINT [PK_c_EXTRANET_USER_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REVIEW_CYCLE_CONFLICT]    Script Date: 10/09/2007 11:48:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REVIEW_CYCLE_CONFLICT](
	[review_cycle_conflict_id] [int] NOT NULL,
	[review_cycle_id] [int] NOT NULL,
	[rev_person_id] [int] NOT NULL,
	[app_person_id] [int] NOT NULL,
	[conflict_type_id] [int] NULL,
	[request_conflict_id] [int] NOT NULL CONSTRAINT [DF_REVIEW_CYCLE_CONFLICT_request_conflict_id]  DEFAULT (0),
	[review_source_id] [int] NULL,
	[wfta_id] [int] NULL,
	[rev_wfta_id] [int] NULL,
	[rev_committee_id] [int] NULL,
	[matching_research_fields] [int] NULL,
	[matching_research_areas] [int] NULL,
 CONSTRAINT [PK_REVIEW_CYCLE_CONFLICT] PRIMARY KEY CLUSTERED 
(
	[review_cycle_conflict_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[c_EDUCATIONAL_LEVEL]    Script Date: 10/09/2007 11:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_EDUCATIONAL_LEVEL](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_EDUCATIONAL_LEVEL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_GRANT_STATUS]    Script Date: 10/09/2007 11:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_GRANT_STATUS](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_GRANT_STATUS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EASYGRANTS_USER]    Script Date: 10/09/2007 11:43:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EASYGRANTS_USER](
	[easygrants_user_id] [int] NOT NULL,
	[person_id] [int] NOT NULL,
	[login_username] [varchar](100) NULL,
	[login_password] [varchar](30) NULL,
	[encryption_key] [varchar](50) NULL,
	[user_type_id] [int] NULL,
	[frontdoor_page] [varchar](100) NULL,
	[password_question_id] [int] NULL,
	[password_answer] [varchar](100) NULL,
	[external_login_id] [varchar](20) NULL,
	[create_date] [datetime] NULL,
	[create_user_id] [int] NULL,
	[change_date] [datetime] NULL,
	[change_user_id] [int] NULL,
	[password_last_sent_date] [datetime] NULL,
	[failed_attempts] [int] NULL,
	[change_password_next_login] [bit] NULL,
	[locked] [bit] NULL,
 CONSTRAINT [PK_EASYGRANTS_USER] PRIMARY KEY CLUSTERED 
(
	[easygrants_user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EASYGRANTS_ROLES]    Script Date: 10/09/2007 11:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EASYGRANTS_ROLES](
	[login_username] [varchar](100) NOT NULL,
	[role_name] [varchar](250) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_KEYWORD]    Script Date: 10/09/2007 11:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_KEYWORD](
	[id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[sequence_in_category] [int] NULL,
	[description] [varchar](100) NULL,
	[more] [bit] NOT NULL,
 CONSTRAINT [PK_c_KEYWORD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_DEGREE]    Script Date: 10/09/2007 11:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_DEGREE](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_DEGREE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_KEYWORD_CATEGORY]    Script Date: 10/09/2007 11:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_KEYWORD_CATEGORY](
	[id] [int] NOT NULL,
	[description] [varchar](100) NULL,
	[sequence_number] [int] NULL,
 CONSTRAINT [PK_c_KEYWORD_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_CONFLICT_TYPE]    Script Date: 10/09/2007 11:40:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_CONFLICT_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_CONFLICT_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_NOTE_SUBJECT]    Script Date: 10/09/2007 11:41:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_NOTE_SUBJECT](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_NOTE_SUBJECT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_OTHER_SUPPORT_STATUS]    Script Date: 10/09/2007 11:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_OTHER_SUPPORT_STATUS](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_OTHER_SUPPORT_STATUS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_ELIGIBILITY_ANSWER]    Script Date: 10/09/2007 11:40:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_ELIGIBILITY_ANSWER](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_ELIGIBILITY_ANSWER] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_CONFLICT_PROCESS]    Script Date: 10/09/2007 11:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_CONFLICT_PROCESS](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[display_name] [varchar](100) NULL,
	[description] [varchar](2000) NULL,
	[sp_name] [varchar](50) NULL,
 CONSTRAINT [PK_c_CONFLICT_PROCESS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_PASSWORD_QUESTION]    Script Date: 10/09/2007 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_PASSWORD_QUESTION](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_PASSWORD_QUESTION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_SCIENCE]    Script Date: 10/09/2007 11:42:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_SCIENCE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[class_id] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_SCIENCE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_ELIGIBILITY_QUESTION]    Script Date: 10/09/2007 11:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_ELIGIBILITY_QUESTION](
	[id] [int] NOT NULL,
	[abbr] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_ELIGIBILITY_QUESTION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_PAYMENT_ENTITY]    Script Date: 10/09/2007 11:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_PAYMENT_ENTITY](
	[id] [int] NOT NULL,
	[entity] [varchar](50) NULL,
	[abbr] [varchar](50) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_PAYMENT_ENTITY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_PI_TYPE]    Script Date: 10/09/2007 11:41:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_PI_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[sort_order] [smallint] NOT NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_PI_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_DEGREE_SPECIALTY]    Script Date: 10/09/2007 11:40:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_DEGREE_SPECIALTY](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_DEGREE_SPECIALTY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_PDF_GENERATION]    Script Date: 10/09/2007 11:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_PDF_GENERATION](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_PDF_GENERATION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_CAREER_STAGE]    Script Date: 10/09/2007 11:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_CAREER_STAGE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_CAREER_STAGE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_PROJECT_TYPE]    Script Date: 10/09/2007 11:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_PROJECT_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NOT NULL,
	[description] [varchar](200) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_PROJECT_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_IMMIGRATION]    Script Date: 10/09/2007 11:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_IMMIGRATION](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_IMMIGRATION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_RATING]    Script Date: 10/09/2007 11:41:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_RATING](
	[id] [int] NOT NULL,
	[rating] [float] NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_c_RATING] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vMY_EASYLISTS]    Script Date: 10/09/2007 11:50:19 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER OFF
--GO
--CREATE VIEW [dbo].[vMY_EASYLISTS]
--AS
--SELECT     dbo.a_MYEASYLIST.myeasylist_id, dbo.a_MYEASYLIST.person_id, dbo.a_MYEASYLIST.myeasylist_url, dbo.a_MYEASYLIST.myeasylist_name, 
--                      dbo.a_MYEASYLIST.myeasylist_desc, dbo.a_EASYLIST_TYPE.long
--FROM         dbo.a_MYEASYLIST INNER JOIN
--                      dbo.a_EASYLIST_TYPE ON dbo.a_MYEASYLIST.myeasylist_type = dbo.a_EASYLIST_TYPE.id
--GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_AHA]    Script Date: 10/09/2007 11:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_AHA](
	[grantee_project_aha_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[wf_task_id] [int] NULL,
	[person_id] [int] NULL,
	[person_role_id] [int] NULL,
	[is_approved] [bit] NULL,
	[non_approval_reason] [varchar](2000) NULL,
	[is_accepted] [bit] NULL,
	[non_accepted_reason] [varchar](2000) NULL,
	[laboratory] [text] NULL,
	[clinical] [text] NULL,
	[animal] [text] NULL,
	[computer] [text] NULL,
	[office] [text] NULL,
	[other] [text] NULL,
	[major_equipment] [text] NULL,
	[major_problem] [text] NULL,
	[specific_questions] [text] NULL,
	[biomedical_significance] [text] NULL,
	[is_fiscal_officer] [bit] NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_AHA] PRIMARY KEY CLUSTERED 
(
	[grantee_project_aha_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_REVIEWER_STATUS]    Script Date: 10/09/2007 11:42:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_REVIEWER_STATUS](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[sort_order] [smallint] NOT NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_REVIEWER_STATUS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[d_SOURCE_TYPE]    Script Date: 10/09/2007 11:42:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[d_SOURCE_TYPE](
	[source_type_id] [int] NOT NULL,
	[source_type] [varchar](50) NOT NULL,
 CONSTRAINT [d_SOURCE_TYPE_PK] PRIMARY KEY CLUSTERED 
(
	[source_type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vMY_CONTACTS]    Script Date: 10/09/2007 11:50:19 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE  VIEW [dbo].[vMY_CONTACTS]
--AS
--SELECT  dbo.a_MYCONTACTS.mycontact_id AS id, 
--	dbo.PERSON.name_last + ', ' + dbo.PERSON.name_first as name, -- + ' ' + dbo.PERSON.name_middle AS Name, 
--	dbo.a_MYCONTACTS.mycontact_url AS URL, 
--        'Person' AS Type
--FROM         dbo.a_MYCONTACTS INNER JOIN
--                      dbo.PERSON ON dbo.a_MYCONTACTS.mycontact_entity_id = dbo.PERSON.person_id
--WHERE     (dbo.a_MYCONTACTS.mycontact_type = 1)
--/*
--UNION ALL
--
--SELECT     dbo.ORGANIZATION.organization_name AS Name, dbo.a_MYCONTACTS.mycontact_url AS URL, 
--                      'Organization' AS Type
--FROM         dbo.a_MYCONTACTS INNER JOIN
--                      dbo.ORGANIZATION ON dbo.a_MYCONTACTS.mycontact_entity_id = dbo.ORGANIZATION.organization_id
--WHERE     (dbo.a_MYCONTACTS.mycontact_type = 2)
--*/
--GO
/****** Object:  Table [dbo].[WF_TASK_ASSIGNMENT_REFERENCE]    Script Date: 10/09/2007 11:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WF_TASK_ASSIGNMENT_REFERENCE](
	[wfta_reference_id] [int] NOT NULL,
	[wfta_id] [int] NOT NULL,
	[from_date] [datetime] NULL,
	[to_date] [datetime] NULL,
	[capacity] [varchar](50) NULL,
	[applicant_position] [varchar](50) NULL,
	[research] [tinyint] NULL,
	[knowledge] [tinyint] NULL,
	[communication] [tinyint] NULL,
	[independence] [tinyint] NULL,
	[motivation] [tinyint] NULL,
	[plan_ability] [tinyint] NULL,
	[team_player] [tinyint] NULL,
	[imagination] [tinyint] NULL,
	[accuracy] [tinyint] NULL,
	[lab_skill] [tinyint] NULL,
	[clinical_proficiency] [tinyint] NULL,
	[overall_ability] [tinyint] NULL,
	[aha_membership_id] [varchar](50) NULL,
 CONSTRAINT [PK_WF_TASK_ASSIGNMENT_REFERENCE] PRIMARY KEY CLUSTERED 
(
	[wfta_reference_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_PERSON_ORG_AFFILIATION_TYPE]    Script Date: 10/09/2007 11:41:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_PERSON_ORG_AFFILIATION_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_PERSON_ORG_AFFILIATION_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_SCIENCE_CLASSIFICATION]    Script Date: 10/09/2007 11:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_SCIENCE_CLASSIFICATION](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_SCIENCE_CLASSIFICATION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_TIME_PERIOD]    Script Date: 10/09/2007 11:42:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_TIME_PERIOD](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_TIME_PERIOD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Award Cycle/Time Period' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'c_TIME_PERIOD', @level2type=N'COLUMN',@level2name=N'id'
GO
/****** Object:  Table [dbo].[BUDGET_ITEM_EXPENSE]    Script Date: 10/09/2007 11:39:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BUDGET_ITEM_EXPENSE](
	[budget_item_expense_id] [int] NOT NULL,
	[budget_item_id] [int] NOT NULL,
	[grantee_project_id] [int] NULL,
	[task_id] [int] NOT NULL,
	[expense] [float] NULL,
 CONSTRAINT [PK_BUDGET_ITEM_EXPENSE] PRIMARY KEY CLUSTERED 
(
	[budget_item_expense_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REVIEW_CYCLE_NOTIFICATION]    Script Date: 10/09/2007 11:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REVIEW_CYCLE_NOTIFICATION](
	[review_cycle_notification_id] [int] NOT NULL,
	[review_cycle_id] [int] NOT NULL,
	[review_cycle_stage_id] [int] NOT NULL,
	[review_committee_id] [int] NOT NULL,
 CONSTRAINT [PK_REVIEW_CYCLE_NOTIFICATION] PRIMARY KEY CLUSTERED 
(
	[review_cycle_notification_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[c_ACCESS_TYPE]    Script Date: 10/09/2007 11:39:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_ACCESS_TYPE](
	[id] [int] NOT NULL,
	[access_type_desc] [varchar](50) NOT NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_ACCESS_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_GRANTEE_PUBLICATION_STATUS]    Script Date: 10/09/2007 11:40:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_GRANTEE_PUBLICATION_STATUS](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_GRANTEE_PUBLICATION_STATUS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_WF_PROJECT_TASK]    Script Date: 10/09/2007 11:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_WF_PROJECT_TASK](
	[id] [int] NOT NULL,
	[wf_project_id] [int] NOT NULL,
	[wf_task_id] [int] NOT NULL,
	[start_date] [datetime] NULL,
	[open_date] [datetime] NULL,
	[due_date] [datetime] NULL,
	[close_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[sort_order] [int] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
	[description] [varchar](100) NULL,
	[default_page_key] [varchar](50) NULL,
	[default_outcome_id] [int] NULL,
	[submitted_outcome_id] [int] NULL,
	[generation_id] [tinyint] NOT NULL CONSTRAINT [DF_a_WF_PROJECT_TASK_generation_id_1]  DEFAULT ((1)),
 CONSTRAINT [PK_a_WF_PROJECT_TASK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_PAGE_CONTENT]    Script Date: 10/09/2007 11:37:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_PAGE_CONTENT](
	[id] [int] NOT NULL,
	[project_id] [int] NULL,
	[wf_task_id] [int] NULL,
	[task_status_id] [int] NULL,
	[page_key] [varchar](50) NULL,
	[content] [text] NULL,
 CONSTRAINT [PK_PAGE_CONTENT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[s_REPORT]    Script Date: 10/09/2007 11:49:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[s_REPORT](
	[report_id] [int] NOT NULL,
	[report_output_definition_id] [int] NULL,
	[report_name] [varchar](255) NULL,
	[page_key] [varchar](100) NULL,
	[mime_type] [varchar](50) NULL,
	[active] [int] NULL,
	[data_object_xml] [text] NULL,
 CONSTRAINT [PK_s_REPORT] PRIMARY KEY CLUSTERED 
(
	[report_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BUDGET]    Script Date: 10/09/2007 11:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BUDGET](
	[budget_id] [int] NOT NULL,
	[budget_type_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[total] [money] NULL,
	[description] [varchar](200) NULL,
	[initial_budget_total] [money] NULL,
	[initial_budget_description] [varchar](50) NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_BUDGET] PRIMARY KEY CLUSTERED 
(
	[budget_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CONTACT_CATEGORY_MEMBER]    Script Date: 10/09/2007 11:42:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTACT_CATEGORY_MEMBER](
	[contact_category_member_id] [int] NOT NULL,
	[contact_category_id] [int] NOT NULL,
	[entity_id] [int] NOT NULL,
	[entity_type_id] [int] NOT NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_CONTACT_CATEGORY_MEMBER] PRIMARY KEY CLUSTERED 
(
	[contact_category_member_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REVIEW_CYCLE_NOTIFICATION_LOG]    Script Date: 10/09/2007 11:48:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REVIEW_CYCLE_NOTIFICATION_LOG](
	[review_cycle_notification_log_id] [int] NOT NULL,
	[review_cycle_id] [int] NOT NULL,
	[review_cycle_stage_id] [int] NOT NULL,
	[send_date] [datetime] NULL,
	[sender_id] [int] NULL,
	[template_id] [int] NULL,
 CONSTRAINT [PK_REVIEW_CYCLE_NOTIFICATION_LOG] PRIMARY KEY CLUSTERED 
(
	[review_cycle_notification_log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REVIEW_CYCLE_COMMITTEE]    Script Date: 10/09/2007 11:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REVIEW_CYCLE_COMMITTEE](
	[review_cycle_committee_id] [int] NOT NULL,
	[review_cycle_id] [int] NOT NULL,
	[review_committee_id] [int] NOT NULL,
 CONSTRAINT [PK_REVIEW_CYCLE_COMMITTEE] PRIMARY KEY CLUSTERED 
(
	[review_cycle_committee_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[c_GRANTEE_PUBLICATION_TYPE]    Script Date: 10/09/2007 11:40:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_GRANTEE_PUBLICATION_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_GRANTEE_PUBLICATION_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_DESCRIPTION_EG2]    Script Date: 10/09/2007 11:44:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_DESCRIPTION_EG2](
	[grantee_project_description_eg2_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[task_id] [int] NULL,
	[person_id] [int] NULL,
	[desc_1] [text] NULL,
	[desc_2] [text] NULL,
	[desc_3] [text] NULL,
	[desc_4] [text] NULL,
	[desc_5] [text] NULL,
	[desc_6] [text] NULL,
	[desc_7] [text] NULL,
	[desc_8] [text] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_DESCRIPTION_EG2] PRIMARY KEY CLUSTERED 
(
	[grantee_project_description_eg2_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMAIL_LOG]    Script Date: 10/09/2007 11:43:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMAIL_LOG](
	[id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[template_id] [int] NULL,
	[correspondence_to] [varchar](100) NULL,
	[correspondence_cc] [varchar](100) NULL,
	[correspondence_bcc] [varchar](100) NULL,
	[correspondence_from] [varchar](100) NULL,
	[subject] [varchar](100) NULL,
	[body] [text] NULL,
	[is_html] [bit] NULL,
	[create_date] [datetime] NOT NULL,
	[recipient_person_id] [int] NULL,
	[resent_date] [datetime] NULL,
 CONSTRAINT [PK_EMAIL_LOG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DATA_COMMAND_REQUEST]    Script Date: 10/09/2007 11:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DATA_COMMAND_REQUEST](
	[data_command_request_id] [int] NOT NULL,
	[data_command_key] [varchar](255) NULL,
	[data_command_xml] [varchar](1000) NULL,
	[status] [int] NULL,
	[result] [varchar](255) NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
	[review_cycle_id] [int] NULL,
	[review_cycle_stage_id] [int] NULL,
	[process_id] [int] NULL,
 CONSTRAINT [PK_DATA_COMMAND_REQUEST] PRIMARY KEY CLUSTERED 
(
	[data_command_request_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REVIEW_CYCLE_PROJECT_TASK]    Script Date: 10/09/2007 11:48:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REVIEW_CYCLE_PROJECT_TASK](
	[review_cycle_project_task_id] [int] NOT NULL,
	[review_cycle_id] [int] NOT NULL,
	[project_task_id] [int] NOT NULL,
 CONSTRAINT [PK_REVIEW_CYCLE_PROJECT_TASK] PRIMARY KEY CLUSTERED 
(
	[review_cycle_project_task_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  UserDefinedFunction [dbo].[fnFormatPhoneNumber]    Script Date: 10/10/2007 14:50:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnFormatPhoneNumber]
(
	@PhoneNumber VARCHAR(20)
)
RETURNS VARCHAR(20)
AS
BEGIN

DECLARE @Number AS VARCHAR(20)
SET @Number = @PhoneNumber
IF LEN(@Number) = 10
	BEGIN
		SET @Number = SUBSTRING(@Number, 1, 3) + '-' + SUBSTRING(@Number, 4, 3) + '-' + SUBSTRING(@Number, 7, 4)
	END

RETURN @Number

END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetResearchAreasMatches]    Script Date: 10/10/2007 14:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetResearchAreasMatches]
(
	@AppPersonID INT,
	@RevPersonID INT
)
RETURNS INT
AS
BEGIN
	DECLARE @Matches int
	
	SELECT	@Matches = COUNT(*) 
	FROM	PERSON_SIX_FIELD 
	WHERE	person_id = @AppPersonID
		AND six_field_id IN (
			SELECT	six_field_id 
			FROM	PERSON_SIX_FIELD 
			WHERE	person_id = @RevPersonID)

	RETURN @Matches
END


GO
/****** Object:  UserDefinedFunction [dbo].[fnGetResearchFields]    Script Date: 10/10/2007 14:50:14 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetResearchFields]
(
	@PersonID int
)
RETURNS VARCHAR(1000)
AS

BEGIN
	DECLARE @Value VARCHAR(100)
	DECLARE @Values VARCHAR(1000)

	SET @Values = ''
	DECLARE my_cursor CURSOR FOR
		SELECT c_RESEARCH_FIELD.description
		FROM c_RESEARCH_FIELD
		JOIN PERSON_RESEARCH_FIELD ON PERSON_RESEARCH_FIELD.research_field_id = c_RESEARCH_FIELD.id
		WHERE PERSON_RESEARCH_FIELD.person_id = @PersonID
		ORDER BY c_RESEARCH_FIELD.description
	OPEN my_cursor
	FETCH NEXT FROM my_cursor INTO @Value
	
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		SET @Values = @Values + ', ' + @Value
		FETCH NEXT FROM my_cursor INTO @Value
	END

	CLOSE my_cursor
	DEALLOCATE my_cursor

	IF LEN(@Values) > 2
		SET @Values = RIGHT(@Values, LEN(@Values) - 2)

	RETURN @Values

END

GO
/****** Object:  UserDefinedFunction [dbo].[fnGetResearchFieldsMatches]    Script Date: 10/10/2007 14:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetResearchFieldsMatches]
(
	@AppPersonID INT,
	@RevPersonID INT
)
RETURNS INT
AS
BEGIN
	DECLARE @Matches int
	
	SELECT	@Matches = COUNT(*) 
	FROM	PERSON_RESEARCH_FIELD 
	WHERE	person_id = @AppPersonID
		AND research_field_id IN (
			SELECT	research_field_id 
			FROM	PERSON_RESEARCH_FIELD 
			WHERE	person_id = @RevPersonID)
		AND	research_field_id <> 999 --Other

	RETURN @Matches
END


GO
/****** Object:  UserDefinedFunction [dbo].[WFTA_Reopen_Sections]    Script Date: 10/10/2007 14:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[WFTA_Reopen_Sections]
	(@WfTAReopenRequestID int)
	RETURNS varchar(1000)
	AS

	BEGIN
		DECLARE @section varchar(50)
		DECLARE @sections varchar(1000)
		
		SET @sections = ''
		DECLARE curSection CURSOR FOR
			SELECT section_description
				FROM WFTA_REOPEN_SECTION
				WHERE wfta_reopen_request_id = @WfTAReopenRequestID
		OPEN curSection
		FETCH NEXT FROM curSection INTO @section
		
		WHILE (@@FETCH_STATUS = 0)
		BEGIN
			SET @sections = @sections + ', ' + @section
			FETCH NEXT FROM curSection INTO @section
		END
		
		CLOSE curSection
		DEALLOCATE curSection

		IF LEN(@sections) > 2
			SET @sections = RIGHT(@sections, LEN(@sections) - 2)
		
		RETURN @sections
		

	END
GO

/****** Object:  StoredProcedure [dbo].[spCREATE_DATABASE_LOG_TRIGGER]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[spCREATE_DATABASE_LOG_TRIGGER] 

AS

DECLARE @tableName varchar(200),
	    @str nvarchar(4000),
		@strSecond nvarchar(4000),
		@str1 nvarchar(4000),
		@database_log_id varchar(100),
		@triggername varchar(500),
		@PrimaryID varchar(500)

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT * from sys.Tables order by name

	DECLARE systables_cursor CURSOR
		FOR SELECT name as tableName FROM sys.Tables order by name
		
	OPEN systables_cursor
	FETCH NEXT FROM systables_cursor INTO @tableName

	WHILE @@FETCH_STATUS = 0
	BEGIN
	   
		-- Assigning a trigger name to a Variable
		SET @triggername = 't_' + @tableName + '_DBLOG'
		--print @triggername

		-- If trigger already exists with the name then trigger is droped.
		IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(@triggername) and OBJECTPROPERTY(id, N'Istrigger') = 1)
	    BEGIN
			SET @str1 = 'DROP TRIGGER t_' + @tableName + '_DBLOG'
			EXECUTE sp_executesql @str1
		End
		
		IF  ( @tableName = 'a_EXTERNAL_EMAIL') or ( @tableName = 'a_PAGE_CONTENT') or ( @tableName = 'a_SAVED_QUERY') or
			( @tableName = 'dtproperties') or ( @tableName = 'EMAIL_LOG') or ( @tableName = 'GRANTEE_PROJECT_AHA') or
			( @tableName = 'GRANTEE_PROJECT_DESCRIPTION_EG2') or ( @tableName = 'GRANTEE_PROJECT_INFO') or ( @tableName = 'GRANTEE_PROJECT_ORGANIZATION_AFFILIATION') or
			( @tableName = 'GRANTEE_PROJECT_STAFF_COMMENTS') or ( @tableName = 'IMPORTED_FILE') or ( @tableName = 'REPORT_OUTPUT') or
			( @tableName = 'REPORT_OUTPUT_DATA') or  ( @tableName = 's_REPORT') or ( @tableName = 'SUBMITTED_FILE_CONVERTED_DATA') or
			( @tableName = 'SUBMITTED_FILE_DATA')  or ( @tableName = 'WF_TASK_ASSIGNMENT_REVIEW') or (@tableName = 'sysdiagrams')
		BEGIN
			PRINT 'Trigger Cannot be created for ' + @tableName + ' Table as it contains text,ntext or imgae  as column datatype' 
		END
		ELSE IF(@tableName = 'DATABASE_LOG') OR (@tableName = 's_ID_GEN')
		BEGIN
			PRINT 'Trigger NOT created for ' + @tableName + ' Table '
		END
		ELSE
		BEGIN
			SELECT @PrimaryID = c.name FROM sysindexes i 
			join sysobjects o ON i.id = o.id 
			join sysobjects pk ON i.name = pk.name AND pk.parent_obj = i.id AND pk.xtype = 'PK'
			join sysindexkeys ik on i.id = ik.id and i.indid = ik.indid
			join syscolumns c ON ik.id = c.id AND ik.colid = c.colid
		    WHERE o.name = @tableName ORDER BY ik.keyno

			--PRINT @PrimaryID
			-- Creating a new trigger.
			SET @str = '
				CREATE TRIGGER ' + @triggername + 
				' ON ' + @tableName + ' FOR INSERT,UPDATE,DELETE
				AS
				BEGIN
					DECLARE @i int, @d int,@database_log_id int,@PkeyVal int,@PKeyValDel int,@PkeyValUpdate int
					DECLARE @ColumnName varchar(100),@ColumnValue varchar(8000),@ColumnValue1 varchar(8000),@strSQL nvarchar(4000),@value varchar(8000),@Orginalvalues varchar(8000), @DBUsrName varchar(8000),@PKey varchar(500)
					SELECT @i = 0, @d = 0
					SELECT @i = 1 from inserted
					SELECT @d = 1 from deleted
					--SELECT @database_log_id = MAX(database_log_id) + 1 FROM Database_log
					--EXEC @database_log_id = getid_sel @table=''DATABASE_LOG''
					SET @Orginalvalues=''''
					SELECT @DBUsrName = user_name()
					
					IF @i > @d
					BEGIN
						SELECT * Into #NEWTABLEINSERT FROM inserted
						DECLARE inserted_rows CURSOR
							FOR SELECT ' + @PrimaryID + '  from #NEWTABLEINSERT 
						OPEN inserted_rows
							FETCH NEXT FROM inserted_rows INTO @PKey
						WHILE @@FETCH_STATUS = 0 
						BEGIN
							EXEC @database_log_id = getid_sel @table=''DATABASE_LOG''
							INSERT INTO DATABASE_LOG (database_log_id,user_id,change_date,table_name,primary_key,original_values,change_type,db_user_id,from_trigger) values (@database_log_id , 0 ,GETDATE(),''' + @tableName + ''', @PKey ,'''', ''insert'',@DBUsrName,''true'')
							FETCH NEXT FROM inserted_rows INTO @PKey
						END 
						CLOSE inserted_rows
						DEALLOCATE inserted_rows	
						DROP TABLE #NEWTABLEINSERT
					END 
				
					IF (@i < @d) or (@i = @d)
					BEGIN
						SELECT * Into #NEWTABLE FROM deleted
							DECLARE deleted_rows CURSOR
							FOR SELECT ' + @PrimaryID + ' from #NEWTABLE 
						OPEN deleted_rows
							FETCH NEXT FROM deleted_rows INTO @PKey
						WHILE @@FETCH_STATUS = 0 
						BEGIN
							DECLARE tables_Colums CURSOR
								FOR SELECT  c1.COLUMN_NAME FROM INFORMATION_SCHEMA.TABLES  t1 
								INNER JOIN INFORMATION_SCHEMA.COLUMNS c1 ON t1.TABLE_NAME = c1.TABLE_NAME 
								WHERE  t1.TABLE_NAME = ''' + @tableName + '''
							OPEN tables_Colums
								FETCH NEXT FROM tables_Colums INTO @ColumnName
							WHILE @@FETCH_STATUS = 0
							BEGIN
								SET @strSQL= (''select @ColumnValue = '' + @ColumnName + '' FROM #NEWTABLE WHERE ' + @PrimaryID + ' = '' + @PKey )
								EXEC sp_executeSql @strSQL, N''@ColumnValue varchar(8000) out'', @ColumnValue out
								SELECT @ColumnValue1=@ColumnValue
								IF (@columnValue1 is NULL)
									SET @value = @ColumnName + ''=null~^''
								ELSE
									SET @value = @ColumnName + ''='' + @ColumnValue1 + ''~^''
	
								SET @Orginalvalues = @Orginalvalues + @Value 
								FETCH NEXT FROM tables_Colums INTO @ColumnName
							END
							CLOSE tables_Colums
							DEALLOCATE tables_Colums
							EXEC @database_log_id = getid_sel @table=''DATABASE_LOG''
							IF @i < @d 
								INSERT INTO DATABASE_LOG (database_log_id,user_id,change_date,table_name,primary_key,original_values,change_type,db_user_id,from_trigger) values (@database_log_id , 0 ,GETDATE(),''' + @tableName + ''', @PKey ,@Orginalvalues, ''delete'',@DBUsrName,''true'')
							ELSE IF @i = @d
								INSERT INTO DATABASE_LOG (database_log_id,user_id,change_date,table_name,primary_key,original_values,change_type,db_user_id,from_trigger) values (@database_log_id , 0 ,GETDATE(),''' + @tableName + ''', @PKey ,@Orginalvalues, ''update'',@DBUsrName,''true'')
	
							SET @Orginalvalues=''''
							FETCH NEXT FROM deleted_rows INTO @PKey
						END 
						CLOSE deleted_rows
						DEALLOCATE deleted_rows	
						DROP TABLE #NEWTABLE
					END
				END'
			--print @str
			EXECUTE sp_executesql @str
		END
				
	   FETCH NEXT FROM systables_cursor INTO @tableName
	   
	END
	CLOSE systables_cursor
    DEALLOCATE systables_cursor

END
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_STAFF_AFFILIATION]    Script Date: 10/09/2007 11:46:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_STAFF_AFFILIATION](
	[staff_affiliation_id] [int] NOT NULL,
	[grantee_project_id] [int] NULL,
	[person_id] [int] NULL,
	[affiliation_type_id] [int] NULL,
	[is_primary] [bit] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modified_user] [int] NULL,
	[modified_date] [datetime] NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_STAFF_AFFILIATION] PRIMARY KEY CLUSTERED 
(
	[staff_affiliation_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAYMENT]    Script Date: 10/09/2007 11:47:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PAYMENT](
	[payment_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[payment_number] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[task_id] [int] NULL,
	[outcome_id] [int] NULL,
	[request_status_id] [int] NULL,
	[request_entity_id] [int] NULL,
	[request_account_fund_id] [int] NULL,
	[requested_date] [datetime] NULL,
	[requested_amount] [money] NULL,
	[sent_date] [datetime] NULL,
	[payment_entity_id] [int] NULL,
	[payment_account_fund_id] [int] NULL,
	[check_payment_number] [char](10) NULL,
	[payment_amount] [money] NULL,
	[payment_date] [datetime] NULL,
	[notes] [varchar](4000) NULL,
	[payee_name] [varchar](200) NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
	[payment_method_id] [int] NULL,
 CONSTRAINT [PK_PAYMENT] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMAIL]    Script Date: 10/09/2007 11:43:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMAIL](
	[id] [int] NOT NULL,
	[entity_type_id] [int] NOT NULL,
	[entity_id] [int] NOT NULL,
	[type_id] [int] NULL,
	[email_addr] [varchar](100) NULL,
	[is_primary] [bit] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_EMAIL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REVIEW_CYCLE_PROJECT_TASK_OUTCOME]    Script Date: 10/09/2007 11:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REVIEW_CYCLE_PROJECT_TASK_OUTCOME](
	[review_cycle_project_task_outcome_id] [int] NOT NULL,
	[review_cycle_project_task_id] [int] NOT NULL,
	[task_outcome_id] [int] NOT NULL,
	[review_cycle_id] [int] NULL,
	[task_id] [int] NULL,
	[project_id] [int] NULL,
 CONSTRAINT [PK_REVIEW_CYCLE_PROJECT_TASK_OUTCOME] PRIMARY KEY CLUSTERED 
(
	[review_cycle_project_task_outcome_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[c_GRANTEE_PROJ_STAFF_AFFILIATION_TYPE]    Script Date: 10/09/2007 11:40:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_GRANTEE_PROJ_STAFF_AFFILIATION_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_GRANTEE_PROJ_STAFF_AFFILIATION_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAYMENT_HISTORY]    Script Date: 10/09/2007 11:47:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PAYMENT_HISTORY](
	[payment_history_id] [int] NOT NULL,
	[payment_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[payment_number] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[task_id] [int] NULL,
	[outcome_id] [int] NULL,
	[request_status_id] [int] NULL,
	[request_entity_id] [int] NULL,
	[request_account_fund_id] [int] NULL,
	[requested_date] [datetime] NULL,
	[requested_amount] [money] NULL,
	[sent_date] [datetime] NULL,
	[payment_entity_id] [int] NULL,
	[payment_account_fund_id] [int] NULL,
	[check_payment_number] [char](10) NULL,
	[payment_amount] [money] NULL,
	[payment_date] [datetime] NULL,
	[notes] [varchar](4000) NULL,
	[payee_name] [varchar](200) NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_PAYMENT_HISTORY] PRIMARY KEY CLUSTERED 
(
	[payment_history_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EVENT]    Script Date: 10/09/2007 11:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EVENT](
	[event_id] [int] NOT NULL,
	[event_action_id] [int] NULL,
	[event_description] [varchar](1000) NULL,
	[event_param_1] [varchar](50) NULL,
	[event_param_2] [varchar](50) NULL,
	[class_node_xml] [varchar](1000) NULL,
 CONSTRAINT [PK_EVENT] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ADDRESS]    Script Date: 10/09/2007 11:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADDRESS](
	[address_id] [int] NOT NULL,
	[entity_type_id] [int] NOT NULL,
	[entity_id] [int] NOT NULL,
	[address_type_id] [int] NULL,
	[address_1] [varchar](150) NULL,
	[address_2] [varchar](100) NULL,
	[address_3] [varchar](100) NULL,
	[state_province_id] [int] NULL,
	[city] [varchar](50) NULL,
	[country_id] [int] NULL,
	[country_other] [varchar](100) NULL,
	[zip_postal_code] [varchar](30) NULL,
	[title] [varchar](255) NULL,
	[create_date] [datetime] NULL,
	[create_user_id] [int] NULL,
	[change_date] [datetime] NULL,
	[change_user_id] [int] NULL,
	[is_primary] [bit] NULL,
	[effective_start_date] [datetime] NULL,
	[effective_end_date] [datetime] NULL,
	[region] [varchar](50) NULL,
	[institution] [varchar](150) NULL,
	[department] [varchar](100) NULL,
 CONSTRAINT [PK_ADDRESS] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FILE_TYPE]    Script Date: 10/09/2007 11:43:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FILE_TYPE](
	[file_type_id] [int] NOT NULL,
	[page_count] [int] NULL,
	[word_count] [int] NULL,
	[character_count_with_spaces] [int] NULL,
	[character_count_without_spaces] [int] NULL,
	[entity_dataobject_key] [varchar](50) NULL,
	[descript] [varchar](255) NULL,
	[competition_id] [int] NULL,
	[pdf_conversion] [varchar](50) NULL,
	[component_id] [int] NULL,
	[allowed_file_extensions] [varchar](100) NULL,
	[invalid_file_extension_error_message] [varchar](250) NULL,
 CONSTRAINT [PK_FILE_TYPE] PRIMARY KEY CLUSTERED 
(
	[file_type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spUPDATE_IDGEN]    Script Date: 10/09/2007 11:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE procedure [dbo].[spUPDATE_IDGEN]

as

INSERT INTO s_ID_GEN 
	(table_name, is_code_table)
	SELECT o.name, 0 
	FROM sysobjects o
		LEFT JOIN s_ID_GEN ig on o.name = ig.table_name
	WHERE o.type = 'U' 
		AND ig.id is null

DELETE s_ID_GEN
	FROM s_ID_GEN ig 
		LEFT JOIN sysobjects o on ig.table_name = o.name
			AND o.type = 'U'
	WHERE o.id is null

CREATE TABLE #id
(table_name varchar(255),
max_id int default 0)

DECLARE @table_name varchar(100), @column_name varchar(100), @max_id int, @sql varchar(255)
SELECT @max_id = 0

DECLARE table_name CURSOR FOR
	SELECT table_name FROM s_ID_GEN

OPEN table_name
FETCH NEXT FROM table_name INTO @table_name

WHILE (@@FETCH_STATUS=0)
	BEGIN
		SELECT @column_name = syscolumns.name
		FROM syscolumns
		INNER JOIN sysobjects ON syscolumns.id = sysobjects.id
		WHERE sysobjects.name = @table_name
		AND syscolumns.colorder = 1

		SELECT @sql = 'INSERT INTO #id (max_id, table_name) SELECT MAX(' + @column_name + '), ''' + @table_name + ''' FROM ' + @table_name

		EXEC (@sql)

		FETCH NEXT FROM table_name INTO @table_name
	END

CLOSE table_name
DEALLOCATE table_name

UPDATE #id SET max_id = max_id + 1
UPDATE #id SET max_id = 1 WHERE max_id IS NULL

UPDATE s_ID_GEN 
	SET next_id = #id.max_id
	FROM #id
		JOIN s_ID_GEN ig on #id.table_name = ig.table_name

SELECT * FROM s_ID_GEN
GO
/****** Object:  StoredProcedure [dbo].[spISAVAILABLEAPPLICANT]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[spISAVAILABLEAPPLICANT]
(
	@grantee_project_id INT,
	@rev_person_id INT,
	@num_shared_applicants SMALLINT,
	@IsAvailable BIT OUTPUT
)
AS

DECLARE	@cur_rev_person_id int,
		@cur_cnt int

CREATE TABLE #CommonCount
(
	pk_cnt_id INT identity, 
	cnt INT
)

TRUNCATE TABLE #RevsForAppl

INSERT  #RevsForAppl
SELECT	rev_person_id
FROM	#assignments
WHERE	grantee_project_id = @grantee_project_id

DECLARE curRevsForAppl CURSOR FORWARD_ONLY FOR 
	SELECT	rev_person_id
	FROM	#RevsForAppl
OPEN curRevsForAppl
FETCH NEXT FROM curRevsForAppl 
INTO	@cur_rev_person_id

SET	@IsAvailable = 1

WHILE @@fetch_status=0
BEGIN
	TRUNCATE TABLE #CommonCount

	INSERT INTO #CommonCount(cnt)
	SELECT	COUNT(grantee_project_id)
	FROM	#assignments
	WHERE	(rev_person_id = @cur_rev_person_id OR rev_person_id = @rev_person_id)
	GROUP BY grantee_project_id
	HAVING	COUNT(grantee_project_id) > 1
	ORDER BY COUNT(grantee_project_id)

	SELECT	@cur_cnt = COUNT(*)
	FROM	#CommonCount
	
	IF @cur_cnt >= @num_shared_applicants AND @num_shared_applicants >= 0
	BEGIN
		SET	@IsAvailable = 0
		BREAK
	END

	FETCH NEXT FROM curRevsForAppl
	INTO	@cur_rev_person_id
END
CLOSE curRevsForAppl
DEALLOCATE curRevsForAppl

DROP TABLE #CommonCount
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_RESEARCH_AREA]    Script Date: 10/09/2007 11:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_RESEARCH_AREA](
	[grantee_project_research_area_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[research_area_id] [int] NOT NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_RESEARCH_AREA] PRIMARY KEY CLUSTERED 
(
	[grantee_project_research_area_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRANTEE]    Script Date: 10/09/2007 11:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRANTEE](
	[grantee_id] [int] NOT NULL,
	[entity_id] [int] NULL,
	[entity_type_id] [int] NULL,
 CONSTRAINT [PK_GRANTEE] PRIMARY KEY CLUSTERED 
(
	[grantee_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[c_ENTITY_AFFILIATION_TYPE]    Script Date: 10/09/2007 11:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_ENTITY_AFFILIATION_TYPE](
	[id] [int] NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[entity_type_id] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[s_ID_GEN]    Script Date: 10/09/2007 11:49:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[s_ID_GEN](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[table_name] [varchar](100) NULL,
	[next_id] [int] NULL,
	[is_code_table] [bit] NOT NULL,
	[description] [varchar](255) NULL,
 CONSTRAINT [PK_s_ID_GEN] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ENTITY_AFFILIATION]    Script Date: 10/09/2007 11:43:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ENTITY_AFFILIATION](
	[entity_affiliation_id] [int] NOT NULL,
	[entity_type_id] [int] NULL,
	[entity_id] [int] NULL,
	[affiliated_entity_id] [int] NULL,
	[affiliation_type_id] [int] NULL,
	[affiliation_description] [varchar](500) NULL,
 CONSTRAINT [PK_ENTITY_AFFILIATION] PRIMARY KEY CLUSTERED 
(
	[entity_affiliation_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spPROCESSREVIEWASSIGNMENT]    Script Date: 10/09/2007 11:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spPROCESSREVIEWASSIGNMENT]
(
	@grantee_project_id INT,
	@rev_person_id INT,
	@rev_committee_id INT,
	@ReqConID INT,
	@wfta_id INT,
	@app_person_id INT,
	@assignment_ordinal INT OUTPUT,
	@counter INT OUTPUT,
	@PrimaryAssignment INT OUTPUT
)
AS

INSERT INTO #assignments(grantee_project_id, rev_person_id, rev_committee_id, assignment_ordinal, review_preference_type_id, app_wfta_id, app_person_id)
VALUES(@grantee_project_id, @rev_person_id, @rev_committee_id, @assignment_ordinal, @ReqConID, @wfta_id, @app_person_id)

SET @counter = @counter + 1

IF @assignment_ordinal = 1
BEGIN
	SET	@assignment_ordinal = 2
	SET @PrimaryAssignment = 1
END
ELSE
BEGIN
	SET @PrimaryAssignment = 0
END

UPDATE	#reviewers 
SET		number_assigned = number_assigned + 1,
		number_primary = number_primary + @PrimaryAssignment
WHERE	person_id = @rev_person_id
GO
/****** Object:  Table [dbo].[c_ASSURANCES_TYPE]    Script Date: 10/09/2007 11:39:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_ASSURANCES_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_ASSURANCES_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_ADDITIONAL_CONTACT]    Script Date: 10/09/2007 11:43:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_ADDITIONAL_CONTACT](
	[grantee_project_additional_contact_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[contact_role_id] [int] NOT NULL,
	[name_last] [varchar](100) NULL,
	[name_first] [varchar](50) NULL,
	[name_middle] [varchar](50) NULL,
	[prefix_id] [int] NULL,
	[suffix_id] [int] NULL,
	[title] [varchar](50) NULL,
	[institution] [varchar](250) NULL,
	[phone_number] [varchar](20) NULL,
	[email] [varchar](100) NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
	[person_id] [int] NOT NULL
) ON [PRIMARY]
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[GRANTEE_PROJECT_ADDITIONAL_CONTACT] ADD [description] [varchar](50) NULL
ALTER TABLE [dbo].[GRANTEE_PROJECT_ADDITIONAL_CONTACT] ADD  CONSTRAINT [PK_GRANTEE_PROJECT_ADDITIONAL_CONTACT] PRIMARY KEY CLUSTERED 
(
	[grantee_project_additional_contact_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_BUDGET]    Script Date: 10/09/2007 11:44:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_BUDGET](
	[grantee_project_budget_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[task_id] [int] NOT NULL,
	[person_id] [int] NULL,
	[projected_personnel] [float] NULL,
	[projected_material] [float] NULL,
	[projected_equipment] [float] NULL,
	[projected_travel] [float] NULL,
	[projected_other] [float] NULL,
	[projected_total] [float] NULL,
	[actual_personnel] [float] NULL,
	[actual_material] [float] NULL,
	[actual_equipment] [float] NULL,
	[actual_travel] [float] NULL,
	[actual_other] [float] NULL,
	[actual_total] [float] NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_BUDGET_1] PRIMARY KEY CLUSTERED 
(
	[grantee_project_budget_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[c_REVIEW_ASSIGNMENT_TYPE]    Script Date: 10/09/2007 11:42:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_REVIEW_ASSIGNMENT_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_REVIEW_ASSIGNMENT_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_ORGANIZATION_ROLE]    Script Date: 10/09/2007 11:37:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_ORGANIZATION_ROLE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [int] NULL,
 CONSTRAINT [PK_a_ORGANIZATION_ROLE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_ASSURANCES_STATUS]    Script Date: 10/09/2007 11:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_ASSURANCES_STATUS](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_ASSURANCES_STATUS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_DEPARTMENT_CHAIR]    Script Date: 10/09/2007 11:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_DEPARTMENT_CHAIR](
	[grantee_project_department_chair_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[person_id] [int] NULL,
	[name_last] [varchar](100) NULL,
	[name_first] [varchar](50) NULL,
	[name_middle] [varchar](50) NULL,
	[address_1] [varchar](150) NULL,
	[address_2] [varchar](100) NULL,
	[address_3] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state_id] [int] NULL,
	[zip] [varchar](30) NULL,
	[country_id] [int] NULL,
	[phone_number] [varchar](50) NULL,
	[prefix_id] [int] NULL,
	[suffix_id] [int] NULL,
	[email] [varchar](100) NULL,
	[degree] [varchar](50) NULL,
	[title] [varchar](100) NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_DEPARTMENT_CHAIR] PRIMARY KEY CLUSTERED 
(
	[grantee_project_department_chair_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_REVIEW_PREFERENCE_TYPE]    Script Date: 10/09/2007 11:42:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_REVIEW_PREFERENCE_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_REVIEW_PREFERENCE_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_ASSURANCE]    Script Date: 10/09/2007 11:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_ASSURANCE](
	[grantee_project_assurance_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[type_id] [int] NOT NULL,
	[is_use] [bit] NOT NULL,
	[status_id] [int] NULL,
	[expiration_date] [datetime] NULL,
	[assurance_number] [varchar](50) NULL,
	[exemption_number] [varchar](50) NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_ASSURANCE] PRIMARY KEY CLUSTERED 
(
	[grantee_project_assurance_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EVENT_CORRESPONDENCE]    Script Date: 10/09/2007 11:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EVENT_CORRESPONDENCE](
	[event_correspondence_id] [int] NOT NULL,
	[event_id] [int] NULL,
	[template_id] [int] NOT NULL,
	[create_date] [datetime] NULL,
	[create_user_id] [int] NULL,
	[change_date] [datetime] NULL,
	[change_user_id] [int] NULL,
 CONSTRAINT [PK_EVENT_CORRESPONDENCE] PRIMARY KEY CLUSTERED 
(
	[event_correspondence_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_HISTORY]    Script Date: 10/09/2007 11:44:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_HISTORY](
	[grantee_project_history_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[grantee_id] [int] NOT NULL,
	[wf_project_id] [int] NOT NULL,
	[wf_project_outcome_id] [int] NULL,
	[primary_person_id] [int] NULL,
	[primary_organization_id] [int] NULL,
	[other_organization] [varchar](100) NULL,
	[primary_address_id] [int] NULL,
	[grant_title] [varchar](255) NULL,
	[short_title] [varchar](100) NULL,
	[create_date] [datetime] NULL,
	[create_user] [int] NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_HISTORY] PRIMARY KEY CLUSTERED 
(
	[grantee_project_history_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_REVIEW_CONFLICT_TYPE]    Script Date: 10/09/2007 11:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_REVIEW_CONFLICT_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_REVIEW_CONFLICT_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_ORGANIZATION_AFFILIATION]    Script Date: 10/09/2007 11:45:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_ORGANIZATION_AFFILIATION](
	[grantee_project_organization_affiliation_id] [int] NOT NULL,
	[grantee_project_id] [int] NULL,
	[organization_id] [int] NULL,
	[organization_role_id] [int] NULL,
	[affiliation_description] [text] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_ORGANIZATION_AFFILIATION] PRIMARY KEY CLUSTERED 
(
	[grantee_project_organization_affiliation_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_TIMELINE]    Script Date: 10/09/2007 11:46:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_TIMELINE](
	[project_timeline_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[milestone] [varchar](100) NULL,
	[description] [varchar](500) NULL,
	[target_date] [datetime] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WF_TASK_ASSIGNMENT_EXT]    Script Date: 10/09/2007 11:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WF_TASK_ASSIGNMENT_EXT](
	[wf_task_assignment_ext_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[legacy_id] [int] NULL,
	[payment_id] [int] NULL,
	[report_wf_task_assignment_id] [int] NULL,
	[expend_all] [bit] NULL,
	[expend_all_date] [datetime] NULL,
	[financial_documentation_options_id] [int] NULL,
	[forecasted_payment_date] [datetime] NULL,
	[grant_amendment_id] [int] NULL,
	[payment_recommendation_id] [int] NULL,
	[grant_recommendation_id] [int] NULL,
	[grant_progress_id] [int] NULL,
	[final_report_recommendation_id] [int] NULL,
	[selected_outcome_id] [int] NULL,
	[review_supplemental_request] [bit] NULL,
	[modify_amendment_wfta_id] [int] NULL,
 CONSTRAINT [PK_WF_TASK_ASSIGNMENT_CR] PRIMARY KEY CLUSTERED 
(
	[wf_task_assignment_ext_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique identifier for this table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_TASK_ASSIGNMENT_EXT', @level2type=N'COLUMN',@level2name=N'wf_task_assignment_ext_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID of parent WF_TASK_ASSIGNMENT record' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_TASK_ASSIGNMENT_EXT', @level2type=N'COLUMN',@level2name=N'wf_task_assignment_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Not used' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_TASK_ASSIGNMENT_EXT', @level2type=N'COLUMN',@level2name=N'legacy_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'For task assignments on which payments are contingent, the ID of the contingent payment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_TASK_ASSIGNMENT_EXT', @level2type=N'COLUMN',@level2name=N'payment_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'For task assignments related to a specific report within a grant, the task assignment ID of that report' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_TASK_ASSIGNMENT_EXT', @level2type=N'COLUMN',@level2name=N'report_wf_task_assignment_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates whether all grant funds are expected to be expended by the end of the grant term' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_TASK_ASSIGNMENT_EXT', @level2type=N'COLUMN',@level2name=N'expend_all'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Anticipated spending completion date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_TASK_ASSIGNMENT_EXT', @level2type=N'COLUMN',@level2name=N'expend_all_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates how financial documentation will be provided to the foundation (see c_FINANCIAL_DOCUMENTATION_OPTIONS)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_TASK_ASSIGNMENT_EXT', @level2type=N'COLUMN',@level2name=N'financial_documentation_options_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'In an Assess Payment Probability task assignment, the forecasted payment date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_TASK_ASSIGNMENT_EXT', @level2type=N'COLUMN',@level2name=N'forecasted_payment_date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'For task assignments related to a grant amendment, the ID of the grant amendment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_TASK_ASSIGNMENT_EXT', @level2type=N'COLUMN',@level2name=N'grant_amendment_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Payment recommendation indicator from Review Report (see c_PAYMENT_RECOMMENDATION)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_TASK_ASSIGNMENT_EXT', @level2type=N'COLUMN',@level2name=N'payment_recommendation_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Grant recommendation indicator from Review Report (see c_GRANT_RECOMMENDATION)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_TASK_ASSIGNMENT_EXT', @level2type=N'COLUMN',@level2name=N'grant_recommendation_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Grant progress indicator from Review Report (see c_GRANT_PROGRESS)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_TASK_ASSIGNMENT_EXT', @level2type=N'COLUMN',@level2name=N'grant_progress_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Recommendation indicator from Review Final Report (see c_FINAL_REPORT_RECOMMENDATION)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_TASK_ASSIGNMENT_EXT', @level2type=N'COLUMN',@level2name=N'final_report_recommendation_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID of task assignment outcome selected by user (see a_SELECTED_OUTCOME)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_TASK_ASSIGNMENT_EXT', @level2type=N'COLUMN',@level2name=N'selected_outcome_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates whether user has reviewed supplemental request information during Submit Amendment Proposal Summary' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_TASK_ASSIGNMENT_EXT', @level2type=N'COLUMN',@level2name=N'review_supplemental_request'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Records the Current WfTaskAssignmentID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_TASK_ASSIGNMENT_EXT', @level2type=N'COLUMN',@level2name=N'modify_amendment_wfta_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Stores CR-specific data for workflow task assignment records.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WF_TASK_ASSIGNMENT_EXT'
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_OTHER_SUPPORT]    Script Date: 10/09/2007 11:45:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_OTHER_SUPPORT](
	[id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[project_title] [varchar](150) NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[project_number] [varchar](50) NULL,
	[source] [varchar](100) NULL,
	[investigator] [varchar](100) NULL,
	[applicant_role] [varchar](50) NULL,
	[status_id] [int] NULL,
	[annual_amount] [float] NULL,
	[direct_cost] [float] NULL,
	[total] [float] NULL,
	[amount_available] [float] NULL,
	[is_overlapping] [bit] NULL,
	[relation_description] [varchar](5000) NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_OTHER_SUPPORT_EMF] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[GRANTEE_PROJECT_OUTCOMES]    Script Date: 10/09/2007 11:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_OUTCOMES](
	[grantee_project_outcomes_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[wf_task_id] [int] NOT NULL,
	[outcome_id] [int] NULL,
	[complete] [bit] NOT NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_OUTCOMES] PRIMARY KEY CLUSTERED 
(
	[grantee_project_outcomes_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REVIEW_CYCLE_STAGE]    Script Date: 10/09/2007 11:48:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REVIEW_CYCLE_STAGE](
	[review_cycle_stage_id] [int] NOT NULL,
	[review_cycle_id] [int] NOT NULL,
	[task_id] [int] NOT NULL,
	[list_order] [smallint] NULL,
	[num_reviewers_per_applicant] [int] NULL,
	[check_conflict] [bit] NULL,
	[cutoff_high] [float] NULL,
	[cutoff_low] [float] NULL,
	[generate_task] [bit] NULL,
	[score_cutoff_high] [float] NULL,
	[score_cutoff_low] [float] NULL,
	[name] [varchar](200) NULL,
	[generation_type_id] [tinyint] NOT NULL CONSTRAINT [DF_REVIEW_CYCLE_STAGE_generation_type]  DEFAULT (1),
	[num_shared_applicants] [smallint] NOT NULL CONSTRAINT [DF_REVIEW_CYCLE_STAGE_num_shared_applicants]  DEFAULT ((-1)),
 CONSTRAINT [PK_REVIEW_CYCLE_STAGE] PRIMARY KEY CLUSTERED 
(
	[review_cycle_stage_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-Random
							-- 2-Avoid reviewers from the previos stage
1-Random; 2-Avoid reviewers from the previos stage; 3-Use reviewers from the previos stage' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'REVIEW_CYCLE_STAGE', @level2type=N'COLUMN',@level2name=N'generation_type_id'
GO
/****** Object:  Table [dbo].[c_PAYMENT_RECOMMENDATION]    Script Date: 10/09/2007 11:41:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_PAYMENT_RECOMMENDATION](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_PAYMENT_RECOMMENDATION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EXTRANET_GROUP]    Script Date: 10/09/2007 11:43:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXTRANET_GROUP](
	[extranet_group_id] [int] NOT NULL,
	[easygrants_user_id] [int] NULL,
	[security_group_id] [int] NULL,
	[person_id] [int] NOT NULL,
	[create_date] [datetime] NULL,
	[create_user] [int] NULL,
	[modify_date] [datetime] NULL,
	[modify_user] [int] NULL,
 CONSTRAINT [PK_EXTRANET_GROUP] PRIMARY KEY CLUSTERED 
(
	[extranet_group_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[c_FIELD_TYPE]    Script Date: 10/09/2007 11:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_FIELD_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sequence_number] [int] NULL,
	[website_id] [int] NULL,
 CONSTRAINT [PK_c_FIELD_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_GRANT_RECOMMENDATION]    Script Date: 10/09/2007 11:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_GRANT_RECOMMENDATION](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_GRANT_RECOMMENDATION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_SEMINAR]    Script Date: 10/09/2007 11:46:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_SEMINAR](
	[grantee_project_seminar_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[task_id] [int] NULL,
	[course_name] [varchar](80) NULL,
	[course_date] [datetime] NULL,
	[descript] [varchar](500) NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_SEMINAR] PRIMARY KEY CLUSTERED 
(
	[grantee_project_seminar_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_REVIEWER_ROLE]    Script Date: 10/09/2007 11:42:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_REVIEWER_ROLE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_REVIEWER_ROLE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_GRANT_PROGRESS]    Script Date: 10/09/2007 11:40:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_GRANT_PROGRESS](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_GRANT_PROGRESS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_PUBLICATIONS]    Script Date: 10/09/2007 11:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_PUBLICATIONS](
	[id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[authors] [varchar](1000) NULL,
	[article_title] [varchar](1000) NULL,
	[journal_book_title] [varchar](1000) NULL,
	[publication_year] [varchar](4) NULL,
	[volume_number] [varchar](50) NULL,
	[start_page] [int] NULL,
	[end_page] [int] NULL,
	[url] [varchar](1000) NULL,
	[create_date] [datetime] NULL,
	[change_date] [datetime] NULL,
	[create_user_id] [int] NULL,
	[change_user_id] [int] NULL,
	[Publication_type_id] [int] NULL,
	[Publication_status_id] [int] NULL,
	[description] [varchar](500) NULL,
	[publication_upload_id] [int] NULL,
 CONSTRAINT [PK_PUBLICATION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_SYSTEM_MAINTENANCE_NOTIFICATIONS]    Script Date: 10/09/2007 11:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_SYSTEM_MAINTENANCE_NOTIFICATIONS](
	[id] [int] NOT NULL,
	[display_notification] [bit] NOT NULL CONSTRAINT [DF_a_SYSTEM_MAINTENANCE_NOTIFICATIONS_display_notification]  DEFAULT (0),
	[display_text] [varchar](3000) NULL,
	[allow_login] [bit] NOT NULL CONSTRAINT [DF_a_SYSTEM_MAINTENANCE_NOTIFICATIONS_allow_login]  DEFAULT (1),
	[display_message_start_time] [datetime] NULL,
	[display_message_end_time] [datetime] NULL,
	[disable_login_start_time] [datetime] NULL,
 CONSTRAINT [PK_a_SYSTEM_MAINTENANCE_NOTIFICATIONS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERSON_FIELD]    Script Date: 10/09/2007 11:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSON_FIELD](
	[person_field_id] [int] NOT NULL,
	[person_id] [int] NULL,
	[grantee_project_id] [int] NULL,
	[field_id] [int] NOT NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_PERSON_FIELD] PRIMARY KEY CLUSTERED 
(
	[person_field_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[c_PROCESS]    Script Date: 10/09/2007 11:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_PROCESS](
	[id] [int] NOT NULL,
	[data_command_key] [varchar](50) NULL,
	[name] [varchar](50) NULL,
	[sort_order] [datetime] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_PROCESS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_INFO]    Script Date: 10/09/2007 11:45:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_INFO](
	[grantee_project_info_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[additional_staff] [varchar](300) NULL,
	[award_amount] [money] NULL,
	[duration_start] [datetime] NULL,
	[duration_end] [datetime] NULL,
	[dollar_request] [money] NULL,
	[age_begin] [int] NULL,
	[age_end] [int] NULL,
	[not_applicable_age] [bit] NULL,
	[not_applicable_gender] [bit] NULL,
	[not_applicable_race] [bit] NULL,
	[not_applicable_income] [bit] NULL,
	[not_applicable_locale] [bit] NULL,
	[demographic_female] [bit] NULL,
	[demographic_male] [bit] NULL,
	[demographic_america_indian] [bit] NULL,
	[demographic_asian] [bit] NULL,
	[demographic_black] [bit] NULL,
	[demographic_latin] [bit] NULL,
	[demographic_middle_eastern] [bit] NULL,
	[demographic_white] [bit] NULL,
	[demographic_other] [bit] NULL,
	[demographic_low_income] [bit] NULL,
	[demographic_working_poor] [bit] NULL,
	[demographic_middle_income] [bit] NULL,
	[demographic_upper_income] [bit] NULL,
	[demographic_rural] [bit] NULL,
	[demographic_suburban] [bit] NULL,
	[demographic_urban] [bit] NULL,
	[demographic_bisexual] [bit] NULL,
	[demographic_heterosexual] [bit] NULL,
	[demographic_questioning] [bit] NULL,
	[demographic_gay] [bit] NULL,
	[demographic_transgender] [bit] NULL,
	[demographic_disability] [bit] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[title] [varchar](150) NULL,
	[description] [text] NULL,
	[status_reason] [varchar](500) NULL,
	[human_sub_auth_received_id] [tinyint] NULL,
	[animal_sub_auth_received_id] [tinyint] NULL,
	[contract_sent_id] [tinyint] NULL,
	[contract_received_id] [tinyint] NULL,
	[resubmission_answer_id] [int] NULL,
	[percentage_time_devoted] [int] NULL,
	[previous_application_id] [int] NULL,
	[research_classification_id] [int] NULL,
	[has_population_interest] [bit] NULL,
	[has_therapy_interest] [bit] NULL,
	[abstract_number] [varchar](50) NULL,
	[science_id] [int] NULL,
	[science_category_id] [int] NULL,
	[science_class_id] [int] NULL,
	[science_class2_id] [int] NULL,
	[is_recombinant] [bit] NULL,
	[is_biohazards] [bit] NULL,
	[is_human_subjects] [bit] NULL,
	[is_adult_stem_cells] [bit] NULL,
	[is_fetal_stem_cells] [bit] NULL,
	[is_fetal_tissue] [bit] NULL,
	[is_cloning] [bit] NULL,
	[is_animal_subjects] [bit] NULL,
	[is_accredited] [bit] NULL,
	[has_current_assurance] [bit] NULL,
	[accredited_effective_date] [datetime] NULL,
	[id_number] [varchar](50) NULL,
	[has_biomedical_research] [bit] NULL,
	[has_clinical_research] [bit] NULL,
	[has_pop_health_research] [bit] NULL,
	[area_percentage_total] [int] NULL,
	[no_irb_document] [bit] NULL,
	[no_iacuc_document] [bit] NULL,
	[no_agreement_form] [bit] NULL,
	[no_release_document] [bit] NULL,
	[no_animal_subject] [bit] NULL,
	[has_animal_subject] [bit] NULL,
	[no_w9_form] [bit] NULL,
	[no_foreign_form] [bit] NULL,
	[Create_User] [int] NULL,
	[Create_date] [datetime] NULL,
	[Modify_User] [int] NULL,
	[Modify_Date] [datetime] NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_INFO] PRIMARY KEY CLUSTERED 
(
	[grantee_project_info_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOGIN_HISTORY]    Script Date: 10/09/2007 11:46:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOGIN_HISTORY](
	[login_history_id] [int] NOT NULL,
	[easygrants_user_id] [int] NULL,
	[remote_address] [char](15) NULL,
	[http_user_agent] [varchar](1000) NULL,
	[http_accept_language] [varchar](1000) NULL,
	[login_date] [datetime] NULL,
 CONSTRAINT [PK_LOGIN_HISTORY] PRIMARY KEY CLUSTERED 
(
	[login_history_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spCALCULATE_SCORES_AND_RANK]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spCALCULATE_SCORES_AND_RANK]
	@review_cycle_stage_id INT,
	@wf_task_role_id INT = 7,
	@Include int = 0
AS

SET NOCOUNT ON

EXEC calculate_average_scores @review_cycle_stage_id, @wf_task_role_id, @Include
EXEC calculate_rankings @review_cycle_stage_id, @wf_task_role_id, @Include

SET NOCOUNT OFF
GO
/****** Object:  Table [dbo].[a_SELECTED_OUTCOME]    Script Date: 10/09/2007 11:38:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_SELECTED_OUTCOME](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](200) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_a_SELECTED_OUTCOME] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NOTES]    Script Date: 10/09/2007 11:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NOTES](
	[id] [int] NOT NULL,
	[entity_id] [int] NOT NULL,
	[entity_type_id] [int] NOT NULL,
	[subject] [varchar](250) NULL,
	[notes] [varchar](5000) NULL,
	[subject_id] [int] NULL,
	[create_date] [datetime] NULL,
	[create_user] [int] NULL,
	[modify_date] [datetime] NULL,
	[modify_user] [int] NULL,
 CONSTRAINT [PK_NOTES] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_ASSIGNMENT_PROCESS]    Script Date: 10/09/2007 11:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_ASSIGNMENT_PROCESS](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NOT NULL,
	[description] [varchar](1000) NOT NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
	[sp_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_c_ASSIGNMENT_PROCESS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SUBMITTED_FILE]    Script Date: 10/09/2007 11:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SUBMITTED_FILE](
	[submitted_file_id] [int] NOT NULL,
	[entity_id] [int] NULL,
	[file_type_id] [int] NULL,
	[source_filename] [varchar](255) NULL,
	[source_MIME_type] [varchar](50) NULL,
	[source_file_path] [varchar](255) NULL,
	[stored_file_path] [varchar](255) NULL,
	[submit_date] [datetime] NULL,
	[competition_id] [int] NULL,
	[color_doc] [smallint] NULL,
	[ftp_sent] [bit] NULL,
	[converted_file_path] [varchar](255) NULL,
	[converted_file_date] [datetime] NULL,
	[conversion_status] [int] NULL,
	[conversion_result] [varchar](255) NULL,
	[description] [varchar](100) NULL,
	[uploaded_by_id] [int] NULL,
	[upload_title] [varchar](100) NULL,
	[is_additional] [bit] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_SUBMITTED_FILE] PRIMARY KEY CLUSTERED 
(
	[submitted_file_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ORGANIZATION]    Script Date: 10/09/2007 11:46:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ORGANIZATION](
	[organization_id] [int] NOT NULL,
	[type_id] [int] NULL,
	[organization_name] [varchar](250) NULL,
	[create_date] [datetime] NULL,
	[change_date] [datetime] NULL,
	[create_user_id] [int] NULL,
	[change_user_id] [int] NULL,
	[ein] [varchar](15) NULL,
	[not_in_list] [bit] NULL,
	[is_eligible] [bit] NULL,
	[is_translational_partner] [bit] NULL,
	[is_translational_partner_applicant] [bit] NULL,
	[legacy_organization_id] [int] NULL,
	[common_organization_name] [varchar](250) NULL,
	[acronym] [varchar](50) NULL,
	[annual_operating_budget] [money] NULL,
	[fiscal_year_begin_date] [datetime] NULL,
	[fiscal_year_end_date] [datetime] NULL,
 CONSTRAINT [PK_ORGANIZATION] PRIMARY KEY CLUSTERED 
(
	[organization_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_PERSON_AFFILIATION]    Script Date: 10/09/2007 11:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_PERSON_AFFILIATION](
	[grantee_project_affiliation_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[person_id] [int] NOT NULL,
	[organization_id] [int] NULL,
	[grantee_member_role] [varchar](50) NOT NULL,
	[department] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](20) NULL,
	[project_title] [varchar](50) NULL,
	[award_year] [int] NULL,
	[active] [bit] NULL,
	[description] [varchar](750) NULL,
	[is_primary] [bit] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_PERSON_AFFILIATION] PRIMARY KEY CLUSTERED 
(
	[grantee_project_affiliation_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WFTA_REOPEN_REQUEST]    Script Date: 10/09/2007 11:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WFTA_REOPEN_REQUEST](
	[wfta_reopen_request_id] [int] NOT NULL,
	[requesting_wf_task_assignment_id] [int] NULL,
	[reopen_wf_task_assignment_id] [int] NULL,
	[active] [bit] NULL,
	[reopened_task_person_id] [int] NULL,
	[resubmitted_date] [datetime] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_WFTA_RESUBMIT_REQUEST] PRIMARY KEY CLUSTERED 
(
	[wfta_reopen_request_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_PI]    Script Date: 10/09/2007 11:45:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_PI](
	[grantee_project_pi_id] [int] NOT NULL,
	[organization_type_id] [int] NULL,
	[grantee_project_id] [int] NOT NULL,
	[person_id] [int] NULL,
	[name_last] [varchar](100) NULL,
	[name_first] [varchar](50) NULL,
	[name_middle] [varchar](50) NULL,
	[informal_name] [varchar](50) NULL,
	[organization_department] [varchar](100) NULL,
	[organization_name] [varchar](150) NULL,
	[address_1] [varchar](150) NULL,
	[address_2] [varchar](100) NULL,
	[address_3] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state_id] [int] NULL,
	[zip] [varchar](10) NULL,
	[country_id] [int] NULL,
	[phone_number] [varchar](20) NULL,
	[phone_ext] [varchar](10) NULL,
	[fax_number] [varchar](20) NULL,
	[web_site] [varchar](100) NULL,
	[expertise] [varchar](500) NULL,
	[prefix_id] [int] NULL,
	[suffix_id] [int] NULL,
	[is_primary] [bit] NULL,
	[secondary_department] [varchar](100) NULL,
	[email] [varchar](250) NULL,
	[institutional_component] [varchar](255) NULL,
	[degree] [varchar](50) NULL,
	[title] [varchar](100) NULL,
	[award_title] [varchar](100) NULL,
	[faculty_appointment_start_date] [datetime] NULL,
	[faculty_rank_type_id] [int] NULL,
	[faculty_rank_type_other] [varchar](100) NULL,
	[organization_id] [int] NULL,
	[pi_type_id] [int] NULL,
	[degree_year] [int] NULL,
	[position_years] [int] NULL,
	[award_academic_position_id] [int] NULL,
	[career_stage_id] [int] NULL,
	[current_academic_position_id] [int] NULL,
	[y1_doctoral_degree_id] [int] NULL,
	[y2_doctoral_degree_id] [int] NULL,
	[y1_specialty_degree_id] [int] NULL,
	[y2_specialty_degree_id] [int] NULL,
	[y1_doctoral_degree_date_earned] [datetime] NULL,
	[y2_doctoral_degree_date_earned] [datetime] NULL,
	[course_completion_date] [datetime] NULL,
	[degree_admission_date] [datetime] NULL,
	[immigration_status_id] [int] NULL,
	[research_months] [int] NULL,
	[research_years] [int] NULL,
	[clinical_months] [int] NULL,
	[clinical_years] [int] NULL,
	[immigration_id] [int] NULL,
	[funding_awards_total] [money] NULL,
	[assistant_appointment_date] [datetime] NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_PI] PRIMARY KEY CLUSTERED 
(
	[grantee_project_pi_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_WF_TASK_SELECTED_OUTCOME]    Script Date: 10/09/2007 11:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[a_WF_TASK_SELECTED_OUTCOME](
	[id] [int] NOT NULL,
	[wf_task_id] [int] NULL,
	[selected_outcome_id] [int] NULL,
 CONSTRAINT [PK_a_WF_TASK_SELECTED_OUTCOME] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IMPORTED_FILE]    Script Date: 10/09/2007 11:46:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IMPORTED_FILE](
	[id] [int] NOT NULL,
	[source_file_name] [varchar](255) NULL,
	[source_file_path] [varchar](255) NULL,
	[submit_date] [datetime] NULL,
	[import_type] [int] NULL,
	[import_status] [int] NULL,
	[import_result] [varchar](255) NULL,
	[uploaded_by_id] [int] NULL,
	[file_data] [image] NULL,
 CONSTRAINT [PK_IMPORTTED_FILE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAYMENT_IMPORT]    Script Date: 10/09/2007 11:47:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PAYMENT_IMPORT](
	[payment_import_id] [int] NOT NULL,
	[grant_number] [varchar](50) NULL,
	[payment_number] [varchar](50) NULL,
	[requested_amount] [int] NULL,
	[requested_date] [datetime] NULL,
	[check_payment_number] [char](10) NULL,
	[payment_amount] [int] NULL,
	[payment_date] [datetime] NULL,
 CONSTRAINT [pk_payment_import_id] PRIMARY KEY CLUSTERED 
(
	[payment_import_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERSON_ORGANIZATION_AFFILIATION]    Script Date: 10/09/2007 11:47:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PERSON_ORGANIZATION_AFFILIATION](
	[id] [int] NOT NULL,
	[person_id] [int] NOT NULL,
	[organization_id] [int] NOT NULL,
	[type_id] [int] NULL,
	[title] [varchar](50) NULL,
	[affiliation_description] [varchar](500) NULL,
	[institutional_component] [varchar](255) NULL,
	[is_primary] [bit] NULL,
	[is_primary_organization_contact] [bit] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_PERSON_ORGANIZATION_AFFILIATION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERSON_ELIGIBILITY]    Script Date: 10/09/2007 11:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PERSON_ELIGIBILITY](
	[id] [int] NOT NULL,
	[person_id] [int] NOT NULL,
	[is_tenure] [bit] NOT NULL,
	[is_biomedical] [bit] NOT NULL,
	[primary_department] [varchar](250) NULL,
	[degree_year] [int] NOT NULL,
	[rank_type_id] [int] NOT NULL,
	[eligibility_status_id] [smallint] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_PERSON_ELIGIBILITY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_WF_PROJECT]    Script Date: 10/09/2007 11:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_WF_PROJECT](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](200) NULL,
	[competition_id] [int] NOT NULL,
	[project_type_id] [smallint] NULL,
	[support_email_address] [varchar](50) NULL,
	[tech_email_address] [varchar](50) NULL,
	[content_email_address] [varchar](50) NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[sort_order] [int] NULL,
	[final_pdf_report_key] [varchar](50) NULL,
	[faculty_date] [datetime] NULL,
	[eligibility_date] [int] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
	[time_period_id] [int] NULL,
	[auto_generate_payment] [bit] NULL,
	[no_auto_generate_payment] [bit] NULL,
	[default_payment_setup] [bit] NULL,
	[payment_process_id] [int] NULL,
	[auto_generate_report] [bit] NULL,
	[no_auto_generate_report] [bit] NULL,
	[default_report_setup] [bit] NULL,
	[report_process_id] [int] NULL,
	[award_term] [smallint] NULL,
	[guideline] [varchar](500) NULL,
	[invitation_code] [varchar](50) NULL,
 CONSTRAINT [PK_a_WF_PROJECT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERSON_RELATIONSHIP]    Script Date: 10/09/2007 11:47:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PERSON_RELATIONSHIP](
	[person_relationship_id] [int] NOT NULL,
	[person_id] [int] NOT NULL,
	[related_person_id] [int] NOT NULL,
	[related_person_role_id] [int] NOT NULL,
	[task_id] [int] NULL,
	[grantee_project_id] [int] NULL,
	[related_person_display_name_first] [varchar](50) NULL,
	[related_person_display_name_last] [varchar](50) NULL,
	[related_person_display_phone] [varchar](50) NULL,
	[related_person_display_title] [varchar](50) NULL,
	[related_person_display_degree] [varchar](50) NULL,
	[related_person_display_email] [varchar](100) NULL,
	[related_person_display_phone_ext] [varchar](10) NULL,
	[related_person_display_institution_name] [varchar](200) NULL,
	[related_person_reference_type_id] [int] NULL,
	[related_person_display_name_middle] [varchar](50) NULL,
	[related_person_display_department] [varchar](100) NULL,
	[related_person_display_prefix_id] [int] NULL,
	[related_person_display_suffix_id] [int] NULL,
	[related_person_display_institutional_component] [varchar](255) NULL,
	[related_person_display_institution_id] [int] NULL,
	[address1] [varchar](150) NULL,
	[address2] [varchar](150) NULL,
	[address3] [varchar](150) NULL,
	[city] [varchar](50) NULL,
	[state_id] [int] NULL,
	[zip] [varchar](50) NULL,
	[country_id] [int] NULL,
	[description] [varchar](500) NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_PERSON_ROLE_RELATIONSHIP] PRIMARY KEY CLUSTERED 
(
	[person_relationship_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_CORRESPONDENCE_DEFINITION]    Script Date: 10/09/2007 11:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_CORRESPONDENCE_DEFINITION](
	[correspondence_definition_id] [int] NOT NULL,
	[correspondence_key] [varchar](20) NULL,
	[title] [varchar](100) NOT NULL,
	[correspondence_to] [varchar](300) NULL,
	[correspondence_from] [varchar](300) NOT NULL,
	[correspondence_cc] [varchar](300) NULL,
	[correspondence_bcc] [varchar](300) NULL,
	[subject] [varchar](250) NOT NULL,
	[body] [varchar](5000) NOT NULL,
	[is_html] [bit] NOT NULL CONSTRAINT [DF_a_CORRESPONDENCE_DEFINITION_is_html]  DEFAULT ((0)),
	[user_id] [int] NULL,
	[id] [int] NULL,
	[correspondence_description] [varchar](100) NULL,
	[is_log] [bit] NOT NULL CONSTRAINT [DF_a_CORRESPONDENCE_DEFINITION_is_log]  DEFAULT ((1)),
	[definition_key_id] [int] NULL,
	[correspondence_from_name] [varchar](100) NULL,
 CONSTRAINT [PK_a_CORRESPONDENCE_DEFINITION] PRIMARY KEY CLUSTERED 
(
	[correspondence_definition_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_PAYMENT_PROCESS]    Script Date: 10/09/2007 11:41:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_PAYMENT_PROCESS](
	[id] [int] NOT NULL,
	[abbr] [varchar](100) NULL,
	[description] [varchar](1000) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
	[sp_name] [varchar](100) NULL,
 CONSTRAINT [PK_c_PAYMENT_PROCESS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REVIEW_CYCLE_STAGE_COMMITTEE]    Script Date: 10/09/2007 11:48:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REVIEW_CYCLE_STAGE_COMMITTEE](
	[review_cycle_stage_committee_id] [int] NOT NULL,
	[review_cycle_stage_id] [int] NOT NULL,
	[review_committee_id] [int] NOT NULL,
	[start_date] [datetime] NULL,
	[open_date] [datetime] NULL,
	[due_date] [datetime] NULL,
	[close_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[total_score] [float] NULL,
 CONSTRAINT [PK_REVIEW_CYCLE_STAGE_COMMITTEE] PRIMARY KEY CLUSTERED 
(
	[review_cycle_stage_committee_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[c_PORTFOLIO]    Script Date: 10/09/2007 11:41:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_PORTFOLIO](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NOT NULL,
	[description] [varchar](200) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_PORTFOLIO] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REMINDER]    Script Date: 10/09/2007 11:48:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REMINDER](
	[reminder_id] [int] NOT NULL,
	[reminder_name] [varchar](50) NULL,
	[description] [varchar](200) NULL,
	[correspondence_definition_id] [int] NULL,
	[program_id] [int] NULL,
	[competition_id] [int] NULL,
	[wf_project_id] [int] NULL,
	[wf_task_id] [int] NULL,
	[project_task_id] [int] NULL,
	[days_to_remind] [int] NULL,
	[before_after] [int] NULL,
	[target_date] [int] NULL,
	[is_enabled] [bit] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [REMINDER_PK] PRIMARY KEY NONCLUSTERED 
(
	[reminder_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_REPORT_PROCESS]    Script Date: 10/09/2007 11:41:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_REPORT_PROCESS](
	[id] [int] NOT NULL,
	[abbr] [varchar](100) NULL,
	[description] [varchar](1000) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
	[sp_name] [varchar](100) NULL,
 CONSTRAINT [PK_c_REPORT_PROCESS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REMINDER_JOB]    Script Date: 10/09/2007 11:48:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REMINDER_JOB](
	[id] [int] NOT NULL,
	[title] [varchar](50) NOT NULL,
	[template_id] [int] NOT NULL,
	[competition_requirement_id] [int] NOT NULL,
	[days_to_remind] [int] NOT NULL,
	[is_after] [bit] NOT NULL,
	[status_code] [int] NOT NULL,
 CONSTRAINT [pk_id_job] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_CONSORTIA]    Script Date: 10/09/2007 11:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_CONSORTIA](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_CONSORTIA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_REVIEW_SUB_COMMITTEE]    Script Date: 10/09/2007 11:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_REVIEW_SUB_COMMITTEE](
	[id] [int] NOT NULL,
	[review_committee_id] [int] NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[competition_type_id] [int] NULL,
	[inactive] [bit] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
 CONSTRAINT [PK_a_REVIEW_SUB_COMMITTEE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REPORT_OUTPUT]    Script Date: 10/09/2007 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REPORT_OUTPUT](
	[report_output_id] [int] NOT NULL,
	[entity_id] [int] NULL,
	[definition_id] [int] NULL,
	[gen_request_date] [datetime] NULL,
	[status] [int] NULL,
	[ftp_sent] [bit] NULL,
	[result] [varchar](255) NULL,
	[report_parameters_xml] [text] NULL,
 CONSTRAINT [PK_REPORT_OUTPUT] PRIMARY KEY CLUSTERED 
(
	[report_output_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REPORT_OUTPUT_DATA]    Script Date: 10/09/2007 11:48:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPORT_OUTPUT_DATA](
	[report_output_data_id] [int] NOT NULL,
	[report_output_id] [int] NULL,
	[file_data] [image] NULL,
 CONSTRAINT [PK_REPORT_OUTPUT_DATA] PRIMARY KEY CLUSTERED 
(
	[report_output_data_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ELIGIBILITY]    Script Date: 10/09/2007 11:43:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ELIGIBILITY](
	[eligibility_id] [int] NOT NULL,
	[grantee_project_id] [int] NULL,
	[competition_id] [int] NULL,
	[person_id] [int] NULL,
	[question_key] [varchar](50) NULL,
	[answer_value] [bit] NULL,
	[question_id] [int] NULL,
 CONSTRAINT [PK_ELIGIBILITY] PRIMARY KEY CLUSTERED 
(
	[eligibility_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_HORIZONTAL_NAVIGATION_ELEMENT]    Script Date: 10/09/2007 11:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_HORIZONTAL_NAVIGATION_ELEMENT](
	[horiz_nav_element_id] [int] NOT NULL,
	[horiz_nav_id] [int] NOT NULL,
	[key_name] [varchar](50) NOT NULL,
	[nav_title] [varchar](50) NOT NULL,
	[enable] [bit] NOT NULL,
	[source_file] [varchar](255) NOT NULL,
	[method] [varchar](50) NULL,
 CONSTRAINT [PK_a_HORIZONTAL_NAVIGATION_ELEMENT] PRIMARY KEY CLUSTERED 
(
	[horiz_nav_element_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMAIL_MESSAGE]    Script Date: 10/09/2007 11:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMAIL_MESSAGE](
	[email_message_id] [int] NOT NULL,
	[correspondence_definition_id] [int] NULL,
	[correspondence_to] [varchar](100) NULL,
	[correspondence_cc] [varchar](100) NULL,
	[correspondence_bcc] [varchar](100) NULL,
	[correspondence_from] [varchar](100) NULL,
	[subject] [varchar](100) NULL,
	[body] [varchar](3500) NULL,
	[is_html] [bit] NULL,
	[status] [int] NULL,
	[sent_date] [datetime] NULL,
	[wf_task_assignment_id] [int] NULL,
	[grantee_project_id] [int] NULL,
	[from_person_id] [int] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NOT NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_EMAIL_MESSAGE] PRIMARY KEY CLUSTERED 
(
	[email_message_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vPERSON_NAMES]    Script Date: 10/09/2007 11:50:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vPERSON_NAMES] as 

SELECT  person_id, 
	ltrim(rtrim(name_first)) + ' ' + 
	CASE 
		WHEN name_middle = '' THEN '' 
		WHEN name_middle IS NOT NULL THEN ltrim(rtrim(name_middle)) + ' ' 
		ELSE '' 
	END 
	+ ltrim(rtrim(name_last)) AS FirstMiddleLast, 
	RTRIM(ltrim(rtrim(name_last)) + ', ' + ltrim(rtrim(name_first)) + ' ' +  
	CASE 
		WHEN name_middle = '' THEN '' 
		WHEN name_middle IS NOT NULL THEN ltrim(rtrim(name_middle)) 
		ELSE '' 
	END) AS LastFirstMiddle
FROM    dbo.PERSON
GO
/****** Object:  Table [dbo].[REVIEW_ADDITIONAL_INFORMATION]    Script Date: 10/09/2007 11:48:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REVIEW_ADDITIONAL_INFORMATION](
	[review_additional_information_id] [int] NOT NULL,
	[rev_wf_task_assignment_id] [int] NULL,
	[app_wf_task_assignment_id] [int] NULL,
	[request_comment] [varchar](200) NULL,
	[response_comment] [varchar](200) NULL,
	[request_date] [datetime] NULL,
	[response_date] [datetime] NULL,
	[subject] [varchar](100) NULL,
	[email_from] [varchar](50) NULL,
	[email_cc] [varchar](50) NULL,
	[email_bcc] [varchar](50) NULL,
	[is_send] [bit] NULL,
 CONSTRAINT [PK_REVIEW_ADDITIONAL_INFORMATION] PRIMARY KEY CLUSTERED 
(
	[review_additional_information_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERSON_REVIEWER]    Script Date: 10/09/2007 11:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PERSON_REVIEWER](
	[person_reviewer_id] [int] NOT NULL,
	[person_id] [int] NOT NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[reviewer_status_id] [int] NULL,
	[area_of_expertise] [varchar](250) NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
	[program_id] [int] NULL,
	[science_class_id] [int] NULL,
	[science_class2_id] [int] NULL,
	[science_id] [int] NULL,
	[science_category_id] [int] NULL,
 CONSTRAINT [PK_PERSON_REVIEWER] PRIMARY KEY CLUSTERED 
(
	[person_reviewer_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_COMPETITION_TYPE]    Script Date: 10/09/2007 11:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_COMPETITION_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](200) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_COMPETITION_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_QUERY_OUTPUT]    Script Date: 10/09/2007 11:41:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_QUERY_OUTPUT](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[descr] [varchar](50) NULL,
	[sort_order] [smallint] NULL,
 CONSTRAINT [PK_c_QUERY_OUTPUT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REVIEW_COMMITTEE_MEMBER]    Script Date: 10/09/2007 11:48:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REVIEW_COMMITTEE_MEMBER](
	[review_committee_member_id] [int] NOT NULL,
	[review_committee_id] [int] NULL,
	[person_id] [int] NULL,
	[reviewer_role_id] [int] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[inactive] [bit] NULL,
	[create_user_id] [int] NULL,
	[create_date] [datetime] NULL,
 CONSTRAINT [PK_REVIEW_COMMITTEE_MEMBER] PRIMARY KEY CLUSTERED 
(
	[review_committee_member_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_STAFF_COMMENTS]    Script Date: 10/09/2007 11:46:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_STAFF_COMMENTS](
	[id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[staff_person_id] [int] NOT NULL,
	[comments] [text] NULL,
	[create_date] [datetime] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_STAFF_COMMENTS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[c_TRIP_TYPE]    Script Date: 10/09/2007 11:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_TRIP_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_TRIP_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_TRIP_STATUS]    Script Date: 10/09/2007 11:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_TRIP_STATUS](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_TRIP_STATUS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REVIEW_FEEDBACK_TO_APPLICANT]    Script Date: 10/09/2007 11:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REVIEW_FEEDBACK_TO_APPLICANT](
	[review_feedback_to_applicant_id] [int] NOT NULL,
	[rev_wf_task_assignment_id] [int] NULL,
	[app_wf_task_assignment_id] [int] NULL,
	[comment] [varchar](200) NULL,
 CONSTRAINT [PK_REVIEW_FEEDBACK_TO_APPLICANT] PRIMARY KEY CLUSTERED 
(
	[review_feedback_to_applicant_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REVIEW_INTERNAL_COMMENT]    Script Date: 10/09/2007 11:49:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REVIEW_INTERNAL_COMMENT](
	[review_internal_comment_id] [int] NOT NULL,
	[rev_wf_task_assignment_id] [int] NOT NULL,
	[comment] [varchar](500) NULL,
 CONSTRAINT [PK_REVIEW_INTERNAL_COMMENT] PRIMARY KEY CLUSTERED 
(
	[review_internal_comment_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REVIEW_STAGE]    Script Date: 10/09/2007 11:49:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REVIEW_STAGE](
	[review_stage_id] [int] NOT NULL,
	[wf_project_task_id] [int] NULL,
	[review_committee_id] [int] NULL,
	[num_reviewers_per_applicant] [int] NULL,
	[include_conflicts] [bit] NULL,
	[application_wf_project_task_id] [int] NULL,
	[num_expected_to_advance] [int] NULL,
	[cutoff_high] [float] NULL,
	[cutoff_low] [float] NULL,
	[is_interview_stage] [bit] NULL,
	[mean_calculation_property_key] [varchar](50) NULL,
 CONSTRAINT [PK_REVIEW_STAGE] PRIMARY KEY CLUSTERED 
(
	[review_stage_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_MEDIA_CODE]    Script Date: 10/09/2007 11:41:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_MEDIA_CODE](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_MEDIA_CODE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REVIEW_STAGE_GRANTEE_PROJECT_CRITERIA]    Script Date: 10/09/2007 11:49:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REVIEW_STAGE_GRANTEE_PROJECT_CRITERIA](
	[review_stage_grantee_project_criteria_id] [int] NOT NULL,
	[review_stage_id] [int] NULL,
	[wf_project_task_id] [int] NULL,
	[wf_task_outcome_id] [int] NULL,
 CONSTRAINT [PK_REVIEW_STAGE_GRANTEE_PROJECT_CRITERIA] PRIMARY KEY CLUSTERED 
(
	[review_stage_grantee_project_criteria_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_SCIENCE1]    Script Date: 10/09/2007 11:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_SCIENCE1](
	[grantee_project_science_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[science_id] [int] NOT NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_SCIENCE1] PRIMARY KEY CLUSTERED 
(
	[grantee_project_science_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_SCIENCE2]    Script Date: 10/09/2007 11:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_SCIENCE2](
	[grantee_project_science_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[science_id] [int] NOT NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_SCIENCE2] PRIMARY KEY CLUSTERED 
(
	[grantee_project_science_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[c_CAMPAIGN_TYPE]    Script Date: 10/09/2007 11:39:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_CAMPAIGN_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_CAMPAIGN_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vEASYGRANTS_USER]    Script Date: 10/09/2007 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vEASYGRANTS_USER]
AS
SELECT	easygrants_user_id, 
	person_id, 
	login_username, 
	CASE
		WHEN user_type_id = 1 THEN login_password 
		WHEN user_type_id > 1 THEN '[restricted]' 
	END AS login_pwd,
	user_type_id
FROM    dbo.EASYGRANTS_USER
GO
/****** Object:  Table [dbo].[SUBMITTED_FILE_CONVERTED_DATA]    Script Date: 10/09/2007 11:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBMITTED_FILE_CONVERTED_DATA](
	[converted_file_data_id] [int] NOT NULL,
	[submitted_file_id] [int] NOT NULL,
	[file_data] [image] NULL,
 CONSTRAINT [PK_SUBMITTED_FILE_CONVERTED_DATA] PRIMARY KEY CLUSTERED 
(
	[converted_file_data_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_PERSON_CONTACT_INFO]    Script Date: 10/09/2007 11:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_PERSON_CONTACT_INFO](
	[id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[person_id] [int] NULL,
	[wf_task_role_id] [int] NULL,
	[name_last] [varchar](100) NULL,
	[name_first] [varchar](50) NULL,
	[name_middle] [varchar](50) NULL,
	[suffix_id] [int] NULL,
	[prefix_id] [int] NULL,
	[degree] [varchar](50) NULL,
	[organization_id] [int] NULL,
	[title] [varchar](255) NULL,
	[department] [varchar](100) NULL,
	[address_1] [varchar](150) NULL,
	[address_2] [varchar](100) NULL,
	[address_3] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state_id] [int] NULL,
	[zip_postal_code] [varchar](30) NULL,
	[phone_number] [varchar](20) NULL,
	[phone_ext] [varchar](10) NULL,
	[fax] [varchar](20) NULL,
	[email] [varchar](250) NULL,
	[url] [varchar](250) NULL,
	[express_address_1] [varchar](150) NULL,
	[express_address_2] [varchar](100) NULL,
	[express_address_3] [varchar](100) NULL,
	[express_city] [varchar](50) NULL,
	[express_state_id] [int] NULL,
	[express_zip_postal_code] [varchar](30) NULL,
	[express_phone_number] [varchar](20) NULL,
	[express_phone_ext] [varchar](10) NULL,
	[submitted_file_id] [int] NULL,
	[project_role_desc] [varchar](2550) NULL,
	[create_user_id] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user_id] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_PERSON_CONTACT_INFO] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SUBMITTED_FILE_DATA]    Script Date: 10/09/2007 11:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBMITTED_FILE_DATA](
	[submitted_file_data_id] [int] NOT NULL,
	[submitted_file_id] [int] NOT NULL,
	[file_data] [image] NULL,
 CONSTRAINT [PK_SUBMITTED_FILE_DATA] PRIMARY KEY CLUSTERED 
(
	[submitted_file_data_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT]    Script Date: 10/09/2007 11:43:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT](
	[grantee_project_id] [int] NOT NULL,
	[app_grantee_project_id] [int] NULL,
	[grantee_id] [int] NOT NULL,
	[wf_project_id] [int] NOT NULL,
	[wf_project_outcome_id] [int] NULL,
	[primary_person_id] [int] NULL,
	[primary_organization_id] [int] NULL,
	[primary_address_id] [int] NULL,
	[grant_title] [varchar](500) NULL,
	[short_title] [varchar](100) NULL,
	[grant_description] [varchar](700) NULL,
	[grant_status_id] [int] NULL,
	[other_organization] [varchar](100) NULL,
	[grant_number] [varchar](50) NULL,
	[effective_date] [datetime] NULL,
	[grant_award_date] [datetime] NULL,
	[no_other_support] [bit] NULL,
	[smart_id] [varchar](50) NULL,
	[applicant_id] [varchar](50) NULL,
	[sponsor_id] [varchar](50) NULL,
	[min_value] [float] NULL,
	[max_value] [float] NULL,
	[request_amount] [money] NULL,
	[invention_indicator] [bit] NULL,
	[aha_appl_id] [char](8) NULL,
	[primary_staff_id] [int] NULL,
	[legacy_grant_id] [varchar](50) NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
	[other_research_area] [varchar](50) NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT] PRIMARY KEY CLUSTERED 
(
	[grantee_project_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vGRANTEE_PROJECT_TITLE]    Script Date: 10/09/2007 11:50:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vGRANTEE_PROJECT_TITLE]
AS
SELECT    distinct  grantee_project_id, CAST(grantee_project_id AS varchar) + ISNULL(', ' + short_title, '') AS grantee_project_title
FROM         dbo.GRANTEE_PROJECT
GO
/****** Object:  Table [dbo].[c_SITE_VISIT_TYPE]    Script Date: 10/09/2007 11:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_SITE_VISIT_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[descr] [varchar](50) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_SITE_VISIT_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WF_TASK_ASSIGNMENT]    Script Date: 10/09/2007 11:49:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WF_TASK_ASSIGNMENT](
	[wf_task_assignment_id] [int] NOT NULL,
	[wf_task_id] [int] NOT NULL,
	[wf_task_status_id] [int] NULL CONSTRAINT [DF_WF_TASK_ASSIGNMENT_status_id]  DEFAULT (0),
	[wf_task_outcome_id] [int] NULL,
	[grantee_project_id] [int] NULL,
	[person_id] [int] NULL,
	[wf_task_role_id] [int] NULL,
	[open_date] [datetime] NULL,
	[due_date] [datetime] NULL,
	[close_date] [datetime] NULL,
	[active] [bit] NULL,
	[assignment_ordinal] [int] NULL,
	[submitted_date] [datetime] NULL,
	[review_rating] [float] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[min_value] [float] NULL,
	[max_value] [float] NULL,
	[streamlined] [bit] NULL,
	[review_cycle_stage_id] [int] NULL,
	[review_assignment_type_id] [int] NULL,
	[review_committee_id] [int] NULL,
	[review_preference_type_id] [int] NULL,
	[review_conflict_type_id] [int] NULL,
	[award_term_id] [int] NULL,
	[create_date] [datetime] NULL,
	[create_user_id] [int] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_WF_TASK_ASSIGNMENT] PRIMARY KEY CLUSTERED 
(
	[wf_task_assignment_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NOTIFICATION_LOG_COMMITTEE]    Script Date: 10/09/2007 11:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NOTIFICATION_LOG_COMMITTEE](
	[notification_log_committee_id] [int] NOT NULL,
	[notification_log_id] [int] NOT NULL,
	[review_committee_id] [int] NOT NULL,
 CONSTRAINT [PK_NOTIFICATION_LOG_COMMITTEE] PRIMARY KEY CLUSTERED 
(
	[notification_log_committee_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[c_SITE_VISIT_STATUS]    Script Date: 10/09/2007 11:42:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_SITE_VISIT_STATUS](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_SITE_VISIT_STATUS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WEB_ADDRESS]    Script Date: 10/09/2007 11:49:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WEB_ADDRESS](
	[id] [int] NOT NULL,
	[entity_type_id] [int] NOT NULL,
	[entity_id] [int] NOT NULL,
	[type_id] [int] NULL,
	[web_addr] [varchar](250) NULL,
	[is_primary] [bit] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_WEB_ADDRESS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_QUERY_TYPE]    Script Date: 10/09/2007 11:41:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_QUERY_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[descr] [varchar](50) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_QUERY_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_LINK]    Script Date: 10/09/2007 11:45:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_LINK](
	[id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[link] [varchar](150) NULL,
	[description] [varchar](250) NULL,
	[campaign_id] [int] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_LINKS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WF_TASK_ASSIGNMENT_PERSON_RELATIONSHIP]    Script Date: 10/09/2007 11:49:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WF_TASK_ASSIGNMENT_PERSON_RELATIONSHIP](
	[wf_task_assignment_person_relationship_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NOT NULL,
	[person_relationship_id] [int] NOT NULL,
 CONSTRAINT [PK_WF_TASK_ASSIGNMENT_PERSON_RELATIONSHIP] PRIMARY KEY CLUSTERED 
(
	[wf_task_assignment_person_relationship_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[a_HORIZONTAL_NAVIGATION]    Script Date: 10/09/2007 11:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_HORIZONTAL_NAVIGATION](
	[horiz_nav_id] [int] NOT NULL,
	[key_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_a_HORIZONTAL_NAVIGATION] PRIMARY KEY CLUSTERED 
(
	[horiz_nav_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_EASYLIST_ACTION_TYPE]    Script Date: 10/09/2007 11:37:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_EASYLIST_ACTION_TYPE](
	[id] [int] NOT NULL,
	[data_object_definition_key] [varchar](50) NULL,
	[easylist_action_id] [int] NULL,
	[sort_order] [int] NULL,
 CONSTRAINT [PK_a_EASYLIST_ACTION_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROJECT_REPORT]    Script Date: 10/09/2007 11:48:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROJECT_REPORT](
	[project_report_id] [int] NOT NULL,
	[project_id] [int] NOT NULL,
	[task_id] [int] NOT NULL,
	[award_term_id] [int] NOT NULL,
	[start_date] [datetime] NULL,
	[open_date] [datetime] NULL,
	[due_date] [datetime] NULL,
	[close_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[status_id] [int] NULL,
	[outcome_id] [int] NULL,
 CONSTRAINT [PK_PROJECT_REPORT] PRIMARY KEY CLUSTERED 
(
	[project_report_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[c_LINEAGE]    Script Date: 10/09/2007 11:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_LINEAGE](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NOT NULL,
	[description] [varchar](100) NOT NULL,
	[sort_order] [smallint] NOT NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_LINEAGE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_TRIP]    Script Date: 10/09/2007 11:46:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_TRIP](
	[id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[trip_type_id] [int] NULL,
	[trip_status_id] [int] NULL,
	[media_code_id] [int] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[reference] [varchar](250) NULL,
	[upload_id] [int] NOT NULL CONSTRAINT [DF_GRANTEE_PROJECT_TRIP_upload_id]  DEFAULT ((0)),
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_TRIPS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_ACADEMIC_POSITION]    Script Date: 10/09/2007 11:39:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_ACADEMIC_POSITION](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_ACADEMIC_POSITION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_GENERAL_FUND]    Script Date: 10/09/2007 11:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_GENERAL_FUND](
	[id] [int] NOT NULL,
	[general_fund] [varchar](50) NULL,
 CONSTRAINT [PK_a_GENERAL_FUND] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_STATE_PROV]    Script Date: 10/09/2007 11:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_STATE_PROV](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_STATE_PROV] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_GRANTEE_MEMBER_ROLE]    Script Date: 10/09/2007 11:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_GRANTEE_MEMBER_ROLE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](200) NULL,
	[sort_order] [smallint] NULL,
 CONSTRAINT [PK_a_GRANTEE_MEMBER_ROLE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_ETHNICITY]    Script Date: 10/09/2007 11:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_ETHNICITY](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](1000) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_ETHNICITY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_OUTCOME_CONFIGURATION]    Script Date: 10/09/2007 11:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[a_OUTCOME_CONFIGURATION](
	[id] [int] NOT NULL,
	[original_task_id] [int] NOT NULL,
	[original_outcome_id] [int] NOT NULL,
	[original_task_status_id] [int] NULL,
	[original_task_role_id] [int] NULL,
	[generated_task_id] [int] NOT NULL,
	[generated_outcome_id] [int] NULL,
	[generated_task_status_id] [int] NULL,
	[generated_task_role_id] [int] NULL,
	[event_id] [int] NULL,
 CONSTRAINT [PK_a_OUTCOME_CONFIGURATION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[c_LOOKUPTABLE_PROPERTYKEY_MAPPING]    Script Date: 10/09/2007 11:40:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_LOOKUPTABLE_PROPERTYKEY_MAPPING](
	[id] [int] NOT NULL,
	[table_name] [varchar](50) NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [varchar](50) NULL,
	[end_date] [varchar](50) NULL,
 CONSTRAINT [PK_c_LOOKUPTABLE_MAPPING] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_PROGRAM]    Script Date: 10/09/2007 11:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_PROGRAM](
	[id] [int] NOT NULL,
	[abbr] [varchar](75) NULL,
	[description] [varchar](200) NULL,
	[sort_order] [int] NULL,
	[consortia_id] [int] NULL,
 CONSTRAINT [PK_a_PROGRAM] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_RACE]    Script Date: 10/09/2007 11:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_RACE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](1000) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_RACE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_INCOME_TYPE]    Script Date: 10/09/2007 11:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_INCOME_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_Income_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_REMINDER_BEFORE]    Script Date: 10/09/2007 11:37:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_REMINDER_BEFORE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [int] NULL,
 CONSTRAINT [PK_a_REMINDER_SETTINGS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_PAYMENT_METHOD]    Script Date: 10/09/2007 11:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_PAYMENT_METHOD](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_PAYMENT_METHOD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_REMINDER_TARGET]    Script Date: 10/09/2007 11:37:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_REMINDER_TARGET](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [int] NULL,
 CONSTRAINT [PK_a_REMINDER_TARGET] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_TENURE]    Script Date: 10/09/2007 11:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_TENURE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](1000) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_TENURE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_LOCALE_TYPE]    Script Date: 10/09/2007 11:40:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_LOCALE_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_LOCALE_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_REPORT_OUTPUT_DEFINITION]    Script Date: 10/09/2007 11:37:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_REPORT_OUTPUT_DEFINITION](
	[report_output_definition_id] [int] NOT NULL,
	[definition_key] [varchar](32) NULL,
	[description] [varchar](50) NULL,
	[entity_dataobject_key] [varchar](50) NULL,
	[output_MIME_type] [varchar](50) NULL,
	[delete_on_view] [bit] NOT NULL CONSTRAINT [DF_a_REPORT_OUTPUT_DEFINITION_delete_on_view]  DEFAULT (0),
	[generation_id] [int] NULL,
 CONSTRAINT [PK_a_REPORT_OUTPUT_DEFINITION] PRIMARY KEY CLUSTERED 
(
	[report_output_definition_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_ACCOUNT]    Script Date: 10/09/2007 11:39:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_ACCOUNT](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_ACCOUNT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_COUNTRY]    Script Date: 10/09/2007 11:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_COUNTRY](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
	[sequence_number] [int] NULL,
 CONSTRAINT [PK_c_COUNTRY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_REQUEST_STATUS]    Script Date: 10/09/2007 11:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_REQUEST_STATUS](
	[id] [int] NOT NULL,
	[request_status] [varchar](50) NULL,
 CONSTRAINT [PK_a_REQUEST_STATUS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERSON_RACE]    Script Date: 10/09/2007 11:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSON_RACE](
	[person_race_id] [int] NOT NULL,
	[person_id] [int] NOT NULL,
	[race_id] [int] NULL,
 CONSTRAINT [PK_PERSON_RACE] PRIMARY KEY CLUSTERED 
(
	[person_race_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_DEMOGRAPHICS]    Script Date: 10/09/2007 11:44:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_DEMOGRAPHICS](
	[project_demographics_id] [int] NOT NULL,
	[grantee_project_id] [int] NULL,
	[demographics_Type] [varchar](50) NULL,
	[demographics_Type_id] [int] NULL,
 CONSTRAINT [PK_GRANTEE_GRANTEE_PROJECT_DEMOGRAPHICS] PRIMARY KEY CLUSTERED 
(
	[project_demographics_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_REVIEW_COMMITTEE]    Script Date: 10/09/2007 11:38:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_REVIEW_COMMITTEE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[competition_type_id] [int] NULL,
	[inactive] [bit] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[parent_review_committee_id] [int] NULL,
 CONSTRAINT [PK_a_REVIEW_COMMITTEE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_PROJECT_REPORT_STATUS]    Script Date: 10/09/2007 11:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_PROJECT_REPORT_STATUS](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_PROJECT_REPORT_STATUS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_GENDER]    Script Date: 10/09/2007 11:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_GENDER](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[gender] [varchar](50) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_GENDER] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_SAVED_QUERY]    Script Date: 10/09/2007 11:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_SAVED_QUERY](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[data_object_xml] [text] NULL,
	[user_id] [int] NULL,
	[query_sql] [text] NULL,
	[description] [varchar](100) NULL,
	[query_type_id] [int] NULL,
	[access_type_id] [int] NULL CONSTRAINT [DF_a_SAVED_QUERY_access_type_id]  DEFAULT (2),
	[query_output_id] [int] NULL,
 CONSTRAINT [PK_a_SAVED_QUERY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_CURRENT_AWARDS]    Script Date: 10/09/2007 11:40:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_CURRENT_AWARDS](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_CURRENT_AWARDS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WFTA_REOPEN_SECTION]    Script Date: 10/09/2007 11:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WFTA_REOPEN_SECTION](
	[wfta_reopen_section_id] [int] NOT NULL,
	[wfta_reopen_request_id] [int] NULL,
	[section_key] [varchar](50) NULL,
	[section_description] [varchar](50) NULL,
	[saved_after_reopen] [bit] NOT NULL CONSTRAINT [DF_WFTA_REOPEN_SECTION_saved]  DEFAULT ((0)),
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_WFTA_RESUBMIT_SECTION] PRIMARY KEY CLUSTERED 
(
	[wfta_reopen_section_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_SAVED_QUERY_ACTION]    Script Date: 10/09/2007 11:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_SAVED_QUERY_ACTION](
	[id] [int] NOT NULL,
	[action] [varchar](50) NULL,
 CONSTRAINT [PK_a_SAVED_QUERY_ACTION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_PROJECT_REPORT_OUTCOME]    Script Date: 10/09/2007 11:41:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_PROJECT_REPORT_OUTCOME](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_PROJECT_REPORT_OUTCOME] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_ORGANIZATION_TYPE]    Script Date: 10/09/2007 11:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_ORGANIZATION_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_ORGANIZATION_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_SAVED_QUERY_BASE_TYPE]    Script Date: 10/09/2007 11:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_SAVED_QUERY_BASE_TYPE](
	[id] [int] NOT NULL,
	[base_type] [varchar](50) NULL,
 CONSTRAINT [PK_a_SAVED_QUERY_BASE_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERSON_CURRENT_AWARDS]    Script Date: 10/09/2007 11:47:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PERSON_CURRENT_AWARDS](
	[person_current_award_id] [int] NOT NULL,
	[person_id] [int] NOT NULL,
	[current_award_id] [int] NULL,
	[is_other_1] [bit] NULL,
	[is_other_2] [bit] NULL,
	[other_specify_1] [varchar](100) NULL,
	[other_specify_2] [varchar](100) NULL,
 CONSTRAINT [PK_PERSON_CURRENT_AWARDS] PRIMARY KEY CLUSTERED 
(
	[person_current_award_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_PHONE_TYPE]    Script Date: 10/09/2007 11:41:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_PHONE_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[phone_type] [varchar](30) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_PHONE_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_WF_PROJECT_OUTCOME]    Script Date: 10/09/2007 11:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_WF_PROJECT_OUTCOME](
	[id] [int] NOT NULL,
	[project_id] [int] NULL,
	[role_id] [int] NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[outcome_key] [char](10) NULL,
 CONSTRAINT [PK_a_WF_PROJECT_OUTCOME] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_BUDGET_PERIOD_DESCRIPTION]    Script Date: 10/09/2007 11:39:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_BUDGET_PERIOD_DESCRIPTION](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](50) NOT NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_BUDGET_PERIOD_DESCRIPTION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_WF_PROJECT_PDF]    Script Date: 10/09/2007 11:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_WF_PROJECT_PDF](
	[id] [int] NOT NULL,
	[wf_project_id] [int] NOT NULL,
	[report_output_definition_type_id] [int] NOT NULL,
	[final_pdf_report_key] [varchar](50) NOT NULL,
	[description] [varchar](100) NULL,
	[generation_id] [tinyint] NOT NULL CONSTRAINT [DF_a_WF_PROJECT_HHMI_generation_id]  DEFAULT (1),
 CONSTRAINT [PK_a_WF_PROJECT_HHMI] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_CO_AUTHOR]    Script Date: 10/09/2007 11:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_CO_AUTHOR](
	[grantee_project_co_author_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[middle_name] [varchar](50) NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_CO_AUTHOR] PRIMARY KEY CLUSTERED 
(
	[grantee_project_co_author_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHONE]    Script Date: 10/09/2007 11:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHONE](
	[id] [int] NOT NULL,
	[entity_type_id] [int] NOT NULL,
	[entity_id] [int] NOT NULL,
	[type_id] [int] NULL,
	[address_id] [int] NULL,
	[country_code] [varchar](10) NULL,
	[phone_number] [varchar](50) NULL,
	[phone_ext] [varchar](10) NULL,
	[is_primary] [bit] NULL,
	[description] [varchar](255) NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_PHONE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WORK_GROUP_MEMBER]    Script Date: 10/09/2007 11:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WORK_GROUP_MEMBER](
	[work_group_member_id] [int] NOT NULL,
	[work_group_id] [int] NOT NULL,
	[person_id] [int] NOT NULL,
 CONSTRAINT [PK_WORK_GROUP_MEMBER] PRIMARY KEY CLUSTERED 
(
	[work_group_member_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[a_BUDGET_CATEGORY]    Script Date: 10/09/2007 11:37:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_BUDGET_CATEGORY](
	[budget_category_id] [int] NOT NULL,
	[project_id] [int] NOT NULL,
	[parent_id] [int] NOT NULL,
	[description] [varchar](100) NULL,
	[has_child] [int] NULL,
	[has_notes] [bit] NOT NULL CONSTRAINT [DF_a_BUDGET_CATEGORY_has_notes]  DEFAULT (0),
	[sort_order] [int] NOT NULL,
	[category_type_id] [int] NULL,
 CONSTRAINT [PK_a_BUDGET_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[budget_category_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_AREA_PERCENTAGES]    Script Date: 10/09/2007 11:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_AREA_PERCENTAGES](
	[area_percentage_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[percent_areas_id] [int] NULL,
	[total] [money] NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_AREA_PERCENTAGES] PRIMARY KEY CLUSTERED 
(
	[area_percentage_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[a_BUDGET_TYPE]    Script Date: 10/09/2007 11:37:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_BUDGET_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[sort_order] [int] NULL,
 CONSTRAINT [PK_a_BUDGET_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_ELIGIBILITY_STATUS]    Script Date: 10/09/2007 11:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_ELIGIBILITY_STATUS](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NOT NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_ELIGIBILITY_STATUS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_COMPETITION]    Script Date: 10/09/2007 11:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_COMPETITION](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](200) NULL,
	[program_id] [int] NOT NULL,
	[sort_order] [int] NULL,
	[competition_type_id] [int] NULL,
	[portfolio_id] [int] NULL,
 CONSTRAINT [PK_a_COMPETITION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_REPORT_OUTPUT_DEFINITION_TYPE]    Script Date: 10/09/2007 11:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_REPORT_OUTPUT_DEFINITION_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_REPORT_OUTPUT_DEFINITION_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EDUCATION]    Script Date: 10/09/2007 11:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EDUCATION](
	[education_id] [int] NOT NULL,
	[person_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[educational_level_id] [int] NULL,
	[doctoral_degree_id] [int] NULL,
	[organization_id] [int] NULL,
	[attended_start_date] [datetime] NULL,
	[attended_end_date] [datetime] NULL,
	[conferred_date] [datetime] NULL,
	[field_of_study] [varchar](50) NULL,
 CONSTRAINT [PK_EDUCATION] PRIMARY KEY CLUSTERED 
(
	[education_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_CONTACT_CATEGORY]    Script Date: 10/09/2007 11:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_CONTACT_CATEGORY](
	[contact_category_id] [int] NOT NULL,
	[title] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
 CONSTRAINT [PK_a_CONTACT_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[contact_category_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_FACULTY_RANK_TYPE]    Script Date: 10/09/2007 11:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_FACULTY_RANK_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NOT NULL,
	[is_eligible] [bit] NOT NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_FacultyRank_EMF] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_DATA_COMMAND_REQUEST_STATUS]    Script Date: 10/09/2007 11:37:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_DATA_COMMAND_REQUEST_STATUS](
	[id] [int] NOT NULL,
	[abbr] [int] NULL,
	[description] [varchar](255) NULL,
	[sort_order] [int] NULL,
 CONSTRAINT [PK_a_DATA_COMMAND_REQUEST_STATUS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LEDGER]    Script Date: 10/09/2007 11:46:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LEDGER](
	[ledger_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[account_id] [int] NULL,
	[transaction_type_id] [int] NULL,
	[amount] [float] NULL,
	[note] [varchar](5000) NULL,
	[create_date] [datetime] NULL,
 CONSTRAINT [PK_LEDGER] PRIMARY KEY CLUSTERED 
(
	[ledger_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_RESEARCH_AREA]    Script Date: 10/09/2007 11:41:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_RESEARCH_AREA](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_RESEARCH_AREA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_BUDGET_PERIOD_NAME]    Script Date: 10/09/2007 11:39:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_BUDGET_PERIOD_NAME](
	[budget_period_name_id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[sequence] [int] NULL,
 CONSTRAINT [PK_c_BUDGET_PERIOD_NAME] PRIMARY KEY CLUSTERED 
(
	[budget_period_name_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_DEFINITION_KEY]    Script Date: 10/09/2007 11:37:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_DEFINITION_KEY](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NOT NULL,
	[description] [varchar](200) NOT NULL,
	[sort_order] [smallint] NOT NULL,
 CONSTRAINT [PK_a_DEFINITION_KEY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_SITE_VISIT]    Script Date: 10/09/2007 11:46:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_SITE_VISIT](
	[id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[grantee_project_trip_id] [int] NULL,
	[site_visit_status_id] [int] NULL,
	[site_visit_type_id] [int] NULL,
	[start_date] [datetime] NULL,
	[start_time_min] [varchar](50) NULL,
	[start_time_hr] [varchar](50) NULL,
	[end_time_min] [varchar](50) NULL,
	[end_time_hr] [varchar](50) NULL,
	[location] [varchar](250) NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_SITE_VISIT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_EASYLIST_ACTION]    Script Date: 10/09/2007 11:37:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_EASYLIST_ACTION](
	[id] [int] NOT NULL,
	[description] [varchar](50) NULL,
	[action_xml] [varchar](1000) NULL,
 CONSTRAINT [PK_a_EASYLIST_ACTION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROJECT_PAYMENT]    Script Date: 10/09/2007 11:48:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROJECT_PAYMENT](
	[project_payment_id] [int] NOT NULL,
	[project_id] [int] NOT NULL,
	[request_date] [datetime] NULL,
	[request_amount] [float] NULL,
	[payment_method_id] [int] NULL,
	[account_id] [int] NULL,
 CONSTRAINT [PK_PROJECT_PAYMENT] PRIMARY KEY CLUSTERED 
(
	[project_payment_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NOMINATION_CRITERIA]    Script Date: 10/09/2007 11:46:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NOMINATION_CRITERIA](
	[nomination_criteria_id] [int] NOT NULL,
	[wf_project_id] [int] NOT NULL,
	[nominator_person_id] [int] NOT NULL,
	[nominator_organization_id] [int] NOT NULL,
	[number_permited] [int] NOT NULL,
 CONSTRAINT [PK_NOMINATION_CRITERIA] PRIMARY KEY CLUSTERED 
(
	[nomination_criteria_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[c_PERCENT_AREAS]    Script Date: 10/09/2007 11:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_PERCENT_AREAS](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_PERCENT_AREAS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_PREFIX]    Script Date: 10/09/2007 11:41:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_PREFIX](
	[prefix_id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[prefix] [varchar](8) NOT NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_PREFIX] PRIMARY KEY CLUSTERED 
(
	[prefix_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_WF_TASK]    Script Date: 10/09/2007 11:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_WF_TASK](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](1000) NULL,
	[wf_task_type_id] [int] NULL,
	[sort_order] [int] NULL,
	[mail_address] [varchar](1000) NULL,
	[comments] [varchar](1000) NULL,
	[wf_task_title] [varchar](200) NULL,
	[wf_task_program] [varchar](100) NULL,
	[parent_task_id] [int] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_a_WF_TASK] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAYMENT_CONTINGENCY_TASKS]    Script Date: 10/09/2007 11:47:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAYMENT_CONTINGENCY_TASKS](
	[payment_contingency_id] [int] NOT NULL,
	[payment_id] [int] NOT NULL,
	[contingency_task_id] [int] NULL,
	[contingency_person_id] [int] NULL,
	[contingency_required_outcome_id] [int] NULL,
	[contingency_open_date] [datetime] NULL,
	[contingency_due_date] [datetime] NULL,
	[contingency_close_date] [datetime] NULL,
	[contingency_start_date] [datetime] NULL,
	[contingency_end_date] [datetime] NULL,
	[contingency_task_assignment_id] [int] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_PAYMENT_CONTINGENCY_TASKS] PRIMARY KEY CLUSTERED 
(
	[payment_contingency_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[a_WF_TASK_MODULE]    Script Date: 10/09/2007 11:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_WF_TASK_MODULE](
	[wf_task_module_id] [int] NOT NULL,
	[wf_task_id] [int] NOT NULL,
	[wf_task_role_id] [int] NOT NULL,
	[module_name] [varchar](50) NULL,
	[module_config_filename] [varchar](50) NULL,
	[outcome_config_filename] [varchar](50) NULL,
	[report_output_definition_id] [int] NULL,
 CONSTRAINT [PK_a_WF_TASK_MODULE] PRIMARY KEY CLUSTERED 
(
	[wf_task_module_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_RATING_TYPE]    Script Date: 10/09/2007 11:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_RATING_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_RATING_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_WF_TASK_OUTCOME]    Script Date: 10/09/2007 11:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_WF_TASK_OUTCOME](
	[id] [int] NOT NULL,
	[task_id] [int] NULL,
	[role_id] [int] NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[outcome_key] [char](10) NULL,
	[sort_order] [int] NULL,
 CONSTRAINT [PK_a_WF_TASK_OUTCOME] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_WF_PROJECT_TASK_ELIGIBILITY_ANSWER]    Script Date: 10/09/2007 11:38:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[a_WF_PROJECT_TASK_ELIGIBILITY_ANSWER](
	[id] [int] NOT NULL,
	[wf_project_task_id] [int] NULL,
	[question_id] [int] NOT NULL,
	[valid_answer_id] [int] NOT NULL,
	[sort_order] [int] NULL,
 CONSTRAINT [PK_a_WF_PROJECT_TASK_ELIGIBILITY_ANSWER] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[a_WF_TASK_ROLE]    Script Date: 10/09/2007 11:38:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_WF_TASK_ROLE](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[task_type_id] [int] NULL,
 CONSTRAINT [PK_a_WF_TASK_ROLE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_REQUEST_CONFLICT]    Script Date: 10/09/2007 11:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_REQUEST_CONFLICT](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_REQUEST_CONFLICT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_RESEARCH_STAGE]    Script Date: 10/09/2007 11:42:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_RESEARCH_STAGE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[stage] [varchar](50) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_RESEARCH_STAGE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_WF_TASK_STATUS]    Script Date: 10/09/2007 11:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_WF_TASK_STATUS](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_a_WF_TASK_STATUS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_WF_TASK_TYPE]    Script Date: 10/09/2007 11:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_WF_TASK_TYPE](
	[id] [int] NOT NULL,
	[description] [varchar](50) NULL,
	[sort_order] [int] NULL,
 CONSTRAINT [PK_a_WF_TASK_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_REVIEW_SOURCE]    Script Date: 10/09/2007 11:42:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_REVIEW_SOURCE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_REVIEW_SOURCE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_RESEARCH_CATEGORY]    Script Date: 10/09/2007 11:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_RESEARCH_CATEGORY](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_RESEARCH_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_SUFFIX]    Script Date: 10/09/2007 11:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_SUFFIX](
	[suffix_id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[suffix] [char](20) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_SUFFIX] PRIMARY KEY CLUSTERED 
(
	[suffix_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_WORK_GROUP]    Script Date: 10/09/2007 11:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_WORK_GROUP](
	[id] [int] NOT NULL,
	[status_id] [int] NULL,
	[description] [varchar](50) NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
 CONSTRAINT [PK_a_WORK_GROUP] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_WF_TASK_ELIGIBILITY_OUTCOME]    Script Date: 10/09/2007 11:38:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[a_WF_TASK_ELIGIBILITY_OUTCOME](
	[id] [int] NOT NULL,
	[wf_task_id] [int] NULL,
	[eligibility_status_id] [int] NULL,
	[wf_task_outcome_id] [int] NULL,
 CONSTRAINT [PK_a_WF_TASK_ELIGIBILITY_OUTCOME] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_REVIEW_STAGE]    Script Date: 10/09/2007 11:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_REVIEW_STAGE](
	[id] [int] NOT NULL,
	[grantee_project_id] [int] NULL,
	[app_wf_task_assignment_id] [int] NULL,
	[proposed_outcome_id] [int] NULL,
	[proposed_grantee_project_outcome_id] [int] NULL,
	[review_stage_id] [int] NULL,
	[comments] [varchar](200) NULL,
	[additional_information] [varchar](200) NULL,
	[average_rating] [float] NULL,
	[flag_for_action] [bit] NULL,
	[review_task_id] [int] NULL,
	[review_cycle_stage_id] [int] NULL,
	[review_committee_id] [int] NULL,
	[min_value] [float] NULL,
	[max_value] [float] NULL,
	[rank] [int] NULL,
	[appl_outcome_finalize] [bit] NULL CONSTRAINT [DF_GRANTEE_PROJECT_REVIEW_STAGE_appl_outcome_finalize_1]  DEFAULT (0),
	[variance] [float] NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_REVIEW_STAGE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_WORK_GROUP_TASK_LIST]    Script Date: 10/09/2007 11:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_WORK_GROUP_TASK_LIST](
	[id] [int] NOT NULL,
	[description] [varchar](50) NULL,
	[work_group_id] [int] NOT NULL,
	[wf_project_id] [int] NULL,
	[wf_task_id] [int] NOT NULL,
	[wf_status_id] [int] NULL,
	[wf_outcome_id] [int] NULL,
 CONSTRAINT [PK_a_WORK_GROUP_TASK_LIST] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GRANTEE_PROJECT_RESEARCH_CATEGORY]    Script Date: 10/09/2007 11:46:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRANTEE_PROJECT_RESEARCH_CATEGORY](
	[grantee_project_research_category_id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[research_category_id] [int] NOT NULL,
	[wf_task_id] [int] NULL,
	[other_research_category] [varchar](100) NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_RESEARCH_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[grantee_project_research_category_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_TRANSLATIONAL_ANSWER]    Script Date: 10/09/2007 11:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_TRANSLATIONAL_ANSWER](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[answer] [varchar](50) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_TRANSLATIONAL_ANSWER] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_ADDITIONAL_CONTACT_ROLE]    Script Date: 10/09/2007 11:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_ADDITIONAL_CONTACT_ROLE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
	[task_id] [int] NULL,
	[competition_id] [int] NULL,
 CONSTRAINT [PK_c_ADDITIONAL_CONTACT_ROLE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_ADDRESS_TYPE]    Script Date: 10/09/2007 11:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_ADDRESS_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_ADDRESS_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_SCIENCE_CATEGORY]    Script Date: 10/09/2007 11:42:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_SCIENCE_CATEGORY](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_SCIENCE_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[c_USER_TYPE]    Script Date: 10/09/2007 11:42:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_USER_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[access_level] [int] NULL,
	[frontdoor_page] [varchar](100) NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_USER_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spMISSING_PRIMARYKEYS]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMISSING_PRIMARYKEYS]
AS
BEGIN
	SELECT c.name, b.name  
	FROM sys.tables b  
	INNER JOIN sys.schemas c ON b.schema_id = c.schema_id  
	WHERE b.type = 'U'  
	AND NOT EXISTS 
	(SELECT a.name  
	FROM sys.key_constraints a  
	WHERE a.parent_object_id = b.OBJECT_ID  
	AND a.schema_id = c.schema_id  
	AND a.type = 'PK' )
END
GO
/****** Object:  Table [dbo].[WF_TASK_ASSIGNMENT_REVIEW]    Script Date: 10/09/2007 11:50:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WF_TASK_ASSIGNMENT_REVIEW](
	[wf_task_assignment_review_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[grantee_project_id] [int] NULL,
	[app_wf_task_assignment_id] [int] NULL,
	[review_stage_id] [int] NULL,
	[proposed_outcome_id] [int] NULL,
	[comments] [varchar](4000) NULL,
	[rating_type_id] [int] NULL,
	[rating] [varchar](10) NULL,
	[translational_answer_id] [int] NULL,
	[research_stage_id] [int] NULL,
	[is_conflict] [bit] NULL,
	[conflict_reason] [varchar](500) NULL,
	[research_plan_sound] [varchar](50) NULL,
	[research_plan_feasible] [varchar](50) NULL,
	[research_plan_appropriate] [varchar](50) NULL,
	[research_plan_grade] [varchar](10) NULL,
	[clinical_impact_outcome] [varchar](100) NULL,
	[clinical_impact_character] [varchar](50) NULL,
	[clinical_impact_grade] [varchar](10) NULL,
	[collaborate_clinical_investigator] [varchar](50) NULL,
	[collaborate_substantive] [varchar](50) NULL,
	[collaborate_experience] [varchar](50) NULL,
	[collaborate_grade] [varchar](10) NULL,
	[intellectual] [varchar](100) NULL,
	[intellectual_potential] [varchar](100) NULL,
	[intellectual_proprietary] [varchar](50) NULL,
	[intellectual_grade] [varchar](10) NULL,
	[commerce_potential_envision] [varchar](50) NULL,
	[commerce_potential_stage] [varchar](100) NULL,
	[commerce_potential_experience] [varchar](50) NULL,
	[commerce_potential_path] [varchar](50) NULL,
	[commerce_potential_time] [varchar](50) NULL,
	[commerce_potential_grade] [varchar](10) NULL,
	[intangibles] [varchar](10) NULL,
	[overall_grade] [varchar](10) NULL,
	[overall_comments] [varchar](1000) NULL,
	[review_task_id] [int] NULL,
	[review_cycle_stage_id] [int] NULL,
	[review_committee_id] [int] NULL,
	[peer_critique] [text] NULL,
	[public_critique] [text] NULL,
 CONSTRAINT [PK_WF_TASK_ASSIGNMENT_REVIEW] PRIMARY KEY CLUSTERED 
(
	[wf_task_assignment_review_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_HORIZONTAL_NAVIGATION_ELEMENT_ARG]    Script Date: 10/09/2007 11:37:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_HORIZONTAL_NAVIGATION_ELEMENT_ARG](
	[horiz_nav_element_arg_id] [int] NOT NULL,
	[horiz_nav_element_id] [int] NOT NULL,
	[arg_type] [varchar](50) NULL,
	[arg_property_key] [varchar](50) NULL,
 CONSTRAINT [PK_a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] PRIMARY KEY CLUSTERED 
(
	[horiz_nav_element_arg_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WF_TASK_ASSIGNMENT_SEMINAR]    Script Date: 10/09/2007 11:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WF_TASK_ASSIGNMENT_SEMINAR](
	[id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NOT NULL,
	[course_name] [varchar](250) NOT NULL,
	[course_date] [datetime] NOT NULL,
	[course_description] [varchar](5000) NOT NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_WF_TASK_ASSIGNMENT_SEMINAR] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BUDGET_PERIOD]    Script Date: 10/09/2007 11:39:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BUDGET_PERIOD](
	[budget_period_id] [int] NOT NULL,
	[budget_id] [int] NOT NULL,
	[budget_period_name] [varchar](255) NULL,
	[budget_period_name_id] [int] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[total] [money] NULL,
	[carryover_cost] [money] NULL,
	[budget_period_description] [varchar](255) NULL,
	[total_salary] [float] NULL,
	[total_materials] [float] NULL,
	[total_equipment] [float] NULL,
	[total_travel] [float] NULL,
	[total_other] [float] NULL,
	[indirect_costs] [float] NULL,
	[grand_total] [float] NULL,
	[budget_year] [varchar](255) NULL,
	[note] [varchar](7000) NULL,
	[budget_period_description_id] [int] NULL,
 CONSTRAINT [PK_BUDGET_PERIOD] PRIMARY KEY CLUSTERED 
(
	[budget_period_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BUDGET_ITEM]    Script Date: 10/09/2007 11:39:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BUDGET_ITEM](
	[budget_item_id] [int] NOT NULL,
	[budget_period_id] [int] NOT NULL,
	[budget_category_id] [int] NOT NULL,
	[amount] [float] NULL,
	[grantee_project_id] [int] NULL,
	[notes] [varchar](7000) NULL,
	[category_type_id] [int] NULL,
 CONSTRAINT [PK_BUDGET_ITEM] PRIMARY KEY CLUSTERED 
(
	[budget_item_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vEASYLIST_GRANTS]    Script Date: 10/09/2007 11:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEASYLIST_GRANTS]
AS
SELECT DISTINCT 
                      Grantee.person_id, Grantee.name_last AS LastName, Grantee.name_first AS FirstName, 
                      Grantee.name_last + ', ' + Grantee.name_first AS LastNameFirstName, dbo.c_GRANT_STATUS.abbr, dbo.ORGANIZATION.organization_name, 
                      dbo.ORGANIZATION.organization_id, dbo.a_WF_PROJECT.description AS project_name, Grantee.name_middle, 
                      dbo.PERSON_ORGANIZATION_AFFILIATION.institutional_component,
                          (SELECT     email_addr
                            FROM          dbo.EMAIL AS E
                            WHERE      (is_primary = 1) AND (entity_id = dbo.WF_TASK_ASSIGNMENT.person_id) AND (entity_type_id = 1)) AS primary_email_addr, dbo.a_COMPETITION.program_id, 
                      dbo.a_WF_PROJECT.competition_id, dbo.GRANTEE_PROJECT.wf_project_id, dbo.GRANTEE_PROJECT.grant_status_id,
                          (SELECT     (SELECT     organization_name
                                                    FROM         dbo.ORGANIZATION AS O
                                                    WHERE     (organization_id = POA.organization_id)) AS primary_organization_name
                            FROM          dbo.PERSON_ORGANIZATION_AFFILIATION AS POA
                            WHERE      (is_primary = 1) AND (person_id = Grantee.person_id)) AS primary_organization_name, dbo.GRANTEE_PROJECT.grantee_project_id, 
                      dbo.a_WF_PROJECT_TASK.wf_task_id, dbo.a_WF_TASK.wf_task_type_id, dbo.GRANTEE_PROJECT.wf_project_outcome_id, 
                      dbo.WF_TASK_ASSIGNMENT.wf_task_outcome_id, dbo.a_PROGRAM.abbr AS ProgramName, dbo.a_WF_PROJECT.time_period_id AS TimePeriodID, 
                      PrimaryStaff.name_last AS PrimaryLastName, PrimaryStaff.name_first AS PrimaryFirstName, dbo.GRANTEE_PROJECT.grant_title AS ProjectTitle, 
                      dbo.GRANTEE_PROJECT.Legacy_Grant_ID
FROM         dbo.WF_TASK_ASSIGNMENT RIGHT OUTER JOIN
                      dbo.GRANTEE_PROJECT INNER JOIN
                      dbo.c_GRANT_STATUS ON dbo.GRANTEE_PROJECT.grant_status_id = dbo.c_GRANT_STATUS.id ON 
                      dbo.WF_TASK_ASSIGNMENT.grantee_project_id = dbo.GRANTEE_PROJECT.grantee_project_id LEFT OUTER JOIN
                      dbo.ORGANIZATION LEFT OUTER JOIN
                      dbo.PERSON_ORGANIZATION_AFFILIATION ON dbo.ORGANIZATION.organization_id = dbo.PERSON_ORGANIZATION_AFFILIATION.organization_id ON 
                      dbo.GRANTEE_PROJECT.primary_organization_id = dbo.ORGANIZATION.organization_id AND 
                      dbo.GRANTEE_PROJECT.primary_person_id = dbo.PERSON_ORGANIZATION_AFFILIATION.person_id LEFT OUTER JOIN
                      dbo.a_PROGRAM INNER JOIN
                      dbo.a_COMPETITION INNER JOIN
                      dbo.a_WF_PROJECT ON dbo.a_COMPETITION.id = dbo.a_WF_PROJECT.competition_id ON 
                      dbo.a_PROGRAM.id = dbo.a_COMPETITION.program_id INNER JOIN
                      dbo.a_WF_PROJECT_TASK ON dbo.a_PROGRAM.id = dbo.a_WF_PROJECT_TASK.id INNER JOIN
                      dbo.a_WF_TASK ON dbo.a_WF_PROJECT_TASK.wf_task_id = dbo.a_WF_TASK.id ON 
                      dbo.GRANTEE_PROJECT.wf_project_id = dbo.a_WF_PROJECT.id LEFT OUTER JOIN
                      dbo.PERSON AS Grantee ON dbo.GRANTEE_PROJECT.primary_person_id = Grantee.person_id LEFT OUTER JOIN
                      dbo.GRANTEE_PROJECT_STAFF_AFFILIATION ON 
                      dbo.GRANTEE_PROJECT.grantee_project_id = dbo.GRANTEE_PROJECT_STAFF_AFFILIATION.grantee_project_id AND 
                      dbo.PERSON_ORGANIZATION_AFFILIATION.is_primary = 1 LEFT OUTER JOIN
                      dbo.PERSON AS PrimaryStaff ON dbo.GRANTEE_PROJECT_STAFF_AFFILIATION.person_id = PrimaryStaff.person_id
GO
/****** Object:  View [dbo].[vEASYLIST_APPLICATIONS]    Script Date: 10/09/2007 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEASYLIST_APPLICATIONS]
AS
SELECT     TOP (100) PERCENT dbo.PERSON.name_last, dbo.PERSON.name_first, 
                      dbo.PERSON.name_last + ', ' + dbo.PERSON.name_first AS LastNameFirstName, dbo.a_WF_TASK_STATUS.description AS Status, 
                      dbo.a_WF_TASK_ROLE.description AS Role, dbo.a_WF_TASK_OUTCOME.description AS Outcome, dbo.a_WF_TASK.description AS Task, 
                      dbo.WF_TASK_ASSIGNMENT.grantee_project_id, dbo.a_WF_TASK_ROLE.task_type_id, dbo.WF_TASK_ASSIGNMENT.wf_task_assignment_id, 
                      dbo.PERSON.person_id,
                          (SELECT     (SELECT     organization_name
                                                    FROM         dbo.ORGANIZATION AS O
                                                    WHERE     (organization_id = POA.organization_id)) AS primary_organization_name
                            FROM          dbo.PERSON_ORGANIZATION_AFFILIATION AS POA
                            WHERE      (is_primary = 1) AND (person_id = dbo.PERSON.person_id)) AS primary_organization_name,
                          (SELECT     email_addr
                            FROM          dbo.EMAIL AS E
                            WHERE      (is_primary = 1) AND (entity_id = dbo.PERSON.person_id) AND (entity_type_id = 1)) AS primary_email_addr, 
                      dbo.a_WF_TASK_OUTCOME.id AS wf_task_outcome_id, dbo.a_WF_TASK.id AS wf_task_id, dbo.a_WF_TASK_ROLE.id AS wf_task_role_id, 
                      dbo.a_WF_TASK_STATUS.id AS wf_task_status_id, dbo.GRANTEE_PROJECT.wf_project_id, dbo.a_WF_PROJECT.competition_id, 
                      dbo.a_COMPETITION.program_id
FROM         dbo.a_WF_TASK_ROLE RIGHT OUTER JOIN
                      dbo.a_COMPETITION RIGHT OUTER JOIN
                      dbo.a_WF_PROJECT ON dbo.a_COMPETITION.id = dbo.a_WF_PROJECT.competition_id RIGHT OUTER JOIN
                      dbo.GRANTEE_PROJECT RIGHT OUTER JOIN
                      dbo.WF_TASK_ASSIGNMENT ON dbo.GRANTEE_PROJECT.primary_person_id = dbo.WF_TASK_ASSIGNMENT.person_id ON 
                      dbo.a_WF_PROJECT.id = dbo.GRANTEE_PROJECT.wf_project_id LEFT OUTER JOIN
                      dbo.PERSON ON dbo.WF_TASK_ASSIGNMENT.person_id = dbo.PERSON.person_id ON 
                      dbo.a_WF_TASK_ROLE.id = dbo.WF_TASK_ASSIGNMENT.wf_task_role_id LEFT OUTER JOIN
                      dbo.a_WF_TASK_OUTCOME ON dbo.WF_TASK_ASSIGNMENT.wf_task_outcome_id = dbo.a_WF_TASK_OUTCOME.id LEFT OUTER JOIN
                      dbo.a_WF_TASK_STATUS ON dbo.WF_TASK_ASSIGNMENT.wf_task_status_id = dbo.a_WF_TASK_STATUS.id LEFT OUTER JOIN
                      dbo.a_WF_TASK ON dbo.WF_TASK_ASSIGNMENT.wf_task_id = dbo.a_WF_TASK.id
WHERE     (dbo.a_WF_TASK_ROLE.task_type_id = 1) OR
                      (dbo.a_WF_TASK_ROLE.task_type_id = 5) OR
                      (dbo.a_WF_TASK_ROLE.task_type_id = 6) OR
                      (dbo.a_WF_TASK_ROLE.task_type_id = 7)
GO
/****** Object:  View [dbo].[vEASYLIST_REVIEWS_REVIEW]    Script Date: 10/09/2007 11:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEASYLIST_REVIEWS_REVIEW]
AS
SELECT     WF_TASK_ASSIGNMENT.wf_task_assignment_id, PERSON.person_id, PERSON.name_last, PERSON.name_first, 
                      ORGANIZATION.organization_name AS primary_organization_name, APP_PERSON.name_last AS app_name_last, 
                      APP_PERSON.name_first AS app_name_first, APP_ORGANIZATION.organization_name AS app_organization_name, 
                      WF_TASK_ASSIGNMENT.review_committee_id, a_REVIEW_COMMITTEE.inactive, 
                      a_REVIEW_COMMITTEE.description AS review_committee_description, a_WF_PROJECT.competition_id, a_COMPETITION.competition_type_id, 
                      a_COMPETITION.program_id, a_PROGRAM.consortia_id, a_WF_PROJECT_TASK.id AS project_task_id, 
                      a_WF_PROJECT_TASK.description AS project_task_desc, a_REVIEW_CYCLE.time_period_id, 
                      dbo.vPERSON_NAMES.LastFirstMiddle AS LastNameFirstNameMiddle, vPERSON_NAMES_APP.LastFirstMiddle AS AppLastNameFirstName, 
                      vPERSON_NAMES_APP.person_id AS AppPersonID, vPERSON_NAMES_1.LastFirstMiddle AS LastNameFirstName
FROM         dbo.WF_TASK_ASSIGNMENT AS WF_TASK_ASSIGNMENT INNER JOIN
                      dbo.PERSON AS PERSON ON PERSON.person_id = WF_TASK_ASSIGNMENT.person_id LEFT OUTER JOIN
                      dbo.PERSON_ORGANIZATION_AFFILIATION AS PERSON_ORGANIZATION_AFFILIATION ON 
                      PERSON.person_id = PERSON_ORGANIZATION_AFFILIATION.person_id AND PERSON_ORGANIZATION_AFFILIATION.is_primary = 1 LEFT OUTER JOIN
                      dbo.ORGANIZATION AS ORGANIZATION ON PERSON_ORGANIZATION_AFFILIATION.organization_id = ORGANIZATION.organization_id INNER JOIN
                      dbo.GRANTEE_PROJECT AS GRANTEE_PROJECT ON 
                      GRANTEE_PROJECT.grantee_project_id = WF_TASK_ASSIGNMENT.grantee_project_id INNER JOIN
                      dbo.PERSON AS APP_PERSON ON APP_PERSON.person_id = GRANTEE_PROJECT.primary_person_id LEFT OUTER JOIN
                      dbo.PERSON_ORGANIZATION_AFFILIATION AS APP_PERSON_ORGANIZATION_AFFILIATION ON 
                      APP_PERSON.person_id = APP_PERSON_ORGANIZATION_AFFILIATION.person_id AND 
                      APP_PERSON_ORGANIZATION_AFFILIATION.is_primary = 1 LEFT OUTER JOIN
                      dbo.ORGANIZATION AS APP_ORGANIZATION ON 
                      APP_PERSON_ORGANIZATION_AFFILIATION.organization_id = APP_ORGANIZATION.organization_id LEFT OUTER JOIN
                      dbo.a_REVIEW_COMMITTEE AS a_REVIEW_COMMITTEE ON a_REVIEW_COMMITTEE.id = WF_TASK_ASSIGNMENT.review_committee_id INNER JOIN
                      dbo.a_WF_PROJECT AS a_WF_PROJECT ON GRANTEE_PROJECT.wf_project_id = a_WF_PROJECT.id INNER JOIN
                      dbo.a_COMPETITION AS a_COMPETITION ON a_COMPETITION.id = a_WF_PROJECT.competition_id INNER JOIN
                      dbo.a_PROGRAM AS a_PROGRAM ON a_PROGRAM.id = a_COMPETITION.program_id INNER JOIN
                      dbo.a_WF_PROJECT_TASK AS a_WF_PROJECT_TASK ON GRANTEE_PROJECT.wf_project_id = a_WF_PROJECT_TASK.wf_project_id AND 
                      WF_TASK_ASSIGNMENT.wf_task_id = a_WF_PROJECT_TASK.wf_task_id LEFT OUTER JOIN
                      dbo.REVIEW_CYCLE_STAGE AS REVIEW_CYCLE_STAGE ON 
                      REVIEW_CYCLE_STAGE.review_cycle_stage_id = WF_TASK_ASSIGNMENT.review_cycle_stage_id LEFT OUTER JOIN
                      dbo.a_REVIEW_CYCLE AS a_REVIEW_CYCLE ON a_REVIEW_CYCLE.id = REVIEW_CYCLE_STAGE.review_cycle_id INNER JOIN
                      dbo.a_WF_TASK AS a_WF_TASK ON WF_TASK_ASSIGNMENT.wf_task_id = a_WF_TASK.id INNER JOIN
                      dbo.vPERSON_NAMES ON PERSON.person_id = dbo.vPERSON_NAMES.person_id INNER JOIN
                      dbo.vPERSON_NAMES AS vPERSON_NAMES_APP ON APP_PERSON.person_id = vPERSON_NAMES_APP.person_id INNER JOIN
                      dbo.vPERSON_NAMES AS vPERSON_NAMES_1 ON PERSON.person_id = vPERSON_NAMES_1.person_id
WHERE     (WF_TASK_ASSIGNMENT.wf_task_role_id = 9) OR
                      (WF_TASK_ASSIGNMENT.wf_task_role_id = 7)
GO
/****** Object:  View [dbo].[vRevWFTA]    Script Date: 10/09/2007 11:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vRevWFTA]
AS

SELECT	w.wf_task_assignment_id,
		p.person_id,
		p.name_last,
		p.name_first,
		app.person_id app_person_id,
		app.name_last app_name_last,
		app.name_first app_name_first,
		w.review_committee_id,
		w.review_cycle_stage_id,
		r.inactive,
		pj.competition_id,
		c.competition_type_id,
		c.program_id,
		pt.id,
		rc.time_period_id,
		w.wf_task_status_id,
		org_rev.organization_name AS organization_name_rev,
		org_app.organization_name AS organization_name_app
FROM	WF_TASK_ASSIGNMENT w
		join PERSON p on p.person_id = w.person_id
		join GRANTEE_PROJECT gp on gp.grantee_project_id = w.grantee_project_id
		join PERSON app on app.person_id = gp.primary_person_id
		left join a_REVIEW_COMMITTEE r on r.id = w.review_committee_id
		join a_WF_PROJECT pj on gp.wf_project_id = pj.id
		join a_COMPETITION c on c.id = pj.competition_id
		join a_PROGRAM pg on pg.id = c.program_id
		join a_WF_PROJECT_TASK pt on gp.wf_project_id = pt.wf_project_id and w.wf_task_id = pt.wf_task_id
		left join REVIEW_CYCLE_STAGE rcs on rcs.review_cycle_stage_id = w.review_cycle_stage_id
		left join  a_REVIEW_CYCLE rc on rc.id = rcs.review_cycle_id
		join a_wf_task wt on w.wf_task_id = wt.id
		left join person_organization_affiliation poa_rev on (poa_rev.person_id = p.person_id) and (poa_rev.is_primary = 1)
		left join ORGANIZATION org_rev on org_rev.organization_id = poa_rev.organization_id
		left join person_organization_affiliation poa_app on (poa_app.person_id = app.person_id) and (poa_app.is_primary = 1)
		left join ORGANIZATION org_app on org_app.organization_id = poa_app.organization_id
WHERE	w.wf_task_role_id = 7
GO
/****** Object:  StoredProcedure [dbo].[spUSEPREVIOUSREVIEWER]    Script Date: 10/09/2007 11:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUSEPREVIOUSREVIEWER]
(
	@review_cycle_stage_id INT,
	@grantee_project_id INT,
	@rev_person_id INT,
	@IsAvailable BIT OUTPUT
)
AS

DECLARE	@review_cycle_id INT,
		@previous_review_cycle_id INT,
		@PrevReviewCycleStageID INT,
		@cnt INT

SELECT	@review_cycle_id = review_cycle_id
FROM	REVIEW_CYCLE_STAGE
WHERE	review_cycle_stage_id = @review_cycle_stage_id

SELECT	@previous_review_cycle_id = ISNULL(previous_review_cycle_id, 0)
FROM	a_REVIEW_CYCLE
WHERE	id = @review_cycle_id

SELECT	@PrevReviewCycleStageID = ISNULL(review_cycle_stage_id, 0)
FROM	REVIEW_CYCLE_STAGE
WHERE	review_cycle_id = @previous_review_cycle_id

SET	@IsAvailable = 0

IF @PrevReviewCycleStageID > 0
BEGIN
	SELECT	@cnt = COUNT(*)
	FROM	WF_TASK_ASSIGNMENT
	WHERE	review_cycle_stage_id = @PrevReviewCycleStageID
		AND	grantee_project_id = @grantee_project_id
		AND person_id = @rev_person_id

	IF @cnt > 0
		SET	@IsAvailable = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spAVOIDPREVIOUSREVIEWER]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAVOIDPREVIOUSREVIEWER]
(
	@review_cycle_stage_id INT,
	@grantee_project_id INT,
	@rev_person_id INT,
	@IsAvailable BIT OUTPUT
)
AS

DECLARE	@review_cycle_id INT,
		@previous_review_cycle_id INT,
		@PrevReviewCycleStageID INT,
		@cnt INT

SELECT	@review_cycle_id = review_cycle_id
FROM	REVIEW_CYCLE_STAGE
WHERE	review_cycle_stage_id = @review_cycle_stage_id

SELECT	@previous_review_cycle_id = ISNULL(previous_review_cycle_id, 0)
FROM	a_REVIEW_CYCLE
WHERE	id = @review_cycle_id

SELECT	@PrevReviewCycleStageID = ISNULL(review_cycle_stage_id, 0)
FROM	REVIEW_CYCLE_STAGE
WHERE	review_cycle_id = @previous_review_cycle_id

SET	@IsAvailable = 1

IF @PrevReviewCycleStageID > 0
BEGIN
	SELECT	@cnt = COUNT(*)
	FROM	WF_TASK_ASSIGNMENT
	WHERE	review_cycle_stage_id = @PrevReviewCycleStageID
		AND	grantee_project_id = @grantee_project_id
		AND person_id = @rev_person_id

	IF @cnt > 0
		SET	@IsAvailable = 0
END
GO
/****** Object:  StoredProcedure [dbo].[spCLEAR_PREPROCESS]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCLEAR_PREPROCESS]
(
	@review_cycle_id INT
)
AS

DELETE FROM review_cycle_conflict 
WHERE review_cycle_id = @review_cycle_id 
	AND review_source_id = 1
GO
/****** Object:  StoredProcedure [dbo].[spCONFLICTRESULTSBYREV]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE         procedure [dbo].[spCONFLICTRESULTSBYREV]
	(
		@ReviewCycleID INT
	)
AS
set nocount on



DECLARE

	@ResultsID int,
	@WftaID float, 
	@GPID int,
	@Consortia varchar(100), 
	@RevOrgName varchar(250), 
	@AppPersonID int, 
	@RevPersonID int, 
	@RevFirstMiddleLast varchar(100),
	@RevLastFirstMiddle varchar(100),
	@AppFirstMiddleLast varchar(100),
	@AppLastFirstMiddle varchar(100),
	@RevCommID int, 
	@CommitteeName varchar(100),
	@RevCycleID int,
	@count int,
	@counter int
	
	CREATE TABLE #t
		(
		WftaID float,
		GPID int,
		Consortia varchar(100),
		RevOrgName varchar(250),
		AppPersonID int,
		RevPersonID int,
		RevFirstMiddleLast varchar(100),
		RevLastFirstMiddle varchar(100),
		AppFirstMiddleLast varchar(100),
		AppLastFirstMiddle varchar(100),
		RevCommID int,
		CommitteeName varchar(100),
		RevCycleID int
		)





-- **************** ConflictCursor begins here ****************************

BEGIN -- ConflictCursor

	-- get reviewers, excluding dupes
		DECLARE ConflictCursor SCROLL CURSOR FOR	



select distinct
			rcc.review_cycle_conflict_id as 'WftaID', 
			--RAND(10000) as 'WftaID',
			wfta.grantee_project_id as 'GPID',
			consort.description as 'Consortia',  
			o.organization_name as 'RevOrgName', 
			rcc.app_person_id as  'AppPersonID', 
			ltrim(rtrim(p.name_first)) + ' ' + 
					CASE 
						WHEN p.name_middle = '' THEN '' 
						WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) + ' ' 
						ELSE '' 
					END 
					+ ltrim(rtrim(p.name_last)) AS 'AppFirstMiddleLast', 
					RTRIM(ltrim(rtrim(p.name_last)) + ', ' + ltrim(rtrim(p.name_first)) + ' ' +  
					CASE 
						WHEN p.name_middle = '' THEN '' 
						WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) 
						ELSE '' 
					END) AS 'AppLastFirstMiddle',
			rcc.rev_person_id  as 'RevPersonID', 
			ltrim(rtrim(revperson.name_first)) + ' ' + 
				CASE 
					WHEN revperson.name_middle = '' THEN '' 
					WHEN revperson.name_middle IS NOT NULL THEN ltrim(rtrim(revperson.name_middle)) + ' ' 
					ELSE '' 
				END 
				+ ltrim(rtrim(revperson.name_last)) AS 'RevFirstMiddleLast', 
				RTRIM(ltrim(rtrim(revperson.name_last)) + ', ' + ltrim(rtrim(revperson.name_first)) + ' ' +  
				CASE 
					WHEN revperson.name_middle = '' THEN '' 
					WHEN revperson.name_middle IS NOT NULL THEN ltrim(rtrim(revperson.name_middle)) 
					ELSE '' 
				END) AS 'RevLastFirstMiddle',
			rcc.rev_committee_id as 'RevCommID', 
			rc.description as 'CommitteeName',
			rcc.review_cycle_id as 'ReviewCycleID'
		
		from review_cycle_conflict rcc
		
			join wf_task_assignment as wfta on wfta.wf_task_assignment_id = rcc.wfta_id
			--join grantee_project as gp on gp.grantee_project_id = wfta.grantee_project_id
			--join review_cycle_stage as rcs on rcs.review_cycle_id = rcc.review_cycle_id
			join review_cycle_project_task as rcpt on rcpt.review_cycle_id = rcc.review_cycle_id
			join PERSON p on p.person_id = rcc.app_person_id
			join person as revperson on revperson.person_id = rcc.rev_person_id
			left JOIN PERSON_ORGANIZATION_AFFILIATION po on revperson.person_id = po.person_id and po.is_primary = 1
			left JOIN ORGANIZATION o on po.organization_id = o.organization_id
			join a_wf_project_task as wfpt on wfpt.id = rcpt.project_task_id
			join a_WF_PROJECT pj on pj.id = wfpt.wf_project_id
			join a_COMPETITION c on c.id = pj.competition_id
			join a_PROGRAM pg on pg.id = c.program_id
			join c_consortia as consort on consort.id = pg.consortia_id
			--join review_committee_member as rcom on rcc.rev_committee_id = rcc.rev_committee_id
			join review_cycle_committee as rcm on rcc.rev_committee_id = rcm.review_committee_id and rcc.review_cycle_id = rcm.review_cycle_id
			--join review_cycle_committee as rcm2 on rcc.review_cycle_id = rcm2.review_cycle_id
			join a_review_committee as rc on rc.id = rcc.rev_committee_id
			
		
		
		where rcc.wfta_id in (select wfta.wf_task_assignment_id from wf_task_assignment) 
			and rcc.review_cycle_id = @ReviewCycleID
			--and rcc.review_cycle_id = 21
		
		--and rcc.review_cycle_id = 82



OPEN ConflictCursor	
		FETCH NEXT FROM ConflictCursor INTO @WftaID, @GPID, @Consortia, @RevOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
			WHILE (@@FETCH_STATUS=0)
				BEGIN
					
					
					--set WftaID = @counter + 1
					SELECT @count = count(*) from review_cycle_conflict where rev_person_id = @RevPersonID and review_cycle_id = @ReviewCycleID and rev_committee_id = @RevCommID	
					IF @count > 1
						BEGIN
							set @WftaID = @WftaID + RAND(10000)
							DECLARE DupedCursor SCROLL CURSOR FOR
			
							select distinct
									rcc.review_cycle_conflict_id as 'WftaID', 
									wfta.grantee_project_id as 'GPID',
									--RAND(30000) as 'WftaID',
									consort.description as 'Consortia',  
									o.organization_name as 'RevOrgName', 
									rcc.app_person_id as  'AppPersonID',
									ltrim(rtrim(p.name_first)) + ' ' + 
										CASE 
											WHEN p.name_middle = '' THEN '' 
											WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) + ' ' 
											ELSE '' 
										END 
										+ ltrim(rtrim(p.name_last)) AS 'AppFirstMiddleLast', 
										RTRIM(ltrim(rtrim(p.name_last)) + ', ' + ltrim(rtrim(p.name_first)) + ' ' +  
										CASE 
											WHEN p.name_middle = '' THEN '' 
											WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) 
											ELSE '' 
										END) AS 'AppLastFirstMiddle', 
									rcc.rev_person_id  as 'RevPersonID', 
									ltrim(rtrim(revperson.name_first)) + ' ' + 
										CASE 
											WHEN revperson.name_middle = '' THEN '' 
											WHEN revperson.name_middle IS NOT NULL THEN ltrim(rtrim(revperson.name_middle)) + ' ' 
											ELSE '' 
										END 
										+ ltrim(rtrim(revperson.name_last)) AS 'RevFirstMiddleLast', 
										RTRIM(ltrim(rtrim(revperson.name_last)) + ', ' + ltrim(rtrim(revperson.name_first)) + ' ' +  
										CASE 
											WHEN revperson.name_middle = '' THEN '' 
											WHEN revperson.name_middle IS NOT NULL THEN ltrim(rtrim(revperson.name_middle)) 
											ELSE '' 
										END) AS 'RevLastFirstMiddle',
									rcc.rev_committee_id as 'RevCommID', 
									rc.description as 'CommitteeName',
									rcc.review_cycle_id as 'ReviewCycleID'
								
								from review_cycle_conflict rcc
								
									join wf_task_assignment as wfta on wfta.wf_task_assignment_id = rcc.wfta_id
			--join grantee_project as gp on gp.grantee_project_id = wfta.grantee_project_id
			--join review_cycle_stage as rcs on rcs.review_cycle_id = rcc.review_cycle_id
			join review_cycle_project_task as rcpt on rcpt.review_cycle_id = rcc.review_cycle_id
			join PERSON p on p.person_id = rcc.app_person_id
			join person as revperson on revperson.person_id = rcc.rev_person_id
			left JOIN PERSON_ORGANIZATION_AFFILIATION po on revperson.person_id = po.person_id and po.is_primary = 1
			left JOIN ORGANIZATION o on po.organization_id = o.organization_id
			join a_wf_project_task as wfpt on wfpt.id = rcpt.project_task_id
			join a_WF_PROJECT pj on pj.id = wfpt.wf_project_id
			join a_COMPETITION c on c.id = pj.competition_id
			join a_PROGRAM pg on pg.id = c.program_id
			join c_consortia as consort on consort.id = pg.consortia_id
			--join review_committee_member as rcom on rcc.rev_committee_id = rcc.rev_committee_id
			join review_cycle_committee as rcm on rcc.rev_committee_id = rcm.review_committee_id and rcc.review_cycle_id = rcm.review_cycle_id
			--join review_cycle_committee as rcm2 on rcc.review_cycle_id = rcm2.review_cycle_id
			join a_review_committee as rc on rc.id = rcc.rev_committee_id
									
								
								
								where rev_person_id = @RevPersonID and rev_committee_id = @RevCommID
									and rcc.review_cycle_id = @ReviewCycleID
 
								--select app_person_id, review_cycle_id, rev_committee_id from review_cycle_conflict where app_person_id = @AppPersonID and review_cycle_id = @ReviewCycleID and rev_committee_id = @RevCommID
									--group by app_person_id, review_cycle_id, rev_committee_id

							OPEN DupedCursor
							FETCH FIRST FROM DupedCursor into @WftaID, @GPID, @Consortia, @RevOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
	
								--WHILE (@@FETCH_STATUS=0)
									--BEGIN
									INSERT INTO #t 
										(
										WftaID,
										GPID,
										Consortia,
										RevOrgName,
										AppPersonID,
										AppFirstMiddleLast,
										AppLastFirstMiddle,
										RevPersonID,
										RevFirstMiddleLast,
										RevLastFirstMiddle,
										RevCommID,
										CommitteeName,
										RevCycleID
										)
										VALUES
										( 
											@WftaID,
											@GPID,
											@Consortia, 
											@RevOrgName, 
											@AppPersonID,
											@AppFirstMiddleLast,
											@AppLastFirstMiddle, 
											@RevPersonID, 
											@RevFirstMiddleLast,
											@RevLastFirstMiddle,
											@RevCommID,
											@CommitteeName,
											@ReviewCycleID
										)
									--FETCH LAST FROM DupedCursor into @WftaID, @Consortia, @AppOrgName, @AppPersonID, @RevPersonID, @RevCommID, @ReviewCycleID
									--END --closes DupedCursor While for if count
							CLOSE DupedCursor
							DEALLOCATE  DupedCursor
						END -- ConflictCursor if count
					if @count = 1
						BEGIN
							set @WftaID = @WftaID + RAND(20000)
							--FETCH NEXT FROM ConflictCursor into @WftaID, @Consortia, @AppOrgName, @AppPersonID, @RevPersonID, @RevCommID, @ReviewCycleID
	
								--WHILE (@@FETCH_STATUS=0)
									--BEGIN
									INSERT INTO #t 
										(
										WftaID,
										GPID,
										Consortia,
										RevOrgName,
										AppPersonID,
										AppFirstMiddleLast,
										AppLastFirstMiddle,
										RevPersonID,
										RevFirstMiddleLast,
										RevLastFirstMiddle,
										RevCommID,
										CommitteeName,
										RevCycleID
										)
										VALUES
										( 
											@WftaID,
											@GPID,
											@Consortia, 
											@RevOrgName, 
											@AppPersonID,
											@AppFirstMiddleLast,
											@AppLastFirstMiddle, 
											@RevPersonID, 
											@RevFirstMiddleLast,
											@RevLastFirstMiddle,
											@RevCommID,
											@CommitteeName,
											@ReviewCycleID
										)						
						END
						
				


						FETCH NEXT FROM ConflictCursor into @WftaID, @GPID, @Consortia, @RevOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
				
				END -- ConflictCursor while
		
CLOSE ConflictCursor
DEALLOCATE  ConflictCursor


END



-- **************** RevCursor begins here *************************

BEGIN
		-- get reviewers, who have no conflict records then add to temp table
		DECLARE RevCursor SCROLL CURSOR FOR
	
		-- reviewers for a review cycle
	select distinct 
			RAND(p.person_id) as 'WftaID', 
			'-1' as 'GPID',
			consort.description as 'Consortia',
			o.organization_name as 'RevOrgName',
			'-1' as 'AppPersonID',
			CASE WHEN rcom.person_id is not null THEN 'N/A' END as 'AppFirstMiddleLast', 
			CASE WHEN rcom.person_id is not null THEN 'N/A' END as 'AppLastFirstMiddle',
			rcom.person_id as 'RevPersonID', 
			ltrim(rtrim(p.name_first)) + ' ' + 
				CASE 
					WHEN p.name_middle = '' THEN '' 
					WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) + ' ' 
					ELSE '' 
				END 
				+ ltrim(rtrim(p.name_last)) AS 'RevFirstMiddleLast', 
				RTRIM(ltrim(rtrim(p.name_last)) + ', ' + ltrim(rtrim(p.name_first)) + ' ' +  
				CASE 
					WHEN p.name_middle = '' THEN '' 
					WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) 
					ELSE '' 
				END) AS 'RevLastFirstMiddle',
				rcc.review_committee_id as 'RevCommID',
				arc.description as 'CommitteeName', 
				rcc.review_cycle_id as 'ReviewCycleID' 
		
			from review_cycle_project_task_outcome rcpto

				--join review_cycle_project_task as rcpt on rcpto.review_cycle_id = rcpt.review_cycle_id
				join review_cycle_committee as rcc on rcpto.review_cycle_id = rcc.review_cycle_id
				join review_committee_member as rcom on rcom.review_committee_id = rcc.review_committee_id
				join a_review_committee as arc on arc.id = rcom.review_committee_id
				--join review_cycle_committee as rcc on rcpto.review_cycle_id = rcc.review_cycle_id
				--join review_cycle_conflict as rccon on rcpto.review_cycle_id = rccon.review_cycle_id
				--join review_cycle_conflict as rccon on rcpto.review_cycle_id = rccon.review_cycle_id
				--join wf_task_assignment as wfta on rcpto.task_id = wfta.wf_task_id and rcpto.task_outcome_id = wfta.wf_task_outcome_id
				--join grantee_project as gp on wfta.grantee_project_id = gp.grantee_project_id and rcpto.project_id = gp.wf_project_id
				join PERSON p on rcom.person_id = p.person_id
				left JOIN PERSON_ORGANIZATION_AFFILIATION po on p.person_id = po.person_id and po.is_primary = 1
				left JOIN ORGANIZATION o on po.organization_id = o.organization_id
				join a_WF_PROJECT pj on pj.id = rcpto.project_id
				join a_COMPETITION c on c.id = pj.competition_id
				join a_PROGRAM pg on pg.id = c.program_id
				join c_consortia as consort on consort.id = pg.consortia_id
				

			where not exists (select * from review_cycle_conflict where rcom.review_committee_id = rev_committee_id 
			and rcom.person_id = rev_person_id and rcpto.review_cycle_id = review_cycle_id)
			--and rccon.app_person_id = gp.primary_person_id
			and rcpto.review_cycle_id = @ReviewCycleID --and rcom.review_committee_id = @ReviewCommitteeID

	
		OPEN RevCursor
		FETCH NEXT FROM RevCursor into @WftaID, @GPID, @Consortia, @RevOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
		WHILE (@@FETCH_STATUS=0)
		BEGIN		
		set @WftaID = @WftaID + RAND(20000) + @RevCommID

		INSERT INTO #t 
				(
				WftaID,
				GPID,
				Consortia,
				RevOrgName,
				AppPersonID,
				AppFirstMiddleLast, 
				AppLastFirstMiddle, 
				RevPersonID,
				RevFirstMiddleLast,
				RevLastFirstMiddle,
				RevCommID,
				CommitteeName,
				RevCycleID
				)
				VALUES
				( 
					@WftaID,
					@GPID,
					@Consortia, 
					@RevOrgName, 
					@AppPersonID, 
					@AppFirstMiddleLast, 
					@AppLastFirstMiddle, 
					@RevPersonID, 
					@RevFirstMiddleLast,
					@RevLastFirstMiddle,
					@RevCommID,
					@CommitteeName,
					@ReviewCycleID
				)
					
				--FROM review_cycle_proj 
		
		FETCH NEXT FROM RevCursor into @WftaID, @GPID, @Consortia, @RevOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
	
		END


CLOSE RevCursor
DEALLOCATE  RevCursor

END

--****************************** RevCursor ends here **************************************






select distinct TOP 100 PERCENT  WftaID, GPID, Consortia, RevOrgName, AppPersonID, AppFirstMiddleLast, AppLastFirstMiddle, RevPersonID, RevFirstMiddleLast, RevLastFirstMiddle, RevCommID, CommitteeName, RevCycleID 

from #t

order by CommitteeName, RevLastFirstMiddle

return

-- exec spConflictResultsByRev @ReviewCycleID = 23
GO
/****** Object:  StoredProcedure [dbo].[spCONFLICTRESULTSBYCOMM]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE   procedure [dbo].[spCONFLICTRESULTSBYCOMM]
(
	@ReviewCommitteeID INT,
	@ReviewCycleID INT
)
AS
--set nocount on

DECLARE
	@ResultsID int,
	@WftaID float, 
	@GPID int,
	@RevOrgName varchar(250), 
	@AppPersonID int, 
	@RevPersonID int, 
	@RevFirstMiddleLast varchar(100),
	@RevLastFirstMiddle varchar(100),
	@AppFirstMiddleLast varchar(100),
	@AppLastFirstMiddle varchar(100),
	@RevCommID int, 
	@CommitteeName varchar(100),
	@RevCycleID int,
	@count int,
	@counter int

	
CREATE TABLE #t
(
	WftaID float,
	GPID int,
	RevOrgName varchar(250),
	AppPersonID int,
	RevPersonID int,
	RevFirstMiddleLast varchar(100),
	RevLastFirstMiddle varchar(100),
	AppFirstMiddleLast varchar(100),
	AppLastFirstMiddle varchar(100),
	RevCommID int,
	CommitteeName varchar(100),
	RevCycleID int
)

-- **************** ConflictCursor begins here ****************************
if @ReviewCommitteeID = -1
BEGIN -- ConflictCursor
	-- get reviewers, excluding dupes
	DECLARE ConflictCursor CURSOR FAST_FORWARD FOR	
	select distinct
		rcc.review_cycle_conflict_id as 'WftaID', 
		--RAND(10000) as 'WftaID',
		wfta.grantee_project_id as 'GPID',
		o.organization_name as 'RevOrgName',  
		rcc.app_person_id as  'AppPersonID', 
		ltrim(rtrim(p.name_first)) + ' ' + 
				CASE 
					WHEN p.name_middle = '' THEN '' 
					WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) + ' ' 
					ELSE '' 
				END 
				+ ltrim(rtrim(p.name_last)) AS 'AppFirstMiddleLast', 
				RTRIM(ltrim(rtrim(p.name_last)) + ', ' + ltrim(rtrim(p.name_first)) + ' ' +  
				CASE 
					WHEN p.name_middle = '' THEN '' 
					WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) 
					ELSE '' 
				END) AS 'AppLastFirstMiddle',
		rcc.rev_person_id  as 'RevPersonID', 
		ltrim(rtrim(revperson.name_first)) + ' ' + 
			CASE 
				WHEN revperson.name_middle = '' THEN '' 
				WHEN revperson.name_middle IS NOT NULL THEN ltrim(rtrim(revperson.name_middle)) + ' ' 
				ELSE '' 
			END 
			+ ltrim(rtrim(revperson.name_last)) AS 'RevFirstMiddleLast', 
			RTRIM(ltrim(rtrim(revperson.name_last)) + ', ' + ltrim(rtrim(revperson.name_first)) + ' ' +  
			CASE 
				WHEN revperson.name_middle = '' THEN '' 
				WHEN revperson.name_middle IS NOT NULL THEN ltrim(rtrim(revperson.name_middle)) 
				ELSE '' 
			END) AS 'RevLastFirstMiddle',
		rcc.rev_committee_id as 'RevCommID', 
		rc.description as 'CommitteeName',
		rcc.review_cycle_id as 'ReviewCycleID'
	from review_cycle_conflict rcc
		join wf_task_assignment as wfta on wfta.wf_task_assignment_id = rcc.wfta_id
		join review_cycle_project_task as rcpt on rcpt.review_cycle_id = rcc.review_cycle_id
		join PERSON p on p.person_id = rcc.app_person_id
		join PERSON revperson on revperson.person_id = rcc.rev_person_id
		left JOIN PERSON_ORGANIZATION_AFFILIATION po on revperson.person_id = po.person_id and po.is_primary = 1
		left JOIN ORGANIZATION o on po.organization_id = o.organization_id
		join a_wf_project_task as wfpt on wfpt.id = rcpt.project_task_id
		--join a_WF_PROJECT pj on pj.id = wfpt.wf_project_id
		--join a_COMPETITION c on c.id = pj.competition_id
		--join a_PROGRAM pg on pg.id = c.program_id
		join review_committee_member as rcm on rcm.review_committee_id = rcc.rev_committee_id
		join a_review_committee as rc on rc.id = rcc.rev_committee_id
	where rcc.wfta_id in (select wfta.wf_task_assignment_id from wf_task_assignment) 
		and rcc.review_cycle_id = @ReviewCycleID

	OPEN ConflictCursor	
	FETCH NEXT FROM ConflictCursor INTO @WftaID, @GPID, @RevOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
	
	WHILE (@@FETCH_STATUS=0)
	BEGIN
		--set WftaID = @counter + 1
		SELECT @count = count(*) from review_cycle_conflict where rev_person_id = @RevPersonID and review_cycle_id = @ReviewCycleID and rev_committee_id = @RevCommID	
		IF @count > 1
		BEGIN
			SET @WftaID = @WftaID + RAND(10000)

			INSERT INTO #t 
			(
				WftaID,
				GPID,
				RevOrgName,
				AppPersonID,
				AppFirstMiddleLast,
				AppLastFirstMiddle,
				RevPersonID,
				RevFirstMiddleLast,
				RevLastFirstMiddle,
				RevCommID,
				CommitteeName,
				RevCycleID
			)
			select distinct top 1
				rcc.review_cycle_conflict_id as 'WftaID', 
				wfta.grantee_project_id as 'GPID',
				--RAND(30000) as 'WftaID',
				o.organization_name as 'RevOrgName', 
				rcc.app_person_id as  'AppPersonID',
				ltrim(rtrim(p.name_first)) + ' ' + 
					CASE 
						WHEN p.name_middle = '' THEN '' 
						WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) + ' ' 
						ELSE '' 
					END 
					+ ltrim(rtrim(p.name_last)) AS 'AppFirstMiddleLast', 
					RTRIM(ltrim(rtrim(p.name_last)) + ', ' + ltrim(rtrim(p.name_first)) + ' ' +  
					CASE 
						WHEN p.name_middle = '' THEN '' 
						WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) 
						ELSE '' 
					END) AS 'AppLastFirstMiddle', 
				rcc.rev_person_id  as 'RevPersonID', 
				ltrim(rtrim(revperson.name_first)) + ' ' + 
					CASE 
						WHEN revperson.name_middle = '' THEN '' 
						WHEN revperson.name_middle IS NOT NULL THEN ltrim(rtrim(revperson.name_middle)) + ' ' 
						ELSE '' 
					END 
					+ ltrim(rtrim(revperson.name_last)) AS 'RevFirstMiddleLast', 
					RTRIM(ltrim(rtrim(revperson.name_last)) + ', ' + ltrim(rtrim(revperson.name_first)) + ' ' +  
					CASE 
						WHEN revperson.name_middle = '' THEN '' 
						WHEN revperson.name_middle IS NOT NULL THEN ltrim(rtrim(revperson.name_middle)) 
						ELSE '' 
					END) AS 'RevLastFirstMiddle',
				rcc.rev_committee_id as 'RevCommID', 
				rc.description as 'CommitteeName',
				rcc.review_cycle_id as 'ReviewCycleID'
			from review_cycle_conflict rcc
				join wf_task_assignment as wfta on wfta.wf_task_assignment_id = rcc.wfta_id
				join review_cycle_project_task as rcpt on rcpt.review_cycle_id = rcc.review_cycle_id
				join PERSON p on p.person_id = rcc.app_person_id
				join person as revperson on revperson.person_id = rcc.rev_person_id
				left JOIN PERSON_ORGANIZATION_AFFILIATION po on revperson.person_id = po.person_id and po.is_primary = 1
				left JOIN ORGANIZATION o on po.organization_id = o.organization_id
				join a_wf_project_task as wfpt on wfpt.id = rcpt.project_task_id
				--join a_WF_PROJECT pj on pj.id = wfpt.wf_project_id
				--join a_COMPETITION c on c.id = pj.competition_id
				--join a_PROGRAM pg on pg.id = c.program_id
				join review_committee_member as rcm on rcm.review_committee_id = rcc.rev_committee_id
				join a_review_committee as rc on rc.id = rcc.rev_committee_id
			where rev_person_id = @RevPersonID and rev_committee_id = @RevCommID
				and rcc.review_cycle_id = @ReviewCycleID
			
		END -- ConflictCursor if count

		if @count = 1
		BEGIN
			set @WftaID = @WftaID + RAND(20000)

			INSERT INTO #t 
			(
				WftaID,
				GPID,
				RevOrgName,
				AppPersonID,
				AppFirstMiddleLast,
				AppLastFirstMiddle,
				RevPersonID,
				RevFirstMiddleLast,
				RevLastFirstMiddle,
				RevCommID,
				CommitteeName,
				RevCycleID
			)
			VALUES
			( 
				@WftaID,
				@GPID,
				@RevOrgName, 
				@AppPersonID,
				@AppFirstMiddleLast,
				@AppLastFirstMiddle, 
				@RevPersonID, 
				@RevFirstMiddleLast,
				@RevLastFirstMiddle,
				@RevCommID,
				@CommitteeName,
				@ReviewCycleID
			)
		END

		FETCH NEXT FROM ConflictCursor into @WftaID, @GPID, @RevOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
	END -- ConflictCursor while
		
	CLOSE ConflictCursor
	DEALLOCATE  ConflictCursor
END

-- if ReviewCommitteeID <> -1
ELSE
BEGIN -- ConflictCursor
	-- get reviewers, excluding dupes
	DECLARE ConflictCursor CURSOR FAST_FORWARD FOR	
	select distinct
		rcc.review_cycle_conflict_id as 'WftaID', 
		--RAND(10000) as 'WftaID',
		wfta.grantee_project_id as 'GPID',
		o.organization_name as 'RevOrgName',
		rcc.app_person_id as  'AppPersonID', 
		ltrim(rtrim(p.name_first)) + ' ' + 
				CASE 
					WHEN p.name_middle = '' THEN '' 
					WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) + ' ' 
					ELSE '' 
				END 
				+ ltrim(rtrim(p.name_last)) AS 'AppFirstMiddleLast', 
				RTRIM(ltrim(rtrim(p.name_last)) + ', ' + ltrim(rtrim(p.name_first)) + ' ' +  
				CASE 
					WHEN p.name_middle = '' THEN '' 
					WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) 
					ELSE '' 
				END) AS 'AppLastFirstMiddle',

		rcc.rev_person_id  as 'RevPersonID', 
		ltrim(rtrim(revperson.name_first)) + ' ' + 
			CASE 
				WHEN revperson.name_middle = '' THEN '' 
				WHEN revperson.name_middle IS NOT NULL THEN ltrim(rtrim(revperson.name_middle)) + ' ' 
				ELSE '' 
			END 
			+ ltrim(rtrim(revperson.name_last)) AS 'RevFirstMiddleLast', 
			RTRIM(ltrim(rtrim(revperson.name_last)) + ', ' + ltrim(rtrim(revperson.name_first)) + ' ' +  
			CASE 
				WHEN revperson.name_middle = '' THEN '' 
				WHEN revperson.name_middle IS NOT NULL THEN ltrim(rtrim(revperson.name_middle)) 
				ELSE '' 
			END) AS 'RevLastFirstMiddle',
		rcc.rev_committee_id as 'RevCommID', 
		rc.description as 'CommitteeName',
		rcc.review_cycle_id as 'ReviewCycleID'
	from review_cycle_conflict rcc
		join wf_task_assignment as wfta on wfta.wf_task_assignment_id = rcc.wfta_id
		join review_cycle_project_task as rcpt on rcpt.review_cycle_id = rcc.review_cycle_id
		join PERSON p on p.person_id = rcc.app_person_id
		join person as revperson on revperson.person_id = rcc.rev_person_id
		left JOIN PERSON_ORGANIZATION_AFFILIATION po on revperson.person_id = po.person_id and po.is_primary = 1
		left JOIN ORGANIZATION o on po.organization_id = o.organization_id
		join a_wf_project_task as wfpt on wfpt.id = rcpt.project_task_id
		--join a_WF_PROJECT pj on pj.id = wfpt.wf_project_id
		--join a_COMPETITION c on c.id = pj.competition_id
		--join a_PROGRAM pg on pg.id = c.program_id
		join review_committee_member as rcm on rcm.review_committee_id = rcc.rev_committee_id
		join a_review_committee as rc on rc.id = rcc.rev_committee_id
	where rcc.wfta_id in (select wfta.wf_task_assignment_id from wf_task_assignment) 
		and rcc.review_cycle_id = @ReviewCycleID 
		and rcc.rev_committee_id = @ReviewCommitteeID

	OPEN ConflictCursor	
	FETCH NEXT FROM ConflictCursor INTO @WftaID, @GPID, @RevOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID

	WHILE (@@FETCH_STATUS=0)
	BEGIN
		--set WftaID = @counter + 1
		SELECT @count = count(*) from review_cycle_conflict where rev_person_id = @RevPersonID and review_cycle_id = @ReviewCycleID and rev_committee_id = @RevCommID	
		IF @count > 1
		BEGIN
			set @WftaID = @WftaID + RAND(10000)

			INSERT INTO #t 
			(
				WftaID,
				GPID,
				RevOrgName,
				AppPersonID,
				AppFirstMiddleLast,
				AppLastFirstMiddle,
				RevPersonID,
				RevFirstMiddleLast,
				RevLastFirstMiddle,
				RevCommID,
				CommitteeName,
				RevCycleID
			)
			select distinct top 1
				rcc.review_cycle_conflict_id as 'WftaID', 
				wfta.grantee_project_id as 'GPID',
				--RAND(30000) as 'WftaID',
				o.organization_name as 'RevOrgName',
				rcc.app_person_id as  'AppPersonID',
				ltrim(rtrim(p.name_first)) + ' ' + 
					CASE 
						WHEN p.name_middle = '' THEN '' 
						WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) + ' ' 
						ELSE '' 
					END 
					+ ltrim(rtrim(p.name_last)) AS 'AppFirstMiddleLast', 
					RTRIM(ltrim(rtrim(p.name_last)) + ', ' + ltrim(rtrim(p.name_first)) + ' ' +  
					CASE 
						WHEN p.name_middle = '' THEN '' 
						WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) 
						ELSE '' 
					END) AS 'AppLastFirstMiddle', 
				rcc.rev_person_id  as 'RevPersonID', 
				ltrim(rtrim(revperson.name_first)) + ' ' + 
					CASE 
						WHEN revperson.name_middle = '' THEN '' 

						WHEN revperson.name_middle IS NOT NULL THEN ltrim(rtrim(revperson.name_middle)) + ' ' 
						ELSE '' 
					END 
					+ ltrim(rtrim(revperson.name_last)) AS 'RevFirstMiddleLast', 
					RTRIM(ltrim(rtrim(revperson.name_last)) + ', ' + ltrim(rtrim(revperson.name_first)) + ' ' +  
					CASE 
						WHEN revperson.name_middle = '' THEN '' 
						WHEN revperson.name_middle IS NOT NULL THEN ltrim(rtrim(revperson.name_middle)) 
						ELSE '' 
					END) AS 'RevLastFirstMiddle',
				rcc.rev_committee_id as 'RevCommID', 
				rc.description as 'CommitteeName',
				rcc.review_cycle_id as 'ReviewCycleID'
			from review_cycle_conflict rcc
				join wf_task_assignment as wfta on wfta.wf_task_assignment_id = rcc.wfta_id
				join review_cycle_project_task as rcpt on rcpt.review_cycle_id = rcc.review_cycle_id
				join PERSON p on p.person_id = rcc.app_person_id
				join person as revperson on revperson.person_id = rcc.rev_person_id
				left JOIN PERSON_ORGANIZATION_AFFILIATION po on revperson.person_id = po.person_id and po.is_primary = 1
				left JOIN ORGANIZATION o on po.organization_id = o.organization_id
				join a_wf_project_task as wfpt on wfpt.id = rcpt.project_task_id
				--join a_WF_PROJECT pj on pj.id = wfpt.wf_project_id
				--join a_COMPETITION c on c.id = pj.competition_id
				--join a_PROGRAM pg on pg.id = c.program_id
				join review_committee_member as rcm on rcm.review_committee_id = rcc.rev_committee_id
				join a_review_committee as rc on rc.id = rcc.rev_committee_id
			where rev_person_id = @RevPersonID and rev_committee_id = @RevCommID
				and rcc.review_cycle_id = @ReviewCycleID 
				and rcc.rev_committee_id = @ReviewCommitteeID

		END -- ConflictCursor if count

		if @count = 1
		BEGIN
			set @WftaID = @WftaID + RAND(20000)
			INSERT INTO #t 
			(
				WftaID,
				GPID,
				RevOrgName,
				AppPersonID,
				AppFirstMiddleLast,
				AppLastFirstMiddle,
				RevPersonID,
				RevFirstMiddleLast,
				RevLastFirstMiddle,
				RevCommID,
				CommitteeName,
				RevCycleID
			)
			VALUES
			( 
				@WftaID,
				@GPID,
				@RevOrgName,
				@AppPersonID,
				@AppFirstMiddleLast,
				@AppLastFirstMiddle, 
				@RevPersonID, 
				@RevFirstMiddleLast,
				@RevLastFirstMiddle,
				@RevCommID,
				@CommitteeName,
				@ReviewCycleID
			)
		END

		FETCH NEXT FROM ConflictCursor into @WftaID, @GPID, @RevOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
		
	END -- ConflictCursor while
		
	CLOSE ConflictCursor
	DEALLOCATE  ConflictCursor
END

-- **************** RevCursor begins here *************************



-- **************** RevCursor begins here *************************


if @ReviewCommitteeID = -1
BEGIN
	-- get reviewers, who have no conflict records then add to temp table
	DECLARE RevCursor CURSOR FAST_FORWARD FOR
	
	-- reviewers for a review cycle
	select distinct 
		RAND(p.person_id) as 'WftaID', 
		'-1' as 'GPID',
		o.organization_name as 'RevOrgName',
		'-1' as 'AppPersonID',
		CASE WHEN rcom.person_id is not null THEN 'N/A' END as 'AppFirstMiddleLast', 
		CASE WHEN rcom.person_id is not null THEN 'N/A' END as 'AppLastFirstMiddle',
		rcom.person_id as 'RevPersonID', 
		ltrim(rtrim(p.name_first)) + ' ' + 
			CASE 
				WHEN p.name_middle = '' THEN '' 
				WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) + ' ' 
				ELSE '' 
			END 
			+ ltrim(rtrim(p.name_last)) AS 'RevFirstMiddleLast', 
			RTRIM(ltrim(rtrim(p.name_last)) + ', ' + ltrim(rtrim(p.name_first)) + ' ' +  
			CASE 
				WHEN p.name_middle = '' THEN '' 
				WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) 
				ELSE '' 
			END) AS 'RevLastFirstMiddle',
		rcc.review_committee_id as 'RevCommID',
		arc.description as 'CommitteeName', 
		rcc.review_cycle_id as 'ReviewCycleID' 
	from review_cycle_project_task_outcome rcpto
		join review_cycle_committee as rcc on rcpto.review_cycle_id = rcc.review_cycle_id
		join review_committee_member as rcom on rcom.review_committee_id = rcc.review_committee_id
		join a_review_committee as arc on arc.id = rcom.review_committee_id
		--join review_cycle_committee as rcc on rcpto.review_cycle_id = rcc.review_cycle_id
		--join review_cycle_conflict as rccon on rcpto.review_cycle_id = rccon.review_cycle_id
		--join review_cycle_conflict as rccon on rcpto.review_cycle_id = rccon.review_cycle_id
		--join wf_task_assignment as wfta on rcpto.task_id = wfta.wf_task_id and rcpto.task_outcome_id = wfta.wf_task_outcome_id
		--join grantee_project as gp on wfta.grantee_project_id = gp.grantee_project_id and rcpto.project_id = gp.wf_project_id
		join PERSON p on rcom.person_id = p.person_id
		left JOIN PERSON_ORGANIZATION_AFFILIATION po on p.person_id = po.person_id and po.is_primary = 1
		left JOIN ORGANIZATION o on po.organization_id = o.organization_id
		join a_WF_PROJECT pj on pj.id = rcpto.project_id
		join a_COMPETITION c on c.id = pj.competition_id
		join a_PROGRAM pg on pg.id = c.program_id
	where not exists (select * from review_cycle_conflict 
					where rcom.review_committee_id = rev_committee_id 
						and rcom.person_id = rev_person_id 
						and rcpto.review_cycle_id = review_cycle_id)
		and rcpto.review_cycle_id = @ReviewCycleID

	OPEN RevCursor
	FETCH NEXT FROM RevCursor into @WftaID, @GPID, @RevOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
	
	WHILE (@@FETCH_STATUS=0)
	BEGIN		
		set @WftaID = @WftaID + RAND(20000) + @RevCommID

		INSERT INTO #t 
		(
			WftaID,
			GPID,
			RevOrgName,
			AppPersonID,
			AppFirstMiddleLast, 
			AppLastFirstMiddle, 
			RevPersonID,
			RevFirstMiddleLast,
			RevLastFirstMiddle,
			RevCommID,
			CommitteeName,
			RevCycleID
		)
		VALUES
		( 
			@WftaID,
			@GPID,
			@RevOrgName, 
			@AppPersonID, 
			@AppFirstMiddleLast, 
			@AppLastFirstMiddle, 
			@RevPersonID, 
			@RevFirstMiddleLast,
			@RevLastFirstMiddle,
			@RevCommID,
			@CommitteeName,
			@ReviewCycleID
		)
					
		FETCH NEXT FROM RevCursor into @WftaID, @GPID, @RevOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
	END

	CLOSE RevCursor
	DEALLOCATE  RevCursor
END

-- if @ReviewCommitteeID <> -1
ELSE
-- **************** RevCursor begins here *************************

BEGIN
	-- get reviewers, who have no conflict records then add to temp table
	DECLARE RevCursor CURSOR FAST_FORWARD FOR
	
	-- reviewers for a review cycle
	select distinct 
		RAND(p.person_id) as 'WftaID', 
		'-1' as 'GPID',
		o.organization_name as 'RevOrgName',
		'-1' as 'AppPersonID',
		CASE WHEN rcom.person_id is not null THEN 'N/A' END as 'AppFirstMiddleLast', 
		CASE WHEN rcom.person_id is not null THEN 'N/A' END as 'AppLastFirstMiddle',
		rcom.person_id as 'RevPersonID', 
		ltrim(rtrim(p.name_first)) + ' ' + 
			CASE 
				WHEN p.name_middle = '' THEN '' 
				WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) + ' ' 
				ELSE '' 
			END 
			+ ltrim(rtrim(p.name_last)) AS 'RevFirstMiddleLast', 
			RTRIM(ltrim(rtrim(p.name_last)) + ', ' + ltrim(rtrim(p.name_first)) + ' ' +  
			CASE 
				WHEN p.name_middle = '' THEN '' 
				WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) 
				ELSE '' 
			END) AS 'RevLastFirstMiddle',
			rcc.review_committee_id as 'RevCommID',
			arc.description as 'CommitteeName', 
			rcc.review_cycle_id as 'ReviewCycleID' 
	from review_cycle_project_task_outcome rcpto
		join review_cycle_committee as rcc on rcpto.review_cycle_id = rcc.review_cycle_id
		join review_committee_member as rcom on rcom.review_committee_id = rcc.review_committee_id
		join a_review_committee as arc on arc.id = rcom.review_committee_id
		join PERSON p on rcom.person_id = p.person_id
		left JOIN PERSON_ORGANIZATION_AFFILIATION po on p.person_id = po.person_id and po.is_primary = 1
		left JOIN ORGANIZATION o on po.organization_id = o.organization_id
		--join a_WF_PROJECT pj on pj.id = rcpto.project_id
		--join a_COMPETITION c on c.id = pj.competition_id
		--join a_PROGRAM pg on pg.id = c.program_id
	where not exists (select * from review_cycle_conflict where rcom.review_committee_id = rev_committee_id 
		and rcom.person_id = rev_person_id and rcpto.review_cycle_id = review_cycle_id)
		and rcpto.review_cycle_id = @ReviewCycleID 
		and rcom.review_committee_id = @ReviewCommitteeID
	
	OPEN RevCursor
	FETCH NEXT FROM RevCursor into @WftaID, @GPID, @RevOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
	
	WHILE (@@FETCH_STATUS=0)
	BEGIN		
		set @WftaID = @WftaID + RAND(20000) + @RevCommID

		INSERT INTO #t 
		(
			WftaID,
			GPID,
			RevOrgName,
			AppPersonID,
			AppFirstMiddleLast, 
			AppLastFirstMiddle, 
			RevPersonID,
			RevFirstMiddleLast,
			RevLastFirstMiddle,
			RevCommID,
			CommitteeName,
			RevCycleID
		)
		VALUES
		( 
			@WftaID,
			@GPID,
			@RevOrgName, 
			@AppPersonID, 
			@AppFirstMiddleLast, 
			@AppLastFirstMiddle, 
			@RevPersonID, 
			@RevFirstMiddleLast,

			@RevLastFirstMiddle,
			@RevCommID,
			@CommitteeName,
			@ReviewCycleID
		)
		FETCH NEXT FROM RevCursor into @WftaID, @GPID, @RevOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
	END

	CLOSE RevCursor
	DEALLOCATE  RevCursor
END
--****************************** RevCursor ends here **************************************

select distinct
	WftaID, GPID, RevOrgName, AppPersonID, 
	AppFirstMiddleLast, AppLastFirstMiddle, 
	RevPersonID, RevFirstMiddleLast, RevLastFirstMiddle, 
	RevCommID, CommitteeName, RevCycleID 
from #t
order by CommitteeName, RevLastFirstMiddle
GO
/****** Object:  View [dbo].[vReviewConflicts]    Script Date: 10/09/2007 11:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vReviewConflicts]
AS
-- view to get all reviewers for an applicant for a particular committee for a review cycle
select distinct TOP 100 PERCENT 
	rcc.review_cycle_conflict_id,
	rcc.wfta_id,
	rcc.rev_person_id, 
	ltrim(rtrim(p.name_first)) + ' ' + 
		CASE 
			WHEN p.name_middle = '' THEN '' 
			WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) + ' ' 
			ELSE '' 
		END 
		+ ltrim(rtrim(p.name_last)) AS 'RevFirstMiddleLast', 
		RTRIM(ltrim(rtrim(p.name_last)) + ', ' + ltrim(rtrim(p.name_first)) + ' ' +  
		CASE 
			WHEN p.name_middle = '' THEN '' 
			WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) 
			ELSE '' 
		END) AS 'RevLastFirstMiddle',
	rcc.app_person_id,
	ltrim(rtrim(appPer.name_first)) + ' ' + 
		CASE 
			WHEN appPer.name_middle = '' THEN '' 
			WHEN appPer.name_middle IS NOT NULL THEN ltrim(rtrim(appPer.name_middle)) + ' ' 
			ELSE '' 
		END 
		+ ltrim(rtrim(appPer.name_last)) AS 'AppFirstMiddleLast', 
		RTRIM(ltrim(rtrim(appPer.name_last)) + ', ' + ltrim(rtrim(appPer.name_first)) + ' ' +  
		CASE 
			WHEN appPer.name_middle = '' THEN '' 
			WHEN appPer.name_middle IS NOT NULL THEN ltrim(rtrim(appPer.name_middle)) 
			ELSE '' 
		END) AS 'AppLastFirstMiddle',
		CASE
			WHEN rcc.request_conflict_id = 1 THEN RTRIM(ltrim(rtrim(appPer.name_last)) + ', ' + ltrim(rtrim(appPer.name_first)) + ' ' +  
			CASE 
				WHEN appPer.name_middle = '' THEN '' 
				WHEN appPer.name_middle IS NOT NULL THEN ltrim(rtrim(appPer.name_middle)) 
				ELSE '' 
			END)
			WHEN rcc.request_conflict_id = 3 THEN RTRIM(ltrim(rtrim(appPer.name_last)) + ', ' + ltrim(rtrim(appPer.name_first)) + ' ' +  
			CASE 
				WHEN appPer.name_middle = '' THEN '' 
				WHEN appPer.name_middle IS NOT NULL THEN ltrim(rtrim(appPer.name_middle)) 
				ELSE '' 
			END)
			WHEN rcc.request_conflict_id = 2 THEN RTRIM(ltrim(rtrim(appPer.name_last)) + ', ' + ltrim(rtrim(appPer.name_first)) + ' ' +  
			CASE 
				WHEN appPer.name_middle = '' THEN '' 
				WHEN appPer.name_middle IS NOT NULL THEN ltrim(rtrim(appPer.name_middle)) 
				ELSE '' 
			END)
		END as 'ConflictRequestAppPerson',
		CASE
			WHEN rcc.request_conflict_id = 1 THEN RTRIM(ltrim(rtrim(p.name_last)) + ', ' + ltrim(rtrim(p.name_first)) + ' ' +  
			CASE 
				WHEN p.name_middle = '' THEN '' 
				WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) 
				ELSE '' 
			END)
			WHEN rcc.request_conflict_id = 3 THEN RTRIM(ltrim(rtrim(p.name_last)) + ', ' + ltrim(rtrim(p.name_first)) + ' ' +  
			CASE 
				WHEN p.name_middle = '' THEN '' 
				WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) 
				ELSE '' 
			END)
			WHEN rcc.request_conflict_id = 2 THEN RTRIM(ltrim(rtrim(p.name_last)) + ', ' + ltrim(rtrim(p.name_first)) + ' ' +  
			CASE 
				WHEN p.name_middle = '' THEN '' 
				WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) 
				ELSE '' 
			END)
		END as 'ConflictRequestRevPerson',
	rcc.conflict_type_id, 
	rcc.request_conflict_id,
	rcc.rev_committee_id, 
	rcc.review_cycle_id
from review_cycle_conflict rcc
	join review_committee_member as rcm on rcm.review_committee_id = rcc.rev_committee_id
	join review_committee_member as rcm2 on rcm2.person_id = rcc.rev_person_id
	join person as p on p.person_id = rcm2.person_id
	join person as appPer on appPer.person_id = rcc.app_person_id
WHERE	request_conflict_id > 0
order by RevLastFirstMiddle asc
GO
/****** Object:  StoredProcedure [dbo].[spCONFLICTRESULTSBYAPP]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE             procedure [dbo].[spCONFLICTRESULTSBYAPP]
	(
		@ReviewCycleID INT
	)
AS
set nocount on



DECLARE

	@ResultsID int,
	@WftaID float, 
	@GPID int,
	@Consortia varchar(100), 
	@AppOrgName varchar(250), 
	@AppPersonID int, 
	@RevPersonID int, 
	@RevFirstMiddleLast varchar(100),
	@RevLastFirstMiddle varchar(100),
	@AppFirstMiddleLast varchar(100),
	@AppLastFirstMiddle varchar(100),
	@RevCommID int, 
	@CommitteeName varchar(100),
	@RevCycleID int,
	@count int,
	@counter int
	
	CREATE TABLE #t
		(
		WftaID float,
		GPID int,
		Consortia varchar(100),
		AppOrgName varchar(250),
		AppPersonID int,
		RevPersonID int,
		RevFirstMiddleLast varchar(100),
		RevLastFirstMiddle varchar(100),
		AppFirstMiddleLast varchar(100),
		AppLastFirstMiddle varchar(100),
		RevCommID int,
		CommitteeName varchar(100),
		RevCycleID int
		)


-- **************** ConflictCursor begins here ****************************

BEGIN -- ConflictCursor

	-- get reviewers, excluding dupes
		DECLARE ConflictCursor SCROLL CURSOR FOR
			
		
		select distinct
			rcc.review_cycle_conflict_id as 'WftaID', 
			--RAND(10000) as 'WftaID',
			wfta.grantee_project_id as 'GPID',
			consort.description as 'Consortia',  
			o.organization_name as 'AppOrgName', 
			rcc.app_person_id as  'AppPersonID', 
			ltrim(rtrim(p.name_first)) + ' ' + 
					CASE 
						WHEN p.name_middle = '' THEN '' 
						WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) + ' ' 
						ELSE '' 
					END 
					+ ltrim(rtrim(p.name_last)) AS 'AppFirstMiddleLast', 
					RTRIM(ltrim(rtrim(p.name_last)) + ', ' + ltrim(rtrim(p.name_first)) + ' ' +  
					CASE 
						WHEN p.name_middle = '' THEN '' 
						WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) 
						ELSE '' 
					END) AS 'AppLastFirstMiddle',
			rcc.rev_person_id  as 'RevPersonID', 
			ltrim(rtrim(revperson.name_first)) + ' ' + 
				CASE 
					WHEN revperson.name_middle = '' THEN '' 
					WHEN revperson.name_middle IS NOT NULL THEN ltrim(rtrim(revperson.name_middle)) + ' ' 
					ELSE '' 
				END 
				+ ltrim(rtrim(revperson.name_last)) AS 'RevFirstMiddleLast', 
				RTRIM(ltrim(rtrim(revperson.name_last)) + ', ' + ltrim(rtrim(revperson.name_first)) + ' ' +  
				CASE 
					WHEN revperson.name_middle = '' THEN '' 
					WHEN revperson.name_middle IS NOT NULL THEN ltrim(rtrim(revperson.name_middle)) 
					ELSE '' 
				END) AS 'RevLastFirstMiddle',
			rcc.rev_committee_id as 'RevCommID', 
			rc.description as 'CommitteeName',
			rcc.review_cycle_id as 'ReviewCycleID'
		
		from review_cycle_conflict rcc
		
			join wf_task_assignment as wfta on wfta.wf_task_assignment_id = rcc.wfta_id
			--join grantee_project as gp on gp.grantee_project_id = wfta.grantee_project_id
			--join review_cycle_stage as rcs on rcs.review_cycle_id = rcc.review_cycle_id
			join review_cycle_project_task_outcome as rcpto on wfta.wf_task_id = rcpto.task_id and wfta.wf_task_outcome_id = rcpto.task_outcome_id
			join review_cycle_project_task as rcpt on rcpt.review_cycle_id = rcc.review_cycle_id
			join PERSON p on p.person_id = rcc.app_person_id
			left JOIN PERSON_ORGANIZATION_AFFILIATION po on p.person_id = po.person_id and po.is_primary = 1
			left JOIN ORGANIZATION o on po.organization_id = o.organization_id
			join a_wf_project_task as wfpt on wfpt.id = rcpt.project_task_id
			join a_WF_PROJECT pj on pj.id = wfpt.wf_project_id
			join a_COMPETITION c on c.id = pj.competition_id
			join a_PROGRAM pg on pg.id = c.program_id
			join c_consortia as consort on consort.id = pg.consortia_id
			--join review_committee_member as rcm on rcm.review_committee_id = rcc.rev_committee_id
			join a_review_committee as rc on rc.id = rcc.rev_committee_id
			join review_cycle_committee as rcm on rcc.rev_committee_id = rcm.review_committee_id and rcc.review_cycle_id = rcm.review_cycle_id
			join person as revperson on revperson.person_id = rcc.rev_person_id
		
		
		
		where rcc.review_cycle_id = @ReviewCycleID

-- exec sp_cursor_test @ReviewCycleID = 82
	
	OPEN ConflictCursor	
		FETCH NEXT FROM ConflictCursor INTO @WftaID, @GPID, @Consortia, @AppOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
			WHILE (@@FETCH_STATUS=0)
				BEGIN
					
					
					--set WftaID = @counter + 1
					SELECT @count = count(*) from review_cycle_conflict where app_person_id = @AppPersonID and review_cycle_id = @ReviewCycleID and rev_committee_id = @RevCommID	
					IF @count > 1
						BEGIN
							set @WftaID = @WftaID + RAND(10000)
							DECLARE DupedCursor SCROLL CURSOR FOR
			
							select distinct
									rcc.review_cycle_conflict_id as 'WftaID', 
									wfta.grantee_project_id as 'GPID',
									--RAND(30000) as 'WftaID',
									consort.description as 'Consortia',  
									o.organization_name as 'AppOrgName', 
									rcc.app_person_id as  'AppPersonID',
									ltrim(rtrim(p.name_first)) + ' ' + 
										CASE 
											WHEN p.name_middle = '' THEN '' 
											WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) + ' ' 
											ELSE '' 
										END 
										+ ltrim(rtrim(p.name_last)) AS 'AppFirstMiddleLast', 
										RTRIM(ltrim(rtrim(p.name_last)) + ', ' + ltrim(rtrim(p.name_first)) + ' ' +  
										CASE 
											WHEN p.name_middle = '' THEN '' 
											WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) 
											ELSE '' 
										END) AS 'AppLastFirstMiddle', 
									rcc.rev_person_id  as 'RevPersonID', 
									ltrim(rtrim(revperson.name_first)) + ' ' + 
										CASE 
											WHEN revperson.name_middle = '' THEN '' 
											WHEN revperson.name_middle IS NOT NULL THEN ltrim(rtrim(revperson.name_middle)) + ' ' 
											ELSE '' 
										END 
										+ ltrim(rtrim(revperson.name_last)) AS 'RevFirstMiddleLast', 
										RTRIM(ltrim(rtrim(revperson.name_last)) + ', ' + ltrim(rtrim(revperson.name_first)) + ' ' +  
										CASE 
											WHEN revperson.name_middle = '' THEN '' 
											WHEN revperson.name_middle IS NOT NULL THEN ltrim(rtrim(revperson.name_middle)) 
											ELSE '' 
										END) AS 'RevLastFirstMiddle',
									rcc.rev_committee_id as 'RevCommID', 
									rc.description as 'CommitteeName',
									rcc.review_cycle_id as 'ReviewCycleID'
								
								from review_cycle_conflict rcc
								
			join wf_task_assignment as wfta on wfta.wf_task_assignment_id = rcc.wfta_id
			--join grantee_project as gp on gp.grantee_project_id = wfta.grantee_project_id
			--join review_cycle_stage as rcs on rcs.review_cycle_id = rcc.review_cycle_id
			join review_cycle_project_task_outcome as rcpto on wfta.wf_task_id = rcpto.task_id and wfta.wf_task_outcome_id = rcpto.task_outcome_id
			join review_cycle_project_task as rcpt on rcpt.review_cycle_id = rcc.review_cycle_id
			join PERSON p on p.person_id = rcc.app_person_id
			left JOIN PERSON_ORGANIZATION_AFFILIATION po on p.person_id = po.person_id and po.is_primary = 1
			left JOIN ORGANIZATION o on po.organization_id = o.organization_id
			join a_wf_project_task as wfpt on wfpt.id = rcpt.project_task_id
			join a_WF_PROJECT pj on pj.id = wfpt.wf_project_id
			join a_COMPETITION c on c.id = pj.competition_id
			join a_PROGRAM pg on pg.id = c.program_id
			join c_consortia as consort on consort.id = pg.consortia_id
			--join review_committee_member as rcm on rcm.review_committee_id = rcc.rev_committee_id
			join a_review_committee as rc on rc.id = rcc.rev_committee_id
			join review_cycle_committee as rcm on rcc.rev_committee_id = rcm.review_committee_id and rcc.review_cycle_id = rcm.review_cycle_id
			join person as revperson on revperson.person_id = rcc.rev_person_id
		
								
								
								where app_person_id = @AppPersonID and rev_committee_id = @RevCommID
									and rcc.review_cycle_id = @ReviewCycleID
 
								--select app_person_id, review_cycle_id, rev_committee_id from review_cycle_conflict where app_person_id = @AppPersonID and review_cycle_id = @ReviewCycleID and rev_committee_id = @RevCommID
									--group by app_person_id, review_cycle_id, rev_committee_id

							OPEN DupedCursor
							FETCH FIRST FROM DupedCursor into @WftaID, @GPID, @Consortia, @AppOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
	
								--WHILE (@@FETCH_STATUS=0)
									--BEGIN
									INSERT INTO #t 
										(
										WftaID,
										GPID,
										Consortia,
										AppOrgName,
										AppPersonID,
										AppFirstMiddleLast,
										AppLastFirstMiddle,
										RevPersonID,
										RevFirstMiddleLast,
										RevLastFirstMiddle,
										RevCommID,
										CommitteeName,
										RevCycleID
										)
										VALUES
										( 
											@WftaID,
											@GPID,
											@Consortia, 
											@AppOrgName, 
											@AppPersonID,
											@AppFirstMiddleLast,
											@AppLastFirstMiddle, 
											@RevPersonID, 
											@RevFirstMiddleLast,
											@RevLastFirstMiddle,
											@RevCommID,
											@CommitteeName,
											@ReviewCycleID
										)
									--FETCH LAST FROM DupedCursor into @WftaID, @Consortia, @AppOrgName, @AppPersonID, @RevPersonID, @RevCommID, @ReviewCycleID
									--END --closes DupedCursor While for if count
							CLOSE DupedCursor
							DEALLOCATE  DupedCursor
						END -- ConflictCursor if count
					if @count = 1
						BEGIN
							set @WftaID = @WftaID + RAND(20000)
							--FETCH NEXT FROM ConflictCursor into @WftaID, @Consortia, @AppOrgName, @AppPersonID, @RevPersonID, @RevCommID, @ReviewCycleID
	
								--WHILE (@@FETCH_STATUS=0)
									--BEGIN
									INSERT INTO #t 
										(
										WftaID,
										GPID,
										Consortia,
										AppOrgName,
										AppPersonID,
										AppFirstMiddleLast,
										AppLastFirstMiddle,
										RevPersonID,
										RevFirstMiddleLast,
										RevLastFirstMiddle,
										RevCommID,
										CommitteeName,
										RevCycleID
										)
										VALUES
										( 
											@WftaID,
											@GPID,
											@Consortia, 
											@AppOrgName, 
											@AppPersonID,
											@AppFirstMiddleLast,
											@AppLastFirstMiddle, 
											@RevPersonID, 
											@RevFirstMiddleLast,
											@RevLastFirstMiddle,
											@RevCommID,
											@CommitteeName,
											@ReviewCycleID
										)						
						END
						
				


						FETCH NEXT FROM ConflictCursor into @WftaID, @GPID, @Consortia, @AppOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
				
				END -- ConflictCursor while
		
CLOSE ConflictCursor
DEALLOCATE  ConflictCursor

END -- ConflictCursor

--***************** ConflictCursor ends here **********************






-- **************** AppCursor begins here *************************

BEGIN
		-- get applicants, who have no conflict records then add to temp table
		DECLARE AppCursor SCROLL CURSOR FOR
				select distinct	
				wfta.wf_task_assignment_id as 'WftaID', 
				wfta.grantee_project_id as 'GPID',
				--consort.description as 'Consortia',
				o.organization_name as 'AppOrgName', 
				wfta.person_id as 'AppPersonID',
				ltrim(rtrim(p.name_first)) + ' ' + 
					CASE 
						WHEN p.name_middle = '' THEN '' 
						WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) + ' ' 
						ELSE '' 
					END 
					+ ltrim(rtrim(p.name_last)) AS 'AppFirstMiddleLast', 
					RTRIM(ltrim(rtrim(p.name_last)) + ', ' + ltrim(rtrim(p.name_first)) + ' ' +  
					CASE 
						WHEN p.name_middle = '' THEN '' 
						WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) 
						ELSE '' 
					END) AS 'AppLastFirstMiddle',
				'-1' as 'RevPersonID',
				CASE WHEN wfta.person_id is not null THEN 'N/A' END as 'RevFirstMiddleLast', 
				CASE WHEN wfta.person_id is not null THEN 'N/A' END as 'RevLastFirstMiddle',
				'-1' as 'RevCommID',
				CASE WHEN wfta.person_id is not null THEN 'N/A' END as 'CommitteeName',
				rcpto.review_cycle_id as 'ReviewCycleID'
			
				--rccon.review_cycle_conflict_id,
				--rccon.app_person_id,
				--rccon.wfta_id
			
			from review_cycle_project_task_outcome rcpto
				join review_cycle_project_task as rcpt on rcpto.review_cycle_id = rcpt.review_cycle_id
				join review_cycle_committee as rcc on rcpt.review_cycle_id = rcc.review_cycle_id
				--join review_cycle_committee as rcc on rcpto.review_cycle_id = rcc.review_cycle_id
				--join review_cycle_conflict as rccon on rcpto.review_cycle_id = rccon.review_cycle_id
				--join review_cycle_conflict as rccon on rcpto.review_cycle_id = rccon.review_cycle_id
				join wf_task_assignment as wfta on rcpto.task_id = wfta.wf_task_id and rcpto.task_outcome_id = wfta.wf_task_outcome_id
				join grantee_project as gp on wfta.grantee_project_id = gp.grantee_project_id and rcpto.project_id = gp.wf_project_id
				
				join PERSON p on p.person_id = wfta.person_id
				left JOIN PERSON_ORGANIZATION_AFFILIATION po on p.person_id = po.person_id and po.is_primary = 1
				left JOIN ORGANIZATION o on po.organization_id = o.organization_id
				--join a_WF_PROJECT pj on pj.id = rcpto.project_id
				--join a_COMPETITION c on c.id = pj.competition_id
				--join a_PROGRAM pg on pg.id = c.program_id
				--join c_consortia as consort on consort.id = pg.consortia_id
				

			where  not exists (select * from review_cycle_conflict where --rcc.review_committee_id = rev_committee_id 
				wfta.person_id = app_person_id and review_cycle_id = @ReviewCycleID)
				and rcpto.review_cycle_id = @ReviewCycleID
	
		OPEN AppCursor
		FETCH NEXT FROM AppCursor into @WftaID, @GPID, /*@Consortia,*/ @AppOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
		WHILE (@@FETCH_STATUS=0)
		BEGIN		


		INSERT INTO #t 
				(
				WftaID,
				GPID,
				Consortia,
				AppOrgName,
				AppPersonID,
				AppFirstMiddleLast, 
				AppLastFirstMiddle, 
				RevPersonID,
				RevFirstMiddleLast,
				RevLastFirstMiddle,
				RevCommID,
				CommitteeName,
				RevCycleID
				)
				VALUES
				( 
					@WftaID,
					@GPID,
					@Consortia, 
					@AppOrgName, 
					@AppPersonID, 
					@AppFirstMiddleLast, 
					@AppLastFirstMiddle, 
					@RevPersonID, 
					@RevFirstMiddleLast,
					@RevLastFirstMiddle,
					@RevCommID,
					@CommitteeName,
					@ReviewCycleID
				)
					
				--FROM review_cycle_proj 
		
		FETCH NEXT FROM AppCursor into @WftaID, @GPID, /*@Consortia,*/ @AppOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
	
		END

END
CLOSE AppCursor
DEALLOCATE  AppCursor


--****************************** AppCursor ends here **************************************




select distinct TOP 100 PERCENT  WftaID, GPID, Consortia, AppOrgname, AppPersonID, AppFirstMiddleLast, AppLastFirstMiddle, RevPersonID, RevFirstMiddleLast, RevLastFirstMiddle, RevCommID, CommitteeName, RevCycleID from #t

order by AppLastFirstMiddle, RevLastFirstMiddle

return

-- exec spConflictResultsByApp @ReviewCycleID = 26
GO
/****** Object:  StoredProcedure [dbo].[spBYAPPTEST]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE          procedure [dbo].[spBYAPPTEST]
	(
		@ReviewCycleID INT
	)
AS
set nocount on

DECLARE

	@ResultsID int,
	@WftaID float, 
	@GPID int,
	@Consortia varchar(100), 
	@AppOrgName varchar(250), 
	@AppPersonID int, 
	@RevPersonID int, 
	@RevFirstMiddleLast varchar(100),
	@RevLastFirstMiddle varchar(100),
	@AppFirstMiddleLast varchar(100),
	@AppLastFirstMiddle varchar(100),
	@RevCommID int, 
	@CommitteeName varchar(100),
	@RevCycleID int,
	@count int,
	@counter int
	
	CREATE TABLE #t
		(
		WftaID float,
		GPID int,
		Consortia varchar(100),
		AppOrgName varchar(250),
		AppPersonID int,
		RevPersonID int,
		RevFirstMiddleLast varchar(100),
		RevLastFirstMiddle varchar(100),
		AppFirstMiddleLast varchar(100),
		AppLastFirstMiddle varchar(100),
		RevCommID int,
		CommitteeName varchar(100),
		RevCycleID int
		)


-- **************** ConflictCursor begins here ****************************

BEGIN -- ConflictCursor

	-- get reviewers, excluding dupes
		DECLARE ConflictCursor SCROLL CURSOR FOR
			
		
		select distinct
			rcc.review_cycle_conflict_id as 'WftaID', 
			--RAND(10000) as 'WftaID',
			wfta.grantee_project_id as 'GPID',
			consort.description as 'Consortia',  
			o.organization_name as 'AppOrgName', 
			rcc.app_person_id as  'AppPersonID', 
			ltrim(rtrim(p.name_first)) + ' ' + 
					CASE 
						WHEN p.name_middle = '' THEN '' 
						WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) + ' ' 
						ELSE '' 
					END 
					+ ltrim(rtrim(p.name_last)) AS 'AppFirstMiddleLast', 
					RTRIM(ltrim(rtrim(p.name_last)) + ', ' + ltrim(rtrim(p.name_first)) + ' ' +  
					CASE 
						WHEN p.name_middle = '' THEN '' 
						WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) 
						ELSE '' 
					END) AS 'AppLastFirstMiddle',
			rcc.rev_person_id  as 'RevPersonID', 
			ltrim(rtrim(revperson.name_first)) + ' ' + 
				CASE 
					WHEN revperson.name_middle = '' THEN '' 
					WHEN revperson.name_middle IS NOT NULL THEN ltrim(rtrim(revperson.name_middle)) + ' ' 
					ELSE '' 
				END 
				+ ltrim(rtrim(revperson.name_last)) AS 'RevFirstMiddleLast', 
				RTRIM(ltrim(rtrim(revperson.name_last)) + ', ' + ltrim(rtrim(revperson.name_first)) + ' ' +  
				CASE 
					WHEN revperson.name_middle = '' THEN '' 
					WHEN revperson.name_middle IS NOT NULL THEN ltrim(rtrim(revperson.name_middle)) 
					ELSE '' 
				END) AS 'RevLastFirstMiddle',
			rcc.rev_committee_id as 'RevCommID', 
			rc.description as 'CommitteeName',
			rcc.review_cycle_id as 'ReviewCycleID'
		
		from review_cycle_conflict rcc
		
			join wf_task_assignment as wfta on wfta.wf_task_assignment_id = rcc.wfta_id
			--join grantee_project as gp on gp.grantee_project_id = wfta.grantee_project_id
			--join review_cycle_stage as rcs on rcs.review_cycle_id = rcc.review_cycle_id
			join review_cycle_project_task as rcpt on rcpt.review_cycle_id = rcc.review_cycle_id
			join PERSON p on p.person_id = rcc.app_person_id
			left JOIN PERSON_ORGANIZATION_AFFILIATION po on p.person_id = po.person_id and po.is_primary = 1
			left JOIN ORGANIZATION o on po.organization_id = o.organization_id
			join a_wf_project_task as wfpt on wfpt.id = rcpt.project_task_id
			join a_WF_PROJECT pj on pj.id = wfpt.wf_project_id
			join a_COMPETITION c on c.id = pj.competition_id
			join a_PROGRAM pg on pg.id = c.program_id
			join c_consortia as consort on consort.id = pg.consortia_id
			--join review_committee_member as rcm on rcm.review_committee_id = rcc.rev_committee_id
			join a_review_committee as rc on rc.id = rcc.rev_committee_id
			join review_cycle_committee as rcm on rcc.rev_committee_id = rcm.review_committee_id and rcc.review_cycle_id = rcm.review_cycle_id
			join person as revperson on revperson.person_id = rcc.rev_person_id
		
		
		where rcc.review_cycle_id = @ReviewCycleID

-- exec sp_cursor_test @ReviewCycleID = 82
	
	OPEN ConflictCursor	
		FETCH NEXT FROM ConflictCursor INTO @WftaID, @GPID, @Consortia, @AppOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
			WHILE (@@FETCH_STATUS=0)
				BEGIN
					
					
					--set WftaID = @counter + 1
					SELECT @count = count(*) from review_cycle_conflict where app_person_id = @AppPersonID and review_cycle_id = @ReviewCycleID and rev_committee_id = @RevCommID	
					IF @count > 1
						BEGIN
							set @WftaID = @WftaID + RAND(10000)
							DECLARE DupedCursor SCROLL CURSOR FOR
			
							select distinct
									rcc.review_cycle_conflict_id as 'WftaID', 
									wfta.grantee_project_id as 'GPID',
									--RAND(30000) as 'WftaID',
									consort.description as 'Consortia',  
									o.organization_name as 'AppOrgName', 
									rcc.app_person_id as  'AppPersonID',
									ltrim(rtrim(p.name_first)) + ' ' + 
										CASE 
											WHEN p.name_middle = '' THEN '' 
											WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) + ' ' 
											ELSE '' 
										END 
										+ ltrim(rtrim(p.name_last)) AS 'AppFirstMiddleLast', 
										RTRIM(ltrim(rtrim(p.name_last)) + ', ' + ltrim(rtrim(p.name_first)) + ' ' +  
										CASE 
											WHEN p.name_middle = '' THEN '' 
											WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) 
											ELSE '' 
										END) AS 'AppLastFirstMiddle', 
									rcc.rev_person_id  as 'RevPersonID', 
									ltrim(rtrim(revperson.name_first)) + ' ' + 
										CASE 
											WHEN revperson.name_middle = '' THEN '' 
											WHEN revperson.name_middle IS NOT NULL THEN ltrim(rtrim(revperson.name_middle)) + ' ' 
											ELSE '' 
										END 
										+ ltrim(rtrim(revperson.name_last)) AS 'RevFirstMiddleLast', 
										RTRIM(ltrim(rtrim(revperson.name_last)) + ', ' + ltrim(rtrim(revperson.name_first)) + ' ' +  
										CASE 
											WHEN revperson.name_middle = '' THEN '' 
											WHEN revperson.name_middle IS NOT NULL THEN ltrim(rtrim(revperson.name_middle)) 
											ELSE '' 
										END) AS 'RevLastFirstMiddle',
									rcc.rev_committee_id as 'RevCommID', 
									rc.description as 'CommitteeName',
									rcc.review_cycle_id as 'ReviewCycleID'
								
								from review_cycle_conflict rcc
								
									join wf_task_assignment as wfta on wfta.wf_task_assignment_id = rcc.wfta_id
			--join grantee_project as gp on gp.grantee_project_id = wfta.grantee_project_id
			--join review_cycle_stage as rcs on rcs.review_cycle_id = rcc.review_cycle_id
			join review_cycle_project_task as rcpt on rcpt.review_cycle_id = rcc.review_cycle_id
			join PERSON p on p.person_id = rcc.app_person_id
			left JOIN PERSON_ORGANIZATION_AFFILIATION po on p.person_id = po.person_id and po.is_primary = 1
			left JOIN ORGANIZATION o on po.organization_id = o.organization_id
			join a_wf_project_task as wfpt on wfpt.id = rcpt.project_task_id
			join a_WF_PROJECT pj on pj.id = wfpt.wf_project_id
			join a_COMPETITION c on c.id = pj.competition_id
			join a_PROGRAM pg on pg.id = c.program_id
			join c_consortia as consort on consort.id = pg.consortia_id
			--join review_committee_member as rcm on rcm.review_committee_id = rcc.rev_committee_id
			join a_review_committee as rc on rc.id = rcc.rev_committee_id
			join review_cycle_committee as rcm on rcc.rev_committee_id = rcm.review_committee_id and rcc.review_cycle_id = rcm.review_cycle_id
			join person as revperson on revperson.person_id = rcc.rev_person_id
								
								
								where app_person_id = @AppPersonID and rev_committee_id = @RevCommID
									and rcc.review_cycle_id = @ReviewCycleID
 
								--select app_person_id, review_cycle_id, rev_committee_id from review_cycle_conflict where app_person_id = @AppPersonID and review_cycle_id = @ReviewCycleID and rev_committee_id = @RevCommID
									--group by app_person_id, review_cycle_id, rev_committee_id

							OPEN DupedCursor
							FETCH FIRST FROM DupedCursor into @WftaID, @GPID, @Consortia, @AppOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
	
								--WHILE (@@FETCH_STATUS=0)
									--BEGIN
									INSERT INTO #t 
										(
										WftaID,
										GPID,
										Consortia,
										AppOrgName,
										AppPersonID,
										AppFirstMiddleLast,
										AppLastFirstMiddle,
										RevPersonID,
										RevFirstMiddleLast,
										RevLastFirstMiddle,
										RevCommID,
										CommitteeName,
										RevCycleID
										)
										VALUES
										( 
											@WftaID,
											@GPID,
											@Consortia, 
											@AppOrgName, 
											@AppPersonID,
											@AppFirstMiddleLast,
											@AppLastFirstMiddle, 
											@RevPersonID, 
											@RevFirstMiddleLast,
											@RevLastFirstMiddle,
											@RevCommID,
											@CommitteeName,
											@ReviewCycleID
										)
									--FETCH LAST FROM DupedCursor into @WftaID, @Consortia, @AppOrgName, @AppPersonID, @RevPersonID, @RevCommID, @ReviewCycleID
									--END --closes DupedCursor While for if count
							CLOSE DupedCursor
							DEALLOCATE  DupedCursor
						END -- ConflictCursor if count
					if @count = 1
						BEGIN
							set @WftaID = @WftaID + RAND(20000)
							--FETCH NEXT FROM ConflictCursor into @WftaID, @Consortia, @AppOrgName, @AppPersonID, @RevPersonID, @RevCommID, @ReviewCycleID
	
								--WHILE (@@FETCH_STATUS=0)
									--BEGIN
									INSERT INTO #t 
										(
										WftaID,
										GPID,
										Consortia,
										AppOrgName,
										AppPersonID,
										AppFirstMiddleLast,
										AppLastFirstMiddle,
										RevPersonID,
										RevFirstMiddleLast,
										RevLastFirstMiddle,
										RevCommID,
										CommitteeName,
										RevCycleID
										)
										VALUES
										( 
											@WftaID,
											@GPID,
											@Consortia, 
											@AppOrgName, 
											@AppPersonID,
											@AppFirstMiddleLast,
											@AppLastFirstMiddle, 
											@RevPersonID, 
											@RevFirstMiddleLast,
											@RevLastFirstMiddle,
											@RevCommID,
											@CommitteeName,
											@ReviewCycleID
										)						
						END
						
				


						FETCH NEXT FROM ConflictCursor into @WftaID, @GPID, @Consortia, @AppOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
				
				END -- ConflictCursor while
		
CLOSE ConflictCursor
DEALLOCATE  ConflictCursor

END -- ConflictCursor

--***************** ConflictCursor ends here **********************






-- **************** AppCursor begins here *************************

BEGIN
		-- get applicants, who have no conflict records then add to temp table
		DECLARE AppCursor SCROLL CURSOR FOR
			select distinct	
				wfta.wf_task_assignment_id as 'WftaID', 
				wfta.grantee_project_id as 'GPID',
				consort.description as 'Consortia',
				o.organization_name as 'AppOrgName', 
				wfta.person_id as 'AppPersonID',
				ltrim(rtrim(p.name_first)) + ' ' + 
					CASE 
						WHEN p.name_middle = '' THEN '' 
						WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) + ' ' 
						ELSE '' 
					END 
					+ ltrim(rtrim(p.name_last)) AS 'AppFirstMiddleLast', 
					RTRIM(ltrim(rtrim(p.name_last)) + ', ' + ltrim(rtrim(p.name_first)) + ' ' +  
					CASE 
						WHEN p.name_middle = '' THEN '' 
						WHEN p.name_middle IS NOT NULL THEN ltrim(rtrim(p.name_middle)) 
						ELSE '' 
					END) AS 'AppLastFirstMiddle',
				'-1' as 'RevPersonID',
				CASE WHEN wfta.person_id is not null THEN 'N/A' END as 'RevFirstMiddleLast', 
				CASE WHEN wfta.person_id is not null THEN 'N/A' END as 'RevLastFirstMiddle',
				'-1' as 'RevCommID',
				CASE WHEN wfta.person_id is not null THEN 'N/A' END as 'CommitteeName',
				rcpto.review_cycle_id as 'ReviewCycleID'
			
				--rccon.review_cycle_conflict_id,
				--rccon.app_person_id,
				--rccon.wfta_id
			
			from review_cycle_project_task_outcome rcpto
			
				join review_cycle_committee as rcc on rcpto.review_cycle_id = rcc.review_cycle_id
				--join review_cycle_conflict as rccon on rcpto.review_cycle_id = rccon.review_cycle_id
				--join review_cycle_conflict as rccon on rcpto.review_cycle_id = rccon.review_cycle_id
				join wf_task_assignment as wfta on rcpto.task_id = wfta.wf_task_id
				join grantee_project as gp on wfta.grantee_project_id = gp.grantee_project_id and rcpto.project_id = gp.wf_project_id
				
				join PERSON p on p.person_id = wfta.person_id
				left JOIN PERSON_ORGANIZATION_AFFILIATION po on p.person_id = po.person_id and po.is_primary = 1
				left JOIN ORGANIZATION o on po.organization_id = o.organization_id
				join a_WF_PROJECT pj on pj.id = rcpto.project_id
				join a_COMPETITION c on c.id = pj.competition_id
				join a_PROGRAM pg on pg.id = c.program_id
				join c_consortia as consort on consort.id = pg.consortia_id
				

			where not exists (select * from review_cycle_conflict where rcc.review_committee_id = rev_committee_id 
			and wfta.person_id = app_person_id)
			--and rccon.app_person_id = gp.primary_person_id
			and 
rcpto.review_cycle_id = @ReviewCycleID
	
		OPEN AppCursor
		FETCH NEXT FROM AppCursor into @WftaID, @GPID, @Consortia, @AppOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
		WHILE (@@FETCH_STATUS=0)
		BEGIN		


		INSERT INTO #t 
				(
				WftaID,
				GPID,
				Consortia,
				AppOrgName,
				AppPersonID,
				AppFirstMiddleLast, 
				AppLastFirstMiddle, 
				RevPersonID,
				RevFirstMiddleLast,
				RevLastFirstMiddle,
				RevCommID,
				CommitteeName,
				RevCycleID
				)
				VALUES
				( 
					@WftaID,
					@GPID,
					@Consortia, 
					@AppOrgName, 
					@AppPersonID, 
					@AppFirstMiddleLast, 
					@AppLastFirstMiddle, 
					@RevPersonID, 
					@RevFirstMiddleLast,
					@RevLastFirstMiddle,
					@RevCommID,
					@CommitteeName,
					@ReviewCycleID
				)
					
				--FROM review_cycle_proj 
		
		FETCH NEXT FROM AppCursor into @WftaID, @GPID, @Consortia, @AppOrgName, @AppPersonID, @AppFirstMiddleLast, @AppLastFirstMiddle, @RevPersonID, @RevFirstMiddleLast, @RevLastFirstMiddle, @RevCommID, @CommitteeName, @ReviewCycleID
	
		END

END
CLOSE AppCursor
DEALLOCATE  AppCursor


--****************************** AppCursor ends here **************************************




select distinct TOP 100 PERCENT  WftaID, GPID, Consortia, AppOrgname, AppPersonID, AppFirstMiddleLast, AppLastFirstMiddle, RevPersonID, RevFirstMiddleLast, RevLastFirstMiddle, RevCommID, CommitteeName, RevCycleID from #t

order by AppLastFirstMiddle, RevLastFirstMiddle

return

-- exec spConflictResultsByApp @ReviewCycleID = 23
GO
/****** Object:  StoredProcedure [dbo].[spEASYGRANTS_USER]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[spEASYGRANTS_USER] (
@easygrants_user_id int, @login_username varchar(100) = null, @login_password varchar(30) = null, @encryption_key varchar(50) = null, @person_id int, @user_type_id int = null, @password_question_id int = null, @password_answer varchar(100) = null, @create_date datetime = null, @change_date datetime = null, @create_user_id int = null, @change_user_id int = null, @password_last_sent_date datetime = null, @failed_attempts int = null, @change_password_next_login bit = null, @locked bit = null )
AS

SET NOCOUNT ON

declare @count int

select @count=count(*) from EASYGRANTS_USER where easygrants_user_id = @easygrants_user_id

if @count > 0
	begin
		update EASYGRANTS_USER set login_username=@login_username, login_password=@login_password, encryption_key=@encryption_key, person_id=@person_id, user_type_id=@user_type_id, password_question_id=@password_question_id, password_answer=@password_answer, create_date=@create_date, change_date=@change_date, create_user_id=@create_user_id, change_user_id=@change_user_id, password_last_sent_date=@password_last_sent_date,  failed_attempts = @failed_attempts, change_password_next_login  = @change_password_next_login , locked = @locked 
where easygrants_user_id=@easygrants_user_id
	end

else
	begin
		insert into EASYGRANTS_USER (easygrants_user_id, login_username, login_password, encryption_key, person_id, user_type_id, password_question_id, password_answer, create_date, change_date, create_user_id, change_user_id, password_last_sent_date,failed_attempts,change_password_next_login,locked ) 
values (@easygrants_user_id, @login_username, @login_password, @encryption_key, @person_id, @user_type_id, @password_question_id, @password_answer, @create_date, @change_date, @create_user_id, @change_user_id, @password_last_sent_date,@failed_attempts, @change_password_next_login,@locked) 
	end
GO
/****** Object:  View [dbo].[vPERSON_USERTYPE]    Script Date: 10/09/2007 11:50:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPERSON_USERTYPE]
AS
select distinct p.person_id, p.name_last, p.name_first from person p
join easygrants_user eu on p.person_id=eu.person_id and (eu.user_type_id=2 or eu.user_type_id=3)
GO
/****** Object:  View [dbo].[vMedPhysicianRCList]    Script Date: 10/09/2007 11:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	VIEW [dbo].[vMedPhysicianRCList]
AS
SELECT DISTINCT TOP 100 PERCENT 
		WF_TASK_ASSIGNMENT.wf_task_id AS RevWfTaskID, 
		WF_TASK_ASSIGNMENT.person_id AS ReviewerID, 
		WF_TASK_ASSIGNMENT.wf_task_assignment_id AS RevWftaID, 
		WF_TASK_ASSIGNMENT.grantee_project_id AS GranteeProjectID, 
		WF_TASK_ASSIGNMENT_1.wf_task_assignment_id AS AppWftaID, 
		WF_TASK_ASSIGNMENT_1.wf_task_id AS AppWfTaskID, 
		PERSON.name_last + ', ' + PERSON.name_first AS ApplicantName, 
		--c_SIX_FIELD.description AS ResearchArea, 
		--WF_TASK_ASSIGNMENT_GRADUATE.title_of_project AS ProjectTitle, 
		c_REQUEST_CONFLICT.description AS RequestConflict, 
		PERSON.person_id AS AppPersonID, 
		WF_TASK_ASSIGNMENT.review_conflict_type_id AS ConflictTypeID, 
		WF_TASK_ASSIGNMENT.review_preference_type_id AS RequestConflictID, 
		WF_TASK_ASSIGNMENT.wf_task_status_id AS WfTaskStatusID, 
		c_CONFLICT_TYPE.description As ConflictType
FROM	REVIEW_CYCLE_STAGE 
		INNER JOIN WF_TASK_ASSIGNMENT 
			INNER JOIN WF_TASK_ASSIGNMENT WF_TASK_ASSIGNMENT_1 ON WF_TASK_ASSIGNMENT.grantee_project_id = WF_TASK_ASSIGNMENT_1.grantee_project_id 
			INNER JOIN GRANTEE_PROJECT ON WF_TASK_ASSIGNMENT.grantee_project_id = GRANTEE_PROJECT.grantee_project_id 
			INNER JOIN PERSON ON GRANTEE_PROJECT.primary_person_id = PERSON.person_id 
		ON REVIEW_CYCLE_STAGE.review_cycle_stage_id = WF_TASK_ASSIGNMENT.review_cycle_stage_id 
		INNER JOIN REVIEW_CYCLE_PROJECT_TASK ON REVIEW_CYCLE_STAGE.review_cycle_id = REVIEW_CYCLE_PROJECT_TASK.review_cycle_id 
		INNER JOIN a_WF_PROJECT_TASK ON REVIEW_CYCLE_PROJECT_TASK.project_task_id = a_WF_PROJECT_TASK.id 
			AND WF_TASK_ASSIGNMENT_1.wf_task_id = a_WF_PROJECT_TASK.wf_task_id 
		LEFT OUTER JOIN c_CONFLICT_TYPE ON WF_TASK_ASSIGNMENT.review_conflict_type_id = c_CONFLICT_TYPE.id 
		LEFT OUTER JOIN c_REQUEST_CONFLICT ON WF_TASK_ASSIGNMENT.review_preference_type_id = c_REQUEST_CONFLICT.id 
		--LEFT OUTER JOIN WF_TASK_ASSIGNMENT_GRADUATE ON WF_TASK_ASSIGNMENT_1.wf_task_assignment_id = WF_TASK_ASSIGNMENT_GRADUATE.wf_task_assignment_id 
		--LEFT OUTER JOIN c_SIX_FIELD 
		--RIGHT OUTER JOIN PERSON_SIX_FIELD ON c_SIX_FIELD.id = PERSON_SIX_FIELD.six_field_id 
			--ON PERSON.person_id = PERSON_SIX_FIELD.person_id
WHERE	WF_TASK_ASSIGNMENT.wf_task_role_id = 7 
	AND WF_TASK_ASSIGNMENT_1.wf_task_role_id = 1
ORDER BY ApplicantName
GO
/****** Object:  View [dbo].[vMY_QUERIES]    Script Date: 10/09/2007 11:50:19 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE VIEW [dbo].[vMY_QUERIES]
--AS
--SELECT     dbo.a_MYQUERIES.id, dbo.a_MYQUERIES.saved_query_id, dbo.a_MYQUERIES.person_id, dbo.a_SAVED_QUERY.name, 
--                      dbo.a_SAVED_QUERY.description, dbo.c_ACCESS_TYPE.access_type_desc, dbo.c_QUERY_TYPE.abbr AS query_type
--FROM         dbo.a_MYQUERIES INNER JOIN
--                      dbo.a_SAVED_QUERY ON dbo.a_MYQUERIES.saved_query_id = dbo.a_SAVED_QUERY.id INNER JOIN
--                      dbo.c_QUERY_TYPE ON dbo.a_SAVED_QUERY.query_type_id = dbo.c_QUERY_TYPE.id INNER JOIN
--                      dbo.c_ACCESS_TYPE ON dbo.a_SAVED_QUERY.access_type_id = dbo.c_ACCESS_TYPE.id
--GO
/****** Object:  View [dbo].[vCommitteePool]    Script Date: 10/09/2007 11:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vCommitteePool]
AS

select distinct 
	rcm.review_committee_member_id, 
	rcc.review_cycle_id, 
	rcm.person_id, 
	rcc.review_committee_id,
	p.name_first,
	p.name_middle,
	p.name_last
from review_cycle_committee rcc
	join review_committee_member as rcm on rcc.review_committee_id = rcm.review_committee_id
	join person as p on rcm.person_id = p.person_id
GO
/****** Object:  StoredProcedure [dbo].[spPDQ_SEL_QUEUED_DATACOMMAND]    Script Date: 10/09/2007 11:37:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPDQ_SEL_QUEUED_DATACOMMAND]
AS
SET NOCOUNT ON

SELECT data_command_request_id AS DataCommandRequestID
	FROM DATA_COMMAND_REQUEST
	WHERE status = 0 or status is null
	ORDER BY create_date
GO
/****** Object:  View [dbo].[vReviewApplicants]    Script Date: 10/09/2007 11:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vReviewApplicants]
AS
SELECT DISTINCT gprs.id As GranteeProjectReviewStageID, 
		gp.grantee_project_id As GranteeProjectID, 
		wfta.wf_task_assignment_id As WfTaskAssignmentID,
		p.person_id As PersonID, 
		p.name_last As LastName, 
		p.name_first As FirstName, 
		p.name_middle As MiddleName, 
		o.organization_id As OrganizationID,
		o.organization_name As OrganizationName,
		gprs.review_cycle_stage_id As ReviewCycleStageID,
		gprs.average_rating As AverageRating
FROM	GRANTEE_PROJECT_REVIEW_STAGE gprs
		INNER JOIN REVIEW_CYCLE_STAGE rcs ON rcs.review_cycle_stage_id = gprs.review_cycle_stage_id
		INNER JOIN REVIEW_CYCLE_PROJECT_TASK rcpt ON rcpt.review_cycle_id = rcs.review_cycle_id
		INNER JOIN a_WF_PROJECT_TASK wfpt ON wfpt.id = rcpt.project_task_id
		INNER JOIN GRANTEE_PROJECT gp ON gprs.grantee_project_id = gp.grantee_project_id 
		INNER JOIN WF_TASK_ASSIGNMENT wfta ON wfta.grantee_project_id = gp.grantee_project_id
		AND wfta.wf_task_id = wfpt.wf_task_id
		AND wfta.wf_task_role_id = 1
		INNER JOIN PERSON p ON gp.primary_person_id = p.person_id
		LEFT JOIN PERSON_ORGANIZATION_AFFILIATION poa on p.person_id = poa.person_id AND poa.is_primary = 1
		LEFT JOIN ORGANIZATION o on poa.organization_id = o.organization_id
GO
/****** Object:  View [dbo].[vReviewCycleWFTAs]    Script Date: 10/09/2007 11:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE        VIEW [dbo].[vReviewCycleWFTAs]
	AS


-- review cycle applicants with application tasks
select wfta.wf_task_assignment_id, rcpt.review_cycle_id, wfta.wf_task_id, wfta.wf_task_role_id, wfta.grantee_project_id, wfta.review_committee_id, wfta.person_id from review_cycle_project_task rcpt

join a_wf_project_task as wfpt on wfpt.id = rcpt.project_task_id
join grantee_project as gp on gp.wf_project_id = wfpt.wf_project_id
join wf_task_assignment as wfta on wfta.grantee_project_id = gp.grantee_project_id
join a_wf_task as wft on wft.id = wfta.wf_task_id

where wft.wf_task_type_id = 1 
--and rcpt.review_cycle_id = 82
GO
/****** Object:  View [dbo].[vApplicantPool]    Script Date: 10/09/2007 11:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vApplicantPool]
AS

/*
select distinct	
	wfta.wf_task_assignment_id, 
	wfta.grantee_project_id,
	wfta.wf_task_id,
	gpo.outcome_id AS wf_task_outcome_id,
	wfta.wf_task_status_id,
	o.organization_id,
	o.organization_name, 
	wfta.person_id,
	rcpto.review_cycle_id,
	p.name_first,
	p.name_middle,
	p.name_last
from review_cycle_project_task_outcome rcpto
	join review_cycle_project_task as rcpt on rcpto.review_cycle_project_task_id = rcpt.review_cycle_project_task_id
	join wf_task_assignment as wfta on rcpto.task_id = wfta.wf_task_id 
		and wfta.wf_task_role_id = 1
		and wfta.wf_task_status_id = 2
	join grantee_project as gp on wfta.grantee_project_id = gp.grantee_project_id 
		and rcpto.project_id = gp.wf_project_id
	join PERSON p on p.person_id = wfta.person_id
	
	join GRANTEE_PROJECT_OUTCOMES gpo ON gp.grantee_project_id = gpo.grantee_project_id 
		AND wfta.wf_task_id = gpo.wf_task_id 
		AND rcpto.task_outcome_id = gpo.outcome_id 

	left JOIN PERSON_ORGANIZATION_AFFILIATION po on p.person_id = po.person_id and po.is_primary = 1
	left JOIN ORGANIZATION o on po.organization_id = o.organization_id
where	wfta.wf_task_role_id = 1
*/

SELECT DISTINCT	
		wfta.wf_task_assignment_id, 
		wfta.grantee_project_id,
		wfta.wf_task_id,
		gpo.outcome_id AS wf_task_outcome_id,
		wfta.wf_task_status_id,
		o.organization_id,
		o.organization_name, 
		wfta.person_id,
		rcpto.review_cycle_id,
		p.name_first,
		p.name_middle,
		p.name_last
FROM	GRANTEE_PROJECT_OUTCOMES gpo 
		JOIN GRANTEE_PROJECT gp ON gpo.grantee_project_id = gp.grantee_project_id 
		JOIN REVIEW_CYCLE_PROJECT_TASK rcpt 
			JOIN REVIEW_CYCLE_PROJECT_TASK_OUTCOME rcpto ON rcpt.review_cycle_project_task_id = rcpto.review_cycle_project_task_id 
		ON gp.wf_project_id = rcpto.project_id 
			AND gpo.wf_task_id = rcpto.task_id 
			AND gpo.outcome_id = rcpto.task_outcome_id 
		JOIN WF_TASK_ASSIGNMENT wfta ON gp.grantee_project_id = wfta.grantee_project_id 
			AND wfta.wf_task_role_id = 1 
			AND wfta.wf_task_status_id = 2
		JOIN a_WF_TASK wt ON wt.id = wfta.wf_task_id
		JOIN PERSON p ON p.person_id = wfta.person_id
		LEFT JOIN PERSON_ORGANIZATION_AFFILIATION po ON p.person_id = po.person_id 
			AND po.is_primary = 1
		LEFT JOIN ORGANIZATION o ON po.organization_id = o.organization_id
WHERE	wfta.wf_task_role_id = 1
	AND wt.wf_task_type_id = 1
GO
/****** Object:  View [dbo].[vEASYLIST_REVIEWS_REVIEWERS]    Script Date: 10/09/2007 11:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEASYLIST_REVIEWS_REVIEWERS]
AS
SELECT     dbo.PERSON.name_last, dbo.PERSON.name_first, dbo.PERSON.name_last + ', ' + dbo.PERSON.name_first AS LastNameFirstName, 
                      dbo.a_REVIEW_COMMITTEE.description, dbo.PERSON.is_reviewer, dbo.ORGANIZATION.organization_name, dbo.ORGANIZATION.organization_id, 
                      dbo.PERSON.person_id, dbo.PERSON_ORGANIZATION_AFFILIATION.is_primary,
                          (SELECT     email_addr
                            FROM          dbo.EMAIL AS E
                            WHERE      (is_primary = 1) AND (entity_id = dbo.PERSON.person_id)) AS primary_email_addr, 
                      dbo.REVIEW_COMMITTEE_MEMBER.review_committee_id, dbo.PERSON_REVIEWER.reviewer_status_id, dbo.PERSON.name_middle, 
                      dbo.vPERSON_NAMES.LastFirstMiddle AS LastNameFirstNameMiddle
FROM         dbo.ORGANIZATION RIGHT OUTER JOIN
                      dbo.PERSON_ORGANIZATION_AFFILIATION ON 
                      dbo.ORGANIZATION.organization_id = dbo.PERSON_ORGANIZATION_AFFILIATION.organization_id RIGHT OUTER JOIN
                      dbo.vPERSON_NAMES RIGHT OUTER JOIN
                      dbo.PERSON ON dbo.vPERSON_NAMES.person_id = dbo.PERSON.person_id ON 
                      dbo.PERSON_ORGANIZATION_AFFILIATION.person_id = dbo.PERSON.person_id LEFT OUTER JOIN
                      dbo.a_REVIEW_COMMITTEE RIGHT OUTER JOIN
                      dbo.REVIEW_COMMITTEE_MEMBER ON dbo.a_REVIEW_COMMITTEE.id = dbo.REVIEW_COMMITTEE_MEMBER.review_committee_id ON 
                      dbo.PERSON.person_id = dbo.REVIEW_COMMITTEE_MEMBER.person_id LEFT OUTER JOIN
                      dbo.PERSON_REVIEWER ON dbo.PERSON.person_id = dbo.PERSON_REVIEWER.person_id
WHERE     (dbo.PERSON.is_reviewer = 1)
GO
/****** Object:  View [dbo].[vEASYLIST_GRANTEE_REPORTS]    Script Date: 10/09/2007 11:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEASYLIST_GRANTEE_REPORTS]
AS
SELECT     TOP (100) PERCENT dbo.PERSON.name_last, dbo.PERSON.name_first, 
                      dbo.PERSON.name_last + ', ' + dbo.PERSON.name_first AS LastNameFirstName, dbo.a_WF_TASK_STATUS.description AS status, 
                      dbo.a_WF_TASK_ROLE.description AS role, dbo.a_WF_TASK_OUTCOME.description AS outcome, dbo.a_WF_TASK.description AS task, 
                      dbo.WF_TASK_ASSIGNMENT.wf_task_assignment_id, dbo.PERSON.person_id,
                          (SELECT     (SELECT     organization_name
                                                    FROM         dbo.ORGANIZATION AS O
                                                    WHERE     (organization_id = POA.organization_id)) AS primary_organization_name
                            FROM          dbo.PERSON_ORGANIZATION_AFFILIATION AS POA
                            WHERE      (is_primary = 1) AND (person_id = dbo.PERSON.person_id)) AS primary_organization_name,
                          (SELECT     (SELECT     organization_id
                                                    FROM         dbo.ORGANIZATION AS O
                                                    WHERE     (organization_id = POA.organization_id)) AS primary_organization_id
                            FROM          dbo.PERSON_ORGANIZATION_AFFILIATION AS POA
                            WHERE      (is_primary = 1) AND (person_id = dbo.PERSON.person_id)) AS primary_organization_id,
                          (SELECT     email_addr
                            FROM          dbo.EMAIL AS E
                            WHERE      (is_primary = 1) AND (entity_id = dbo.PERSON.person_id)) AS primary_email_addr, 
                      dbo.a_WF_TASK_OUTCOME.id AS wf_task_outcome_id, dbo.a_WF_TASK.id AS wf_task_id, dbo.a_WF_TASK_ROLE.id AS wf_task_role_id, 
                      dbo.a_WF_TASK_STATUS.id AS wf_task_status_id, dbo.GRANTEE_PROJECT.wf_project_id, dbo.a_WF_PROJECT.competition_id, 
                      dbo.a_COMPETITION.program_id, dbo.a_COMPETITION.description AS competition_display_name, 
                      dbo.a_WF_TASK_ROLE.task_type_id AS wf_task_type_id
FROM         dbo.a_WF_TASK_ROLE RIGHT OUTER JOIN
                      dbo.a_COMPETITION RIGHT OUTER JOIN
                      dbo.a_WF_PROJECT ON dbo.a_COMPETITION.id = dbo.a_WF_PROJECT.competition_id RIGHT OUTER JOIN
                      dbo.GRANTEE_PROJECT RIGHT OUTER JOIN
                      dbo.WF_TASK_ASSIGNMENT ON dbo.GRANTEE_PROJECT.primary_person_id = dbo.WF_TASK_ASSIGNMENT.person_id ON 
                      dbo.a_WF_PROJECT.id = dbo.GRANTEE_PROJECT.wf_project_id LEFT OUTER JOIN
                      dbo.PERSON ON dbo.WF_TASK_ASSIGNMENT.person_id = dbo.PERSON.person_id ON 
                      dbo.a_WF_TASK_ROLE.id = dbo.WF_TASK_ASSIGNMENT.wf_task_role_id LEFT OUTER JOIN
                      dbo.a_WF_TASK_OUTCOME ON dbo.WF_TASK_ASSIGNMENT.wf_task_outcome_id = dbo.a_WF_TASK_OUTCOME.id LEFT OUTER JOIN
                      dbo.a_WF_TASK_STATUS ON dbo.WF_TASK_ASSIGNMENT.wf_task_status_id = dbo.a_WF_TASK_STATUS.id LEFT OUTER JOIN
                      dbo.a_WF_TASK ON dbo.WF_TASK_ASSIGNMENT.wf_task_id = dbo.a_WF_TASK.id
WHERE     (dbo.a_WF_TASK_ROLE.task_type_id = 3)
GO
/****** Object:  View [dbo].[vADDRESS]    Script Date: 10/09/2007 11:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vADDRESS] AS
	select a.address_id,
		a.address_1 + 
		CASE WHEN a.address_2 IS NULL OR a.address_2 = '' THEN ''
			ELSE  '  <br> ' + a.address_2
		END +
		CASE WHEN a.address_3 IS NULL OR a.address_3 = '' THEN ''
			ELSE '  <br>  ' + a.address_3
		END + '  <br>  ' +
		CASE WHEN a.city IS NULL OR a.city = '' THEN '' ELSE a.city END +
		CASE WHEN sp.id IS NULL THEN '' else ', ' + sp.abbr END +
		CASE WHEN a.zip_postal_code IS NULL OR a.zip_postal_code = '' THEN '' ELSE ' ' + a.zip_postal_code END +
		CASE WHEN c.id IS NULL THEN '' ELSE '  <br>  ' + c.description END
		AS full_address
		FROM ADDRESS a
			LEFT JOIN c_STATE_PROV sp ON a.state_province_id = sp.id
			LEFT JOIN c_COUNTRY c ON a.country_id = c.id
GO
/****** Object:  View [dbo].[vEASYLIST_CONTACTS_ORGANIZATION]    Script Date: 10/09/2007 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEASYLIST_CONTACTS_ORGANIZATION]
AS
SELECT DISTINCT organization_id, common_organization_name, acronym, ein,
                          (SELECT     id
                            FROM          person_organization_affiliation poa
                            WHERE      poa.is_primary_organization_contact = 1 AND poa.is_primary = 1 AND poa.organization_id = b.organization_id) AS id,
                          (SELECT     (SELECT     name_last
                                                    FROM         person p
                                                    WHERE     p.person_id = poa.person_id) AS name_last
                            FROM          person_organization_affiliation poa
                            WHERE      poa.is_primary_organization_contact = 1 AND poa.is_primary = 1 AND poa.organization_id = b.organization_id) AS name_last,
                          (SELECT     (SELECT     name_first
                                                    FROM         person p
                                                    WHERE     p.person_id = poa.person_id) AS name_first
                            FROM          person_organization_affiliation poa
                            WHERE      poa.is_primary_organization_contact = 1 AND poa.is_primary = 1 AND poa.organization_id = b.organization_id) AS name_first,
                          (SELECT     city
                            FROM          address a
                            WHERE      a.entity_id = b.organization_id AND a.is_primary = 1 AND a.entity_type_id = 2) AS city,
                          (SELECT     (SELECT     description
                                                    FROM         c_state_prov c
                                                    WHERE     c.id = a.state_province_id AND a.is_primary = 1 AND a.entity_type_id = 2) AS state
                            FROM          address a
                            WHERE      a.entity_id = b.organization_id AND a.is_primary = 1 AND a.entity_type_id = 2) AS State, organization_name
FROM         dbo.ORGANIZATION b
GO
/****** Object:  View [dbo].[vSUBMITTEDFILES]    Script Date: 10/09/2007 11:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   view [dbo].[vSUBMITTEDFILES] 
as
select distinct(submitted_file_id),entity_id,gp.grantee_project_id,ft.file_type_id from Submitted_file sf
	join wf_task_assignment wfta on wfta.wf_task_assignment_id = sf.entity_id 
	join grantee_project gp on gp.grantee_project_id = wfta.grantee_project_id
	join file_type ft on sf.file_type_id = ft.file_type_id 
	where conversion_status = -1 and ft.entity_dataobject_key = 'WfTaskAssignment'
union
select distinct(submitted_file_id),entity_id,gp.grantee_project_id,ft.file_type_id from submitted_file sf
	join grantee_project gp on gp.grantee_project_id=sf.entity_id 
	join file_type ft on sf.file_type_id = ft.file_type_id 
	where conversion_status=-1 and ft.entity_dataobject_key = 'GranteeProject'
GO
/****** Object:  View [dbo].[vLOOKUP_TABLE_LIST]    Script Date: 10/09/2007 11:50:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Get row counts from sysindexes table for tables designated in s_ID_GEN as code tables.

Note that the DataObjectDefinitionKey and Description columns, which are to be filled in by EG
from the Data Definition file, are initialized to blank strings rather than NULL. This is to ensure that
the corresponding columns in the .NET DataSet object to be created from this stored procedure
are set to a data type of String.

*/
CREATE VIEW [dbo].[vLOOKUP_TABLE_LIST]
AS
SELECT     dbo.s_ID_GEN.id, OBJECT_NAME(dbo.sysindexes.id) AS TableName, '' AS DataObjectDefinitionKey, dbo.s_ID_GEN.description AS Description, 
                      dbo.sysindexes.rowcnt AS NumRows
FROM         dbo.sysindexes INNER JOIN
                      dbo.s_ID_GEN ON OBJECT_NAME(dbo.sysindexes.id) = dbo.s_ID_GEN.table_name AND dbo.s_ID_GEN.is_code_table = 1
WHERE     (dbo.sysindexes.indid IN (1, 0))
GO
/****** Object:  StoredProcedure [dbo].[spIMPORTGETID]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[spIMPORTGETID]
(
	@table VARCHAR(255),
	@id INT = 0 OUTPUT,
	@mode INT = NULL -- Select Only = 1; Return Only = 2
)
AS

SET NOCOUNT ON

DECLARE @NEW_ID INT
--BEGIN TRANSACTION NEWID
SELECT @NEW_ID = NEXT_ID FROM s_ID_GEN (UPDLOCK) WHERE TABLE_NAME = @table
UPDATE s_ID_GEN SET NEXT_ID = NEXT_ID + 1 WHERE TABLE_NAME = @table
--COMMIT TRANSACTION NEWID
IF @mode is NULL or @mode = 1
BEGIN
	SELECT @NEW_ID AS NEW_ID
END
SELECT @id = @NEW_ID
IF @mode is NULL or @mode = 2
BEGIN
	RETURN (@id)
END

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[getid_sel]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getid_sel]
(
	@table VARCHAR(255),
	@id INT = 0 OUTPUT,
	@mode INT = NULL -- Select Only = 1; Return Only = 2
)
AS
SET NOCOUNT ON
DECLARE @NEW_ID INT
BEGIN TRANSACTION NEWID
SELECT @NEW_ID = NEXT_ID FROM s_ID_GEN (ROWLOCK) WHERE TABLE_NAME = @table
UPDATE s_ID_GEN SET NEXT_ID = NEXT_ID + 1 WHERE TABLE_NAME = @table
COMMIT TRANSACTION NEWID
IF @mode is NULL or @mode = 1
BEGIN
	SELECT @NEW_ID AS NEW_ID
END
SELECT @id = @NEW_ID
IF @mode is NULL or @mode = 2
BEGIN
	RETURN (@id)
END
SET NOCOUNT OFF
GO
/****** Object:  View [dbo].[vENTITY_AFFILIATION_MAIN_AND_AFFIL]    Script Date: 10/09/2007 11:50:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vENTITY_AFFILIATION_MAIN_AND_AFFIL]
AS
SELECT     ea_main.entity_affiliation_id AS main_entity_affiliation_id, ea_affil.entity_affiliation_id AS affil_entity_affiliation_id, 
                      ea_main.entity_id AS main_entity_id, ea_main.affiliated_entity_id AS affil_entity_id, ea_main.affiliation_type_id AS main_affiliation_type_id, 
                      ea_main.affiliation_description AS main_affiliation_description, ea_affil.affiliation_type_id AS affil_affiliation_type_id, 
                      ea_affil.affiliation_description AS affil_affiliation_description, ea_main.entity_type_id
FROM         dbo.ENTITY_AFFILIATION ea_main INNER JOIN
                      dbo.ENTITY_AFFILIATION ea_affil ON ea_main.entity_id = ea_affil.affiliated_entity_id AND ea_main.affiliated_entity_id = ea_affil.entity_id AND 
                      ea_main.entity_type_id = ea_affil.entity_type_id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1 [56] 4 [18] 2))"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ea_main"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ea_affil"
            Begin Extent = 
               Top = 6
               Left = 259
               Bottom = 121
               Right = 442
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      RowHeights = 220
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vENTITY_AFFILIATION_MAIN_AND_AFFIL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vENTITY_AFFILIATION_MAIN_AND_AFFIL'
GO
/****** Object:  View [dbo].[vBioMedAssignedApplicationsList]    Script Date: 10/09/2007 11:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[vBioMedAssignedApplicationsList]
AS

SELECT DISTINCT 
		wftar.wf_task_assignment_id AS RevWftaID, 
		wftar.grantee_project_id AS GranteeProjectID, 
		pa.name_last + ', ' + pa.name_first + ISNULL(' ' + pa.name_middle, '') AS ApplicantName, 
		pa.person_id As AppPersonID,
		wftar.review_rating AS Rating, 
		org.organization_name AS CurrentMedInst, 
		arod.report_output_definition_id AS DefinitionID, 
		wftaa.wf_task_assignment_id AS AppWftaID, 
		wftar.wf_task_id AS RevWfTaskID, 
		wftar.person_id AS ReviewerID, 
		c_REVIEW_ASSIGNMENT_TYPE.description AS AssignmentType, 
		wftar.review_cycle_stage_id AS ReviewCycleStageID
FROM	WF_TASK_ASSIGNMENT wftar 
	INNER JOIN GRANTEE_PROJECT gp ON wftar.grantee_project_id = gp.grantee_project_id 
	INNER JOIN PERSON pa ON gp.primary_person_id = pa.person_id 
	INNER JOIN WF_TASK_ASSIGNMENT wftaa ON gp.grantee_project_id = wftaa.grantee_project_id 
	INNER JOIN a_WF_PROJECT_TASK awfpt ON wftaa.wf_task_id = awfpt.wf_task_id 
		AND gp.wf_project_id = awfpt.wf_project_id 
	INNER JOIN a_WF_PROJECT_PDF awfpp ON awfpt.wf_project_id = awfpp.wf_project_id 
	INNER JOIN a_REPORT_OUTPUT_DEFINITION arod ON awfpp.final_pdf_report_key = arod.definition_key 
	INNER JOIN c_REVIEW_ASSIGNMENT_TYPE ON wftar.review_assignment_type_id = c_REVIEW_ASSIGNMENT_TYPE.id 
	LEFT OUTER JOIN EDUCATION edu ON pa.person_id = edu.person_id --AND edu.current_institution = 1 
	LEFT OUTER JOIN ORGANIZATION org ON edu.organization_id = org.organization_id
WHERE	wftaa.wf_task_role_id = 1 
	AND wftar.wf_task_role_id = 7 
	AND awfpp.report_output_definition_type_id = 1
GO
/****** Object:  View [dbo].[vFormattedPhone]    Script Date: 10/09/2007 11:50:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vFormattedPhone]
AS
SELECT id, dbo.fnFormatPhoneNumber(phone_number) AS phone_number
FROM PHONE
GO
/****** Object:  View [dbo].[vRevCommitteeWfTA]    Script Date: 10/09/2007 11:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[vRevCommitteeWfTA]
AS

SELECT	w.wf_task_assignment_id,
		p.person_id,
		p.name_last,
		p.name_first,
		app.person_id app_person_id,
		app.name_last app_name_last,
		app.name_first app_name_first,
		w.review_committee_id,
		w.review_cycle_stage_id,
		w.review_preference_type_id,
		w.review_assignment_type_id
FROM	WF_TASK_ASSIGNMENT w
		join PERSON p on p.person_id = w.person_id
		join REVIEW_COMMITTEE_MEMBER rcm on p.person_id = rcm.person_id 
			and w.review_committee_id = rcm.review_committee_id
		join GRANTEE_PROJECT gp on gp.grantee_project_id = w.grantee_project_id
		join PERSON app on app.person_id = gp.primary_person_id
		join a_REVIEW_COMMITTEE r on r.id = w.review_committee_id
		join a_WF_PROJECT_TASK pt on gp.wf_project_id = pt.wf_project_id and w.wf_task_id = pt.wf_task_id
		join REVIEW_CYCLE_STAGE rcs on rcs.review_cycle_stage_id = w.review_cycle_stage_id
WHERE	w.wf_task_role_id = 7
GO
/****** Object:  StoredProcedure [dbo].[spCHECKCOMMONAPPLICANTS]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCHECKCOMMONAPPLICANTS]
(
	@review_cycle_stage_id INT,
	@wf_task_role_id INT = 7
)
AS

DECLARE	@grantee_project_id INT,
		@rev_person_id INT,
		@cur_cnt INT,
		@IsAvailable BIT,
		@cur_rev_person_id INT,
		@OldID INT,
		@NewID INT,
		@num_shared_applicants SMALLINT

SET NOCOUNT ON

CREATE TABLE #RevsForAppl
(
	pk_rev_id INT identity, 
	rev_person_id INT
)

CREATE TABLE #CommonCount
(
	pk_cnt_id INT identity, 
	cnt INT
)

SET	@NewID = 0
SET	@OldID = 0

SELECT	@num_shared_applicants = num_shared_applicants
FROM	review_cycle_stage
WHERE	review_cycle_stage_id = @review_cycle_stage_id

DECLARE rev CURSOR FORWARD_ONLY FOR 
	SELECT	grantee_project_id, 
			person_id
	FROM	WF_TASK_ASSIGNMENT
	WHERE	review_cycle_stage_id = @review_cycle_stage_id
	ORDER BY	person_id, grantee_project_id

OPEN rev
FETCH NEXT FROM rev 
INTO @grantee_project_id, @rev_person_id

WHILE @@fetch_status=0
BEGIN
	IF @NewID > 0
		SET @OldID = @NewID
	SET @NewID = @rev_person_id

	IF @OldID <> @NewID
		GOTO lNext

	TRUNCATE TABLE #RevsForAppl

	INSERT  #RevsForAppl
	SELECT	person_id
	FROM	WF_TASK_ASSIGNMENT
	WHERE	grantee_project_id = @grantee_project_id
		AND review_cycle_stage_id = @review_cycle_stage_id
		AND person_id > @rev_person_id
	ORDER BY person_id

	DECLARE curRevsForAppl CURSOR FORWARD_ONLY FOR 
		SELECT	rev_person_id
		FROM	#RevsForAppl
	OPEN curRevsForAppl
	FETCH NEXT FROM curRevsForAppl 
	INTO	@cur_rev_person_id
	
	SET	@IsAvailable = 1

	WHILE @@fetch_status=0
	BEGIN
		TRUNCATE TABLE #CommonCount

		INSERT INTO #CommonCount(cnt)
		SELECT	COUNT(grantee_project_id)
		FROM	WF_TASK_ASSIGNMENT
		WHERE	(person_id = @cur_rev_person_id OR person_id = @rev_person_id)
			AND	review_cycle_stage_id = @review_cycle_stage_id
			AND grantee_project_id <> @grantee_project_id
		GROUP BY grantee_project_id
		HAVING	COUNT(grantee_project_id) > 1
		ORDER BY COUNT(grantee_project_id)

		SELECT	@cur_cnt = COUNT(*)
		FROM	#CommonCount
		
		IF @cur_cnt > @num_shared_applicants AND @num_shared_applicants >= 0
		BEGIN
			SET	@IsAvailable = 0
			--BREAK
			PRINT 'GranteeProjectID: ' + CAST(@grantee_project_id as varchar(20)) + '; Rev1ID: ' +  + CAST(@cur_rev_person_id as varchar(20)) + + '; Rev2ID: ' +  + CAST(@rev_person_id as varchar(20))
		END

		FETCH NEXT FROM curRevsForAppl
		INTO	@cur_rev_person_id
	END
	CLOSE curRevsForAppl
	DEALLOCATE curRevsForAppl

lNext:
	FETCH NEXT FROM rev 
	INTO @grantee_project_id, @rev_person_id
END
CLOSE rev
DEALLOCATE rev

DROP TABLE #CommonCount
DROP TABLE #RevsForAppl

SET NOCOUNT OFF
GO
/****** Object:  View [dbo].[vBioMedAllApplicationsList]    Script Date: 10/09/2007 11:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vBioMedAllApplicationsList]
AS

SELECT DISTINCT 
	wftar.grantee_project_id AS GranteeProjectID, 
	pa.name_last + ', ' + pa.name_first + ISNULL(' ' + pa.name_middle, '') AS ApplicantName, 
	pa.person_id As AppPersonID,
	org.organization_name AS CurrentMedInst, 
	arod.report_output_definition_id AS DefinitionID, 
	wftaa.wf_task_assignment_id AS AppWftaID, 
	wftar.wf_task_id AS RevWfTaskID
FROM	WF_TASK_ASSIGNMENT wftar 
	INNER JOIN GRANTEE_PROJECT gp ON wftar.grantee_project_id = gp.grantee_project_id 
	INNER JOIN PERSON pa ON gp.primary_person_id = pa.person_id 
	INNER JOIN WF_TASK_ASSIGNMENT wftaa ON gp.grantee_project_id = wftaa.grantee_project_id 
	INNER JOIN a_WF_PROJECT_TASK awfpt ON wftaa.wf_task_id = awfpt.wf_task_id 
		AND gp.wf_project_id = awfpt.wf_project_id 
	INNER JOIN a_WF_PROJECT_PDF awfpp ON awfpt.wf_project_id = awfpp.wf_project_id 
	INNER JOIN a_REPORT_OUTPUT_DEFINITION arod ON awfpp.final_pdf_report_key = arod.definition_key 
	LEFT OUTER JOIN EDUCATION edu ON pa.person_id = edu.person_id --AND edu.current_institution = 1 
	LEFT OUTER JOIN ORGANIZATION org ON edu.organization_id = org.organization_id
WHERE	wftaa.wf_task_role_id = 1 
	AND wftar.wf_task_role_id = 7 
	AND awfpp.report_output_definition_type_id = 1
GO
/****** Object:  View [dbo].[vEASYLIST_WORKGROUP_TASKS]    Script Date: 10/09/2007 11:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEASYLIST_WORKGROUP_TASKS]
AS
SELECT     dbo.PERSON.name_last, dbo.PERSON.name_first, dbo.PERSON.name_last + ', ' + dbo.PERSON.name_first AS LastNameFirstName, 
                      dbo.a_WF_PROJECT_TASK.due_date, dbo.WF_TASK_ASSIGNMENT.wf_task_assignment_id, dbo.a_WF_TASK.description, 
                      dbo.ORGANIZATION.organization_name
FROM         dbo.ORGANIZATION RIGHT OUTER JOIN
                      dbo.GRANTEE_PROJECT GRANTEE_PROJECT LEFT OUTER JOIN
                      dbo.PERSON ON GRANTEE_PROJECT.primary_person_id = dbo.PERSON.person_id ON 
                      dbo.ORGANIZATION.organization_id = GRANTEE_PROJECT.primary_organization_id RIGHT OUTER JOIN
                      dbo.a_WF_TASK RIGHT OUTER JOIN
                      dbo.WF_TASK_ASSIGNMENT LEFT OUTER JOIN
                      dbo.a_WF_PROJECT_TASK ON dbo.WF_TASK_ASSIGNMENT.grantee_project_id = dbo.a_WF_PROJECT_TASK.wf_project_id AND 
                      dbo.WF_TASK_ASSIGNMENT.wf_task_id = dbo.a_WF_PROJECT_TASK.wf_task_id ON dbo.a_WF_TASK.id = dbo.WF_TASK_ASSIGNMENT.wf_task_id ON
                       GRANTEE_PROJECT.grantee_project_id = dbo.WF_TASK_ASSIGNMENT.grantee_project_id
GO
/****** Object:  View [dbo].[vEASYLIST_CONTACTS_PERSON]    Script Date: 10/09/2007 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEASYLIST_CONTACTS_PERSON]
AS
SELECT DISTINCT c.person_id, c.name_last, c.name_first,
                          (SELECT     (SELECT     organization_name
                                                    FROM         organization a
                                                    WHERE     a.organization_id = b.organization_id) AS organization_name
                            FROM          person_organization_affiliation b
                            WHERE      is_primary = 1 AND b.person_id = c.person_id) AS organization_name,
                          (SELECT     (SELECT     organization_name
                                                    FROM         organization a
                                                    WHERE     a.organization_id = b.organization_id) AS organization_name
                            FROM          person_organization_affiliation b
                            WHERE      is_primary = 1 AND b.person_id = c.person_id) AS common_organization_name, dbo.WF_TASK_ASSIGNMENT.wf_task_status_id
FROM         dbo.PERSON c LEFT OUTER JOIN
                      dbo.WF_TASK_ASSIGNMENT ON c.person_id = dbo.WF_TASK_ASSIGNMENT.person_id
GO
/****** Object:  StoredProcedure [dbo].[spCR_GRANTPAYMENT_PRIMARYCONTACT]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE   procedure [dbo].[spCR_GRANTPAYMENT_PRIMARYCONTACT]
AS
set nocount on
	select distinct pay.requested_date [Date],
		gf.general_fund [Account],
		o.organization_name [Name (To:)],
		pay.requested_amount [Amount],
		pay.check_payment_number [DocNum],
		pay.payment_id [Memo],
		p.name_last [First Name],
		p.name_first [Last Name],
		gp.other_organization [Grantee Institution Name],
		oa.address_1 [Addr1],
		oa.address_2 [Addr2],
		oa.address_3 [Addr3],
		oa.city [City],
		s.abbr [State],
		c.description [Country],
		oa.zip_postal_code [Zip]
	from payment pay
		join a_general_fund gf on pay.request_account_fund_id=gf.id
		join grantee_project gp on pay.grantee_project_id=gp.grantee_project_id
		join organization o on gp.primary_organization_id=o.organization_id
		join person p on gp.primary_person_id=p.person_id
		join address oa on gp.primary_organization_id=oa.entity_id and oa.entity_type_id='2'
		left join c_state_prov s on oa.state_province_id=s.id
		left join c_country c on oa.country_id=c.id
	order by o.organization_name, p.name_last, p.name_first
GO
/****** Object:  View [dbo].[vPERSON_ORGANIZATION]    Script Date: 10/09/2007 11:50:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vPERSON_ORGANIZATION]
AS
SELECT    distinct p. person_id, p.name_last, p.name_last + ', ' + p.name_first + isnull(', ' + o.organization_name, '') collate Latin1_General_CI_AS as person_organization
FROM       PERSON p 
left join PERSON_ORGANIZATION_AFFILIATION poa on p.person_id=poa.person_id and poa.is_primary='1'
left join ORGANIZATION o on poa.organization_id=o.organization_id
GO
/****** Object:  View [dbo].[vWFTA_REOPEN_REQUEST_SECTIONS]    Script Date: 10/09/2007 11:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vWFTA_REOPEN_REQUEST_SECTIONS]
AS
SELECT wfta_reopen_request_id,
	dbo.WFTA_Reopen_Sections(wfta_reopen_request_id) AS section_keys
	FROM WFTA_REOPEN_REQUEST
GO
/****** Object:  View [dbo].[vPERSON_GRANTEE_PROJECTS]    Script Date: 10/09/2007 11:50:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
This view, when filtered by person_id, returns all grants for which the person is the primary or principal investigator.
RN 7/26/2006
*/

CREATE VIEW [dbo].[vPERSON_GRANTEE_PROJECTS]
AS
SELECT gp.grantee_project_id, p.person_id
	FROM GRANTEE_PROJECT gp
		LEFT JOIN PERSON p ON  gp.primary_person_id = p.person_id
UNION
SELECT gppi.grantee_project_id, p.person_id
	 FROM GRANTEE_PROJECT_PI gppi
		LEFT JOIN PERSON p ON gppi.person_id = p.person_id and gppi.pi_type_id = 1
GO
/****** Object:  StoredProcedure [dbo].[spCALCULATE_AVERAGE_SCORES]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE   PROCEDURE [dbo].[spCALCULATE_AVERAGE_SCORES]
(
	@review_cycle_stage_id INT,
	@wf_task_role_id INT = 7,
	@Include int = 0
)
AS

SET NOCOUNT ON

IF @Include = 0
	UPDATE GRANTEE_PROJECT_REVIEW_STAGE
	SET average_rating = NULL
	WHERE review_cycle_stage_id = @review_cycle_stage_id

DECLARE @rating float,
		@min float,
		@max float,
		@total float,
		@grantee_project_id int,
		@task_id int,
		@counter int
		
DECLARE criteria CURSOR FOR 
	SELECT	gprs.grantee_project_id
	FROM	grantee_project_review_stage gprs
		join grantee_project gp on gp.grantee_project_id = gprs.grantee_project_id
		join a_wf_project wp on wp.id = gp.wf_project_id
	WHERE	review_cycle_stage_id = @review_cycle_stage_id 
		and (flag_for_action = 1 Or @Include = 1)
		--and gp.wf_project_outcome_id is null
OPEN criteria
FETCH NEXT FROM criteria into @grantee_project_id
WHILE @@FETCH_STATUS=0
BEGIN
	set @counter = 0
	set @total = 0

	DECLARE rev CURSOR FOR 
		SELECT	review_rating, wf_task_id
		FROM	wf_task_assignment
		WHERE	grantee_project_id = @grantee_project_id 
			and review_cycle_stage_id = @review_cycle_stage_id 
			AND wf_task_role_id = @wf_task_role_id
			--and wf_task_status_id = @wf_task_status_id
	open rev
	fetch next from rev into @rating, @task_id
	while @@fetch_status=0
	begin
		if not @rating is null
			begin
				set @total = @total + @rating
				set @counter = @counter + 1
			end
		fetch next from rev into @rating, @task_id
	end
	close rev
	deallocate rev

	if @counter > 0
	begin
		UPDATE	grantee_project_review_stage 
		SET		average_rating = @total/@counter
		WHERE	grantee_project_id = @grantee_project_id 
			and review_cycle_stage_id = @review_cycle_stage_id
		
		/*
		if @Include = 0
		begin
			UPDATE	WF_TASK_ASSIGNMENT_GRADUATE 
			SET		review_mean = @total/@counter
			WHERE	wf_task_assignment_id IN 
				(SELECT DISTINCT wf_task_assignment_id 
				 FROM WF_TASK_ASSIGNMENT
				 WHERE grantee_project_id = @grantee_project_id 
					and wf_task_role_id = 1)
		end
		*/
	end

	FETCH NEXT FROM criteria into @grantee_project_id
END
CLOSE criteria
DEALLOCATE criteria

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spPDQ_SEL_QUEUED_CREATEWORDTEMPLATE]    Script Date: 10/09/2007 11:37:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spPDQ_SEL_QUEUED_CREATEWORDTEMPLATE]
	@LoginName		varchar(100) = null
AS
set nocount on
select ro.report_output_id as ReportOutputID
		from REPORT_OUTPUT ro
		where (status in (0,1)
				or status is null
			)
			and definition_id in (9)
		order by gen_request_date
GO
/****** Object:  StoredProcedure [dbo].[spPDQ_SEL_QUEUED_REPORT]    Script Date: 10/09/2007 11:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE       PROCEDURE [dbo].[spPDQ_SEL_QUEUED_REPORT]
	@LoginName		varchar(100) = null
AS
set nocount on
select ro.report_output_id as ReportOutputID
		from REPORT_OUTPUT ro
		where (status = 0
				or status is null
			)
		and definition_id in (2,3,4,5,6,7,16,17,18,21,22,35)
		order by gen_request_date
GO
/****** Object:  StoredProcedure [dbo].[spPDQ_SEL_QUEUED_WORDMERGE_REPORT]    Script Date: 10/09/2007 11:37:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spPDQ_SEL_QUEUED_WORDMERGE_REPORT]
	@LoginName		varchar(100) = null
AS
set nocount on
select ro.report_output_id as ReportOutputID
		from REPORT_OUTPUT ro
		where (status in (0,1)
				or status is null
			)
			and definition_id in (8)
		order by gen_request_date
GO
/****** Object:  StoredProcedure [dbo].[spPDQ_SEL_QUEUED_QUERY_REPORT]    Script Date: 10/09/2007 11:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPDQ_SEL_QUEUED_QUERY_REPORT]
	@LoginName		varchar(100) = null
AS
set nocount on
select ro.report_output_id as ReportOutputID
		from REPORT_OUTPUT ro
		where (status = 0
				or status is null
			)
			and definition_id in (1)
		order by gen_request_date
GO
/****** Object:  StoredProcedure [dbo].[spEG_WORD_MERGE]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  PROCEDURE [dbo].[spEG_WORD_MERGE]
	@ReportID	int
AS
set nocount on
	declare @sql	varchar(8000)
	
	select @sql = report_parameters_xml from REPORT_OUTPUT WHERE report_output_id = @ReportID and definition_id = 8
	select @sql = @sql + ' for xml raw'
	exec (@sql)
GO
/****** Object:  View [dbo].[vSUMMARYDOCUMENTS]    Script Date: 10/09/2007 11:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      view [dbo].[vSUMMARYDOCUMENTS]
as
select 
	report_output_id summary_document_id, wfta.wf_task_assignment_id, 
	entity_id,gp.grantee_project_id,1 PDF, ro.gen_request_date doc_submitted_date, 
	wfta.submitted_date wfta_submitted_date, wfta.person_id, definition_id, rd.description document_title
	from report_output ro
	join wf_task_assignment wfta on wfta.wf_task_assignment_id = ro.entity_id 
	join grantee_project gp on gp.grantee_project_id = wfta.grantee_project_id
	join a_report_output_definition rd on rd.report_output_definition_id=ro.definition_id
	where status=-1 and wfta.submitted_date is not null
GO
/****** Object:  StoredProcedure [dbo].[spPDQ_SEL_QUEUED_QUERY_REPORT_WORD]    Script Date: 10/09/2007 11:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPDQ_SEL_QUEUED_QUERY_REPORT_WORD]
	@LoginName		varchar(100) = null
AS
set nocount on
select ro.report_output_id as ReportOutputID
		from REPORT_OUTPUT ro
		where (status = 0
				or status is null
			)
			and definition_id in (36)
		order by gen_request_date
GO
/****** Object:  StoredProcedure [dbo].[spPDQ_SEL_QUEUED_FILE]    Script Date: 10/09/2007 11:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[spPDQ_SEL_QUEUED_FILE]
AS
	set nocount on
/*	
	select	SF.submitted_file_id as SubmittedFileID
	from	SUBMITTED_FILE SF
	where	(conversion_status = 0 or conversion_status is null)
	order by submit_date
*/

	select	SF.submitted_file_id as SubmittedFileID
	from	SUBMITTED_FILE SF join SUBMITTED_FILE_DATA sfd 
			on sf.submitted_file_id = sfd.submitted_file_id
	where	(conversion_status = 0 or conversion_status is null)
			and (sfd.file_data is not null)
	order by submit_date
GO
/****** Object:  View [dbo].[vWF_TASK_ASSIGNMENT_WORK_GROUP_MEMBER]    Script Date: 10/09/2007 11:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[vWF_TASK_ASSIGNMENT_WORK_GROUP_MEMBER]
AS

SELECT DISTINCT wfta.wf_task_assignment_id,
	wgm.person_id,
	wgm.work_group_id
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN GRANTEE_PROJECT gp on wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WORK_GROUP_TASK_LIST wgtl on gp.wf_project_id = wgtl.wf_project_id
			AND wfta.wf_task_id = wgtl.wf_task_id
			AND wfta.wf_task_status_id = wgtl.wf_status_id
			AND wfta.wf_task_outcome_id = wgtl.wf_outcome_id
		JOIN work_group_member wgm on wgtl.work_group_id = wgm.work_group_id
GO
/****** Object:  View [dbo].[vBioMedPanelReviewList]    Script Date: 10/09/2007 11:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vBioMedPanelReviewList]
AS
/*
SELECT DISTINCT 
	wftar.wf_task_assignment_id AS RevWftaID, 
	wftar.wf_task_id AS RevWfTaskID,
	wftar.wf_task_status_id AS RevWfTaskStatusID, 
	wftar.person_id AS ReviewerID,
	wftar.grantee_project_id AS GranteeProjectID, 
	wftaa.wf_task_assignment_id AS AppWftaID,
	PERSON.name_last + ', ' + PERSON.name_first + ISNULL(' ' + PERSON.name_middle, '') AS ApplicantName, 
	wftar.review_rating AS ReviewRating, 
	WF_TASK_ASSIGNMENT_REVIEW.comments AS Comments,
	a_REPORT_OUTPUT_DEFINITION.report_output_definition_id AS RevPDFDefinitionID
FROM a_WF_PROJECT_TASK
	JOIN a_WF_PROJECT_PDF ON a_WF_PROJECT_TASK.wf_project_id = a_WF_PROJECT_PDF.wf_project_id
	JOIN a_REPORT_OUTPUT_DEFINITION ON a_WF_PROJECT_PDF.final_pdf_report_key = a_REPORT_OUTPUT_DEFINITION.definition_key 
	JOIN WF_TASK_ASSIGNMENT wftaa ON a_WF_PROJECT_TASK.wf_task_id = wftaa.wf_task_id
	JOIN GRANTEE_PROJECT ON wftaa.grantee_project_id = GRANTEE_PROJECT.grantee_project_id
	JOIN REVIEW_CYCLE_PROJECT_TASK ON REVIEW_CYCLE_PROJECT_TASK.project_task_id = a_WF_PROJECT_TASK.id
	JOIN REVIEW_CYCLE_STAGE ON REVIEW_CYCLE_PROJECT_TASK.review_cycle_id = REVIEW_CYCLE_STAGE.review_cycle_id
	JOIN WF_TASK_ASSIGNMENT wftar ON 
		(REVIEW_CYCLE_STAGE.review_cycle_stage_id = wftar.review_cycle_stage_id
		AND GRANTEE_PROJECT.grantee_project_id = wftar.grantee_project_id)
	JOIN PERSON ON PERSON.person_id = GRANTEE_PROJECT.primary_person_id
	LEFT JOIN WF_TASK_ASSIGNMENT_REVIEW ON WF_TASK_ASSIGNMENT_REVIEW.wf_task_assignment_id = wftar.wf_task_assignment_id
WHERE	wftar.wf_task_role_id = 7 
	AND a_WF_PROJECT_PDF.report_output_definition_type_id = 1 --Applicant PDF 
	AND wftaa.wf_task_role_id = 1
*/

SELECT DISTINCT
	wftar.wf_task_assignment_id AS RevWftaID, 
	wftar.wf_task_id AS RevWfTaskID, 
	wftar.wf_task_status_id AS RevWfTaskStatusID, 
	wftar.person_id AS ReviewerID, 
	wftar.grantee_project_id AS GranteeProjectID, 
	wftaa.wf_task_assignment_id AS AppWftaID, 
	pa.name_last + ', ' + pa.name_first + ISNULL(' ' + pa.name_middle, '') AS ApplicantName, 
	wftar.review_rating AS ReviewRating, 
	WF_TASK_ASSIGNMENT_REVIEW.comments AS Comments, 
	a_REPORT_OUTPUT_DEFINITION.report_output_definition_id AS RevPDFDefinitionID
FROM	WF_TASK_ASSIGNMENT wftar 
	INNER JOIN GRANTEE_PROJECT gp ON wftar.grantee_project_id = gp.grantee_project_id 
	INNER JOIN PERSON pa ON gp.primary_person_id = pa.person_id 
	INNER JOIN WF_TASK_ASSIGNMENT wftaa ON gp.grantee_project_id = wftaa.grantee_project_id 
		AND gp.primary_person_id = wftaa.person_id 
	INNER JOIN a_WF_PROJECT_TASK ON wftaa.wf_task_id = a_WF_PROJECT_TASK.wf_task_id 
		AND gp.wf_project_id = a_WF_PROJECT_TASK.wf_project_id 
	INNER JOIN a_WF_PROJECT_PDF ON a_WF_PROJECT_TASK.wf_project_id = a_WF_PROJECT_PDF.wf_project_id 
	INNER JOIN a_REPORT_OUTPUT_DEFINITION ON a_WF_PROJECT_PDF.final_pdf_report_key = a_REPORT_OUTPUT_DEFINITION.definition_key 
	LEFT OUTER JOIN WF_TASK_ASSIGNMENT_REVIEW ON wftar.wf_task_assignment_id = WF_TASK_ASSIGNMENT_REVIEW.wf_task_assignment_id
WHERE	wftaa.wf_task_role_id = 1 
	AND wftar.wf_task_role_id = 7 
	AND a_WF_PROJECT_PDF.report_output_definition_type_id = 1
GO
/****** Object:  View [dbo].[vBiomedUACStage1]    Script Date: 10/09/2007 11:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vBiomedUACStage1]
AS

SELECT	gprs.id AS GranteeProjectReviewStageID,
		gprs.review_cycle_stage_id AS ReviewCycleStageID,
		gp.grantee_project_id AS GranteeProjectID,
		pa.name_last + ', ' + pa.name_first + ISNULL(' ' + pa.name_middle, '') AS ApplicantName, 
		pa.person_id AS AppPersonID,
		wfta_rev.person_id AS ReviewerID
FROM	GRANTEE_PROJECT_REVIEW_STAGE gprs
	JOIN GRANTEE_PROJECT gp ON gp.grantee_project_id = gprs.grantee_project_id
	JOIN PERSON pa ON pa.person_id = gp.primary_person_id
	--JOIN WF_TASK_ASSIGNMENT wfta_program_director ON wfta_program_director.grantee_project_id = gp.grantee_project_id
		--AND wfta_program_director.wf_task_role_id = 1
	JOIN WF_TASK_ASSIGNMENT wfta_rev ON wfta_rev.grantee_project_id = gp.grantee_project_id
		AND wfta_rev.review_cycle_stage_id = gprs.review_cycle_stage_id
GO
/****** Object:  StoredProcedure [dbo].[spCALCULATE_MIN_MAX_REVIEWSCORES]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[spCALCULATE_MIN_MAX_REVIEWSCORES]
(
	@ReviewCycleStageID INT,
	@ReviewCommitteeID INT = null
)
AS
set nocount on

DECLARE 
	@min float,
	@max float,
	@variance float,
	@grantee_project_id int
		
If @ReviewCommitteeID Is null 
BEGIN
	DECLARE criteria CURSOR FOR 
		SELECT	grantee_project_id
		FROM	grantee_project_review_stage 
		WHERE	review_cycle_stage_id = @ReviewCycleStageID
	
	OPEN criteria
	FETCH NEXT FROM criteria into @grantee_project_id
	WHILE @@FETCH_STATUS=0
	BEGIN
		set @max = 0
		set @min = 0
		set @variance = 0
	
		select @max = MAX(review_rating), @min = MIN(review_rating)
		from WF_TASK_ASSIGNMENT 
		where grantee_project_id = @grantee_project_id and
			review_cycle_stage_id = @ReviewCycleStageID
	
		set @variance = @max - @min
		update grantee_project_review_stage set max_value=@max, min_value=@min, variance = @variance
		where grantee_project_id = @grantee_project_id and
			review_cycle_stage_id = @ReviewCycleStageID
	
		FETCH NEXT FROM criteria into @grantee_project_id
	
	END
	CLOSE criteria
	DEALLOCATE criteria
END
Else
BEGIN
	DECLARE criteria CURSOR FOR 
		SELECT	grantee_project_id
		FROM	grantee_project_review_stage 
		WHERE	review_cycle_stage_id = @ReviewCycleStageID and
			review_committee_id = @ReviewCommitteeID
	
	OPEN criteria
	FETCH NEXT FROM criteria into @grantee_project_id
	WHILE @@FETCH_STATUS=0
	BEGIN
		set @max = 0
		set @min = 0
		set @variance = 0
	
		select @max = MAX(review_rating), @min = MIN(review_rating)
		from WF_TASK_ASSIGNMENT 
		where grantee_project_id = @grantee_project_id and
			review_cycle_stage_id = @ReviewCycleStageID and
			review_committee_id = @ReviewCommitteeID
	
	
		set @variance = @max - @min
		update grantee_project_review_stage set max_value=@max, min_value=@min, variance = @variance
		where grantee_project_id = @grantee_project_id and
			review_cycle_stage_id = @ReviewCycleStageID and
			review_committee_id = @ReviewCommitteeID
	
		FETCH NEXT FROM criteria into @grantee_project_id
	
	END
	CLOSE criteria
	DEALLOCATE criteria
END
GO
/****** Object:  View [dbo].[vPERSON_WORK_GROUP_TASK_ASSIGNMENT]    Script Date: 10/09/2007 11:50:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPERSON_WORK_GROUP_TASK_ASSIGNMENT]
AS
SELECT DISTINCT p.person_id, wfta.wf_task_assignment_id
FROM         dbo.PERSON p INNER JOIN
                      dbo.WORK_GROUP_MEMBER wgm ON p.person_id = wgm.person_id INNER JOIN
                      dbo.a_WORK_GROUP_TASK_LIST wgtl ON wgm.work_group_id = wgtl.work_group_id INNER JOIN
                      dbo.WF_TASK_ASSIGNMENT wfta ON wgtl.wf_task_id = wfta.wf_task_id AND wgtl.wf_status_id = wfta.wf_task_status_id INNER JOIN
                      dbo.GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id AND wgtl.wf_project_id = gp.wf_project_id
WHERE     (wfta.person_id IS NULL)
GO
/****** Object:  StoredProcedure [dbo].[spCALCULATE_RANKINGS]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  PROCEDURE [dbo].[spCALCULATE_RANKINGS]
(
	@review_cycle_stage_id INT,
	@wf_task_role_id INT = 7,
	@Include int = 0
)
AS
set nocount on

IF @Include = 0
	UPDATE GRANTEE_PROJECT_REVIEW_STAGE
	SET rank = NULL
	WHERE review_cycle_stage_id = @review_cycle_stage_id

DECLARE @rating float,
		@rank_rating float,
		@total float,
		@grantee_project_id varchar(20),
		@r int,
		@temp_rank int,
		@last_rank_rating float,
		@intSameScore int,
		@bolSameScore int

Set @r = 1
Create table #t(id int identity, grantee_project_id varchar(20) NULL, average_rating float NULL, rank int NULL)
delete from #t

insert into #T(grantee_project_id, average_rating)
SELECT gprs.grantee_project_id, gprs.average_rating
FROM grantee_project_review_stage gprs
	join grantee_project gp on gp.grantee_project_id = gprs.grantee_project_id
	join a_wf_project wp on wp.id = gp.wf_project_id
WHERE review_cycle_stage_id = @review_cycle_stage_id 
	and (flag_for_action = 1 Or @Include = 1)
	--and gp.wf_project_outcome_id is null 
	and gprs.average_rating is not null

set @intSameScore = 0

DECLARE criteria CURSOR FOR 
	SELECT grantee_project_id, average_rating
	from #t
	order by average_rating
OPEN criteria
FETCH NEXT FROM criteria into @grantee_project_id, @rating
WHILE @@FETCH_STATUS=0
BEGIN
	print '@last_rank_rating'
	print @last_rank_rating
	print '@rating'
	print @rating
	
	If @temp_rank = 0 or @temp_rank is null
	BEGIN
		set @temp_rank = @r
	END

	IF @last_rank_rating = @rating
	BEGIN
		print 'same rating'
	END
	ELSE
	BEGIN
		print 'diff rating'
		
		set @r = @temp_rank
	END

	print '@temp_rank'
	print @temp_rank
	print '@r'
	print @r
	UPDATE	grantee_project_review_stage 
	SET		rank = @r
	WHERE	grantee_project_id = @grantee_project_id 
		and review_cycle_stage_id = @review_cycle_stage_id

	set @last_rank_rating = @rating
	set @temp_rank = @temp_rank + 1
	FETCH NEXT FROM criteria into @grantee_project_id, @rating
END
CLOSE criteria
DEALLOCATE criteria

delete from #t
drop table #t

set nocount off
GO
/****** Object:  StoredProcedure [dbo].[spCOPY_REQUESTS_CONFLICTS]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[spCOPY_REQUESTS_CONFLICTS]
(
	@review_cycle_id INT,
	@wf_task_role_id INT = 7
)
AS

SET NOCOUNT ON

DECLARE @task_id INT,
		@project_id int,
		@outcome_id INT,
		@wfta_id INT,
		@app_person_id INT,
		@rev_person_id INT,
		@conflict_type_id INT,
		@request_conflict_id INT,
		@review_source_id INT,
		@rev_wfta_id INT,
		@rev_committee_id INT,
		@ReturnCode int,
		@table varchar(100),
		@id int,
		@NewID int,
		@org_id int,
		@cnt int,
		@PrevCycleID int,
		@ProgramID int,
		@CompetitionID int,
		@TimePeriodID int,
		@matching_research_fields int,
		@matching_research_areas int

SELECT	@ProgramID = program_id,
		@CompetitionID = competition_id,
		@TimePeriodID = time_period_id,
		@PrevCycleID = previous_review_cycle_id
FROM	a_REVIEW_CYCLE
WHERE	id = @review_cycle_id

DELETE FROM review_cycle_conflict 
WHERE review_cycle_id = @review_cycle_id 
	AND review_source_id = 1

DECLARE criteria CURSOR FORWARD_ONLY FOR 
SELECT	task_id, 
		project_id, 
		task_outcome_id
FROM	review_cycle_project_task_outcome
WHERE	review_cycle_id = @review_cycle_id

OPEN criteria
FETCH NEXT FROM criteria 
INTO	@task_id, 
		@project_id, 
		@outcome_id

WHILE @@FETCH_STATUS=0
BEGIN
	--copy conflicts from the previous cycle
	DECLARE conflict CURSOR FORWARD_ONLY FOR 
		SELECT	rev_person_id, 
				app_person_id, 
				conflict_type_id, 
				request_conflict_id, 
				review_source_id, 
				wfta_id, 
				rev_wfta_id, 
				rev_committee_id, 
				@matching_research_fields, 
				@matching_research_areas
		FROM	review_cycle_conflict
		WHERE	review_cycle_id = @PrevCycleID 
			--AND review_source_id <> 1
			AND request_conflict_id > 0
			AND app_person_id IN (		
				SELECT	wfta.person_id
				FROM	wf_task_assignment wfta
					JOIN grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
					JOIN grantee_project_outcomes gpo on gp.grantee_project_id = gpo.grantee_project_id
				WHERE	wfta.wf_task_role_id = 1 
					AND wfta.wf_task_status_id = 2 
					AND gp.wf_project_id = @project_id
					AND gpo.wf_task_id = @task_id 
					AND gpo.outcome_id = @outcome_id 
				)


	open conflict
	fetch next from conflict 
	into @rev_person_id, 
		@app_person_id, 
		@conflict_type_id, 
		@request_conflict_id, 
		@review_source_id, 
		@wfta_id, 
		@rev_wfta_id, 
		@rev_committee_id,
		@matching_research_fields,
		@matching_research_areas
	
	while @@fetch_status=0
	begin	
		SELECT @cnt = COUNT(*)
		FROM review_cycle_conflict 
		WHERE review_cycle_id = @review_cycle_id 
			AND rev_person_id = @rev_person_id 
			AND app_person_id = @app_person_id
		IF @cnt < 1
		BEGIN
			exec @ReturnCode = getid_sel @table = 'review_cycle_conflict', @id = @NewID OUTPUT, @mode = 2
			
			insert into review_cycle_conflict(review_cycle_conflict_id,
				review_cycle_id,
				rev_person_id,
				app_person_id,
				conflict_type_id,
				request_conflict_id,
				review_source_id,
				wfta_id,
				rev_wfta_id,
				rev_committee_id,
				matching_research_fields,
				matching_research_areas)
			values (@NewID, 
				@review_cycle_id,  
				@rev_person_id, 
				@app_person_id, 
				@conflict_type_id, 
				@request_conflict_id, 
				@review_source_id, 
				@wfta_id, 
				@rev_wfta_id, 
				@rev_committee_id,
				@matching_research_fields,
				@matching_research_areas)
		END

		fetch next from conflict 
		into @rev_person_id, 
			@app_person_id, 
			@conflict_type_id, 
			@request_conflict_id, 
			@review_source_id, 
			@wfta_id, 
			@rev_wfta_id, 
			@rev_committee_id,
			@matching_research_fields,
			@matching_research_areas
	end

	close conflict
	deallocate conflict


	-- loop through the applicants
	DECLARE app CURSOR FORWARD_ONLY FOR 
		SELECT	wfta.person_id, 
				wfta.wf_task_assignment_id
		FROM	WF_TASK_ASSIGNMENT wfta 
			JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id 
			JOIN GRANTEE_PROJECT_OUTCOMES gpo ON gp.grantee_project_id = gpo.grantee_project_id
		WHERE	wfta.wf_task_role_id = 1 
			AND wfta.wf_task_status_id = 2 
			AND gp.wf_project_id = @project_id 
			AND gpo.wf_task_id = @task_id
			AND gpo.outcome_id = @outcome_id 

	open app
	fetch next from app 
	into @app_person_id, @wfta_id

	while @@fetch_status=0
	begin 
		DECLARE rev CURSOR FORWARD_ONLY FOR 
			SELECT	rcc.review_committee_id, 
					rcm.person_id
			FROM	review_cycle_committee  rcc
			JOIN review_committee_member rcm on rcc.review_committee_id = rcm.review_committee_id
			WHERE	rcc.review_cycle_id = @review_cycle_id 
 
		open rev
		fetch next from rev 
		into @rev_committee_id, @rev_person_id

		while @@fetch_status=0
		begin
			SELECT	@cnt = COUNT(*)
			FROM	review_cycle_conflict 
			WHERE	review_cycle_id = @review_cycle_id 
				AND app_person_id = @app_person_id 
				AND rev_person_id = @rev_person_id

			IF @cnt = 0
			-- new record, no conflict/request
			BEGIN
				EXEC @ReturnCode = getid_sel @table = 'review_cycle_conflict', @id = @NewID OUTPUT, @mode = 2
				INSERT INTO review_cycle_conflict(review_cycle_conflict_id,
					review_cycle_id,
					rev_person_id,
					app_person_id,
					conflict_type_id,
					request_conflict_id,
					review_source_id,
					wfta_id,
					rev_wfta_id,
					rev_committee_id)
				VALUES (@NewID, 
					@review_cycle_id, 
					@rev_person_id, 
					@app_person_id, 
					0, 
					0, 
					1, 
					@wfta_id, 
					NULL, 
					@rev_committee_id)
			END

			fetch next from rev 
			into @rev_committee_id, @rev_person_id
		end
		close rev
		deallocate rev

		fetch next from app 
		into @app_person_id, @wfta_id
	end
	close app
	deallocate app

	FETCH NEXT FROM criteria 
	INTO	@task_id, 
			@project_id, 
			@outcome_id
END
CLOSE criteria
DEALLOCATE criteria

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spGENERATE_PRIMARY_CONFLICTS]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[spGENERATE_PRIMARY_CONFLICTS]
(
	@review_cycle_id INT,
	@wf_task_role_id INT = 7
)
AS

SET NOCOUNT ON

DECLARE @task_id INT,
		@project_id int,
		@outcome_id INT,
		@wfta_id INT,
		@app_person_id INT,
		@rev_person_id INT,
		@conflict_type_id INT,
		@request_conflict_id INT,
		@review_source_id INT,
		@rev_wfta_id INT,
		@rev_committee_id INT,
		@ReturnCode int,
		@table varchar(100),
		@id int,
		@NewID int,
		@org_id int,
		@cnt int,
		@PrevCycleID int,
		@ProgramID int,
		@CompetitionID int,
		@TimePeriodID int,
		@matching_research_fields int,
		@matching_research_areas int,
		@CurrentDataCommAND int,
		@cnt2 int,
		@MatchType int,
		@RecConfID int,
		@RC_ID int

/*
--set the data commAND status to in process
SELECT	@CurrentDataCommAND = MAX(DATA_COMMAND_REQUEST_ID) 
FROM	DATA_COMMAND_REQUEST

UPDATE	DATA_COMMAND_REQUEST 
SET	status = 1 
WHERE	DATA_COMMAND_REQUEST_ID = @CurrentDataCommAND
*/

SELECT	@ProgramID = program_id,
		@CompetitionID = competition_id,
		@TimePeriodID = time_period_id,
		@PrevCycleID = previous_review_cycle_id
FROM	a_REVIEW_CYCLE
WHERE	id = @review_cycle_id

DELETE FROM review_cycle_conflict 
WHERE review_cycle_id = @review_cycle_id 
	AND review_source_id = 1

DECLARE criteria CURSOR FORWARD_ONLY FOR 
SELECT	task_id, 
		project_id, 
		task_outcome_id
FROM	review_cycle_project_task_outcome
WHERE	review_cycle_id = @review_cycle_id

OPEN criteria
FETCH NEXT FROM criteria 
INTO	@task_id, 
		@project_id, 
		@outcome_id

WHILE @@FETCH_STATUS=0
BEGIN
	--copy conflicts from the previous cycle
	DECLARE conflict CURSOR FORWARD_ONLY FOR 
		SELECT	rev_person_id, 
				app_person_id, 
				conflict_type_id, 
				request_conflict_id, 
				review_source_id, 
				wfta_id, 
				rev_wfta_id, 
				rev_committee_id, 
				@matching_research_fields, 
				@matching_research_areas
		FROM	review_cycle_conflict
		WHERE	review_cycle_id = @PrevCycleID 
			AND review_source_id <> 1
			AND request_conflict_id > 0
			AND app_person_id IN (		
				SELECT	wfta.person_id
				FROM	wf_task_assignment wfta
					JOIN grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
					JOIN grantee_project_outcomes gpo on gp.grantee_project_id = gpo.grantee_project_id
				WHERE	wfta.wf_task_role_id = 1 
					AND wfta.wf_task_status_id = 2 
					AND gp.wf_project_id = @project_id
					AND gpo.wf_task_id = @task_id 
					AND gpo.outcome_id = @outcome_id 
				)

/*
			AND app_person_id IN (		
				SELECT	gp.primary_person_id
				FROM	grantee_project gp
					JOIN grantee_project_outcomes gpo on gp.grantee_project_id = gpo.grantee_project_id
				WHERE	gp.wf_project_id = @project_id
					AND gpo.wf_task_id = @task_id 
					AND gpo.outcome_id = @outcome_id 
				)

*/

	open conflict
	fetch next from conflict 
	into @rev_person_id, 
		@app_person_id, 
		@conflict_type_id, 
		@request_conflict_id, 
		@review_source_id, 
		@wfta_id, 
		@rev_wfta_id, 
		@rev_committee_id,
		@matching_research_fields,
		@matching_research_areas
	
	while @@fetch_status=0
	begin	
		SELECT @cnt = COUNT(*)
		FROM review_cycle_conflict 
		WHERE review_cycle_id = @review_cycle_id 
			AND rev_person_id = @rev_person_id 
			AND app_person_id = @app_person_id
		IF @cnt < 1
		BEGIN
			exec @ReturnCode = getid_sel @table = 'review_cycle_conflict', @id = @NewID OUTPUT, @mode = 2
			
			insert into review_cycle_conflict(review_cycle_conflict_id,
				review_cycle_id,
				rev_person_id,
				app_person_id,
				conflict_type_id,
				request_conflict_id,
				review_source_id,
				wfta_id,
				rev_wfta_id,
				rev_committee_id,
				matching_research_fields,
				matching_research_areas)
			values (@NewID, 
				@review_cycle_id,  
				@rev_person_id, 
				@app_person_id, 
				@conflict_type_id, 
				@request_conflict_id, 
				@review_source_id, 
				@wfta_id, 
				@rev_wfta_id, 
				@rev_committee_id,
				@matching_research_fields,
				@matching_research_areas)
		END

		fetch next from conflict 
		into @rev_person_id, 
			@app_person_id, 
			@conflict_type_id, 
			@request_conflict_id, 
			@review_source_id, 
			@wfta_id, 
			@rev_wfta_id, 
			@rev_committee_id,
			@matching_research_fields,
			@matching_research_areas
	end

	close conflict
	deallocate conflict

	-- match against applicant name
	DECLARE app CURSOR FORWARD_ONLY FOR 
		/*
		SELECT	wfta.person_id, 
				wfta.wf_task_assignment_id, 
				poa.organization_id
		FROM	wf_task_assignment wfta
		JOIN person_organization_affiliation poa on wfta.person_id = poa.person_id AND is_primary = 1
		JOIN grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		JOIN grantee_project_outcomes gpo on gp.grantee_project_id = gpo.grantee_project_id AND	wfta.wf_task_id = gpo.wf_task_id 
		WHERE	wfta.wf_task_id = @task_id 
			AND gpo.outcome_id = @outcome_id 
			AND wfta.wf_task_role_id = 1 
			AND wfta.wf_task_status_id = 2 
			AND gp.wf_project_id = @project_id
		*/
		SELECT	wfta.person_id, 
				wfta.wf_task_assignment_id, 
				poa.organization_id
		FROM	WF_TASK_ASSIGNMENT wfta 
			JOIN PERSON_ORGANIZATION_AFFILIATION poa ON wfta.person_id = poa.person_id AND poa.is_primary = 1 
			JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id 
			JOIN GRANTEE_PROJECT_OUTCOMES gpo ON gp.grantee_project_id = gpo.grantee_project_id
		WHERE	wfta.wf_task_role_id = 1 
			AND wfta.wf_task_status_id = 2 
			AND gp.wf_project_id = @project_id 
			AND gpo.wf_task_id = @task_id
			AND gpo.outcome_id = @outcome_id 

	open app
	fetch next from app 
	into @app_person_id, @wfta_id, @org_id 

	while @@fetch_status=0
	begin 
		DECLARE rev CURSOR FORWARD_ONLY FOR 
			SELECT	rcc.review_committee_id, 
					rcm.person_id
			FROM	review_cycle_committee  rcc
			JOIN review_committee_member rcm on rcc.review_committee_id = rcm.review_committee_id
			WHERE	rcc.review_cycle_id = @review_cycle_id 
 
		open rev
		fetch next from rev 
		into @rev_committee_id, @rev_person_id

		while @@fetch_status=0
		begin
			SET @MatchType = 0

			SELECT	@cnt2 = COUNT(*)
			FROM	review_cycle_conflict 
			WHERE	review_cycle_id = @review_cycle_id 
				AND app_person_id = @app_person_id 
				AND rev_person_id = @rev_person_id

			SELECT	@cnt = COUNT(*)
			FROM	person_organization_affiliation
			WHERE	person_id = @rev_person_id
				AND	organization_id = @org_id
				AND	is_primary = 1

			IF @cnt > 0
			BEGIN
				--Primary Inst. match
				SET @MatchType = 11 --Same institution as Applicant
				SET	@RecConfID = 2
			END
			ELSE
				SET	@RecConfID = 0

			IF @cnt2 = 0
			-- new primary inst. conflict
			BEGIN
				EXEC @ReturnCode = getid_sel @table = 'review_cycle_conflict', @id = @NewID OUTPUT, @mode = 2
				INSERT INTO review_cycle_conflict(review_cycle_conflict_id,
					review_cycle_id,
					rev_person_id,
					app_person_id,
					conflict_type_id,
					request_conflict_id,
					review_source_id,
					wfta_id,
					rev_wfta_id,
					rev_committee_id)
				VALUES (@NewID, 
					@review_cycle_id, 
					@rev_person_id, 
					@app_person_id, 
					@MatchType, 
					@RecConfID, 
					1, 
					@wfta_id, 
					NULL, 
					@rev_committee_id)
			END
			ELSE
			BEGIN
				SELECT	@RC_ID = request_conflict_id
				FROM	review_cycle_conflict 
				WHERE	review_cycle_id = @review_cycle_id 
					AND app_person_id = @app_person_id 
					AND rev_person_id = @rev_person_id

				IF @cnt > 0 AND @RC_ID = 1
				--Auto Conflict overrides the external Request
				BEGIN
					UPDATE	review_cycle_conflict
					SET		conflict_type_id = 11,
							request_conflict_id = 2,
							review_source_id = 1
					WHERE	review_cycle_id = @review_cycle_id 
						AND app_person_id = @app_person_id 
						AND rev_person_id = @rev_person_id
				END
			END

			fetch next from rev 
			into @rev_committee_id, @rev_person_id
		end
		close rev
		deallocate rev

		fetch next from app 
		into @app_person_id, @wfta_id, @org_id
	end
	close app
	deallocate app

	FETCH NEXT FROM criteria 
	INTO	@task_id, 
			@project_id, 
			@outcome_id
END
CLOSE criteria
DEALLOCATE criteria

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spGENERATE_RESEARCH_AREA]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[spGENERATE_RESEARCH_AREA]
(
	@review_cycle_id INT,
	@wf_task_role_id INT = 7
)
AS

SET NOCOUNT ON

DECLARE @task_id INT,
		@project_id int,
		@outcome_id INT,
		@wfta_id INT,
		@app_person_id INT,
		@rev_person_id INT,
		@conflict_type_id INT,
		@request_conflict_id INT,
		@review_source_id INT,
		@rev_wfta_id INT,
		@rev_committee_id INT,
		@ReturnCode int,
		@table varchar(100),
		@id int,
		@NewID int,
		@cnt int,
		@PrevCycleID int,
		@ProgramID int,
		@CompetitionID int,
		@TimePeriodID int,
		@matching_research_fields int,
		@matching_research_areas int,
		@RC_ID int,
		@MatchAreas int,
		@MatchFields int,
		@MatchType int,
		@CurrentDataCommand int

/*
--set the data command status to in process
SELECT	@CurrentDataCommand = MAX(DATA_COMMAND_REQUEST_ID) 
FROM	DATA_COMMAND_REQUEST

UPDATE	DATA_COMMAND_REQUEST 
SET	status = 1 
WHERE	DATA_COMMAND_REQUEST_ID = @CurrentDataCommand
*/

SELECT	@ProgramID = program_id,
		@CompetitionID = competition_id,
		@TimePeriodID = time_period_id,
		@PrevCycleID = previous_review_cycle_id
FROM	a_REVIEW_CYCLE
WHERE	id = @review_cycle_id

DELETE FROM review_cycle_conflict 
WHERE review_cycle_id = @review_cycle_id 
	AND review_source_id = 1

DECLARE criteria CURSOR FORWARD_ONLY FOR 
SELECT	task_id, 
		project_id, 
		task_outcome_id
FROM	review_cycle_project_task_outcome
WHERE	review_cycle_id = @review_cycle_id

OPEN criteria
FETCH NEXT FROM criteria 
INTO	@task_id, 
		@project_id, 
		@outcome_id

WHILE @@FETCH_STATUS=0
BEGIN
	--copy conflicts from the previous cycle
	DECLARE conflict CURSOR FORWARD_ONLY FOR 
		SELECT	rev_person_id, 
				app_person_id, 
				conflict_type_id, 
				request_conflict_id, 
				review_source_id, 
				wfta_id, 
				rev_wfta_id, 
				rev_committee_id, 
				matching_research_fields, 
				matching_research_areas
		FROM	review_cycle_conflict
		WHERE	review_cycle_id = @PrevCycleID 
			AND review_source_id <> 1
			AND request_conflict_id > 0
			AND app_person_id IN (
				SELECT	wfta.person_id
				FROM	wf_task_assignment wfta
					JOIN grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
					JOIN grantee_project_outcomes gpo on gp.grantee_project_id = gpo.grantee_project_id
				WHERE	wfta.wf_task_role_id = 1 
					AND wfta.wf_task_status_id = 2 
					AND gp.wf_project_id = @project_id
					AND gpo.wf_task_id = @task_id 
					AND gpo.outcome_id = @outcome_id 
				)

	OPEN conflict
	FETCH NEXT FROM conflict 
	INTO @rev_person_id, 
		@app_person_id, 
		@conflict_type_id, 
		@request_conflict_id, 
		@review_source_id, 
		@wfta_id, 
		@rev_wfta_id, 
		@rev_committee_id,
		@matching_research_fields,
		@matching_research_areas
	
	WHILE @@fetch_status=0
	BEGIN	
		SELECT @cnt = COUNT(*)
		FROM review_cycle_conflict 
		WHERE review_cycle_id = @review_cycle_id 
			AND rev_person_id = @rev_person_id 
			AND app_person_id = @app_person_id
		IF @cnt < 1
		BEGIN
			exec @ReturnCode = getid_sel @table = 'review_cycle_conflict', @id = @NewID OUTPUT, @mode = 2
			
			INSERT INTO review_cycle_conflict(review_cycle_conflict_id,
				review_cycle_id,
				rev_person_id,
				app_person_id,
				conflict_type_id,
				request_conflict_id,
				review_source_id,
				wfta_id,
				rev_wfta_id,
				rev_committee_id,
				matching_research_fields,
				matching_research_areas)
			VALUES (@NewID, 
				@review_cycle_id,  
				@rev_person_id, 
				@app_person_id, 
				@conflict_type_id, 
				@request_conflict_id, 
				@review_source_id, 
				@wfta_id, 
				@rev_wfta_id, 
				@rev_committee_id,
				@matching_research_fields,
				@matching_research_areas)
		END

		FETCH NEXT FROM conflict 
		INTO @rev_person_id, 
			@app_person_id, 
			@conflict_type_id, 
			@request_conflict_id, 
			@review_source_id, 
			@wfta_id, 
			@rev_wfta_id, 
			@rev_committee_id,
			@matching_research_fields,
			@matching_research_areas
	END

	CLOSE conflict
	DEALLOCATE conflict

	-- match against applicant name
	DECLARE app CURSOR FORWARD_ONLY FOR 
		SELECT	wfta.person_id, 
				wfta.wf_task_assignment_id
		FROM	wf_task_assignment wfta
			JOIN grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
			JOIN grantee_project_outcomes gpo on gp.grantee_project_id = gpo.grantee_project_id
		WHERE	wfta.wf_task_role_id = 1 
			AND wfta.wf_task_status_id = 2 
			AND gp.wf_project_id = @project_id 
			AND gpo.wf_task_id = @task_id
			AND gpo.outcome_id = @outcome_id 
		ORDER BY wfta.person_id

	OPEN app
	FETCH NEXT FROM app 
	INTO @app_person_id, @wfta_id 

	WHILE @@fetch_status=0
	BEGIN 
		DECLARE rev CURSOR FORWARD_ONLY FOR 
			SELECT	rcc.review_committee_id, 
					rcm.person_id
			FROM	review_cycle_committee  rcc
			JOIN review_committee_member rcm on rcc.review_committee_id = rcm.review_committee_id
			WHERE	rcc.review_cycle_id = @review_cycle_id 

		OPEN rev
		FETCH NEXT FROM rev 
		INTO @rev_committee_id, @rev_person_id

		WHILE @@fetch_status=0
		BEGIN
			SET	@MatchAreas = dbo.fnGetResearchAreasMatches(@app_person_id, @rev_person_id)
			SET	@MatchFields = 0

			IF @MatchAreas > 0
				SET @MatchType = 18 --Same research area as Applicant
			ELSE
				SET @MatchType = 0

			SELECT	@cnt = COUNT(*)
			FROM	review_cycle_conflict 
			WHERE	review_cycle_id = @review_cycle_id 
				AND app_person_id = @app_person_id 
				AND rev_person_id = @rev_person_id

			IF @cnt = 0
			-- new match
			BEGIN
				EXEC @ReturnCode = getid_sel @table = 'review_cycle_conflict', @id = @NewID OUTPUT, @mode = 2
				INSERT INTO review_cycle_conflict(review_cycle_conflict_id,
					review_cycle_id,
					rev_person_id,
					app_person_id,
					conflict_type_id,
					request_conflict_id,
					review_source_id,
					wfta_id,
					rev_wfta_id,
					rev_committee_id,
					matching_research_areas)
				VALUES (@NewID, 
					@review_cycle_id, 
					@rev_person_id, 
					@app_person_id, 
					@MatchType, 
					0, 
					1, 
					@wfta_id, 
					NULL, 
					@rev_committee_id,
					@MatchAreas)
			END
			ELSE
			BEGIN
				UPDATE	review_cycle_conflict
				SET		matching_research_areas = @MatchAreas
				WHERE	review_cycle_id = @review_cycle_id 
					AND app_person_id = @app_person_id 
					AND rev_person_id = @rev_person_id
			END

			FETCH NEXT FROM rev 
			INTO @rev_committee_id, @rev_person_id
		END
		CLOSE rev
		DEALLOCATE rev

		FETCH NEXT FROM app 
		INTO @app_person_id, @wfta_id
	END
	CLOSE app
	DEALLOCATE app

	FETCH NEXT FROM criteria 
	INTO	@task_id, 
			@project_id, 
			@outcome_id
END
CLOSE criteria
DEALLOCATE criteria

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spGENERATE_PRIMARY_CONFLICTS_RESEARCH_AREAS_FIELDS]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGENERATE_PRIMARY_CONFLICTS_RESEARCH_AREAS_FIELDS]
(
	@review_cycle_id INT,
	@wf_task_role_id INT = 7
)
AS

SET NOCOUNT ON

DECLARE @task_id INT,
		@project_id int,
		@outcome_id INT,
		@wfta_id INT,
		@app_person_id INT,
		@rev_person_id INT,
		@conflict_type_id INT,
		@request_conflict_id INT,
		@review_source_id INT,
		@rev_wfta_id INT,
		@rev_committee_id INT,
		@ReturnCode int,
		@table varchar(100),
		@id int,
		@NewID int,
		@org_id int,
		@cnt int,
		@PrevCycleID int,
		@ProgramID int,
		@CompetitionID int,
		@TimePeriodID int,
		@matching_research_fields int,
		@matching_research_areas int,
		@RC_ID int,
		@MatchAreas int,
		@MatchFields int,
		@MatchType int,
		@RecConfID int,
		@cnt2 int,
		@cnt3 int

SELECT	@ProgramID = program_id,
		@CompetitionID = competition_id,
		@TimePeriodID = time_period_id,
		@PrevCycleID = previous_review_cycle_id
FROM	a_REVIEW_CYCLE
WHERE	id = @review_cycle_id

DELETE FROM review_cycle_conflict 
WHERE review_cycle_id = @review_cycle_id 
	AND review_source_id = 1

DECLARE criteria CURSOR FORWARD_ONLY FOR 
SELECT	task_id, 
		project_id, 
		task_outcome_id
FROM	review_cycle_project_task_outcome
WHERE	review_cycle_id = @review_cycle_id

OPEN criteria
FETCH NEXT FROM criteria 
INTO	@task_id, 
		@project_id, 
		@outcome_id

WHILE @@FETCH_STATUS=0
BEGIN
	--copy conflicts from the previous cycle
	DECLARE conflict CURSOR FORWARD_ONLY FOR 
		SELECT	rev_person_id, 
				app_person_id, 
				conflict_type_id, 
				request_conflict_id, 
				review_source_id, 
				wfta_id, 
				rev_wfta_id, 
				rev_committee_id, 
				matching_research_fields, 
				matching_research_areas
		FROM	review_cycle_conflict
		WHERE	review_cycle_id = @PrevCycleID 
			AND review_source_id <> 1
			AND request_conflict_id > 0
			AND app_person_id IN (		
				SELECT	wfta.person_id
				FROM	wf_task_assignment wfta
					JOIN grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
					JOIN grantee_project_outcomes gpo on gp.grantee_project_id = gpo.grantee_project_id
				WHERE	wfta.wf_task_role_id = 1 
					AND wfta.wf_task_status_id = 2 
					AND gp.wf_project_id = @project_id
					AND gpo.wf_task_id = @task_id 
					AND gpo.outcome_id = @outcome_id 
				)

	OPEN conflict
	FETCH NEXT FROM conflict 
	INTO @rev_person_id, 
		@app_person_id, 
		@conflict_type_id, 
		@request_conflict_id, 
		@review_source_id, 
		@wfta_id, 
		@rev_wfta_id, 
		@rev_committee_id,
		@matching_research_fields,
		@matching_research_areas
	
	WHILE @@fetch_status=0
	BEGIN	
		SELECT @cnt = COUNT(*)
		FROM review_cycle_conflict 
		WHERE review_cycle_id = @review_cycle_id 
			AND rev_person_id = @rev_person_id 
			AND app_person_id = @app_person_id
		IF @cnt < 1
		BEGIN
			exec @ReturnCode = getid_sel @table = 'review_cycle_conflict', @id = @NewID OUTPUT, @mode = 2
			
			INSERT INTO review_cycle_conflict(review_cycle_conflict_id,
				review_cycle_id,
				rev_person_id,
				app_person_id,
				conflict_type_id,
				request_conflict_id,
				review_source_id,
				wfta_id,
				rev_wfta_id,
				rev_committee_id,
				matching_research_fields,
				matching_research_areas)
			VALUES (@NewID, 
				@review_cycle_id,  
				@rev_person_id, 
				@app_person_id, 
				@conflict_type_id, 
				@request_conflict_id, 
				@review_source_id, 
				@wfta_id, 
				@rev_wfta_id, 
				@rev_committee_id,
				@matching_research_fields,
				@matching_research_areas)
		END

		FETCH NEXT FROM conflict 
		INTO @rev_person_id, 
			@app_person_id, 
			@conflict_type_id, 
			@request_conflict_id, 
			@review_source_id, 
			@wfta_id, 
			@rev_wfta_id, 
			@rev_committee_id,
			@matching_research_fields,
			@matching_research_areas
	END

	CLOSE conflict
	DEALLOCATE conflict

	-- match against applicant name
	DECLARE app CURSOR FORWARD_ONLY FOR 
		SELECT	wfta.person_id, 
				wfta.wf_task_assignment_id, 
				poa.organization_id
		FROM	wf_task_assignment wfta
			JOIN person_organization_affiliation poa on wfta.person_id = poa.person_id AND is_primary = 1
			JOIN grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
			JOIN grantee_project_outcomes gpo on gp.grantee_project_id = gpo.grantee_project_id
		WHERE	wfta.wf_task_role_id = 1 
			AND wfta.wf_task_status_id = 2 
			AND gp.wf_project_id = @project_id 
			AND gpo.wf_task_id = @task_id
			AND gpo.outcome_id = @outcome_id 
		ORDER BY wfta.person_id

	OPEN app
	FETCH NEXT FROM app 
	INTO @app_person_id, @wfta_id, @org_id 

	WHILE @@fetch_status=0
	BEGIN 
		DECLARE rev CURSOR FORWARD_ONLY FOR 
			SELECT	rcc.review_committee_id, 
					rcm.person_id
			FROM	review_cycle_committee  rcc
			JOIN review_committee_member rcm on rcc.review_committee_id = rcm.review_committee_id
			WHERE	rcc.review_cycle_id = @review_cycle_id 
			ORDER BY rcm.person_id

		OPEN rev
		FETCH NEXT FROM rev 
		INTO @rev_committee_id, @rev_person_id

		WHILE @@fetch_status=0
		BEGIN
			SET	@MatchAreas = dbo.fnGetResearchAreasMatches(@app_person_id, @rev_person_id)
			SET	@MatchFields = dbo.fnGetResearchFieldsMatches(@app_person_id, @rev_person_id)

			SET @MatchType = 0
			IF @MatchFields > 0 AND @MatchAreas > 0
				SET @MatchType = 19 --Same research area and research field(s) as Applicant
			IF @MatchFields > 0 AND @MatchAreas = 0
				SET @MatchType = 12 --Same research field(s) as Applicant
			IF @MatchFields = 0 AND @MatchAreas > 0
				SET @MatchType = 18 --Same research area as Applicant

			SELECT	@cnt2 = COUNT(*)
			FROM	review_cycle_conflict 
			WHERE	review_cycle_id = @review_cycle_id 
				AND app_person_id = @app_person_id 
				AND rev_person_id = @rev_person_id

			SELECT	@cnt = COUNT(*)
			FROM	person_organization_affiliation
			WHERE	person_id = @rev_person_id
				AND	organization_id = @org_id
				AND	is_primary = 1

			SET @cnt3 = 0

			IF @cnt = 0
			BEGIN
				SELECT	@cnt3 = COUNT(*)
				FROM	EDUCATION 
				WHERE	person_id = @app_person_id 
					AND organization_id IN (
						SELECT	organization_id
						FROM	person_organization_affiliation
						WHERE	person_id = @rev_person_id
							AND	is_primary = 1
						)
			END

			IF @cnt > 0 OR @cnt3 > 0
			BEGIN
				--Primary Inst. match
				SET @MatchType = 11 --Same institution as Applicant
				SET	@RecConfID = 2
			END
			ELSE
				SET	@RecConfID = 0

			IF @cnt2 = 0
			-- new primary inst. conflict
			BEGIN
				EXEC @ReturnCode = getid_sel @table = 'review_cycle_conflict', @id = @NewID OUTPUT, @mode = 2
				INSERT INTO review_cycle_conflict(review_cycle_conflict_id,
					review_cycle_id,
					rev_person_id,
					app_person_id,
					conflict_type_id,
					request_conflict_id,
					review_source_id,
					wfta_id,
					rev_wfta_id,
					rev_committee_id,
					matching_research_fields,
					matching_research_areas)
				VALUES (@NewID, 
					@review_cycle_id, 
					@rev_person_id, 
					@app_person_id, 
					@MatchType, 
					@RecConfID, 
					1, 
					@wfta_id, 
					NULL, 
					@rev_committee_id,
					@MatchFields,
					@MatchAreas)
			END
			ELSE
			BEGIN
				SELECT	@RC_ID = request_conflict_id
				FROM	review_cycle_conflict 
				WHERE	review_cycle_id = @review_cycle_id 
					AND app_person_id = @app_person_id 
					AND rev_person_id = @rev_person_id

				IF @cnt > 0 AND @RC_ID = 1
				--Auto Conflict overrides the external Request
				BEGIN
					UPDATE	review_cycle_conflict
					SET		conflict_type_id = 11,
							request_conflict_id = 2,
							review_source_id = 1,
							matching_research_fields = @MatchFields,
							matching_research_areas = @MatchAreas
					WHERE	review_cycle_id = @review_cycle_id 
						AND app_person_id = @app_person_id 
						AND rev_person_id = @rev_person_id
				END
				ELSE
				BEGIN
					UPDATE	review_cycle_conflict
					SET		matching_research_fields = @MatchFields,
							matching_research_areas = @MatchAreas
					WHERE	review_cycle_id = @review_cycle_id 
						AND app_person_id = @app_person_id 
						AND rev_person_id = @rev_person_id
				END
			END

			FETCH NEXT FROM rev 
			INTO @rev_committee_id, @rev_person_id
		END
		CLOSE rev
		DEALLOCATE rev

		FETCH NEXT FROM app 
		INTO @app_person_id, @wfta_id, @org_id
	END
	CLOSE app
	DEALLOCATE app

	FETCH NEXT FROM criteria 
	INTO	@task_id, 
			@project_id, 
			@outcome_id
END
CLOSE criteria
DEALLOCATE criteria

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spCOPYCONTENT]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCOPYCONTENT] 
(
@SourceProjectID int,
@SourceTaskID int,
@TargetProjectID int,
@TargetTaskID int
)
AS

SET NOCOUNT ON

--delete existing content for @TargetProjectID and @TargetTaskID
delete from a_PAGE_CONTENT where project_id = @TargetProjectID AND wf_task_id = @TargetTaskID

DECLARE @page_key varchar(50),			
		@page_content varchar(8000), 
		@task_status_id int, 
		@ReturnCode int,
		@table varchar(100),
		@id int,
		@NewID int

	--copy content from the source project
	DECLARE page_content CURSOR FOR 
		SELECT	page_key,				
				content,				
				task_status_id
		FROM	a_PAGE_CONTENT
		WHERE	project_id = @SourceProjectID
		AND wf_task_id = @SourceTaskID

	open page_content
	fetch next from page_content 
	into @page_key,		
		 @page_content,		
		 @task_status_id
	while @@fetch_status=0
	begin	
			exec @ReturnCode = getid_sel @table = 'a_PAGE_CONTENT', @id = @NewID OUTPUT, @mode = 2
			insert into a_PAGE_CONTENT(id, project_id, wf_task_id, page_key,  content, task_status_id)
			values (@NewID, 
				@TargetProjectID,
				@TargetTaskID,
				@page_key,				
				@page_content,
				@task_status_id)
	FETCH NEXT FROM page_content 
	INTO	@page_key, 			
			@page_content,			
			@task_status_id
	end

	close page_content
	deallocate page_content
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spGENERATE_REVIEW_ASSIGNMENTS_RESEARCH_AREAS_FIELDS]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[spGENERATE_REVIEW_ASSIGNMENTS_RESEARCH_AREAS_FIELDS]
(
	@review_cycle_stage_id INT,
	@wf_task_role_id INT = 7
)
AS

SET NOCOUNT ON

DECLARE @review_cycle_id INT,
		@rev_task_id INT,
		@task_id INT,
		@project_id INT,
		@outcome_id INT,
		@wfta_id INT,
		@grantee_project_id INT,
		@app_person_id INT,
		@rev_person_id INT,
		@rev_committee_id INT,
		@ReturnCode INT,
		@table VARCHAR(100),
		@id INT,
		@NewID INT,
		@mode INT,
		@count INT,
		@num_reviewers_per_applicant INT,
		@check_conflict INT,
		@rev_count INT,
		@counter INT,
		@request_conflict_wf_task_id INT,
		@MatchResFields INT, 
		@MatchResArea INT, 
		@ReqConID INT,
		@assignment_ordinal TINYINT,
		@cnt INT,
		@PrimaryAssignment TINYINT

/*
DECLARE	@CurrentDataCommand INT
--SET the data command status to in process
SELECT	@CurrentDataCommand = MAX(DATA_COMMAND_REQUEST_ID) 
FROM	DATA_COMMAND_REQUEST

UPDATE	DATA_COMMAND_REQUEST 
SET	status = 1 
WHERE	DATA_COMMAND_REQUEST_ID = @CurrentDataCommand
*/

SELECT	@review_cycle_id = review_cycle_id, 
		@rev_task_id = task_id, 
		@num_reviewers_per_applicant = num_reviewers_per_applicant, 
		@check_conflict = check_conflict
FROM	review_cycle_stage
WHERE	review_cycle_stage_id = @review_cycle_stage_id

SELECT	@rev_count = count(*)
FROM	review_cycle_committee  rcc
	join review_committee_member rcm ON rcc.review_committee_id = rcm.review_committee_id
WHERE	rcc.review_cycle_id = @review_cycle_id


CREATE TABLE #reviewers
(
	pk_rev_id INT identity, 
	person_id INT, 
	rev_committee_id INT, 
	number_assigned INT,
	number_primary 	INT
)

DECLARE reviewers CURSOR FORWARD_ONLY FOR 
	SELECT DISTINCT rcm.person_id,
			rcc.review_committee_id
	FROM	review_cycle_committee  rcc
		join review_committee_member rcm ON rcc.review_committee_id = rcm.review_committee_id
	WHERE	rcc.review_cycle_id = @review_cycle_id
OPEN reviewers
FETCH NEXT FROM reviewers 
INTO @rev_person_id, @rev_committee_id

WHILE @@fetch_status=0
BEGIN
	SELECT	@count = COUNT(*)
	FROM	#reviewers
	WHERE	person_id = @rev_person_id

	IF @count = 0
	BEGIN
		INSERT INTO #reviewers(person_id, rev_committee_id, number_assigned, number_primary)
		VALUES(@rev_person_id, @rev_committee_id, 0, 0)
	END

	FETCH NEXT FROM reviewers 
	INTO @rev_person_id, @rev_committee_id
END

CLOSE reviewers
DEALLOCATE reviewers


--delete previous assignments for this review cycle stage
DELETE FROM WF_TASK_ASSIGNMENT_REVIEW 
WHERE wf_task_assignment_id IN (
	SELECT	wf_task_assignment_id 
	FROM	WF_TASK_ASSIGNMENT
	WHERE wf_task_id = @rev_task_id 
		AND review_cycle_stage_id = @review_cycle_stage_id
	)

DELETE FROM WF_TASK_ASSIGNMENT 
WHERE wf_task_id = @rev_task_id 
	AND review_cycle_stage_id = @review_cycle_stage_id

-- Delete from GRANTEE_PROJECT_REVIEW_STAGE
DELETE FROM GRANTEE_PROJECT_REVIEW_STAGE 
WHERE review_cycle_stage_id = @review_cycle_stage_id


DECLARE criteria CURSOR FORWARD_ONLY FOR 
	SELECT DISTINCT
			task_id, 
			project_id, 
			task_outcome_id
	FROM	review_cycle_project_task_outcome
	WHERE	review_cycle_id = @review_cycle_id

OPEN criteria
FETCH NEXT FROM criteria INTO @task_id, @project_id, @outcome_id

WHILE @@FETCH_STATUS=0
BEGIN

	DECLARE app CURSOR FORWARD_ONLY FOR 
		SELECT DISTINCT
				wfta.person_id, 
				wfta.wf_task_assignment_id, 
				wfta.grantee_project_id
		FROM wf_task_assignment wfta
			JOIN grantee_project gp ON wfta.grantee_project_id = gp.grantee_project_id
			JOIN grantee_project_outcomes gpo on gp.grantee_project_id = gpo.grantee_project_id
			JOIN a_WF_TASK wt ON wt.id = wfta.wf_task_id
		WHERE	wfta.wf_task_role_id = 1 
			AND wfta.wf_task_status_id = 2 
			AND gp.wf_project_id = @project_id 
			AND gpo.wf_task_id = @task_id
			AND gpo.outcome_id = @outcome_id 
			AND wt.wf_task_type_id = 1
		ORDER BY wfta.person_id

	OPEN app
	FETCH NEXT FROM app INTO @app_person_id, @wfta_id, @grantee_project_id
	
	WHILE @@fetch_status=0
	BEGIN
		SET @counter = 0
		SET	@assignment_ordinal = 1
		SET @PrimaryAssignment = 0

		IF @check_conflict = 1
			DECLARE rev CURSOR FORWARD_ONLY FOR 
				SELECT	revs.rev_committee_id, 
						revs.person_id,
						rc.matching_research_fields,
						rc.matching_research_areas,
						rc.request_conflict_id
				FROM	#reviewers  revs
				JOIN person p ON revs.person_id = p.person_id
				JOIN review_cycle_conflict rc ON rc.rev_person_id = revs.person_id 
					AND rc.app_person_id = @app_person_id
					AND	rc.review_cycle_id = @review_cycle_id
				WHERE	p.is_reviewer = 1
					AND rc.request_conflict_id <> 2 --avoid conflicts
				ORDER BY	revs.number_assigned,
							rc.request_conflict_id DESC,
							revs.number_primary,
							rc.matching_research_fields DESC, 
							rc.matching_research_areas DESC
		ELSE
			DECLARE rev CURSOR FORWARD_ONLY FOR 
				SELECT	revs.rev_committee_id, 
						revs.person_id,
						rc.matching_research_fields,
						rc.matching_research_areas,
						rc.request_conflict_id
				FROM	#reviewers  revs
				JOIN person p ON revs.person_id = p.person_id
				JOIN review_cycle_conflict rc ON rc.rev_person_id = revs.person_id 
					AND rc.app_person_id = @app_person_id
					AND	rc.review_cycle_id = @review_cycle_id
				WHERE	p.is_reviewer = 1
				ORDER BY	revs.number_assigned,
							revs.number_primary,
							rc.matching_research_fields DESC, 
							rc.matching_research_areas DESC

		OPEN rev
		FETCH NEXT FROM rev 
		INTO @rev_committee_id, @rev_person_id, @MatchResFields, @MatchResArea, @ReqConID

		WHILE @@fetch_status=0
		BEGIN
			IF @num_reviewers_per_applicant = -1
			BEGIN
				EXEC @ReturnCode = getid_sel @table = 'WF_TASK_ASSIGNMENT', @id = @NewID OUTPUT, @mode = 2
				INSERT INTO wf_task_assignment (wf_task_assignment_id, wf_task_id, wf_task_status_id, grantee_project_id, person_id, wf_task_role_id, review_cycle_stage_id, review_committee_id, review_assignment_type_id, review_preference_type_id, create_date)
					VALUES (@NewID, @rev_task_id,  1, @grantee_project_id, @rev_person_id, @wf_task_role_id, @review_cycle_stage_id, @rev_committee_id, @assignment_ordinal, @ReqConID, getdate())

				IF @counter = 0
				BEGIN
					EXEC @ReturnCode = getid_sel @table = 'GRANTEE_PROJECT_REVIEW_STAGE', @id = @NewID OUTPUT, @mode = 2			
					INSERT grantee_project_review_stage (id, grantee_project_id, review_cycle_stage_id, review_committee_id, app_wf_task_assignment_id)
						VALUES (@NewID, @grantee_project_id, @review_cycle_stage_id, @rev_committee_id, @wfta_id)
				END

				SET @counter = @counter + 1

				IF @assignment_ordinal = 1
				BEGIN
					SET	@assignment_ordinal = 2
					SET @PrimaryAssignment = 1
				END
				ELSE
				BEGIN
					SET @PrimaryAssignment = 0
				END

				UPDATE	#reviewers 
				SET		number_assigned = number_assigned + 1,
						number_primary = number_primary + @PrimaryAssignment
				WHERE	person_id = @rev_person_id
			END
			ELSE
			BEGIN
				IF @counter < @num_reviewers_per_applicant
				BEGIN
					SELECT @count = count(*) 
					FROM #reviewers 
					WHERE person_id = @rev_person_id
						AND	number_assigned > 0

					IF @count = 0 OR @MatchResFields > 0 OR @MatchResArea > 0 OR @ReqConID = 1
					BEGIN
						SELECT	@cnt = COUNT(*)
						FROM	wf_task_assignment
						WHERE	wf_task_id = @rev_task_id
							AND	grantee_project_id = @grantee_project_id
							AND	person_id = @rev_person_id
							AND	wf_task_role_id = @wf_task_role_id
							AND	review_cycle_stage_id = @review_cycle_stage_id

						IF @cnt = 0
						BEGIN
							EXEC @ReturnCode = getid_sel @table = 'WF_TASK_ASSIGNMENT', @id = @NewID OUTPUT, @mode = 2
							INSERT INTO wf_task_assignment (wf_task_assignment_id, wf_task_id, wf_task_status_id, grantee_project_id, person_id, wf_task_role_id, review_cycle_stage_id, review_committee_id, review_assignment_type_id, review_preference_type_id, create_date)
								VALUES (@NewID, @rev_task_id,  1, @grantee_project_id, @rev_person_id, @wf_task_role_id, @review_cycle_stage_id, @rev_committee_id, @assignment_ordinal, @ReqConID, getdate())
	
							IF @counter = 0
							BEGIN
								EXEC @ReturnCode = getid_sel @table = 'GRANTEE_PROJECT_REVIEW_STAGE', @id = @NewID OUTPUT, @mode = 2			
								INSERT grantee_project_review_stage (id, grantee_project_id, review_cycle_stage_id, review_committee_id, app_wf_task_assignment_id)
									VALUES (@NewID, @grantee_project_id, @review_cycle_stage_id, @rev_committee_id, @wfta_id)
							END
							SET @counter = @counter + 1

							IF @assignment_ordinal = 1
							BEGIN
								SET	@assignment_ordinal = 2
								SET @PrimaryAssignment = 1
							END
							ELSE
							BEGIN
								SET @PrimaryAssignment = 0
							END

							UPDATE	#reviewers 
							SET		number_assigned = number_assigned + 1,
									number_primary = number_primary + @PrimaryAssignment
							WHERE	person_id = @rev_person_id
						END
					END
				END
				ELSE
					BREAK
			END

			SELECT	@cnt = count(*) 
			FROM	#reviewers
			WHERE	number_assigned >= 1

			IF @cnt >= @rev_count
			BEGIN
				UPDATE	#reviewers 
				SET		number_assigned = number_assigned - 1
			END

			FETCH NEXT FROM rev 
			INTO @rev_committee_id, @rev_person_id, @MatchResFields, @MatchResArea, @ReqConID
		END
		CLOSE rev
		DEALLOCATE rev

		--still need to assign reviewer(s) to this applicant
		IF @num_reviewers_per_applicant <> -1 AND @counter < @num_reviewers_per_applicant
		BEGIN
			IF @check_conflict = 1
				DECLARE rev2 CURSOR FORWARD_ONLY FOR 
					SELECT	revs.rev_committee_id, 
							revs.person_id,
							rc.matching_research_fields,
							rc.matching_research_areas,
							rc.request_conflict_id
					FROM	#reviewers  revs
					JOIN person p ON revs.person_id = p.person_id
					JOIN review_cycle_conflict rc ON rc.rev_person_id = revs.person_id 
						AND rc.app_person_id = @app_person_id
						AND	rc.review_cycle_id = @review_cycle_id
					WHERE	p.is_reviewer = 1
						AND rc.request_conflict_id <> 2 --avoid conflicts
					ORDER BY	revs.number_assigned,
								rc.request_conflict_id DESC,
								revs.number_primary,
								rc.matching_research_fields DESC, 
								rc.matching_research_areas DESC
			ELSE
				DECLARE rev2 CURSOR FORWARD_ONLY FOR 
					SELECT	revs.rev_committee_id, 
							revs.person_id,
							rc.matching_research_fields,
							rc.matching_research_areas,
							rc.request_conflict_id
					FROM	#reviewers  revs
					JOIN person p ON revs.person_id = p.person_id
					JOIN review_cycle_conflict rc ON rc.rev_person_id = revs.person_id 
						AND rc.app_person_id = @app_person_id
						AND	rc.review_cycle_id = @review_cycle_id
					WHERE	p.is_reviewer = 1
					ORDER BY	revs.number_assigned,
								revs.number_primary,
								rc.matching_research_fields DESC, 
								rc.matching_research_areas DESC

			OPEN rev2
			FETCH NEXT FROM rev2
			INTO @rev_committee_id, @rev_person_id, @MatchResFields, @MatchResArea, @ReqConID

			WHILE @@fetch_status=0
			BEGIN
				IF @counter < @num_reviewers_per_applicant
				BEGIN
					SELECT	@cnt = COUNT(*)
					FROM	wf_task_assignment
					WHERE	wf_task_id = @rev_task_id
						AND	grantee_project_id = @grantee_project_id
						AND	person_id = @rev_person_id
						AND	wf_task_role_id = @wf_task_role_id
						AND	review_cycle_stage_id = @review_cycle_stage_id

					IF @cnt = 0
					BEGIN
						EXEC @ReturnCode = getid_sel @table = 'WF_TASK_ASSIGNMENT', @id = @NewID OUTPUT, @mode = 2
						INSERT INTO wf_task_assignment (wf_task_assignment_id, wf_task_id, wf_task_status_id, grantee_project_id, person_id, wf_task_role_id, review_cycle_stage_id, review_committee_id, review_assignment_type_id, review_preference_type_id, create_date)
							VALUES (@NewID, @rev_task_id,  1, @grantee_project_id, @rev_person_id, @wf_task_role_id, @review_cycle_stage_id, @rev_committee_id, @assignment_ordinal, @ReqConID, getdate())
	
						IF @counter = 0
						BEGIN
							EXEC @ReturnCode = getid_sel @table = 'GRANTEE_PROJECT_REVIEW_STAGE', @id = @NewID OUTPUT, @mode = 2			
							INSERT grantee_project_review_stage (id, grantee_project_id, review_cycle_stage_id, review_committee_id, app_wf_task_assignment_id)
								VALUES (@NewID, @grantee_project_id, @review_cycle_stage_id, @rev_committee_id, @wfta_id)
						END
						SET @counter = @counter + 1
						
						IF @assignment_ordinal = 1
						BEGIN
							SET	@assignment_ordinal = 2
							SET @PrimaryAssignment = 1
						END
						ELSE
						BEGIN
							SET @PrimaryAssignment = 0
						END

						SELECT	@count = count(*) 
						FROM	#reviewers 
						WHERE	person_id = @rev_person_id
	
						UPDATE	#reviewers 
						SET		number_assigned = number_assigned + 1,
								number_primary = number_primary + @PrimaryAssignment
						WHERE	person_id = @rev_person_id
					END
				END
				ELSE
					BREAK

				SELECT	@cnt = count(*) 
				FROM	#reviewers
				WHERE	number_assigned >= 1

				IF @cnt >= @rev_count
				BEGIN
					UPDATE	#reviewers 
					SET		number_assigned = number_assigned - 1
				END

				FETCH NEXT FROM rev2
				INTO @rev_committee_id, @rev_person_id, @MatchResFields, @MatchResArea, @ReqConID
			END
			CLOSE rev2
			DEALLOCATE rev2
		END

		FETCH NEXT FROM app INTO @app_person_id, @wfta_id, @grantee_project_id
	END
	CLOSE app
	DEALLOCATE app

	FETCH NEXT FROM criteria INTO @task_id, @project_id, @outcome_id
END
CLOSE criteria
DEALLOCATE criteria

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spGENERATE_REVIEW_ASSIGNMENTS]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[spGENERATE_REVIEW_ASSIGNMENTS]
(
	@review_cycle_stage_id INT,
	@wf_task_role_id INT = 7
)
AS

SET NOCOUNT ON

DECLARE @review_cycle_id INT,
		@rev_task_id INT,
		@task_id INT,
		@project_id INT,
		@outcome_id INT,
		@wfta_id INT,
		@grantee_project_id INT,
		@app_person_id INT,
		@rev_person_id INT,
		@rev_committee_id INT,
		@ReturnCode INT,
		@table VARCHAR(100),
		@id INT,
		@NewID INT,
		@mode INT,
		@count INT,
		@num_reviewers_per_applicant INT,
		@check_conflict INT,
		@rev_count INT,
		@counter INT,
		@request_conflict_wf_task_id INT,
		@ReqConID INT,
		@assignment_ordinal TINYINT,
		@cnt INT,
		@PrimaryAssignment TINYINT

/*
DECLARE	@CurrentDataCommand INT
--SET the data command status to in process
SELECT	@CurrentDataCommand = MAX(DATA_COMMAND_REQUEST_ID) 
FROM	DATA_COMMAND_REQUEST

UPDATE	DATA_COMMAND_REQUEST 
SET	status = 1 
WHERE	DATA_COMMAND_REQUEST_ID = @CurrentDataCommand
*/

SELECT	@review_cycle_id = review_cycle_id, 
		@rev_task_id = task_id, 
		@num_reviewers_per_applicant = num_reviewers_per_applicant, 
		@check_conflict = check_conflict
FROM	review_cycle_stage
WHERE	review_cycle_stage_id = @review_cycle_stage_id

SELECT	@rev_count = count(*)
FROM	review_cycle_committee  rcc
	join review_committee_member rcm ON rcc.review_committee_id = rcm.review_committee_id
WHERE	rcc.review_cycle_id = @review_cycle_id


CREATE TABLE #reviewers
(
	pk_rev_id INT identity, 
	person_id INT, 
	rev_committee_id INT, 
	number_assigned INT,
	number_primary INT
)

DECLARE reviewers CURSOR FORWARD_ONLY FOR 
	SELECT DISTINCT rcm.person_id,
			rcc.review_committee_id
	FROM	review_cycle_committee  rcc
		join review_committee_member rcm ON rcc.review_committee_id = rcm.review_committee_id
	WHERE	rcc.review_cycle_id = @review_cycle_id
OPEN reviewers
FETCH NEXT FROM reviewers 
INTO @rev_person_id, @rev_committee_id

WHILE @@fetch_status=0
BEGIN
	SELECT	@count = COUNT(*)
	FROM	#reviewers
	WHERE	person_id = @rev_person_id

	IF @count = 0
	BEGIN
		INSERT INTO #reviewers(person_id, rev_committee_id, number_assigned, number_primary)
		VALUES(@rev_person_id, @rev_committee_id, 0, 0)
	END

	FETCH NEXT FROM reviewers 
	INTO @rev_person_id, @rev_committee_id
END

CLOSE reviewers
DEALLOCATE reviewers


--delete previous assignments for this review cycle stage
DELETE FROM WF_TASK_ASSIGNMENT_REVIEW 
WHERE wf_task_assignment_id IN (
	SELECT	wf_task_assignment_id 
	FROM	WF_TASK_ASSIGNMENT
	WHERE wf_task_id = @rev_task_id 
		AND review_cycle_stage_id = @review_cycle_stage_id
	)

DELETE FROM WF_TASK_ASSIGNMENT 
WHERE wf_task_id = @rev_task_id 
	AND review_cycle_stage_id = @review_cycle_stage_id

-- Delete from GRANTEE_PROJECT_REVIEW_STAGE
DELETE FROM GRANTEE_PROJECT_REVIEW_STAGE 
WHERE review_cycle_stage_id = @review_cycle_stage_id


DECLARE criteria CURSOR FORWARD_ONLY FOR 
	SELECT DISTINCT
			task_id, 
			project_id, 
			task_outcome_id
	FROM	review_cycle_project_task_outcome
	WHERE	review_cycle_id = @review_cycle_id

OPEN criteria
FETCH NEXT FROM criteria INTO @task_id, @project_id, @outcome_id

WHILE @@FETCH_STATUS=0
BEGIN
	DECLARE app CURSOR FORWARD_ONLY FOR 
		SELECT DISTINCT
				wfta.person_id, 
				wfta.wf_task_assignment_id, 
				wfta.grantee_project_id
		FROM wf_task_assignment wfta
			JOIN grantee_project gp ON wfta.grantee_project_id = gp.grantee_project_id
			JOIN grantee_project_outcomes gpo on gp.grantee_project_id = gpo.grantee_project_id
			JOIN a_WF_TASK wt ON wt.id = wfta.wf_task_id
		WHERE	wfta.wf_task_role_id = 1 
			AND wfta.wf_task_status_id = 2 
			AND gp.wf_project_id = @project_id 
			AND gpo.wf_task_id = @task_id
			AND gpo.outcome_id = @outcome_id 
			AND wt.wf_task_type_id = 1
		ORDER BY wfta.person_id

	OPEN app
	FETCH NEXT FROM app INTO @app_person_id, @wfta_id, @grantee_project_id
	
	WHILE @@fetch_status=0
	BEGIN
		SET @counter = 0
		SET	@assignment_ordinal = 1
		SET @PrimaryAssignment = 0

		IF @check_conflict = 1
			DECLARE rev CURSOR FORWARD_ONLY FOR 
				SELECT	revs.rev_committee_id, 
						revs.person_id,
						rc.request_conflict_id
				FROM	#reviewers  revs
				JOIN person p ON revs.person_id = p.person_id
				JOIN review_cycle_conflict rc ON rc.rev_person_id = revs.person_id 
					AND rc.app_person_id = @app_person_id
					AND	rc.review_cycle_id = @review_cycle_id
				WHERE	p.is_reviewer = 1
					AND rc.request_conflict_id <> 2 --avoid conflicts
				ORDER BY	revs.number_assigned,
							rc.request_conflict_id DESC,
							revs.number_primary
		ELSE
			DECLARE rev CURSOR FORWARD_ONLY FOR 
				SELECT	revs.rev_committee_id, 
						revs.person_id,
						0
				FROM	#reviewers  revs
				JOIN person p ON revs.person_id = p.person_id
				WHERE	p.is_reviewer = 1
				ORDER BY	revs.number_assigned,
							revs.number_primary

		OPEN rev
		FETCH NEXT FROM rev 
		INTO @rev_committee_id, @rev_person_id, @ReqConID

		WHILE @@fetch_status=0
		BEGIN
			IF @num_reviewers_per_applicant = -1
			BEGIN
				EXEC @ReturnCode = getid_sel @table = 'WF_TASK_ASSIGNMENT', @id = @NewID OUTPUT, @mode = 2
				INSERT INTO wf_task_assignment (wf_task_assignment_id, wf_task_id, wf_task_status_id, grantee_project_id, person_id, wf_task_role_id, review_cycle_stage_id, review_committee_id, review_assignment_type_id, review_preference_type_id, create_date)
					VALUES (@NewID, @rev_task_id,  1, @grantee_project_id, @rev_person_id, @wf_task_role_id, @review_cycle_stage_id, @rev_committee_id, @assignment_ordinal, @ReqConID, getdate())

				IF @counter = 0
				BEGIN
					EXEC @ReturnCode = getid_sel @table = 'GRANTEE_PROJECT_REVIEW_STAGE', @id = @NewID OUTPUT, @mode = 2			
					INSERT grantee_project_review_stage (id, grantee_project_id, review_cycle_stage_id, review_committee_id, app_wf_task_assignment_id)
						VALUES (@NewID, @grantee_project_id, @review_cycle_stage_id, @rev_committee_id, @wfta_id)
				END
				SET @counter = @counter + 1

				IF @assignment_ordinal = 1
				BEGIN
					SET	@assignment_ordinal = 2
					SET @PrimaryAssignment = 1
				END
				ELSE
				BEGIN
					SET @PrimaryAssignment = 0
				END

				UPDATE	#reviewers 
				SET		number_assigned = number_assigned + 1,
						number_primary = number_primary + @PrimaryAssignment
				WHERE	person_id = @rev_person_id
			END
			ELSE
			BEGIN
				IF @counter < @num_reviewers_per_applicant
				BEGIN
					SELECT	@count = count(*) 
					FROM	#reviewers 
					WHERE	person_id = @rev_person_id
						AND	number_assigned > 0

					IF @count = 0 OR @ReqConID = 1
					BEGIN
						SELECT	@cnt = COUNT(*)
						FROM	wf_task_assignment
						WHERE	wf_task_id = @rev_task_id
							AND	grantee_project_id = @grantee_project_id
							AND	person_id = @rev_person_id
							AND	wf_task_role_id = @wf_task_role_id
							AND	review_cycle_stage_id = @review_cycle_stage_id

						IF @cnt = 0
						BEGIN
							EXEC @ReturnCode = getid_sel @table = 'WF_TASK_ASSIGNMENT', @id = @NewID OUTPUT, @mode = 2
							INSERT INTO wf_task_assignment (wf_task_assignment_id, wf_task_id, wf_task_status_id, grantee_project_id, person_id, wf_task_role_id, review_cycle_stage_id, review_committee_id, review_assignment_type_id, review_preference_type_id, create_date)
								VALUES (@NewID, @rev_task_id,  1, @grantee_project_id, @rev_person_id, @wf_task_role_id, @review_cycle_stage_id, @rev_committee_id, @assignment_ordinal, @ReqConID, getdate())
	
							IF @counter = 0
							BEGIN
								EXEC @ReturnCode = getid_sel @table = 'GRANTEE_PROJECT_REVIEW_STAGE', @id = @NewID OUTPUT, @mode = 2			
								INSERT grantee_project_review_stage (id, grantee_project_id, review_cycle_stage_id, review_committee_id, app_wf_task_assignment_id)
									VALUES (@NewID, @grantee_project_id, @review_cycle_stage_id, @rev_committee_id, @wfta_id)
							END
							SET @counter = @counter + 1
							
							IF @assignment_ordinal = 1
							BEGIN
								SET	@assignment_ordinal = 2
								SET @PrimaryAssignment = 1
							END
							ELSE
							BEGIN
								SET @PrimaryAssignment = 0
							END

							UPDATE	#reviewers 
							SET		number_assigned = number_assigned + 1,
									number_primary = number_primary + @PrimaryAssignment
							WHERE	person_id = @rev_person_id
						END
					END
				END
				ELSE
					BREAK
			END

			SELECT	@cnt = count(*) 
			FROM	#reviewers
			WHERE	number_assigned >= 1

			IF @cnt >= @rev_count
			BEGIN
				UPDATE	#reviewers 
				SET		number_assigned = number_assigned - 1
			END

			FETCH NEXT FROM rev 
			INTO @rev_committee_id, @rev_person_id, @ReqConID
		END
		CLOSE rev
		DEALLOCATE rev

		--still need to assign reviewer(s) to this applicant
		IF @num_reviewers_per_applicant <> -1 AND @counter < @num_reviewers_per_applicant
		BEGIN
			IF @check_conflict = 1
				DECLARE rev2 CURSOR FORWARD_ONLY FOR 
					SELECT	revs.rev_committee_id, 
							revs.person_id,
							rc.request_conflict_id
					FROM	#reviewers  revs
					JOIN person p ON revs.person_id = p.person_id
					JOIN review_cycle_conflict rc ON rc.rev_person_id = revs.person_id 
						AND rc.app_person_id = @app_person_id
						AND	rc.review_cycle_id = @review_cycle_id
					WHERE	p.is_reviewer = 1
						AND rc.request_conflict_id <> 2 --avoid conflicts
					ORDER BY	revs.number_assigned,
								rc.request_conflict_id DESC,
								revs.number_primary
			ELSE
				DECLARE rev2 CURSOR FORWARD_ONLY FOR 
					SELECT	revs.rev_committee_id, 
							revs.person_id,
							0
					FROM	#reviewers  revs
					JOIN person p ON revs.person_id = p.person_id
					WHERE	p.is_reviewer = 1
					ORDER BY	revs.number_assigned,
								revs.number_primary
			
			OPEN rev2
			FETCH NEXT FROM rev2
			INTO @rev_committee_id, @rev_person_id, @ReqConID
	
			WHILE @@fetch_status=0
			BEGIN
				IF @counter < @num_reviewers_per_applicant
				BEGIN
					SELECT	@cnt = COUNT(*)
					FROM	wf_task_assignment
					WHERE	wf_task_id = @rev_task_id
						AND	grantee_project_id = @grantee_project_id
						AND	person_id = @rev_person_id
						AND	wf_task_role_id = @wf_task_role_id
						AND	review_cycle_stage_id = @review_cycle_stage_id

					IF @cnt = 0
					BEGIN
						EXEC @ReturnCode = getid_sel @table = 'WF_TASK_ASSIGNMENT', @id = @NewID OUTPUT, @mode = 2
						INSERT INTO wf_task_assignment (wf_task_assignment_id, wf_task_id, wf_task_status_id, grantee_project_id, person_id, wf_task_role_id, review_cycle_stage_id, review_committee_id, review_assignment_type_id, review_preference_type_id, create_date)
							VALUES (@NewID, @rev_task_id,  1, @grantee_project_id, @rev_person_id, @wf_task_role_id, @review_cycle_stage_id, @rev_committee_id, @assignment_ordinal, @ReqConID, getdate())
	
						IF @counter = 0
						BEGIN
							EXEC @ReturnCode = getid_sel @table = 'GRANTEE_PROJECT_REVIEW_STAGE', @id = @NewID OUTPUT, @mode = 2			
							INSERT grantee_project_review_stage (id, grantee_project_id, review_cycle_stage_id, review_committee_id, app_wf_task_assignment_id)
								VALUES (@NewID, @grantee_project_id, @review_cycle_stage_id, @rev_committee_id, @wfta_id)
						END
						SET @counter = @counter + 1

						IF @assignment_ordinal = 1
						BEGIN
							SET	@assignment_ordinal = 2
							SET @PrimaryAssignment = 1
						END
						ELSE
						BEGIN
							SET @PrimaryAssignment = 0
						END

						SELECT	@count = count(*) 
						FROM	#reviewers 
						WHERE	person_id = @rev_person_id
	
						UPDATE	#reviewers 
						SET		number_assigned = number_assigned + 1,
								number_primary = number_primary + @PrimaryAssignment
						WHERE	person_id = @rev_person_id
					END
				END
				ELSE
					BREAK

				SELECT	@cnt = count(*) 
				FROM	#reviewers
				WHERE	number_assigned >= 1

				IF @cnt >= @rev_count
				BEGIN
					UPDATE	#reviewers 
					SET		number_assigned = number_assigned - 1
				END

				FETCH NEXT FROM rev2
				INTO @rev_committee_id, @rev_person_id, @ReqConID
			END
			CLOSE rev2
			DEALLOCATE rev2
		END

		FETCH NEXT FROM app INTO @app_person_id, @wfta_id, @grantee_project_id
	END
	CLOSE app
	DEALLOCATE app

	FETCH NEXT FROM criteria INTO @task_id, @project_id, @outcome_id
END
CLOSE criteria
DEALLOCATE criteria

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[spGENERATE_REVIEW_ASSIGNMENTS_BIOMED]    Script Date: 10/09/2007 11:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[spGENERATE_REVIEW_ASSIGNMENTS_BIOMED]
(
	@review_cycle_stage_id INT,
	@wf_task_role_id INT = 7
)
AS

SET NOCOUNT ON

DECLARE @review_cycle_id INT,
		@rev_task_id INT,
		@task_id INT,
		@project_id INT,
		@outcome_id INT,
		@wfta_id INT,
		@grantee_project_id INT,
		@app_person_id INT,
		@rev_person_id INT,
		@rev_committee_id INT,
		@ReturnCode INT,
		@table VARCHAR(100),
		@id INT,
		@NewID INT,
		@mode INT,
		@count INT,
		@num_reviewers_per_applicant INT,
		@check_conflict INT,
		@rev_count INT,
		@counter INT,
		@request_conflict_wf_task_id INT,
		@ReqConID INT,
		@assignment_ordinal TINYINT,
		@cnt INT,
		@PrimaryAssignment TINYINT,
		@review_preference_type_id TINYINT,
		@app_wfta_id INT,
		@cur_rev_person_id INT,
		@cur_cnt INT,
		@IsAvailable BIT,
		@generation_type_id TINYINT,
		@num_shared_applicants SMALLINT,
		@app_count INT,
		@RevMin SMALLINT,
		@RevMax SMALLINT,
		@RevCount SMALLINT,
		@PrimaryMin SMALLINT,
		@PrimaryMax SMALLINT

/*
DECLARE	@CurrentDataCommand INT
--SET the data command status to in process
SELECT	@CurrentDataCommand = MAX(DATA_COMMAND_REQUEST_ID) 
FROM	DATA_COMMAND_REQUEST

UPDATE	DATA_COMMAND_REQUEST 
SET	status = 1 
WHERE	DATA_COMMAND_REQUEST_ID = @CurrentDataCommand
*/

SELECT	@review_cycle_id = review_cycle_id, 
		@rev_task_id = task_id, 
		@num_reviewers_per_applicant = num_reviewers_per_applicant, 
		@check_conflict = check_conflict,
		@generation_type_id = generation_type_id,
		@num_shared_applicants = num_shared_applicants
FROM	review_cycle_stage
WHERE	review_cycle_stage_id = @review_cycle_stage_id

SELECT	@rev_count = count(*)
FROM	review_cycle_committee  rcc
	join review_committee_member rcm ON rcc.review_committee_id = rcm.review_committee_id
WHERE	rcc.review_cycle_id = @review_cycle_id
/*
select distinct @app_count = count(*)
from review_cycle_project_task_outcome rcpto
	join review_cycle_project_task as rcpt on rcpto.review_cycle_id = rcpt.review_cycle_id
	join wf_task_assignment as wfta on rcpto.task_id = wfta.wf_task_id 
		and wfta.wf_task_role_id = 1
		and wfta.wf_task_status_id = 2
	join grantee_project as gp on wfta.grantee_project_id = gp.grantee_project_id 
		and rcpto.project_id = gp.wf_project_id
	join PERSON p on p.person_id = wfta.person_id
	join GRANTEE_PROJECT_OUTCOMES gpo ON gp.grantee_project_id = gpo.grantee_project_id 
		AND wfta.wf_task_id = gpo.wf_task_id 
		AND rcpto.task_outcome_id = gpo.outcome_id 
	left JOIN PERSON_ORGANIZATION_AFFILIATION po on p.person_id = po.person_id and po.is_primary = 1
	left JOIN ORGANIZATION o on po.organization_id = o.organization_id
where	wfta.wf_task_role_id = 1
	AND	rcpto.review_cycle_id = @review_cycle_id
*/

SELECT DISTINCT @app_count = count(*)
FROM	GRANTEE_PROJECT_OUTCOMES gpo 
		JOIN GRANTEE_PROJECT gp ON gpo.grantee_project_id = gp.grantee_project_id 
		JOIN REVIEW_CYCLE_PROJECT_TASK rcpt 
			JOIN REVIEW_CYCLE_PROJECT_TASK_OUTCOME rcpto ON rcpt.review_cycle_project_task_id = rcpto.review_cycle_project_task_id 
		ON gp.wf_project_id = rcpto.project_id 
			AND gpo.wf_task_id = rcpto.task_id 
			AND gpo.outcome_id = rcpto.task_outcome_id 
		JOIN WF_TASK_ASSIGNMENT wfta ON gp.grantee_project_id = wfta.grantee_project_id 
			AND wfta.wf_task_role_id = 1 
			AND wfta.wf_task_status_id = 2
		JOIN a_WF_TASK wt ON wt.id = wfta.wf_task_id
		JOIN PERSON p ON p.person_id = wfta.person_id
		LEFT JOIN PERSON_ORGANIZATION_AFFILIATION po ON p.person_id = po.person_id 
			AND po.is_primary = 1
		LEFT JOIN ORGANIZATION o ON po.organization_id = o.organization_id
WHERE	wfta.wf_task_role_id = 1
	AND wt.wf_task_type_id = 1
	AND	rcpto.review_cycle_id = @review_cycle_id

SET	@RevMin = ROUND(@num_reviewers_per_applicant*@app_count/@rev_count, 0, 1)
SET	@RevMax = @RevMin + 1

SET	@PrimaryMin = ROUND(@app_count/@rev_count, 0, 1)
SET	@PrimaryMax = @PrimaryMin + 1

CREATE TABLE #reviewers
(
	pk_rev_id INT identity, 
	person_id INT, 
	rev_committee_id INT, 
	number_assigned INT,
	number_primary INT
)

CREATE TABLE #assignments
(
	pk_id INT identity, 
	grantee_project_id INT, 
	rev_person_id INT, 
	rev_committee_id INT,
	assignment_ordinal INT,
	review_preference_type_id INT,
	app_wfta_id INT,
	app_person_id INT
)

CREATE TABLE #RevsForAppl
(
	pk_rev_id INT identity, 
	rev_person_id INT
)

DECLARE reviewers CURSOR FAST_FORWARD FOR 
	SELECT DISTINCT rcm.person_id,
			rcc.review_committee_id
	FROM	review_cycle_committee  rcc
		JOIN review_committee_member rcm ON rcc.review_committee_id = rcm.review_committee_id
		JOIN person p ON rcm.person_id = p.person_id
	WHERE	rcc.review_cycle_id = @review_cycle_id
		AND	p.is_reviewer = 1
OPEN reviewers
FETCH NEXT FROM reviewers 
INTO @rev_person_id, @rev_committee_id

WHILE @@fetch_status=0
BEGIN
	SELECT	@count = COUNT(*)
	FROM	#reviewers
	WHERE	person_id = @rev_person_id

	IF @count = 0
	BEGIN
		INSERT INTO #reviewers(person_id, rev_committee_id, number_assigned, number_primary)
		VALUES(@rev_person_id, @rev_committee_id, 0, 0)
	END

	FETCH NEXT FROM reviewers 
	INTO @rev_person_id, @rev_committee_id
END

CLOSE reviewers
DEALLOCATE reviewers


--delete previous assignments for this review cycle stage
DELETE FROM WF_TASK_ASSIGNMENT_REVIEW 
WHERE wf_task_assignment_id IN (
	SELECT	wf_task_assignment_id 
	FROM	WF_TASK_ASSIGNMENT
	WHERE wf_task_id = @rev_task_id 
		AND review_cycle_stage_id = @review_cycle_stage_id
	)

DELETE FROM WF_TASK_ASSIGNMENT 
WHERE wf_task_id = @rev_task_id 
	AND review_cycle_stage_id = @review_cycle_stage_id

-- Delete from GRANTEE_PROJECT_REVIEW_STAGE
DELETE FROM GRANTEE_PROJECT_REVIEW_STAGE 
WHERE review_cycle_stage_id = @review_cycle_stage_id


DECLARE criteria CURSOR FORWARD_ONLY FOR 
	SELECT DISTINCT
			task_id, 
			project_id, 
			task_outcome_id
	FROM	review_cycle_project_task_outcome
	WHERE	review_cycle_id = @review_cycle_id

OPEN criteria
FETCH NEXT FROM criteria INTO @task_id, @project_id, @outcome_id

WHILE @@FETCH_STATUS=0
BEGIN

	DECLARE app CURSOR FAST_FORWARD FOR 
		SELECT DISTINCT
			wfta.person_id, 
			wfta.wf_task_assignment_id, 
			wfta.grantee_project_id
		FROM wf_task_assignment wfta
			JOIN grantee_project gp ON wfta.grantee_project_id = gp.grantee_project_id
			JOIN grantee_project_outcomes gpo on gp.grantee_project_id = gpo.grantee_project_id
			JOIN a_WF_TASK wt ON wt.id = wfta.wf_task_id
		WHERE	wfta.wf_task_role_id = 1 
			AND wfta.wf_task_status_id = 2 
			AND gp.wf_project_id = @project_id 
			AND gpo.wf_task_id = @task_id
			AND gpo.outcome_id = @outcome_id 
			AND wt.wf_task_type_id = 1
		ORDER BY wfta.person_id

	OPEN app
	FETCH NEXT FROM app INTO @app_person_id, @wfta_id, @grantee_project_id
	
	WHILE @@fetch_status=0
	BEGIN
		SET @counter = 0
		SET	@assignment_ordinal = 1
		SET @PrimaryAssignment = 0

		IF @check_conflict = 1
			DECLARE rev CURSOR DYNAMIC FOR 
				SELECT	revs.rev_committee_id, 
						revs.person_id,
						rc.request_conflict_id
				FROM	#reviewers  revs
				JOIN review_cycle_conflict rc ON rc.rev_person_id = revs.person_id 
					AND rc.app_person_id = @app_person_id
					AND	rc.review_cycle_id = @review_cycle_id
				WHERE	rc.request_conflict_id <> 2 --avoid conflicts
					AND	revs.number_primary < @PrimaryMin
					AND revs.number_assigned < @RevMax
				ORDER BY	--revs.number_assigned,
							rc.request_conflict_id DESC,
							revs.number_primary
		ELSE
			DECLARE rev CURSOR DYNAMIC FOR 
				SELECT	revs.rev_committee_id, 
						revs.person_id,
						0
				FROM	#reviewers revs
				WHERE	revs.number_primary < @PrimaryMin
					AND revs.number_assigned < @RevMax
				ORDER BY	--revs.number_assigned,
							revs.number_primary

		OPEN rev
		FETCH NEXT FROM rev 
		INTO @rev_committee_id, @rev_person_id, @ReqConID

		WHILE @@fetch_status=0
		BEGIN
			IF @num_reviewers_per_applicant = -1
			BEGIN
				exec spProcessReviewAssignment @grantee_project_id, @rev_person_id, @rev_committee_id, @ReqConID, @wfta_id, @app_person_id, @assignment_ordinal OUTPUT, @counter OUTPUT, @PrimaryAssignment OUTPUT
			END
			ELSE
			BEGIN
				IF @counter < @num_reviewers_per_applicant
				BEGIN
					SELECT	@count = count(*) 
					FROM	#reviewers 
					WHERE	person_id = @rev_person_id
						AND	number_assigned > 0

					IF @count <= 1 OR @ReqConID = 1
					BEGIN
						SELECT	@cnt = COUNT(*)
						FROM	#assignments
						WHERE	grantee_project_id = @grantee_project_id
							AND	rev_person_id = @rev_person_id

						IF @cnt = 0
						BEGIN
							IF @assignment_ordinal > 1
							BEGIN
								--Check for no more than 1 common applicant for every reviewers combination
								EXEC spIsAvailableApplicant @grantee_project_id, @rev_person_id, @num_shared_applicants, @IsAvailable OUTPUT
								IF @IsAvailable = 0 GOTO NextRev1
							END

							-- check generation type: 
							-- 1-Random
							-- 2-Avoid reviewers from the previos stage
							-- 3-Use reviewers from the previos stage
							IF @generation_type_id = 2
							BEGIN
								EXEC spAvoidPreviousReviewer @review_cycle_stage_id, @grantee_project_id, @rev_person_id, @IsAvailable OUTPUT
								IF @IsAvailable = 0 GOTO NextRev1
							END
							IF @generation_type_id = 3
							BEGIN
								EXEC spUsePreviousReviewer @review_cycle_stage_id, @grantee_project_id, @rev_person_id, @IsAvailable OUTPUT
								IF @IsAvailable = 0 GOTO NextRev1
							END
						/*
							SELECT	@RevCount = count(*) 
							FROM	#assignments
							WHERE	rev_person_id = @rev_person_id

							IF @RevCount >= @RevMax GOTO NextRev1
						*/

							EXEC spProcessReviewAssignment @grantee_project_id, @rev_person_id, @rev_committee_id, @ReqConID, @wfta_id, @app_person_id, @assignment_ordinal OUTPUT, @counter OUTPUT, @PrimaryAssignment OUTPUT
						END
					END
				END
				ELSE
					GOTO EndRev1
			END
NextRev1:
			FETCH NEXT FROM rev 
			INTO @rev_committee_id, @rev_person_id, @ReqConID
		END
EndRev1:
		CLOSE rev
		DEALLOCATE rev

		--still need to assign reviewer(s) to this applicant
		IF @num_reviewers_per_applicant <> -1 AND @counter < @num_reviewers_per_applicant
		BEGIN
			IF @check_conflict = 1
				DECLARE rev3 CURSOR DYNAMIC FOR 
					SELECT	revs.rev_committee_id, 
							revs.person_id,
							rc.request_conflict_id
					FROM	#reviewers  revs
					JOIN review_cycle_conflict rc ON rc.rev_person_id = revs.person_id 
						AND rc.app_person_id = @app_person_id
						AND	rc.review_cycle_id = @review_cycle_id
					WHERE	rc.request_conflict_id <> 2 --avoid conflicts
						AND revs.number_assigned < @RevMin
					ORDER BY	revs.number_assigned,
								rc.request_conflict_id DESC,
								revs.number_primary
			ELSE
				DECLARE rev3 CURSOR DYNAMIC FOR 
					SELECT	revs.rev_committee_id, 
							revs.person_id,
							0
					FROM	#reviewers  revs
					WHERE	revs.number_assigned < @RevMin
					ORDER BY	revs.number_assigned,
								revs.number_primary
			
			OPEN rev3
			FETCH NEXT FROM rev3
			INTO @rev_committee_id, @rev_person_id, @ReqConID
	
			WHILE @@fetch_status=0
			BEGIN
				IF @counter < @num_reviewers_per_applicant
				BEGIN
					SELECT	@count = count(*) 
					FROM	#reviewers 
					WHERE	person_id = @rev_person_id
						AND	number_assigned > 0

					IF @count <= 1 OR @ReqConID = 1
					BEGIN
						SELECT	@cnt = COUNT(*)
						FROM	#assignments
						WHERE	grantee_project_id = @grantee_project_id
							AND	rev_person_id = @rev_person_id

						IF @cnt = 0
						BEGIN
							IF @assignment_ordinal > 1
							BEGIN
								--Check for no more than 1 common applicant for every reviewers combination
								EXEC spIsAvailableApplicant @grantee_project_id, @rev_person_id, @num_shared_applicants, @IsAvailable OUTPUT
								IF @IsAvailable = 0 GOTO NextRev3
							END

							-- check generation type: 
							-- 1-Random
							-- 2-Avoid reviewers from the previos stage
							-- 3-Use reviewers from the previos stage
							IF @generation_type_id = 2
							BEGIN
								EXEC spAvoidPreviousReviewer @review_cycle_stage_id, @grantee_project_id, @rev_person_id, @IsAvailable OUTPUT
								IF @IsAvailable = 0 GOTO NextRev3
							END
							IF @generation_type_id = 3
							BEGIN
								EXEC spUsePreviousReviewer @review_cycle_stage_id, @grantee_project_id, @rev_person_id, @IsAvailable OUTPUT
								IF @IsAvailable = 0 GOTO NextRev3
							END
						/*
							SELECT	@RevCount = count(*) 
							FROM	#assignments
							WHERE	rev_person_id = @rev_person_id

							IF @RevCount >= @RevMax GOTO NextRev1
						*/

							EXEC spProcessReviewAssignment @grantee_project_id, @rev_person_id, @rev_committee_id, @ReqConID, @wfta_id, @app_person_id, @assignment_ordinal OUTPUT, @counter OUTPUT, @PrimaryAssignment OUTPUT
						END
					END
				END
				ELSE
					GOTO EndRev3

NextRev3:
				FETCH NEXT FROM rev3
				INTO @rev_committee_id, @rev_person_id, @ReqConID
			END
EndRev3:
			CLOSE rev3
			DEALLOCATE rev3
		END

		--still need to assign reviewer(s) to this applicant
		IF @num_reviewers_per_applicant <> -1 AND @counter < @num_reviewers_per_applicant
		BEGIN
			IF @check_conflict = 1
				DECLARE rev2 CURSOR DYNAMIC FOR 
					SELECT	revs.rev_committee_id, 
							revs.person_id,
							rc.request_conflict_id
					FROM	#reviewers  revs
					JOIN review_cycle_conflict rc ON rc.rev_person_id = revs.person_id 
						AND rc.app_person_id = @app_person_id
						AND	rc.review_cycle_id = @review_cycle_id
					WHERE	rc.request_conflict_id <> 2 --avoid conflicts
					ORDER BY	revs.number_assigned,
								rc.request_conflict_id DESC,
								revs.number_primary
			ELSE
				DECLARE rev2 CURSOR DYNAMIC FOR 
					SELECT	revs.rev_committee_id, 
							revs.person_id,
							0
					FROM	#reviewers  revs
					ORDER BY	revs.number_assigned,
								revs.number_primary
			
			OPEN rev2
			FETCH NEXT FROM rev2
			INTO @rev_committee_id, @rev_person_id, @ReqConID
	
			WHILE @@fetch_status=0
			BEGIN
				IF @counter < @num_reviewers_per_applicant
				BEGIN
					SELECT	@cnt = COUNT(*)
					FROM	#assignments
					WHERE	grantee_project_id = @grantee_project_id
						AND	rev_person_id = @rev_person_id

					IF @cnt = 0
						exec spProcessReviewAssignment @grantee_project_id, @rev_person_id, @rev_committee_id, @ReqConID, @wfta_id, @app_person_id, @assignment_ordinal OUTPUT, @counter OUTPUT, @PrimaryAssignment OUTPUT
				END
				ELSE
					GOTO EndRev2
NextRev2:
				FETCH NEXT FROM rev2
				INTO @rev_committee_id, @rev_person_id, @ReqConID
			END
EndRev2:
			CLOSE rev2
			DEALLOCATE rev2
		END

		FETCH NEXT FROM app INTO @app_person_id, @wfta_id, @grantee_project_id
	END
	CLOSE app
	DEALLOCATE app

	FETCH NEXT FROM criteria INTO @task_id, @project_id, @outcome_id
END
CLOSE criteria
DEALLOCATE criteria

DECLARE assignments CURSOR FAST_FORWARD FOR 
	SELECT	grantee_project_id, 
			rev_person_id, 
			rev_committee_id,
			assignment_ordinal,
			review_preference_type_id,
			app_wfta_id,
			app_person_id
	FROM	#assignments
OPEN assignments
FETCH NEXT FROM assignments 
INTO	@grantee_project_id, 
		@rev_person_id, 
		@rev_committee_id,
		@assignment_ordinal,
		@review_preference_type_id,
		@app_wfta_id,
		@app_person_id

WHILE @@fetch_status=0
BEGIN
	EXEC @ReturnCode = getid_sel @table = 'WF_TASK_ASSIGNMENT', @id = @NewID OUTPUT, @mode = 2
	INSERT INTO wf_task_assignment (wf_task_assignment_id, wf_task_id, wf_task_status_id, grantee_project_id, person_id, wf_task_role_id, review_cycle_stage_id, review_committee_id, review_assignment_type_id, review_preference_type_id, create_date)
		VALUES (@NewID, @rev_task_id,  1, @grantee_project_id, @rev_person_id, @wf_task_role_id, @review_cycle_stage_id, @rev_committee_id, @assignment_ordinal, @review_preference_type_id, getdate())

	IF @assignment_ordinal = 1
	BEGIN
		EXEC @ReturnCode = getid_sel @table = 'GRANTEE_PROJECT_REVIEW_STAGE', @id = @NewID OUTPUT, @mode = 2			
		INSERT grantee_project_review_stage (id, grantee_project_id, review_cycle_stage_id, review_committee_id, app_wf_task_assignment_id)
			VALUES (@NewID, @grantee_project_id, @review_cycle_stage_id, @rev_committee_id, @app_wfta_id)
	END

	FETCH NEXT FROM assignments 
	INTO	@grantee_project_id, 
			@rev_person_id, 
			@rev_committee_id,
			@assignment_ordinal,
			@review_preference_type_id,
			@app_wfta_id,
			@app_person_id
END

CLOSE assignments
DEALLOCATE assignments

DROP TABLE #reviewers
DROP TABLE #assignments
DROP TABLE #RevsForAppl

SET NOCOUNT OFF
GO
/****** Object:  View [dbo].[vWORK_GROUP_TO_DO_LIST]    Script Date: 10/09/2007 11:50:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vWORK_GROUP_TO_DO_LIST]
AS
SELECT     CONVERT(VARCHAR(10), pwgta.person_id) + '_' + CONVERT(VARCHAR(10), pwgta.wf_task_assignment_id) AS work_group_task_list_key, 
                      pwgta.wf_task_assignment_id, pwgta.person_id, wfta.open_date, wfpt.description AS task_title, gp.grantee_project_id, gp.short_title, 
                      p.name_last + ', ' + p.name_first AS Primary_Person, o.organization_name
FROM         dbo.vPERSON_WORK_GROUP_TASK_ASSIGNMENT AS pwgta INNER JOIN
                      dbo.PERSON AS p ON p.person_id = pwgta.person_id INNER JOIN
                      dbo.WF_TASK_ASSIGNMENT AS wfta ON pwgta.wf_task_assignment_id = wfta.wf_task_assignment_id INNER JOIN
                      dbo.GRANTEE_PROJECT AS gp ON wfta.grantee_project_id = gp.grantee_project_id INNER JOIN
                      dbo.a_WF_PROJECT_TASK AS wfpt ON wfta.wf_task_id = wfpt.wf_task_id AND gp.wf_project_id = wfpt.wf_project_id INNER JOIN
                      dbo.ORGANIZATION AS o ON o.organization_id = gp.primary_organization_id
GO
/****** Object:  ForeignKey [FK_BUDGET_ITEM_BUDGET_PERIOD]    Script Date: 10/09/2007 11:39:20 ******/
ALTER TABLE [dbo].[BUDGET_ITEM]  WITH NOCHECK ADD  CONSTRAINT [FK_BUDGET_ITEM_BUDGET_PERIOD] FOREIGN KEY([budget_period_id])
REFERENCES [dbo].[BUDGET_PERIOD] ([budget_period_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BUDGET_ITEM] CHECK CONSTRAINT [FK_BUDGET_ITEM_BUDGET_PERIOD]
GO
/****** Object:  ForeignKey [FK_BUDGET_PERIOD_BUDGET]    Script Date: 10/09/2007 11:39:29 ******/
ALTER TABLE [dbo].[BUDGET_PERIOD]  WITH NOCHECK ADD  CONSTRAINT [FK_BUDGET_PERIOD_BUDGET] FOREIGN KEY([budget_id])
REFERENCES [dbo].[BUDGET] ([budget_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BUDGET_PERIOD] CHECK CONSTRAINT [FK_BUDGET_PERIOD_BUDGET]
GO


INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(1,1,0,'Total',1,0,1,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(3,1,1,'Direct Costs',1,0,3,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(4,1,1,'Indirect Costs',1,0,4,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(7,1,3,'Personnel-Salaries',0,1,7,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(8,1,3,'Personnel-Fellowships',0,1,8,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(9,1,4,'Indirect Costs',0,1,9,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(12,1,3,'Personnel-Fringe Benefits',0,1,12,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(13,1,3,'Equipment',0,1,13,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(14,1,3,'Travel',0,1,14,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(15,1,3,'Consultants',0,1,15,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(16,1,3,'Other',0,1,16,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(17,1,3,'Subcontracted Services',0,1,17,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(200,2,0,'Total',1,0,200,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(203,2,200,'Direct Costs',1,0,203,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(204,2,200,'Indirect Costs',1,0,204,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(207,2,203,'Personnel-Salaries',0,1,207,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(208,2,203,'Personnel-Fellowships',0,1,208,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(209,2,204,'Indirect Costs',0,1,209,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(212,2,203,'Personnel-Fringe Benefits',0,1,212,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(213,2,203,'Equipment',0,1,213,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(214,2,203,'Travel',0,1,214,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(215,2,203,'Consultants',0,1,215,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(216,2,203,'Other',0,1,216,NULL)
INSERT INTO [a_BUDGET_CATEGORY] ([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes],[sort_order],[category_type_id])VALUES(217,2,203,'Subcontracted Services',0,1,217,NULL)

INSERT INTO [a_BUDGET_TYPE] ([id],[abbr],[description],[sort_order])VALUES(1,'Application','Application',1)
INSERT INTO [a_BUDGET_TYPE] ([id],[abbr],[description],[sort_order])VALUES(2,'Expenditures','Expenditures',3)
INSERT INTO [a_BUDGET_TYPE] ([id],[abbr],[description],[sort_order])VALUES(3,'Approved','Approved',2)

INSERT INTO [a_CORRESPONDENCE_DEFINITION] ([correspondence_definition_id],[correspondence_key],[title],[correspondence_to],[correspondence_from],[correspondence_cc],[correspondence_bcc],[subject],[body],[is_html],[user_id],[id],[correspondence_description],[is_log],[definition_key_id],[correspondence_from_name])VALUES(7,NULL,'Application Submission','[Person.PersonPrimaryEMail.ContactValue1]','EGAutoEmails@arlgroup.com',NULL,'EGAutoEmails@arlgroup.com','Application Submission Confirmation','Dear [Person.FirstName] [Person.LastName]:    Thank you for submitting your [WfTask.WfTask].    For questions related to the application submission process, please contact the Foundation at support@foundation.org.  For technical assistance, please contact the Arlington Group at EGSupport@arlgroup.com.    Thank you,  The Arlington Group, Inc.',0,1,5,'Application Submission',1,1,NULL)
INSERT INTO [a_CORRESPONDENCE_DEFINITION] ([correspondence_definition_id],[correspondence_key],[title],[correspondence_to],[correspondence_from],[correspondence_cc],[correspondence_bcc],[subject],[body],[is_html],[user_id],[id],[correspondence_description],[is_log],[definition_key_id],[correspondence_from_name])VALUES(8,NULL,'System - Letter of Inquiry Submission','[Person.PersonPrimaryEMail.ContactValue1]','EGAutoEmails@arlgroup.com',NULL,'EGAutoEmails@arlgroup.com','Letter of Inquiry Submission','Dear [Person.FirstName] [Person.LastName]: Thank you for submitting your Letter of Inquiry. For questions related to the application submission process, please contact EGAutoEmails@arlgroup.com. For technical assistance, please contact the Easygrants Support Team at <a href="mailto:EGAutoEmails@altum.com">EGAutoEmails@altum.com</a>. Thank you.',0,1,6,'Letter of Inquiry Submission',1,1,NULL)
INSERT INTO [a_CORRESPONDENCE_DEFINITION] ([correspondence_definition_id],[correspondence_key],[title],[correspondence_to],[correspondence_from],[correspondence_cc],[correspondence_bcc],[subject],[body],[is_html],[user_id],[id],[correspondence_description],[is_log],[definition_key_id],[correspondence_from_name])VALUES(10,NULL,'System - Letter of Inquiry Approval','[Person.PersonPrimaryEMail.ContactValue1]','EGAutoEmails@arlgroup.com',NULL,'EGAutoEmails@arlgroup.com','Letter of Inquiry Approval','Dear [Person.FirstName] [Person.LastName]: Thank you for submitting your Letter of Inquiry. Congratulations!&nbsp; It has been approved, and you are invited to submit your Full Proposal. Please submit your proposal through our Web site. This e-mail provides the information you will need to enter the system. Click on the URL link below to go to the login page, then enter your Login ID and Password, which is provided below. The system is easy to use and contains on-line help to guide you through the process. Site: <a href="http://www.easygrants.org/">http://www.easygrants.org</a> Login ID: [Person.User.UserName] Password: [Person.User.Password] Thank you.',0,1,15,'Letter of Inquiry Approval',1,1,NULL)
INSERT INTO [a_CORRESPONDENCE_DEFINITION] ([correspondence_definition_id],[correspondence_key],[title],[correspondence_to],[correspondence_from],[correspondence_cc],[correspondence_bcc],[subject],[body],[is_html],[user_id],[id],[correspondence_description],[is_log],[definition_key_id],[correspondence_from_name])VALUES(12,'RetrieveLogin','System - Retrieve Login','[Person.PersonPrimaryEMail.ContactValue1]','EGAutoEmails@arlgroup.com',NULL,'EGAutoEmails@arlgroup.com','Easygrants Login Information','Dear [Person.FirstName] [Person.LastName],     We have received your request for retrieval of your login information. Please use the following login ID and password to log in to Easygrants.    Login ID: [Person.PersonPrimaryEMail.ContactValue1]  Password: [Password]    Please note that this information is confidential and should not be shared.     Thank you,    The Easygrants Team    ',0,1,10,'Retrieve Login',0,1,NULL)
INSERT INTO [a_CORRESPONDENCE_DEFINITION] ([correspondence_definition_id],[correspondence_key],[title],[correspondence_to],[correspondence_from],[correspondence_cc],[correspondence_bcc],[subject],[body],[is_html],[user_id],[id],[correspondence_description],[is_log],[definition_key_id],[correspondence_from_name])VALUES(13,NULL,'System - Progress Report Submission','[Person.PersonPrimaryEMail.ContactValue1]','EGAutoEmails@arlgroup.com',NULL,'EGAutoEmails@arlgroup.com','Progress Report Submission Confirmation','Dear [Person.FirstName] [Person.LastName]:    Thank you for submitting your [WfTask.WfTask].    For questions related to the progress report submission process, please contact your program officer.    Thank you.',0,1,11,'Progress Report Submission',1,NULL,NULL)
INSERT INTO [a_CORRESPONDENCE_DEFINITION] ([correspondence_definition_id],[correspondence_key],[title],[correspondence_to],[correspondence_from],[correspondence_cc],[correspondence_bcc],[subject],[body],[is_html],[user_id],[id],[correspondence_description],[is_log],[definition_key_id],[correspondence_from_name])VALUES(15,NULL,'System - Support Email','EGAutoEmails@arlgroup.com','EGAutoEmails@arlgroup.com',NULL,'EGAutoEmails@arlgroup.com','Support Email','Support Email',0,1,15,'Support Email',1,1,NULL)
INSERT INTO [a_CORRESPONDENCE_DEFINITION] ([correspondence_definition_id],[correspondence_key],[title],[correspondence_to],[correspondence_from],[correspondence_cc],[correspondence_bcc],[subject],[body],[is_html],[user_id],[id],[correspondence_description],[is_log],[definition_key_id],[correspondence_from_name])VALUES(16,NULL,'System - Sponsored Programs Office - Grants Officer Notification','[GrantOfficer.RelatePersonDisplayEmail]','EGAutoEmails@arlgroup.com',NULL,'EGAutoEmails@arlgroup.com','Sponsored Programs Office - Grants Officer Notification','Dear [GrantOfficer.RelatedPerson.Prefix.Prefix] [GrantOfficer.RelatedPerson.FirstName] [GrantOfficer.RelatedPerson.LastName]:        [GranteeProject.PrimaryPerson.Prefix.Prefix] [GranteeProject.PrimaryPerson.FirstName] [GranteeProject.PrimaryPerson.LastName] has submitted an application to the American Heart Association, and has designated you as his/her Grants Officer.          Contact information for the applicant appears below.        E-mail: [GranteeProject.PrimaryPerson.PersonPrimaryEMail.ContactValue1]        In order for the American Heart Association to accept this application, your approval of the application is required. Please complete this approval through American Heart Association Web site. This e-mail provides the information you need to enter the system and complete your review and approval. Click on the URL link below to go to the login page, and enter the Login ID and Password provided below to enter the system. The system is easy to use and contains on-line help to guide you through the pro',0,1,16,'Sponsored Program Office Notification',1,1,NULL)
INSERT INTO [a_CORRESPONDENCE_DEFINITION] ([correspondence_definition_id],[correspondence_key],[title],[correspondence_to],[correspondence_from],[correspondence_cc],[correspondence_bcc],[subject],[body],[is_html],[user_id],[id],[correspondence_description],[is_log],[definition_key_id],[correspondence_from_name])VALUES(17,NULL,'System -  Approval Submission Confirmation','[Person.PersonPrimaryEMail.ContactValue1]','EGAutoEmails@arlgroup.com',NULL,'EGAutoEmails@arlgroup.com','Approval Submission Confirmation','Dear [Person.Prefix.Prefix] [Person.FirstName] [Person.LastName]:    Thank you for reviewing and approving the Early Career Translational Research Award Application of [GranteeProject.PrimaryPerson.Prefix.Prefix] [GranteeProject.PrimaryPerson.FirstName] [GranteeProject.PrimaryPerson.LastName]. This completes the application submission process and the application will now be reviewed.  [GranteeProject.PrimaryPerson.Prefix.Prefix] [GranteeProject.PrimaryPerson.FirstName] [GranteeProject.PrimaryPerson.LastName] will be notified of the outcome of the reivew process as soon as it has been completed.    Thank you,  The Wallace H. Coulter Foundation Support Team',0,1,17,'Approval Submission Confirmation',1,1,NULL)
INSERT INTO [a_CORRESPONDENCE_DEFINITION] ([correspondence_definition_id],[correspondence_key],[title],[correspondence_to],[correspondence_from],[correspondence_cc],[correspondence_bcc],[subject],[body],[is_html],[user_id],[id],[correspondence_description],[is_log],[definition_key_id],[correspondence_from_name])VALUES(18,NULL,'System - Applicant Notification','[GranteeProject.PrimaryPerson.PersonPrimaryEMail.ContactValue1]','EGAutoEmails@arlgroup.com',NULL,'EGAutoEmails@arlgroup.com','Applicant Notification','Dear [GranteeProject.PrimaryPerson.Prefix.Prefix] [GranteeProject.PrimaryPerson.FirstName] [GranteeProject.PrimaryPerson.LastName]:    Your Grants Officer has reviewed your application. This completes the application submission process and your application will now be reviewed.  You will be notified of the outcome of the review process as soon as it has been completed.    Sincerely,    The Easygrants Team',0,1,18,'Applicant Notification',1,1,NULL)
INSERT INTO [a_CORRESPONDENCE_DEFINITION] ([correspondence_definition_id],[correspondence_key],[title],[correspondence_to],[correspondence_from],[correspondence_cc],[correspondence_bcc],[subject],[body],[is_html],[user_id],[id],[correspondence_description],[is_log],[definition_key_id],[correspondence_from_name])VALUES(20,NULL,'System - Registration Submission','[UserName]','EGAutoEmails@arlgroup.com',NULL,'EGAutoEmails@arlgroup.com','Registration Submission','Dear [Person.FirstName] [Person.LastName], We have received your request for registration. Please use the following login ID and password to login to Our Online Awards System. Site: <a href="http://www.easygrants.org">http://www.easygrants.org</a> Login ID: [Person.PersonPrimaryEMail.ContactValue1] Password: [Password] Thank you, The Easygrants Support Team Please note that this information is confidential and should not be shared. In addition, please save this information for your records.',0,1,20,'Registration Submission',1,NULL,NULL)
INSERT INTO [a_CORRESPONDENCE_DEFINITION] ([correspondence_definition_id],[correspondence_key],[title],[correspondence_to],[correspondence_from],[correspondence_cc],[correspondence_bcc],[subject],[body],[is_html],[user_id],[id],[correspondence_description],[is_log],[definition_key_id],[correspondence_from_name])VALUES(26,NULL,'Welcome Notice','[PersonPrimaryEMail.ContactValue1]','EGAutoEmails@arlgroup.com',NULL,'EGAutoEmails@arlgroup.com','Welcome Notice','Welcome to Easygrants.',0,1,NULL,'Welcome Notice',1,2,NULL)
INSERT INTO [a_CORRESPONDENCE_DEFINITION] ([correspondence_definition_id],[correspondence_key],[title],[correspondence_to],[correspondence_from],[correspondence_cc],[correspondence_bcc],[subject],[body],[is_html],[user_id],[id],[correspondence_description],[is_log],[definition_key_id],[correspondence_from_name])VALUES(29,NULL,' Reviewer Notification','[Person.PersonPrimaryEMail.ContactValue1]','EGAutoEmails@arlgroup.com',NULL,'EGAutoEmails@arlgroup.com','Application Review - [Person.FirstName] [Person.LastName]','Dear [Person.FirstName] [Person.LastName]:    Thank you for your time and effort reviewing applications for the BioMed Program. The EG Competition System is now open for you to access, review, and rate the applications assigned to you. A detailed Guide to Initial Review will be sent to you under separate cover.     Ratings must be submitted by January 26, 2007.      Instructions to access the system are as follows:    1) Go the following login page: http://www.Easygrants.org/competitions    2) Type your login ID as:  [Person.User.UserName]    3) Type your password as: [Person.User.Password]    4) Once you enter the system, go immediately to the Change Password link on the left navigation bar. Use the Change Password link to change your password to one that is more memorable for you. In the event that you forget your login information, click on the "Forgot your login information?" link on the login page and follow instructions on the page to retrieve your login ID and password.  Please note that your "Login ID" is your e-mail address.  If you do not wish to have your Login ID and password e-mailed to you, you can contact Melanie Daub to retrieve your login information.    5) The Home Page in the Competition System provides general information about the program, a Profile section, and a To Do section.      6) The Profile section contains your contact information.  Please click on the link in the Profile section and carefully review your contact information and make any necessary corrections.  Click "Save and Continue" when you are finished.  This will return you to your Home Page.    7) The To Do section contains various tasks associated with the review process.  Within the To Do section, please click on the Cloister 2006 - Initial Review link.  Clicking on this link will open up the Main Page of the Reviewer Module.  The Main Page provides you with general instructions about the Reviewer Module and key deadline dates during the review process.      8) To review applications assigned to you, click on the Assigned Applications link in the left navigation bar.  You will then see a list of applications assigned to you.  Click on the applicant''s name to access the Review/Rate Page.  Under the "Applicant Summary" section, click View Application to view a PDF of the student''s application, which will open in a separate window.  Then, return to the Review/Rate Page and select your rating for the applicant by clicking one of the radio buttons provided. You may also enter comments in the text box.  Any comments that you enter will not be available to other reviewers during the initial review process.  After reviewers have submitted their initial review scores, comments entered by other reviewers will only be available as unattributed comments.  IN ORDER TO SAVE YOUR SCORE AND COMMENTS, IF ANY, YOU MUST CLICK "SAVE". After clicking "Save" you will return to the Assigned Applcations page so that you can then Review/Rate the next applicant(s).    9) After you have rated all of your assigned applications, the Submit button will be displayed. CLICKING SUBMIT FINALIZES YOUR REVIEW AND NOTIFIES EG THAT YOU ARE FINISHED.      10) If you would like to view applications in addition to those assigned to you, click on View Applications on the left navigation bar.  This will direct you to a page that lists ALL the applicants in alphabetical order and the medical or dental school they are attending.  Clicking on the drop down Action List, selecting "View Application" and then clicking on "Go" will open up a PDF file of the person''s completed application.  A complete set of application PDFs will also be provided for you on a CD.    If you have difficulty accessing the site, or if you have technical questions, please send an e-mail to EGSupport@arlgroup.com or call our technical support line at 1-877-249-9932 (9 a.m. to 5 p.m. ET) If you have questions regarding the review process or questions regarding individual applications please contact Program Administrator at xxx-xxx-xxxx or at pa@easygrants.org.    Thanks,  Easygrants Competition System Support Team',0,1,NULL,' E-mail sent to Reviewers about opening of a Review stage',1,2,NULL)
INSERT INTO [a_CORRESPONDENCE_DEFINITION] ([correspondence_definition_id],[correspondence_key],[title],[correspondence_to],[correspondence_from],[correspondence_cc],[correspondence_bcc],[subject],[body],[is_html],[user_id],[id],[correspondence_description],[is_log],[definition_key_id],[correspondence_from_name])VALUES(45,NULL,'rerere','ererer','ererer',NULL,NULL,'erererere','<p>&nbsp;</p>',0,1,NULL,NULL,1,NULL,NULL)
INSERT INTO [a_CORRESPONDENCE_DEFINITION] ([correspondence_definition_id],[correspondence_key],[title],[correspondence_to],[correspondence_from],[correspondence_cc],[correspondence_bcc],[subject],[body],[is_html],[user_id],[id],[correspondence_description],[is_log],[definition_key_id],[correspondence_from_name])VALUES(108,NULL,'System-Invitation to resubmit grantee report (1)','[GranteeProject.PrimaryPerson.Email.ContactValue1]','[Person.Email.ContactValue1]',NULL,NULL,'Please resubmit the Progress Report','<p>Dear [GranteeProject.PrimaryPerson.FirstName] [GranteeProject.PrimaryPerson.LastName]:</p>  <p>Thank you for submitting your [WfTaskAssignmentCR.ReportWfTaskAssignment.WfTask.WfTaskCR.ReportTypeDescription]. Based on our review of the information you provided, we ask that you please revise and resubmit portions of this report.</p>  <p>- Organization legal name: [GranteeProject.PrimaryOrganization.OrganizationName]<br />- Project title: [GranteeProject.ShortTitle]<br />- Report type: [WfTaskAssignmentCR.ReportWfTaskAssignment.WfTask.WfTaskCR.ReportTypeDescription]<br /></p>  <p>Please go to&nbsp;<a href="http://www.altum.com">http://www.altum.com</a> and enter your login ID and password.&nbsp; Click the link in your Task List to review the resubmission information.</p>  <p>If you have any questions, please contact me.</p>  <p>Thank you.</p>',0,1,NULL,'Notification to grantee to resubmit a grantee report',1,NULL,NULL)

INSERT INTO [a_DATA_COMMAND_REQUEST_STATUS] ([id],[abbr],[description],[sort_order])VALUES(1,0,'Request is in queue to be executed',NULL)
INSERT INTO [a_DATA_COMMAND_REQUEST_STATUS] ([id],[abbr],[description],[sort_order])VALUES(2,1,'Request is being executed',NULL)
INSERT INTO [a_DATA_COMMAND_REQUEST_STATUS] ([id],[abbr],[description],[sort_order])VALUES(3,-1,'Request successfully executed',NULL)
INSERT INTO [a_DATA_COMMAND_REQUEST_STATUS] ([id],[abbr],[description],[sort_order])VALUES(4,-3,'Request failed',NULL)

INSERT INTO [a_DEFINITION_KEY] ([id],[abbr],[description],[sort_order])VALUES(1,'WfTaskAssignment  ','Eligibility, Application and To Do',1)
INSERT INTO [a_DEFINITION_KEY] ([id],[abbr],[description],[sort_order])VALUES(2,'Person','Person Contact and Institution',2)
INSERT INTO [a_DEFINITION_KEY] ([id],[abbr],[description],[sort_order])VALUES(3,'GranteeProject','Grants',3)

INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(1,'Tasks - Edit This Task','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''TaskAssignEditor''/><Argument Type=''Attribute'' AttributeName=''WfTaskAssignmentID'' PropertyKey=''WfTaskAssignmentID'' BaseValue=''WfTaskAssignmentID='' Value='''' /><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(2,'Contact Info','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''PersonContact''/><Argument Type=''Attribute'' AttributeName=''PersonID'' PropertyKey=''PersonID'' BaseValue=''PersonID='' Value=''''/></Parameters></Action></Actions>  ')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(3,'Committees Editor','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''CommitteesEditor''/><Argument Type=''Attribute'' AttributeName=''ReviewCommitteeID'' PropertyKey=''ReviewCommitteeID'' BaseValue=''ReviewCommitteeID='' Value=''''/><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL'' Value=''''/></Parameters></Action></Actions>  ')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(4,'Send E-mail','<Actions><Action Object=''ModuleUser'' Method=''SetEmailArgs''><Parameters><Argument Type=''Attribute'' AttributeName=''WfTaskAssignmentID'' PropertyKey=''WfTaskAssignmentID'' Value='''' /><Argument Value=''WfTaskAssignment''/></Parameters></Action><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''EmailSend''/><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL='' Value=''''/><Argument Type=''ModulePage''  TypeKey=''PageKey'' BaseValue=''ReturnPageKey='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(6,'Committees E-mail','<Actions><Action Object=''ModuleUser'' Method=''SetEmailArgs''><Parameters><Argument Type=''Attribute'' AttributeName=''ReviewCommitteeMemberID'' PropertyKey=''ReviewCommitteeMemberID'' Value='''' /><Argument Value=''ReviewCommitteeMember''/></Parameters></Action><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''EmailSend''/><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL='' Value=''''/><Argument Type=''ModulePage''  TypeKey=''PageKey'' BaseValue=''ReturnPageKey='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(7,'View Person Tasks','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''PersonInfo''/><Argument Type=''Attribute'' AttributeName=''WfTaskAssignmentID'' PropertyKey=''WfTaskAssignmentID'' BaseValue=''WfTaskAssignmentID='' Value='''' /></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(8,'View Project Tasks','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''ProjectSummary''/><Argument Type=''Attribute'' AttributeName=''WfTaskAssignmentID'' PropertyKey=''WfTaskAssignmentID'' BaseValue=''WfTaskAssignmentID='' Value='''' /></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(9,'Application Items','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''ApplicationItems''/><Argument Type=''Attribute'' AttributeName=''WfTaskAssignmentID'' PropertyKey=''WfTaskAssignmentID'' BaseValue=''WfTaskAssignmentID='' Value='''' /><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL''  BaseValue=''ReturnURL='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(10,'View Person Tasks','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''PersonInfo''/><Argument Type=''Attribute'' AttributeName=''PersonID'' PropertyKey=''PersonID'' BaseValue=''PersonID='' Value='''' /><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL''  BaseValue=''ReturnURL='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(11,'Login as this User','<Actions><Action Object=''ModulePage'' Method=''LoginAsUser_From_WfTA''><Parameters><Argument Type=''Attribute'' AttributeName=''WfTaskAssignmentID'' PropertyKey=''WfTaskAssignmentID'' Value='''' /></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(12,'Control Method','<Actions><Action Object=''EventControllerControl'' Method=''LoginAsUser''><Parameters><Argument Type=''Attribute'' AttributeName=''WfTaskAssignmentID'' PropertyKey=''WfTaskAssignmentID'' Value='''' /></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(13,'Log in as this User','<Actions><Action Object=''ModulePage'' Method=''LoginAsUser_From_Person''><Parameters><Argument Type=''Attribute'' AttributeName=''PersonID'' PropertyKey=''PersonID'' Value='''' /></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(14,'Tasks - Add New Task','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''AssignTaskEditor''/><Argument Type=''Attribute'' AttributeName=''WfTaskAssignmentID'' PropertyKey=''WfTaskAssignmentID'' BaseValue=''WfTaskAssignmentID='' Value='''' /><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(15,'Organization Info','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''OrganizationContact''/><Argument Type=''Attribute'' AttributeName=''OrganizationID'' PropertyKey=''OrganizationID'' BaseValue=''OrganizationID='' Value=''''/></Parameters></Action></Actions>  ')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(16,'Grant Info','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''GrantsEditor''/><Argument Type=''Attribute'' AttributeName=''GranteeProjectID'' PropertyKey=''GranteeProjectID'' BaseValue=''GranteeProjectID='' Value=''''/></Parameters></Action></Actions>  ')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(17,'Contact Info','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''PersonContact''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''GranteeProjectID'' DataObjectDefinitionKey=''GranteeProject'' PropertyKey=''PrimaryPerson.PersonID'' BaseValue=''PersonID='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(18,'Contact Info','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''PersonContact''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''WfTaskAssignmentID'' DataObjectDefinitionKey=''WfTaskAssignment'' PropertyKey=''Person.PersonID'' BaseValue=''PersonID='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(19,'View Person Tasks','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''PersonInfo''/><Argument Type=''Attribute'' AttributeName=''PersonID'' PropertyKey=''PersonID'' BaseValue=''PersonID='' Value='''' /></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(20,'Send E-mail','<Actions><Action Object=''ModuleUser'' Method=''SetEmailArgs''><Parameters><Argument Type=''Attribute'' AttributeName=''PersonID'' PropertyKey=''PersonID'' Value='''' /><Argument Value=''Person''/></Parameters></Action><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''EmailSend''/><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL='' Value=''''/><Argument Type=''ModulePage''  TypeKey=''PageKey'' BaseValue=''ReturnPageKey='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(21,'View Document','<Actions><Action PostBack=''True'' Object=''EventControllerControl'' ControlID=''ctlReportOutputOpen'' Method=''Open_GranteeProjectReviewStage_ReportOutput''><Parameters><Argument Type=''Attribute'' AttributeName=''SubmittedFileID''  /></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(22,'View Project Outcomes','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''GranteeProjectTaskEditor''/><Argument Type=''Attribute'' AttributeName=''WfTaskAssignmentID'' PropertyKey=''WfTaskAssignmentID'' BaseValue=''WfTaskAssignmentID='' Value='''' /><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(23,'Edit Contact Information','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''PersonEditor''/><Argument Type=''Attribute'' AttributeName=''PersonID'' PropertyKey=''PersonID'' BaseValue=''PersonID='' Value='''' /><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(24,'Contact Info','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''PersonContact''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''ReviewCommitteeMemberID'' DataObjectDefinitionKey=''ReviewCommitteeMember'' PropertyKey=''Person.PersonID'' BaseValue=''PersonID='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(25,'View PDF','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''ApplicationPDF''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''WfTaskAssignmentID'' DataObjectDefinitionKey=''WfTaskAssignment'' PropertyKey=''GranteeProject.WfTaskAssignments.WfTaskAssignmentID'' BaseValue=''ApplicationPDF='' Value='''' /><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(26,'Enter Review','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''InternalReviewEditor''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''WfTaskAssignmentID'' DataObjectDefinitionKey=''WfTaskAssignment'' PropertyKey=''WfTaskAssignmentID'' BaseValue=''WfTaskAssignmentID='' Value=''''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''WfTaskAssignmentID'' DataObjectDefinitionKey=''WfTaskAssignment'' PropertyKey=''GranteeProject.WfTaskAssignments.WfTaskAssignmentID'' BaseValue=''AppWfTaskAssignmentID='' Value=''''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''WfTaskAssignmentID'' DataObjectDefinitionKey=''WfTaskAssignment'' PropertyKey=''GranteeProject.WfProject.FinalPDFReportKeyLink.ReportOutputDefinitionID'' BaseValue=''DefinitionID=''  Value=''''/><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(27,'Review History','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''ReviewHistory''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''WfTaskAssignmentID'' DataObjectDefinitionKey=''WfTaskAssignment'' PropertyKey=''WfTaskAssignmentID'' BaseValue=''WfTaskAssignmentID='' Value=''''/><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(28,'Contact Info','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''PersonContact''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''WfTaskAssignmentID'' DataObjectDefinitionKey=''WfTaskAssignment'' PropertyKey=''GranteeProject.PrimaryPerson.PersonID'' BaseValue=''PersonID='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(29,'Log in as this User','<Actions><Action Object=''ModulePage'' Method=''LoginAsUser_From_WfTA_AsGPPP''><Parameters><Argument Type=''Attribute'' AttributeName=''WfTaskAssignmentID'' PropertyKey=''WfTaskAssignmentID'' Value='''' /></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(30,'View Project Outcomes','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''GranteeProjectTaskEditor''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''GranteeProjectID'' DataObjectDefinitionKey=''GranteeProject'' PropertyKey=''WfTaskAssignments.WfTaskAssignmentID'' BaseValue=''WfTaskAssignmentID='' Value='''' /><Argument Type=''AttributeRelatedProperty'' AttributeName=''GranteeProjectID'' DataObjectDefinitionKey=''GranteeProject'' PropertyKey=''GranteeProjectID'' BaseValue=''GranteeProjectID='' Value='''' /><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(31,'View Project Activity','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''ProjectSummary''/><Argument Type=''Attribute'' AttributeName=''GranteeProjectID'' PropertyKey=''GranteeProjectID'' BaseValue=''GranteeProjectID='' Value='''' />  <Argument Type=''AttributeRelatedProperty'' AttributeName=''GranteeProjectID'' DataObjectDefinitionKey=''GranteeProject'' PropertyKey=''PrimaryOrganizationID'' BaseValue=''OrganizationID='' Value='''' />  </Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(32,'Transfer to Personal Tasks','<Actions><Action Object=''ModulePage'' Method=''ChangePersonIDOfWFTA''><Parameters><Argument Type=''Attribute'' AttributeName=''WfTaskAssignmentID'' PropertyKey=''WfTaskAssignmentID'' Value='''' /></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(33,'Grant Info','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''GrantsEditor''/><Argument Type=''Attribute'' AttributeName=''GranteeProjectID'' PropertyKey=''GranteeProjectID'' BaseValue=''GranteeProjectID='' Value=''''/></Parameters></Action></Actions>  ')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(34,'View Project Tasks','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''ProjectSummary''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''GranteeProjectID'' DataObjectDefinitionKey=''GranteeProjectOrganizationAffiliation'' PropertyKey=''GranteeProjectID'' BaseValue=''GranteeProjectID='' Value='''' /><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(35,'View Project Activity','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''ProjectSummary''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''GranteeProjectID'' DataObjectDefinitionKey=''GranteeProject'' PropertyKey=''WfTaskAssignments.WfTaskAssignmentID'' BaseValue=''WfTaskAssignmentID='' Value=''''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''GranteeProjectID'' DataObjectDefinitionKey=''GranteeProject'' PropertyKey=''GranteeProjectID'' BaseValue=''GranteeProjectID='' Value='''' /><Argument Value=''Origin=GranteeProject''/><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(36,'Log in as this User','<Actions><Action Object=''ModulePage'' Method=''LoginAsUser_From_Grants''><Parameters><Argument Type=''Attribute'' AttributeName=''GranteeProjectID'' PropertyKey=''GranteeProjectID'' Value='''' /></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(37,'View Activity','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''PersonActivity''/><Argument Type=''Attribute'' AttributeName=''PersonID'' PropertyKey=''PersonID'' BaseValue=''PersonID='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(38,'View Activity','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''PersonActivity''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''WfTaskAssignmentID'' DataObjectDefinitionKey=''WfTaskAssignment'' PropertyKey=''Person.PersonID'' BaseValue=''PersonID='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(39,'View Project Activity','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''ProjectSummary''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''WfTaskAssignmentID'' DataObjectDefinitionKey=''WfTaskAssignment'' PropertyKey=''GranteeProject.GranteeProjectID'' BaseValue=''GranteeProjectID='' Value='''' /></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(40,'View Project Tasks','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''ProjectSummary''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''GranteeProjectID'' DataObjectDefinitionKey=''GranteeProject'' PropertyKey=''WfTaskAssignments.WfTaskAssignmentID'' BaseValue=''WfTaskAssignmentID='' Value=''''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''GranteeProjectID'' DataObjectDefinitionKey=''GranteeProject'' PropertyKey=''GranteeProjectID'' BaseValue=''GranteeProjectID='' Value='''' /><Argument Value=''Origin=GranteeProject''/><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(41,'Staff Comments','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''CommentList''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''GranteeProjectReviewStageID'' DataObjectDefinitionKey=''GranteeProjectReviewStage'' PropertyKey=''GranteeProjectID'' BaseValue=''GranteeProjectID='' Value='''' /><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(42,'View Application PDF','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''ApplicationPDF''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''GranteeProjectReviewStageID'' DataObjectDefinitionKey=''vReviewApplicants'' PropertyKey=''WfTaskAssignmentID'' BaseValue=''ApplicationPDF='' Value='''' /><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(43,'View Reviewer PDF','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''ReviewerPDF''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''GranteeProjectReviewStageID'' DataObjectDefinitionKey=''vReviewApplicants'' PropertyKey=''WfTaskAssignmentID'' BaseValue=''ReviewerPDF='' Value='''' /><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(44,'View Staff PDF','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''StaffPDF''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''GranteeProjectReviewStageID'' DataObjectDefinitionKey=''vReviewApplicants'' PropertyKey=''WfTaskAssignmentID'' BaseValue=''StaffPDF='' Value='''' /><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(45,'Tasks - Edit This Task','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''GrantTaskAssignEditor''/><Argument Type=''Attribute'' AttributeName=''WfTaskAssignmentID'' PropertyKey=''WfTaskAssignmentID'' BaseValue=''WfTaskAssignmentID='' Value='''' /><Argument Type=''QueryString'' TypeKey=''GranteeProjectID'' BaseValue=''GranteeProjectID=''/><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL='' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(46,'Internal Review','<Actions><Action Object=''WebSession'' Method=''RedirectToModule''><Parameters><Argument Type=''AttributeRelatedProperty'' AttributeName=''WfTaskAssignmentID'' DataObjectDefinitionKey=''WfTaskAssignment'' PropertyKey=''WfTask.WfTaskModule.ModuleName'' Value=''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''WfTaskAssignmentID'' DataObjectDefinitionKey=''WfTaskAssignment'' PropertyKey=''WfTask.WfTaskModule.ModuleConfigFilename'' Value=''''/><Argument Type='''' Value=''''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''WfTaskAssignmentID'' DataObjectDefinitionKey=''WfTaskAssignment'' PropertyKey=''WfTaskAssignmentID'' Value=''''/></Parameters></Action></Actions>')
INSERT INTO [a_EASYLIST_ACTION] ([id],[description],[action_xml])VALUES(47,'Tasks - Add New Task','<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''GrantAssignTaskWorkflowEditor''/><Argument Type=''Attribute'' AttributeName=''WfTaskAssignmentID'' PropertyKey=''WfTaskAssignmentID'' BaseValue=''WfTaskAssignmentID='' Value='''' /><Argument Type=''URL'' TypeKey=''PathAndQuery'' PropertyKey=''ReturnURL'' BaseValue=''ReturnURL='' Value=''''/></Parameters></Action></Actions>')

INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(1,'WfTaskAssignment',14,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(2,'WfTaskAssignment',18,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(6,'WfTaskAssignment',1,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(7,'WfTaskAssignment',11,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(9,'ReviewCommitteeMember',20,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(11,'ReviewCommitteeMember',13,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(12,'ReviewCommitteeMember',10,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(13,'WfTaskAssignment',22,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(14,'Person',13,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(16,'Organization',15,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(17,'PersonGranteeProject',16,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(18,'Grants',16,1)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(19,'Grants',17,2)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(20,'Person',2,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(21,'DocumentList',21,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(23,'WfTaskAssignment',4,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(24,'Person',20,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(26,'Contact',13,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(27,'Contact',19,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(28,'Contact',20,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(29,'Contact',2,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(30,'ReviewCommitteeMember',24,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(31,'WfTaskAssignment',25,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(32,'InternalReview',26,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(33,'InternalReview',28,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(34,'InternalReview',29,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(35,'InternalReview',4,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(36,'InternalReview',27,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(37,'Grants',30,5)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(38,'Grants',35,4)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(39,'PersonalTask',1,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(40,'PersonalTask',4,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(41,'PersonalTask',7,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(42,'PersonalTask',8,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(43,'PersonalTask',22,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(44,'PersonalTask',14,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(45,'PersonalTask',18,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(46,'PersonalTask',25,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(47,'PersonalTask',26,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(55,'GroupTask',22,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(56,'GroupTask',8,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(58,'GroupTask',25,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(59,'GroupTask',32,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(60,'PersonGranteeProject',31,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(61,'OrganizationGranteeProject',33,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(62,'OrganizationGranteeProject_Remove',34,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(63,'GranteeProject',16,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(64,'GranteeProject',31,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(65,'Grants',36,3)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(67,'Person',37,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(68,'WfTaskAssignment',38,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(69,'WfTaskAssignment',39,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(70,'CommitteeMembers',37,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(71,'CommitteeMembers',13,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(72,'CommitteeMembers',2,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(73,'CommitteeMembers',20,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(74,'Reviewers',20,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(75,'Reviewers',13,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(76,'Reviewers',37,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(77,'Reviewers',2,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(78,'OrganizationGranteeProject',40,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(79,'Applicants',41,1)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(80,'Applicants',42,2)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(81,'Applicants',43,3)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(82,'Applicants',44,4)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(83,'PersonTasks',1,1)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(84,'PersonTasks',11,2)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(85,'PersonTasks',14,3)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(86,'PersonTasks',25,4)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(87,'GrantTaskAssignmentHistory',45,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(88,'GrantTaskAssignmentHistory',11,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(89,'GrantTaskAssignmentHistory',18,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(90,'PersonalTask',46,NULL)
INSERT INTO [a_EASYLIST_ACTION_TYPE] ([id],[data_object_definition_key],[easylist_action_id],[sort_order])VALUES(91,'GrantTaskAssignmentHistory',47,NULL)

INSERT INTO [a_GENERAL_FUND] ([id],[general_fund])VALUES(1,'Account 1')
INSERT INTO [a_GENERAL_FUND] ([id],[general_fund])VALUES(2,'Account 2')

INSERT INTO [a_GRANTEE_MEMBER_ROLE] ([id],[abbr],[description],[sort_order])VALUES(1,'Administrative','Institutional Administrative Contact',1)
INSERT INTO [a_GRANTEE_MEMBER_ROLE] ([id],[abbr],[description],[sort_order])VALUES(2,'Financial','Institutional Financial Contact',2)
INSERT INTO [a_GRANTEE_MEMBER_ROLE] ([id],[abbr],[description],[sort_order])VALUES(3,'Contractual','Institutional Contractual Contact',3)
INSERT INTO [a_GRANTEE_MEMBER_ROLE] ([id],[abbr],[description],[sort_order])VALUES(4,'Other','Other Contact',4)

INSERT INTO [a_HORIZONTAL_NAVIGATION] ([horiz_nav_id],[key_name])VALUES(1,'GotoGrants')
INSERT INTO [a_HORIZONTAL_NAVIGATION] ([horiz_nav_id],[key_name])VALUES(2,'GotoReviewCycle')
INSERT INTO [a_HORIZONTAL_NAVIGATION] ([horiz_nav_id],[key_name])VALUES(3,'GotoPerson')
INSERT INTO [a_HORIZONTAL_NAVIGATION] ([horiz_nav_id],[key_name])VALUES(4,'GotoQuery')
INSERT INTO [a_HORIZONTAL_NAVIGATION] ([horiz_nav_id],[key_name])VALUES(5,'GotoOrg')
INSERT INTO [a_HORIZONTAL_NAVIGATION] ([horiz_nav_id],[key_name])VALUES(6,'GoToReviewStage')

INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(1,1,'GrantsEditor','Grant Details',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=GrantsEditor',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(2,1,'ProjectSummary','Activity',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=ProjectSummary',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(3,1,'GrantContacts','Contacts',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=GrantContacts',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(4,1,'Finance','Financials',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=Finance',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(5,1,'GrantAttachments','Documents',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=GrantAttachments','Test')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(6,1,'GrantNotes','Notes',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=GrantNotes',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(7,2,'ReviewCycle','Review Cycles',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=ReviewCycle',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(8,2,'ReviewCycleManager','Applicant/Committee Pool',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=ReviewCycleManager',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(9,2,'PreReview','Requests and Conflicts',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=PreReview',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(10,2,'ReviewCycleStage','Review Stages',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=ReviewCycleStage',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(11,3,'PersonContact','Person Details',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=PersonContact',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(12,3,'PersonActivity','Activity',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=PersonActivity',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(13,3,'Admin','Administration',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=Admin',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(14,3,'PersonAttachments','Attachments',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=PersonAttachments',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(15,3,'ContactReviewerInfo','Reviewer Info',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=ContactReviewerInfo',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(17,3,'PersonNotes','Notes',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=PersonNotes',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(18,3,'ContactCrspndnc','Correspondence',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=ContactCrspndnc',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(19,4,'SelectFields','Select Fields',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=SelectFields','PersistQueryInfo')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(20,4,'SelectCriteria','Select Criteria',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=SelectCriteria','PersistQueryInfo')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(21,4,'SaveQuery','Save and Run Query',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=SaveQuery','PersistQueryInfo')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(22,5,'OrganizationContact','Organization Details',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=OrganizationContact',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(23,5,'OrganizationActivity','Activity',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=OrganizationActivity',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(24,5,'OrganizationAttachments','Attachments',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=OrganizationAttachments',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(25,5,'OrganizationNotes','Notes',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=OrganizationNotes',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(26,1,'GrantsDemographics','Demographics',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=GrantsDemographics',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(27,1,'GrantsMedia','Media',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=GrantsMedia',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(28,6,'RevProcAssign','Assignments',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=RevProcAssign',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(29,6,'ReviewNotify','Notification',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=ReviewNotify',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(30,6,'RevProcScore','Scores and Critiques/Comments',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=RevProcScore',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(31,6,'RevProcRank','Rankings',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=RevProcRank',NULL)
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT] ([horiz_nav_element_id],[horiz_nav_id],[key_name],[nav_title],[enable],[source_file],[method])VALUES(32,6,'RevProcOutcome','Outcomes',1,'Implementation/Modules/Staff/ModuleContent.aspx?Config=ModuleConfig&amp;Page=RevProcOutcome',NULL)

INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(1,1,'QueryString','GranteeProjectID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(2,2,'QueryString','GranteeProjectID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(3,3,'QueryString','GranteeProjectID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(4,4,'QueryString','GranteeProjectID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(5,5,'QueryString','GranteeProjectID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(6,6,'QueryString','GranteeProjectID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(7,7,'QueryString','ReviewCycleID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(8,8,'QueryString','ReviewCycleID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(9,9,'QueryString','ReviewCycleID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(10,10,'QueryString','ReviewCycleID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(11,11,'QueryString','PersonID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(12,12,'QueryString','PersonID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(13,13,'QueryString','PersonID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(14,14,'QueryString','PersonID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(15,15,'QueryString','PersonID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(16,16,'QueryString','PersonID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(17,17,'QueryString','PersonID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(18,18,'QueryString','PersonID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(19,19,'QueryString','ReturnURL')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(20,20,'QueryString','ReturnURL')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(21,21,'QueryString','ReturnURL')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(22,22,'QueryString','OrganizationID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(23,23,'QueryString','OrganizationID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(24,24,'QueryString','OrganizationID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(25,25,'QueryString','OrganizationID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(26,26,'QueryString','GranteeProjectID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(27,27,'QueryString','GranteeProjectID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(28,28,'QueryString','ReviewCycleID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(29,28,'QueryString','ReviewCycleStageID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(30,29,'QueryString','ReviewCycleID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(31,29,'QueryString','ReviewCycleStageID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(32,30,'QueryString','ReviewCycleID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(33,30,'QueryString','ReviewCycleStageID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(34,31,'QueryString','ReviewCycleID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(35,31,'QueryString','ReviewCycleStageID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(36,32,'QueryString','ReviewCycleID')
INSERT INTO [a_HORIZONTAL_NAVIGATION_ELEMENT_ARG] ([horiz_nav_element_arg_id],[horiz_nav_element_id],[arg_type],[arg_property_key])VALUES(37,32,'QueryString','ReviewCycleStageID')

INSERT INTO [a_ORGANIZATION_ROLE] ([id],[abbr],[description],[sort_order])VALUES(1,'Fiscal Agent','Fiscal Agent',2)
INSERT INTO [a_ORGANIZATION_ROLE] ([id],[abbr],[description],[sort_order])VALUES(2,'Funding Partner','Funding Partner',3)
INSERT INTO [a_ORGANIZATION_ROLE] ([id],[abbr],[description],[sort_order])VALUES(3,'Evaluator','Evaluator',1)

INSERT INTO [a_OUTCOME_CONFIGURATION] ([id],[original_task_id],[original_outcome_id],[original_task_status_id],[original_task_role_id],[generated_task_id],[generated_outcome_id],[generated_task_status_id],[generated_task_role_id],[event_id])VALUES(1,6,-1,NULL,NULL,9,NULL,1,9,NULL)
INSERT INTO [a_OUTCOME_CONFIGURATION] ([id],[original_task_id],[original_outcome_id],[original_task_status_id],[original_task_role_id],[generated_task_id],[generated_outcome_id],[generated_task_status_id],[generated_task_role_id],[event_id])VALUES(2,9,52,NULL,NULL,2,NULL,1,1,11)
INSERT INTO [a_OUTCOME_CONFIGURATION] ([id],[original_task_id],[original_outcome_id],[original_task_status_id],[original_task_role_id],[generated_task_id],[generated_outcome_id],[generated_task_status_id],[generated_task_role_id],[event_id])VALUES(3,12,17,NULL,NULL,14,NULL,1,10,NULL)
INSERT INTO [a_OUTCOME_CONFIGURATION] ([id],[original_task_id],[original_outcome_id],[original_task_status_id],[original_task_role_id],[generated_task_id],[generated_outcome_id],[generated_task_status_id],[generated_task_role_id],[event_id])VALUES(4,23,31,NULL,NULL,24,NULL,1,7,NULL)
INSERT INTO [a_OUTCOME_CONFIGURATION] ([id],[original_task_id],[original_outcome_id],[original_task_status_id],[original_task_role_id],[generated_task_id],[generated_outcome_id],[generated_task_status_id],[generated_task_role_id],[event_id])VALUES(5,4,28,NULL,NULL,23,NULL,1,7,NULL)
INSERT INTO [a_OUTCOME_CONFIGURATION] ([id],[original_task_id],[original_outcome_id],[original_task_status_id],[original_task_role_id],[generated_task_id],[generated_outcome_id],[generated_task_status_id],[generated_task_role_id],[event_id])VALUES(6,56,-1,NULL,NULL,55,NULL,1,1,8)

INSERT INTO [a_REMINDER_BEFORE] ([id],[abbr],[description],[sort_order])VALUES(1,'Before','Before',1)
INSERT INTO [a_REMINDER_BEFORE] ([id],[abbr],[description],[sort_order])VALUES(2,'After','After',2)

INSERT INTO [a_REMINDER_TARGET] ([id],[abbr],[description],[sort_order])VALUES(1,'OpenDate','Open Date',1)
INSERT INTO [a_REMINDER_TARGET] ([id],[abbr],[description],[sort_order])VALUES(2,'DueDate','Due Date',2)

INSERT INTO [a_REQUEST_STATUS] ([id],[request_status])VALUES(1,'Approved')
INSERT INTO [a_REQUEST_STATUS] ([id],[request_status])VALUES(2,'Completed')
INSERT INTO [a_REQUEST_STATUS] ([id],[request_status])VALUES(3,'Requested')

INSERT INTO [a_SAVED_QUERY_ACTION] ([id],[action])VALUES(1,'Edit')
INSERT INTO [a_SAVED_QUERY_ACTION] ([id],[action])VALUES(2,'View Results')
INSERT INTO [a_SAVED_QUERY_ACTION] ([id],[action])VALUES(3,'Export to Excel')
INSERT INTO [a_SAVED_QUERY_ACTION] ([id],[action])VALUES(4,'Export to E-mail Utility')
INSERT INTO [a_SAVED_QUERY_ACTION] ([id],[action])VALUES(5,'Delete')
INSERT INTO [a_SAVED_QUERY_ACTION] ([id],[action])VALUES(6,'Word Merge')
INSERT INTO [a_SAVED_QUERY_ACTION] ([id],[action])VALUES(7,'Copy')
INSERT INTO [a_SAVED_QUERY_ACTION] ([id],[action])VALUES(8,'Export to Word')
INSERT INTO [a_SAVED_QUERY_ACTION] ([id],[action])VALUES(9,'Run Query')

INSERT INTO [a_SAVED_QUERY_BASE_TYPE] ([id],[base_type])VALUES(1,'Person')

INSERT INTO [a_SELECTED_OUTCOME] ([id],[abbr],[description],[sort_order],[end_date])VALUES(13,'Report Accepted','Report Accepted',1,NULL)
INSERT INTO [a_SELECTED_OUTCOME] ([id],[abbr],[description],[sort_order],[end_date])VALUES(14,'Report Not Accepted','Report Not Accepted',2,NULL)

INSERT INTO [a_SYSTEM_MAINTENANCE_NOTIFICATIONS] ([id],[display_notification],[display_text],[allow_login],[display_message_start_time],[display_message_end_time],[disable_login_start_time])VALUES(1,1,'<font color=''red''><b>IMPORTANT:</b></font> Normal and <b>very bold</b> text. <font color=''red''>Also some red text!</font>',1,'Sep 27 2007 12:00:00:000AM','Sep 27 2007 12:00:00:000AM','Nov 18 2005 12:00:00:000AM')

INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(1,'Applicant','Applicant',NULL,1)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(2,'STAFF','Staff',NULL,86)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(3,'MENTOR','Mentor',NULL,99)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(4,'REF','Referee',NULL,99)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(5,'Chair','Chair',NULL,1)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(6,'Nominator','Nominator',NULL,99)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(7,'Reviewer','Reviewer',NULL,2)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(8,'Applicant','Applicant',NULL,3)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(9,'External Reviewer','External Reviewer',NULL,4)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(10,'PR Reviewer','Progress Report Reviewer',NULL,2)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(11,'Applicant','Applicant - Eligibility',NULL,5)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(12,'Applicant','Applicant - Pre-Award',NULL,7)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(15,'Applicant','Applicant - Interim',NULL,8)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(16,'Internal Reviewer','Internal Reviewer',NULL,7)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(17,'INSTOFFICIAL','Institution Official',NULL,1)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(18,'COLLABORATOR','Collaborator',NULL,1)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(100,'Sponsor','Sponsor',NULL,6)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(101,'Reference','Reference',NULL,6)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(102,'Department Head','Department Head',NULL,6)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(103,'Grants Officer','Grants Officer',NULL,6)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(104,'Fiscal Officer','Fiscal Officer',NULL,3)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(105,'Collab Invest','Collaborating Investigator',NULL,6)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(107,'Sponsor','Sponsor',NULL,6)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(108,'Reference','Reference',NULL,6)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(109,'Department Head','Department Head',NULL,6)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(110,'Collab Invest','Collaborating Investigator',NULL,6)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(111,'Co-Sponsor','Co-Sponsor',NULL,6)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(112,'Grants Officer','Grants Officer',NULL,6)
INSERT INTO [a_WF_TASK_ROLE] ([id],[abbr],[description],[sort_order],[task_type_id])VALUES(113,'Fiscal Officer','Fiscal Officer',NULL,6)

INSERT INTO [a_WF_TASK_SELECTED_OUTCOME] ([id],[wf_task_id],[selected_outcome_id])VALUES(1,39,13)
INSERT INTO [a_WF_TASK_SELECTED_OUTCOME] ([id],[wf_task_id],[selected_outcome_id])VALUES(2,39,14)

INSERT INTO [a_WF_TASK_STATUS] ([id],[abbr],[description])VALUES(1,'Incomplete','Incomplete')
INSERT INTO [a_WF_TASK_STATUS] ([id],[abbr],[description])VALUES(2,'Complete','Complete')
INSERT INTO [a_WF_TASK_STATUS] ([id],[abbr],[description])VALUES(3,'Inactive','Inactive')
INSERT INTO [a_WF_TASK_STATUS] ([id],[abbr],[description])VALUES(4,'Resubmit','Resubmit')

INSERT INTO [a_WF_TASK_TYPE] ([id],[description],[sort_order])VALUES(1,'Application',1)
INSERT INTO [a_WF_TASK_TYPE] ([id],[description],[sort_order])VALUES(2,'Review',2)
INSERT INTO [a_WF_TASK_TYPE] ([id],[description],[sort_order])VALUES(3,'Progress Report',3)
INSERT INTO [a_WF_TASK_TYPE] ([id],[description],[sort_order])VALUES(4,'External Review',4)
INSERT INTO [a_WF_TASK_TYPE] ([id],[description],[sort_order])VALUES(5,'Eligibility',5)
INSERT INTO [a_WF_TASK_TYPE] ([id],[description],[sort_order])VALUES(6,'Third Party',6)
INSERT INTO [a_WF_TASK_TYPE] ([id],[description],[sort_order])VALUES(7,'Internal Review',7)

INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'ADM','Scientist Administrator',22,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'ASC','Associate Professor',2,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'AST','Assistant Professor',1,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'CHA','Department Chairman or Head',6,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(5,'CHI','Chief of Section/Division or Labro.',3,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(6,'CLI','Clinical Professor/Associate Prof.',4,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(7,'DEA','Medical School Dean',14,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(8,'DIR','Director of Research Institution',8,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(9,'GRA','Graduate Student',9,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(10,'HSC','High School Student',10,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(11,'INS','Instructor or Lecturer',11,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(12,'INT','Intern',12,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(13,'MEM','Department Member',7,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(14,'MSD','Medical School Associate Dean',13,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(15,'OTH','Other',15,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(16,'POS','Postdoctoral Fellow',16,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(17,'PRE','Predoctoral Fellow',17,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(18,'PRI','Private Practice',18,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(19,'PRO','Professor',19,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(20,'RCH','Research Associate',20,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(21,'RES','Resident',21,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(22,'SRI','Senior Investigator/Scientist',24,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(23,'STA','Staff Scientist',25,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(24,'UND','College Undergraduate',5,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(25,'VIS','Visiting Investigator',26,NULL)
INSERT INTO [c_ACADEMIC_POSITION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(26,'WRI','Scientist Writer',23,NULL)

INSERT INTO [c_ACCESS_TYPE] ([id],[access_type_desc],[sort_order],[end_date])VALUES(1,'Private',NULL,NULL)
INSERT INTO [c_ACCESS_TYPE] ([id],[access_type_desc],[sort_order],[end_date])VALUES(2,'Public',NULL,NULL)
INSERT INTO [c_ACCESS_TYPE] ([id],[access_type_desc],[sort_order],[end_date])VALUES(3,'Read-Only',NULL,NULL)

INSERT INTO [c_ACCOUNT] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Accounts Payable - Trade','Accounts Payable - Trade',NULL,NULL)
INSERT INTO [c_ACCOUNT] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'AP Research Current Yr New Awards','AP Research Current Yr New Awards',NULL,NULL)
INSERT INTO [c_ACCOUNT] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'AP Research Current Yr Refunds','AP Research Current Yr Refunds',NULL,NULL)
INSERT INTO [c_ACCOUNT] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'AP Research Current Yr Resignations','AP Research Current Yr Resignations',NULL,NULL)
INSERT INTO [c_ACCOUNT] ([id],[abbr],[description],[sort_order],[end_date])VALUES(5,'AP Research Current Yr Declinations','AP Research Current Yr Declinations',NULL,NULL)
INSERT INTO [c_ACCOUNT] ([id],[abbr],[description],[sort_order],[end_date])VALUES(6,'AP Research Current Yr Adjustments','AP Research Current Yr Adjustments',NULL,NULL)
INSERT INTO [c_ACCOUNT] ([id],[abbr],[description],[sort_order],[end_date])VALUES(7,'AP Research Current Yr Reissues','AP Research Current Yr Reissues',NULL,NULL)
INSERT INTO [c_ACCOUNT] ([id],[abbr],[description],[sort_order],[end_date])VALUES(8,'AP Research Current Yr Payments','AP Research Current Yr Payments',NULL,NULL)
INSERT INTO [c_ACCOUNT] ([id],[abbr],[description],[sort_order],[end_date])VALUES(9,'Research Payable Due Within 1 Year','Research Payable Due Within 1 Year',NULL,NULL)
INSERT INTO [c_ACCOUNT] ([id],[abbr],[description],[sort_order],[end_date])VALUES(10,'Research Payable Due After 1 Year','Research Payable Due After 1 Year',NULL,NULL)
INSERT INTO [c_ACCOUNT] ([id],[abbr],[description],[sort_order],[end_date])VALUES(11,'Offsets 1499 - reissues','Offsets 1499 - reissues',NULL,NULL)
INSERT INTO [c_ACCOUNT] ([id],[abbr],[description],[sort_order],[end_date])VALUES(12,'New Solomon Liability Code','New Solomon Liability Code',NULL,NULL)
INSERT INTO [c_ACCOUNT] ([id],[abbr],[description],[sort_order],[end_date])VALUES(13,'YTD Net Expense','YTD Net Expense',NULL,NULL)
INSERT INTO [c_ACCOUNT] ([id],[abbr],[description],[sort_order],[end_date])VALUES(14,'Cumulative Research Expense','Cumulative Research Expense',NULL,NULL)

INSERT INTO [c_ADDITIONAL_CONTACT_ROLE] ([id],[abbr],[description],[sort_order],[end_date],[task_id],[competition_id])VALUES(1,'Sponsor','Sponsor',3,NULL,NULL,NULL)
INSERT INTO [c_ADDITIONAL_CONTACT_ROLE] ([id],[abbr],[description],[sort_order],[end_date],[task_id],[competition_id])VALUES(2,'Fiscal Officer','Fiscal Officer',2,NULL,NULL,NULL)
INSERT INTO [c_ADDITIONAL_CONTACT_ROLE] ([id],[abbr],[description],[sort_order],[end_date],[task_id],[competition_id])VALUES(3,'Department Head','Department Head',1,NULL,NULL,NULL)

INSERT INTO [c_ADDRESS_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Home','Home',2,NULL)
INSERT INTO [c_ADDRESS_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Other','Other',4,NULL)
INSERT INTO [c_ADDRESS_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Business','Business',1,NULL)
INSERT INTO [c_ADDRESS_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'Vacation','Vacation',3,NULL)

INSERT INTO [c_ASSIGNMENT_PROCESS] ([id],[abbr],[description],[sort_order],[end_date],[sp_name])VALUES(1,'Generic Bulk Assignment','This assignment process will assign reviewers to each application based on the number of reviewers desired per application. If you wish to avoid making assignments where there is a known conflict of interest, the Preprocess must be run and the request and conflicts box must be checked. The purpose of making these assignments is so that reviewers can use the system to enter scores and comments. This process will typically be run during the Request and Conflicts and Panel Stages with the request and conflict box left unchecked, so that all applicants may be assigned to all reviewers.  ',1,NULL,'GenerateReviewAssignments')
INSERT INTO [c_ASSIGNMENT_PROCESS] ([id],[abbr],[description],[sort_order],[end_date],[sp_name])VALUES(2,'Med and Early Careers - Bulk Assignment','The Med and Early Careers assignment process will assign reviewers to each application based on the number of reviewers desired per application. During the initial review assignment, the request and conflicts box should be checked to avoid matching reviewers when there is a known conflict of interest and will make assignments based on requests giving priority when there is a commonality between Research Areas and the maximum number of matches of Research Fields. (Note that the Med/Early Careers Preprocess must be run before running the bulk assignment.) The purpose of making these assignments is so that reviewers can use the system to enter scores and comments.',2,NULL,'GenerateReviewAssignmentsResearchAreasFields')
INSERT INTO [c_ASSIGNMENT_PROCESS] ([id],[abbr],[description],[sort_order],[end_date],[sp_name])VALUES(3,'Cloister - Bulk Assignment','The Cloister assignment process will assign reviewers to each application based on the number of reviewers desired per application. During the initial review assignment, the request and conflicts box should be checked to avoid matching reviewers when there is a known conflict of interest and will make assignments based on requests giving priority when there is a commonality between Research Areas. (Note that the Cloister Preprocess must be run before running bulk assignments.) The purpose of making these assignments is so that reviewers can use the system to enter scores and comments.  ',3,NULL,'GenerateReviewAssignmentsResearchAreasFields')
INSERT INTO [c_ASSIGNMENT_PROCESS] ([id],[abbr],[description],[sort_order],[end_date],[sp_name])VALUES(4,'BioMed - Bulk Assignment','The BioMed assignment process will assign reviewers to each application based on the number of reviewers desired per application. During Stage 1 and Stage 2 assignment, the request and conflicts box must be checked to avoid matching reviewers when there is a known conflict of interest. (Note that the Copy from Previous Cycle Preprocess must be run before running the bulk assignment.) The purpose of making these assignments is so that reviewers can use the system to enter scores and comments.',4,NULL,'GenerateReviewAssignmentsBioMed')

INSERT INTO [c_ASSURANCES_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Approved','Approved',1,NULL)
INSERT INTO [c_ASSURANCES_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Pending','Pending',4,NULL)
INSERT INTO [c_ASSURANCES_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Exempt','Exempt',2,NULL)
INSERT INTO [c_ASSURANCES_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'Not Applicable','Not Applicable',3,NULL)

INSERT INTO [c_ASSURANCES_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Animal Use','Animal Use',1,NULL)
INSERT INTO [c_ASSURANCES_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Human Use','Human Use',3,NULL)
INSERT INTO [c_ASSURANCES_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Biohazard Use','Biohazard Use',2,NULL)

INSERT INTO [c_BUDGET_PERIOD_DESCRIPTION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,NULL,'Year 1',1,NULL)
INSERT INTO [c_BUDGET_PERIOD_DESCRIPTION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,NULL,'Year 2',2,NULL)
INSERT INTO [c_BUDGET_PERIOD_DESCRIPTION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,NULL,'Year 3',3,NULL)
INSERT INTO [c_BUDGET_PERIOD_DESCRIPTION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,NULL,'Year 4',4,NULL)
INSERT INTO [c_BUDGET_PERIOD_DESCRIPTION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(5,NULL,'Year 5',5,NULL)

INSERT INTO [c_BUDGET_PERIOD_NAME] ([budget_period_name_id],[abbr],[description],[sequence])VALUES(1,'Year 1','1',1)
INSERT INTO [c_BUDGET_PERIOD_NAME] ([budget_period_name_id],[abbr],[description],[sequence])VALUES(2,'Year 2','2',2)
INSERT INTO [c_BUDGET_PERIOD_NAME] ([budget_period_name_id],[abbr],[description],[sequence])VALUES(3,'Year 3','3',3)
INSERT INTO [c_BUDGET_PERIOD_NAME] ([budget_period_name_id],[abbr],[description],[sequence])VALUES(4,'Year 4','4',4)
INSERT INTO [c_BUDGET_PERIOD_NAME] ([budget_period_name_id],[abbr],[description],[sequence])VALUES(5,'Year 5','5',5)

INSERT INTO [c_CAMPAIGN_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'RND 2006','Red Nose Day 2006',2,NULL)
INSERT INTO [c_CAMPAIGN_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'RND 2004','Red Nose Day 2004',1,NULL)
INSERT INTO [c_CAMPAIGN_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'SR 2005','Sports Relief 2005',3,NULL)
INSERT INTO [c_CAMPAIGN_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'SR 2007','Sports Relief 2007',4,NULL)

INSERT INTO [c_CAREER_STAGE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'DS','Directed Step',1,NULL)
INSERT INTO [c_CAREER_STAGE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'FI','First Independent Step',2,NULL)
INSERT INTO [c_CAREER_STAGE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'GC','Gaining Credentials',3,NULL)
INSERT INTO [c_CAREER_STAGE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'GL','Research Group Leader',4,NULL)
INSERT INTO [c_CAREER_STAGE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(5,'IN','Intermediate Level',5,NULL)
INSERT INTO [c_CAREER_STAGE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(6,'MD','Making the Decision',6,NULL)
INSERT INTO [c_CAREER_STAGE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(7,'OT','Other',7,NULL)
INSERT INTO [c_CAREER_STAGE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(8,'RI','Recognized Investigator',8,NULL)

INSERT INTO [c_CHOICE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Yes','Yes',3,NULL)
INSERT INTO [c_CHOICE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'No','No',1,NULL)
INSERT INTO [c_CHOICE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Non_applicable','Non-applicable',2,NULL)

INSERT INTO [c_COMPETITION_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Competition 1','Competition 1',1,NULL)
INSERT INTO [c_COMPETITION_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Competition 2','Competition 2',2,NULL)
INSERT INTO [c_COMPETITION_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Competition 3','Competition 3',3,NULL)

INSERT INTO [c_CONFLICT_PROCESS] ([id],[abbr],[display_name],[description],[sp_name])VALUES(1,'GeneratePrimaryConflicts','Auto Generated Conflict and Requests','The Conflict process compares the reviewer''s institution with that of the applicant.  If there is a match, a conflict record is created.  All of the conflicts created within this process will have a source of "Internal - Auto".    ','GeneratePrimaryConflicts')
INSERT INTO [c_CONFLICT_PROCESS] ([id],[abbr],[display_name],[description],[sp_name])VALUES(4,'ClearPreprocess','Clear Request and Conflicts Process Results','This process will clear all request/conflicts and matching records created in this cycle with a source of "Internal-Auto".  Once this process has successfully executed you may select another request and conflicts process to run from the ''Run Request and Conflicts Process'' dropdown menu.  HHMI will use this process to clear results if they have run a process by mistake.  ','ClearPreprocess')
INSERT INTO [c_CONFLICT_PROCESS] ([id],[abbr],[display_name],[description],[sp_name])VALUES(5,'CopyAllRequestsAndConflictsFromPreviousStage','Copy Requests and/or Conflicts from Previous Cycle','This process copies over any requests and/or conflicts entered during the previous review stage/cycle. These requests and/or conficts may have been entered by reviewers, staff, or auto generated.  ','CopyAllRequestsAndConflictsFromPreviousStage')

INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,NULL,'Reviewer is Mentor',NULL,NULL)
INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,NULL,'Reviewer is CoMentor',NULL,NULL)
INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,NULL,'Division Chief or Chief of Service (reference)',NULL,NULL)
INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,NULL,'Ph.D. or other research adviser (reference)',NULL,NULL)
INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(5,NULL,'Reviewer is Reference',NULL,NULL)
INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(7,NULL,'Research Adviser (prior research form)',NULL,NULL)
INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(8,NULL,'Self-reported conflict',NULL,NULL)
INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(9,NULL,'Same institution as Mentor',NULL,NULL)
INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(10,NULL,'Same institution as CoMentor',NULL,NULL)
INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(11,NULL,'Same institution as Applicant',NULL,NULL)
INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(12,NULL,'Same research field(s) as Applicant',NULL,NULL)
INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(13,NULL,'Reviewer-rejected Application',NULL,NULL)
INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(14,NULL,'Close present collaboration with Applicant',NULL,NULL)
INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(15,NULL,'Close present collaboration with institution',NULL,NULL)
INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(16,NULL,'Current faculty at applicant institution',NULL,NULL)
INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(17,NULL,'Advisory membership at applicant institution',NULL,NULL)
INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(18,NULL,'Same research area as Applicant',NULL,NULL)
INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(19,NULL,'Same research area and field(s) as Applicant',NULL,NULL)
INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(20,NULL,'Administrator at applicant institution  ',NULL,NULL)
INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(21,NULL,'Advisory member at applicant institution  ',NULL,NULL)
INSERT INTO [c_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(999,NULL,'Other',NULL,NULL)

INSERT INTO [c_CONSORTIA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,NULL,'Great America/National',2,NULL)
INSERT INTO [c_CONSORTIA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,NULL,'Northeast',4,NULL)
INSERT INTO [c_CONSORTIA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,NULL,'Mid-Atlantic',3,NULL)
INSERT INTO [c_CONSORTIA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,NULL,'Southern Ohio Valley',5,NULL)
INSERT INTO [c_CONSORTIA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(5,NULL,'Western',6,NULL)
INSERT INTO [c_CONSORTIA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(6,NULL,'Councils',1,NULL)

INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(1,'USM','U.S. Military - APO/FPO',202,NULL,249)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(2,'AF','Afghanistan',1,NULL,1)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(3,'AL','Albania',2,NULL,2)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(4,'AG','Algeria',3,NULL,3)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(5,'AN','Andorra',4,NULL,4)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(6,'AO','Angola',5,NULL,5)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(7,'AV','Anguilla',6,NULL,6)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(8,'AC','Antigua and Barbuda',7,NULL,7)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(9,'AR','Argentina',8,NULL,8)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(10,'AM','Armenia',9,NULL,10)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(13,'AS','Australia',10,NULL,13)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(14,'AU','Austria',11,NULL,14)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(15,'AJ','Azerbaijan',12,NULL,15)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(17,'BA','Bahrain',13,NULL,17)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(18,'BG','Bangladesh',14,NULL,18)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(19,'BB','Barbados',15,NULL,19)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(21,'BO','Belarus',16,NULL,21)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(22,'BE','Belgium',17,NULL,22)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(23,'BH','Belize',18,NULL,23)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(24,'BN','Benin',19,NULL,24)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(25,'BD','Bermuda',20,NULL,25)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(26,'BT','Bhutan',21,NULL,26)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(27,'BL','Bolivia',22,NULL,27)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(28,'BK','Bosnia and Herzegovina',23,NULL,28)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(29,'BC','Botswana',24,NULL,29)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(31,'BR','Brazil',26,NULL,31)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(32,'IO','British Indian Ocean Territory',27,NULL,32)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(34,'BX','Brunei',28,NULL,34)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(35,'BU','Bulgaria',29,NULL,35)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(36,'UV','Bourkina Faso',25,NULL,36)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(38,'BY','Burundi',30,NULL,38)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(40,'CM','Cameroon',31,NULL,40)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(41,'CA','Canada',32,NULL,41)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(43,'CV','Cape Verde',33,NULL,43)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(44,'CJ','Cayman Islands',34,NULL,44)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(45,'CT','Central African Republic',35,NULL,45)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(46,'CD','Chad',36,NULL,46)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(47,'CI','Chile',38,NULL,48)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(52,'CO','Colombia',39,NULL,49)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(54,'CN','Comoros',40,NULL,50)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(56,'CW','Cook Islands',41,NULL,51)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(58,'CS','Costa Rica',42,NULL,52)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(59,'IV2','Cote d''Ivoire',43,NULL,53)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(60,'HR','Croatia',44,NULL,60)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(61,'CU','Cuba',45,NULL,61)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(62,'CY','Cyprus',46,NULL,62)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(63,'EZ','Czech Republic',47,NULL,63)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(65,'CG2','Peoples Republic of Congo',149,NULL,187)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(66,'DA','Denmark',49,NULL,65)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(67,'DJ','Djibouti',50,NULL,66)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(68,'DO','Dominica',51,NULL,67)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(69,'DR','Dominican Republic',52,NULL,68)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(70,'EC','Ecuador',53,NULL,69)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(71,'EG','Egypt',54,NULL,70)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(72,'ES','El Salvador',55,NULL,71)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(73,'EK','Equatorial Guinea',57,NULL,73)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(75,'EN','Estonia',58,NULL,74)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(76,'ET','Ethiopia',59,NULL,75)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(78,'FA','Falkland Islands (Islas Malvinas)',61,NULL,77)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(79,'FO','Faeroe Islands-Den',60,NULL,76)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(80,'FJ','Fiji',63,NULL,80)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(81,'FI','Finland',64,NULL,81)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(82,'FR','France',65,NULL,82)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(83,'FG','French Guiana',66,NULL,83)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(84,'FP','French Polynesia',67,NULL,84)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(86,'GB','Gabon',68,NULL,86)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(87,'GM','Gambia',69,NULL,87)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(89,'GZ','Gaza Strip',70,NULL,89)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(92,'GH','Ghana',71,NULL,92)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(93,'GI','Gibraltar',72,NULL,93)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(95,'GR','Greece',73,NULL,95)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(96,'GL','Greenland',74,NULL,96)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(97,'GJ','Grenada',75,NULL,97)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(98,'GP','Guadeloupe',76,NULL,98)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(99,'GT','Guatemala',77,NULL,99)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(101,'GV','Guinea',78,NULL,101)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(102,'PU','Guinea-Bissau',79,NULL,102)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(103,'GY','Guyana',80,NULL,103)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(104,'HA','Haiti',81,NULL,104)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(105,'HM','Heard Island and McDonald Islands',82,NULL,105)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(106,'HO','Honduras',83,NULL,106)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(107,'HK','Hong Kong',84,NULL,107)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(108,'HU','Hungary',85,NULL,108)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(109,'IC','Iceland',86,NULL,109)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(110,'IN','India',87,NULL,110)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(111,'ID','Indonesia',88,NULL,111)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(112,'IR','Iran',89,NULL,112)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(113,'IZ','Iraq',90,NULL,113)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(114,'EI','Ireland',91,NULL,114)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(115,'IM','Isle of Man',92,NULL,115)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(116,'IS','Israel',93,NULL,116)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(117,'IT','Italy',94,NULL,117)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(119,'JM','Jamaica',95,NULL,119)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(121,'JA','Japan',96,NULL,121)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(123,'JO','Jordan',97,NULL,123)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(125,'KZ','Kazakhstan',99,NULL,125)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(126,'KE','Kenya',100,NULL,126)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(127,'KR','Kiribati',101,NULL,127)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(128,'KR','Korea',102,NULL,128)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(131,'KU','Kuwait',103,NULL,131)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(132,'KG','Kyrgyzstan',104,NULL,132)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(134,'LA','Laos',105,NULL,134)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(135,'LG','Latvia',106,NULL,135)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(136,'LE','Lebanon',107,NULL,136)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(137,'LT','Lesotho',108,NULL,137)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(138,'LI','Liberia',109,NULL,138)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(139,'LY','Libya',110,NULL,139)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(140,'LS','Liechtenstein',111,NULL,140)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(141,'LH','Lithuania',112,NULL,141)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(142,'LU','Luxembourg',113,NULL,142)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(143,'MC','Macao',114,NULL,143)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(145,'MA','Madagascar',115,NULL,145)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(146,'MI','Malawi',116,NULL,146)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(147,'MY','Malaysia',117,NULL,147)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(148,'MV','Republic of Maldives',156,NULL,198)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(149,'ML','Mali',117,NULL,149)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(150,'MT','Malta',119,NULL,150)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(152,'MB','Martinique',120,NULL,152)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(153,'MR','Mauritania',121,NULL,153)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(154,'MP','Mauritius',122,NULL,154)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(156,'MX','Mexico',123,NULL,156)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(158,'MD','Moldova',124,NULL,158)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(159,'MN','Monaco',125,NULL,159)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(160,'MG','Mongolia',126,NULL,160)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(161,'MW','Montenegro',127,NULL,161)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(162,'MH','Montserrat',128,NULL,162)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(163,'MO','Morocco',129,NULL,163)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(164,'MZ','Mozambique',130,NULL,164)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(166,'WA','Namibia',131,NULL,166)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(167,'NR','Nauru',132,NULL,167)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(168,'NP','Nepal',133,NULL,168)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(169,'NT','Netherlands Antilles',134,NULL,169)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(170,'NL','Netherlands, The',135,NULL,170)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(171,'NC','New Caledonia',136,NULL,171)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(172,'NZ','New Zealand',137,NULL,172)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(173,'NU','Nicaragua',138,NULL,173)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(174,'NG','Niger',139,NULL,174)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(175,'NI','Nigeria',140,NULL,175)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(176,'NE','Niue',141,NULL,176)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(178,'NO','Norway',143,NULL,178)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(180,'MU','Oman',144,NULL,180)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(181,'CN','P.R. of China',145,NULL,181)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(182,'PK','Pakistan',146,NULL,182)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(184,'PM','Republic of Panama',157,NULL,199)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(185,'PP','Papua New Guinea',147,NULL,185)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(187,'PA','Paraguay',148,NULL,186)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(188,'PE','Peru',150,NULL,188)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(189,'RP','Philippines',151,NULL,189)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(192,'PL','Poland',152,NULL,192)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(193,'PO','Portugal',153,NULL,193)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(194,'QA','Qatar',154,NULL,194)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(197,'RG','Republic of Georgia',155,NULL,197)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(198,'RE','Reunion',160,NULL,202)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(199,'RO','Romania',161,NULL,203)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(200,'RS','Russia',162,NULL,204)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(201,'RW','Rwanda',164,NULL,206)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(202,'SH','Saint Helena',165,NULL,207)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(203,'SC','Saint Kitts and Nevis',166,NULL,208)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(204,'ST','Saint Lucia',167,NULL,209)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(205,'SB','Saint Pierre and Miquelon',168,NULL,210)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(207,'SM','San Marino',169,NULL,211)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(208,'TP','Sao Tome and Principe',170,NULL,212)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(209,'SA','Saudi Arabia',171,NULL,213)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(210,'SC','Scotland',172,NULL,214)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(211,'SG','Senegal',173,NULL,215)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(212,'SR','Serbia',174,NULL,216)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(213,'SR','Serbia',175,NULL,217)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(214,'SE','Seychelles',176,NULL,218)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(215,'SL','Sierra Leone',177,NULL,219)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(216,'SN','Republic of Singapore',158,NULL,200)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(217,'LO','Slovakia',178,NULL,220)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(218,'SI','Slovenia',179,NULL,221)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(219,'BP','Solomon Islands',180,NULL,222)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(220,'SO','Somalia',181,NULL,223)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(221,'SF','Republic of South Africa',159,NULL,201)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(225,'SP','Spain',182,NULL,224)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(227,'CE','Sri Lanka',183,NULL,227)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(228,'SU','Sudan',184,NULL,228)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(229,'NS','Suriname',185,NULL,229)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(231,'WZ','Swaziland',186,NULL,231)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(232,'SW','Sweden',187,NULL,232)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(233,'SZ','Switzerland',188,NULL,233)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(234,'SY','Syria',189,NULL,234)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(235,'TW','Taiwan',190,NULL,235)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(236,'TI','Tajikistan',191,NULL,236)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(237,'TZ','Tanzania',192,NULL,237)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(238,'TH','Thailand',194,NULL,239)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(240,'TO','Togo',195,NULL,240)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(242,'TN','Tonga',196,NULL,242)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(243,'TD','Trinidad and Tobago',197,NULL,243)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(245,'TS','Tunisia',198,NULL,245)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(246,'TU','Turkey',199,NULL,246)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(247,'TX','Turkmenistan',200,NULL,247)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(249,'TV','Tuvalu',201,NULL,248)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(250,'UG','Uganda',203,NULL,250)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(251,'UP','Ukraine',204,NULL,251)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(252,'TC','United Arab Emirates',206,NULL,253)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(254,'UY','Uruguay',207,NULL,255)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(255,'UZ','Uzbekistan',208,NULL,256)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(257,'VT','Vatican City',209,NULL,257)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(258,'VE','Venezuela',210,NULL,258)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(259,'VM','Vietnam',211,NULL,259)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(264,'WI','Western Sahara',213,NULL,264)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(265,'WS','Western Samoa',214,NULL,265)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(266,'YM','Yemen',215,NULL,266)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(267,'YU','Yugoslavia',217,NULL,268)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(268,'CG','Zaire',218,NULL,269)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(269,'ZA','Zambia',219,NULL,270)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(270,'ZI','Zimbabwe',220,NULL,271)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(271,'CI','Channel Islands',37,NULL,47)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(272,'FRG','Fed Republic of Germany',62,NULL,78)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(274,'EG','England',56,NULL,72)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(275,'KP','Kampuchea',98,NULL,124)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(276,'YRM','Yugoslav Repub Macednoia',216,NULL,267)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(277,'NI','Northern Ireland',142,NULL,177)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(278,'TP','Territory of Pacific',193,NULL,238)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(279,'RF','Russian Federation',163,NULL,205)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(280,'US','United  States',205,NULL,0)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(281,'WA','Wales',212,NULL,260)
INSERT INTO [c_COUNTRY] ([id],[abbr],[description],[sort_order],[end_date],[sequence_number])VALUES(282,'DRY','Dem Rep of Yemen',48,NULL,64)

INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Award 1','Award 1',1,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Award 2','Award 2',2,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Award 3','Award 3',3,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'Award 4','Award 4',4,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(5,'Award 5','Award 5',5,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(6,'Award 6','Award 6',6,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(7,'Award 7','Award 7',7,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(8,'Award 8','Award 8',8,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(9,'Award 9','Award 9',9,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(10,'Award 10','Award 10',10,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(11,'Award 11','Award 11',11,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(12,'Award 12','Award 12',12,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(13,'Award 13','Award 13',13,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(14,'Award 14','Award 14',14,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(15,'Award 15','Award 15',15,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(16,'Award 16','Award 16',16,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(17,'Award 17','Award 17',17,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(18,'Award 18','Award 18',18,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(19,'Award 19','Award 19',19,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(20,'Award 20','Award 20',20,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(21,'Award 21','Award 21',21,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(22,'Award 22','Award 22',22,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(23,'Award 23','Award 23',23,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(24,'Award 24','Award 24',24,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(25,'Award 25','Award 25',25,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(27,'Other 1','Other 1',0,NULL)
INSERT INTO [c_CURRENT_AWARDS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(28,'Other 2','Other 2',0,NULL)

INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'AAS','Associates of Applied Science',1,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'AB','Bachelor of Arts',2,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'BA','Bachelor of Arts',3,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'BC','Bachelor of Surgery',4,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(5,'BCH','Bachelor of Surgery',5,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(6,'BCHIR','Bachelor of Surgery',6,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(7,'BM','Bachelor of Medicine',7,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(8,'BMBC','Bachelor of Medicine & Surgery',8,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(9,'BMEDS','Bachelor of Medical Science',9,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(10,'BPHAR','Bachelor of Pharmacy',10,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(11,'BS','Bachelor of Science',11,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(12,'BSC','Bachelor of Science',12,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(13,'CHB','Bachelor of Surgery',13,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(14,'CHM','Master of Surgery',14,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(15,'DA','Doctor of Arts',15,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(16,'DC','Doctor of Chiropractic',16,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(17,'DCH','Doctor of Surgery',17,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(18,'DDS','Doctor of Dental Surgery',18,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(19,'DES','Doctor of Engineering Science',19,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(20,'DM','Doctor of Medicine',20,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(21,'DMD','Doctor of Dental Medicine',21,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(22,'DMS','Bachelor of Medicine & Surgery',22,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(23,'DNSC','Doctor of Nursing',23,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(24,'DO','Doctor of Osteopathic Medicine',24,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(25,'DPH','Doctor of Public Health',25,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(26,'DPHIL','Doctor of Philosophy',26,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(27,'DSC','Doctor of Science',27,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(28,'DVM','Doctor of Veterinary Medicine',28,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(29,'EDD','Doctor of Education',29,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(30,'HS','High School Diploma',30,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(31,'JD','Doctor of Jurisprudence',31,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(32,'MA','Master of Arts',32,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(33,'MB','Bachelor of Medicine',33,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(34,'MBA','Master of Business Administration',34,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(35,'MBBC','Bachelor of Medicine & Surgery',35,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(36,'MBBCH','Bachelor of Medicine & Surgery',36,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(37,'MBBS','Bachelor of Medicine & Surgery',37,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(38,'MBCHB','Doctor of Medicine',38,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(39,'MCHIR','Master of Surgery',39,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(40,'MD','Doctor of Medicine',40,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(41,'MED','Master of Education',41,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(42,'MPH','Master of Public Health',42,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(43,'MPHIL','Master of Philosophy',43,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(44,'MS','Master of Science',44,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(45,'MSURG','Master of Surgery',45,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(46,'NN','No Degree',46,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(47,'PHD','Doctor of Philosophy',47,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(48,'PHRMD','Doctorate in Pharmacology',48,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(49,'PTA','Physical Therapist Assistant',49,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(50,'RN','Registered Nurse',50,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(51,'SB','Bachelor of Science',51,NULL)
INSERT INTO [c_DEGREE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(52,'SCD','Doctor of Science',52,NULL)

INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'AN','Anesthesiology',1,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'AR','Arteriosclerosis',2,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'BI','Biochemistry/Chemistry',3,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'CA','Cardiovascular Disease/Cardiology',4,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(5,'CE','Cell/Molecular Biology/Genetics',5,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(6,'CR','Critical Care/Intensive Care',6,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(7,'EM','Emergency Care/ACLS/BLS Instructor/EMT/EMT-D/Param',7,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(8,'EN','Endocrinology/Diabetes',8,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(9,'EP','Epidemiology/Prevention/Public Health',9,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(10,'FA','Family Practice/General Practice',10,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(11,'HY','Hypertension',11,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(12,'IN','Internal Medicine',12,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(13,'MI','Microbiology/Immunology/Infectious Diseases',13,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(14,'NE','Nephrology',14,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(15,'NN','Neurology/Neurosurgery/Neuroscience',15,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(16,'NT','Nutrition',16,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(17,'NU','Nursing',17,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(18,'OB','OB/Gyn',18,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(19,'OT','Other',19,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(20,'PA','Pathology',20,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(21,'PB','Physiology/Biophysics',21,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(22,'PE','Pediatric CardiologyPediatrics',22,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(23,'PH','Pharmacy',23,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(24,'PS','Psychology/Psychiatry/Behavioral Science',24,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(25,'PU','Pulmonary Diseases',25,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(26,'RA','Radiology',26,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(27,'RE','Rehabilitation/Exercise Testing/Physical Med & Reh',27,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(28,'SU','Surgery (CV/Thoracic/Vascular)',28,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(29,'TH','Thrombosis',29,NULL)
INSERT INTO [c_DEGREE_SPECIALTY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(30,'VA','Vascular Biology & Medicine',30,NULL)

INSERT INTO [c_EDUCATIONAL_LEVEL] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'GRADPHD','Graduate (Ph.D./Sc.D/Equivalent Degree)',4,NULL)
INSERT INTO [c_EDUCATIONAL_LEVEL] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'GRADMAS','Graduate (Masters/Equivalent Degree)',3,NULL)
INSERT INTO [c_EDUCATIONAL_LEVEL] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'MED','Medical',5,NULL)
INSERT INTO [c_EDUCATIONAL_LEVEL] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'MEDOTH','Medical (Other)',6,NULL)
INSERT INTO [c_EDUCATIONAL_LEVEL] ([id],[abbr],[description],[sort_order],[end_date])VALUES(5,'BACC','Baccalaureate or Equivalent Degree',1,NULL)
INSERT INTO [c_EDUCATIONAL_LEVEL] ([id],[abbr],[description],[sort_order],[end_date])VALUES(6,'DENT','Dental',2,NULL)
INSERT INTO [c_EDUCATIONAL_LEVEL] ([id],[abbr],[description],[sort_order],[end_date])VALUES(7,'OTHER','Other',8,NULL)
INSERT INTO [c_EDUCATIONAL_LEVEL] ([id],[abbr],[description],[sort_order],[end_date])VALUES(8,'POSTDOC','Post-Doctoral (Habilitation/Other)',7,NULL)

INSERT INTO [c_ELIGIBILITY_ANSWER] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'True','Yes',2,NULL)
INSERT INTO [c_ELIGIBILITY_ANSWER] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'False','No',1,NULL)

INSERT INTO [c_ELIGIBILITY_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Eligible','Eligible  Approved  ',1,NULL)
INSERT INTO [c_ELIGIBILITY_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Ineligible','Ineligible',2,NULL)

INSERT INTO [c_EMAIL_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Business','Business',1,NULL)
INSERT INTO [c_EMAIL_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Personal','Personal',3,NULL)
INSERT INTO [c_EMAIL_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Other','Other',2,NULL)

INSERT INTO [c_ENTITY_AFFILIATION_TYPE] ([id],[abbr],[description],[entity_type_id])VALUES(1,'Partner','Partner',2)
INSERT INTO [c_ENTITY_AFFILIATION_TYPE] ([id],[abbr],[description],[entity_type_id])VALUES(2,'Sub-grantee','Sub-grantee',2)
INSERT INTO [c_ENTITY_AFFILIATION_TYPE] ([id],[abbr],[description],[entity_type_id])VALUES(3,'Office','Office',2)

INSERT INTO [c_ETHNICITY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Hispanic or Latino','Hispanic or Latino — A person of Mexican, Puerto Rican, Cuban, South or Central American, or other Spanish culture or origin, regardless of race. The term, "Spanish origin," can be used in addition to "Hispanic or Latino."',1,NULL)
INSERT INTO [c_ETHNICITY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Not Hispanic or Latino','Not Hispanic or Latino — A person not of Cuban, Mexican, Puerto Rican, Cuban, South or Central American, or other Spanish culture or origin, regardless of race.',2,NULL)
INSERT INTO [c_ETHNICITY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Prefer Not to Answer','Prefer Not to Answer',NULL,NULL)

INSERT INTO [c_FACULTY_RANK_TYPE] ([id],[abbr],[description],[is_eligible],[sort_order],[end_date])VALUES(1,'Instructor','Instructor',1,5,NULL)
INSERT INTO [c_FACULTY_RANK_TYPE] ([id],[abbr],[description],[is_eligible],[sort_order],[end_date])VALUES(2,'Assistant Professor','Assistant Professor',1,2,NULL)
INSERT INTO [c_FACULTY_RANK_TYPE] ([id],[abbr],[description],[is_eligible],[sort_order],[end_date])VALUES(3,'Research Assistant Professor','Research Assistant Professor',1,8,NULL)
INSERT INTO [c_FACULTY_RANK_TYPE] ([id],[abbr],[description],[is_eligible],[sort_order],[end_date])VALUES(4,'Associate Professor','Associate Professor',0,4,NULL)
INSERT INTO [c_FACULTY_RANK_TYPE] ([id],[abbr],[description],[is_eligible],[sort_order],[end_date])VALUES(5,'Research Associate Professor','Research Associate Professor',0,9,NULL)
INSERT INTO [c_FACULTY_RANK_TYPE] ([id],[abbr],[description],[is_eligible],[sort_order],[end_date])VALUES(6,'Lecturer','Lecturer',1,6,NULL)
INSERT INTO [c_FACULTY_RANK_TYPE] ([id],[abbr],[description],[is_eligible],[sort_order],[end_date])VALUES(7,'Assistant Lecturer','Assistant Lecturer',1,1,NULL)
INSERT INTO [c_FACULTY_RANK_TYPE] ([id],[abbr],[description],[is_eligible],[sort_order],[end_date])VALUES(8,'Associate Lecturer','Associate Lecturer',0,3,NULL)
INSERT INTO [c_FACULTY_RANK_TYPE] ([id],[abbr],[description],[is_eligible],[sort_order],[end_date])VALUES(9,'Other','Other',0,7,NULL)

INSERT INTO [c_FIELD_TYPE] ([id],[abbr],[description],[sequence_number],[website_id])VALUES(1,'Anthropology','Anthropology',1,4370)
INSERT INTO [c_FIELD_TYPE] ([id],[abbr],[description],[sequence_number],[website_id])VALUES(2,'Communication Studies','Communication Studies',2,4371)
INSERT INTO [c_FIELD_TYPE] ([id],[abbr],[description],[sequence_number],[website_id])VALUES(3,'Demography','Demography',3,4372)
INSERT INTO [c_FIELD_TYPE] ([id],[abbr],[description],[sequence_number],[website_id])VALUES(4,'Economics','Economics',4,4373)
INSERT INTO [c_FIELD_TYPE] ([id],[abbr],[description],[sequence_number],[website_id])VALUES(5,'Epidemiology','Epidemiology',5,4374)
INSERT INTO [c_FIELD_TYPE] ([id],[abbr],[description],[sequence_number],[website_id])VALUES(6,'Ethnic/Cultural Studies','Ethnic/Cultural Studies',6,4375)
INSERT INTO [c_FIELD_TYPE] ([id],[abbr],[description],[sequence_number],[website_id])VALUES(7,'Gender Studies','Gender Studies',7,4376)
INSERT INTO [c_FIELD_TYPE] ([id],[abbr],[description],[sequence_number],[website_id])VALUES(8,'Human Ecology','Human Ecology',8,4377)
INSERT INTO [c_FIELD_TYPE] ([id],[abbr],[description],[sequence_number],[website_id])VALUES(9,'Journalism','Journalism',9,4378)
INSERT INTO [c_FIELD_TYPE] ([id],[abbr],[description],[sequence_number],[website_id])VALUES(10,'Law/Legal Studies','Law/Legal Studies',10,4379)
INSERT INTO [c_FIELD_TYPE] ([id],[abbr],[description],[sequence_number],[website_id])VALUES(11,'Medical/Health/Healthcare','Medical/Health/Healthcare',11,4380)
INSERT INTO [c_FIELD_TYPE] ([id],[abbr],[description],[sequence_number],[website_id])VALUES(12,'Political Science','Political Science',12,4381)
INSERT INTO [c_FIELD_TYPE] ([id],[abbr],[description],[sequence_number],[website_id])VALUES(13,'Psychology','Psychology',13,4382)
INSERT INTO [c_FIELD_TYPE] ([id],[abbr],[description],[sequence_number],[website_id])VALUES(14,'Public Policy','Public Policy',14,4383)
INSERT INTO [c_FIELD_TYPE] ([id],[abbr],[description],[sequence_number],[website_id])VALUES(15,'Sociology','Sociology',15,4384)
INSERT INTO [c_FIELD_TYPE] ([id],[abbr],[description],[sequence_number],[website_id])VALUES(16,'Social Work/Counseling','Social Work/Counseling',16,4385)
INSERT INTO [c_FIELD_TYPE] ([id],[abbr],[description],[sequence_number],[website_id])VALUES(17,'Urban Studies','Urban Studies',17,4386)
INSERT INTO [c_FIELD_TYPE] ([id],[abbr],[description],[sequence_number],[website_id])VALUES(18,'Other','Other',18,4387)
INSERT INTO [c_FIELD_TYPE] ([id],[abbr],[description],[sequence_number],[website_id])VALUES(19,'Education','Education',19,4738)

INSERT INTO [c_GENDER] ([id],[abbr],[gender],[sort_order],[end_date])VALUES(1,'Female','Female',1,NULL)
INSERT INTO [c_GENDER] ([id],[abbr],[gender],[sort_order],[end_date])VALUES(2,'Male','Male',2,NULL)
INSERT INTO [c_GENDER] ([id],[abbr],[gender],[sort_order],[end_date])VALUES(3,'Not Applicable','Not Applicable',3,NULL)

INSERT INTO [c_GRANT_PROGRESS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Satisfactory','Satisfactory Progress',1,NULL)
INSERT INTO [c_GRANT_PROGRESS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Unsatisfactory','Unsatisfactory Progress',2,NULL)

INSERT INTO [c_GRANT_RECOMMENDATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Grant Amendment Req','Grant Amendment Required',1,NULL)
INSERT INTO [c_GRANT_RECOMMENDATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Suspend Grant','Grant Suspension Recommended',3,NULL)
INSERT INTO [c_GRANT_RECOMMENDATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Recommend Cancel','Grant Cancellation Recommended',2,NULL)

INSERT INTO [c_GRANT_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Active','Grant is Active',2,NULL)
INSERT INTO [c_GRANT_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Application','Application',1,NULL)
INSERT INTO [c_GRANT_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Cancelled','Grant is Cancelled',3,NULL)
INSERT INTO [c_GRANT_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'Closed','Grant is Closed',4,NULL)

INSERT INTO [c_GRANTEE_PROJ_STAFF_AFFILIATION_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Grant Assistant','Grant Assistant',1,NULL)
INSERT INTO [c_GRANTEE_PROJ_STAFF_AFFILIATION_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Grants Manager','Grants Manager',2,NULL)
INSERT INTO [c_GRANTEE_PROJ_STAFF_AFFILIATION_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Program Assistant','Program Assistant',3,NULL)
INSERT INTO [c_GRANTEE_PROJ_STAFF_AFFILIATION_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'Program Officer','Program Officer',4,NULL)

INSERT INTO [c_GRANTEE_PUBLICATION_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'In Press','In Press',1,NULL)
INSERT INTO [c_GRANTEE_PUBLICATION_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Published','Published',2,NULL)
INSERT INTO [c_GRANTEE_PUBLICATION_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Submitted','Submitted',3,NULL)

INSERT INTO [c_GRANTEE_PUBLICATION_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Book Article','Book Article',1,NULL)
INSERT INTO [c_GRANTEE_PUBLICATION_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Chapter','Chapter',2,NULL)
INSERT INTO [c_GRANTEE_PUBLICATION_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Journal','Journal',3,NULL)

INSERT INTO [c_IMMIGRATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'US','US - U.S. Citizen',1,NULL)
INSERT INTO [c_IMMIGRATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'F1','F1 - Student in aca or lang program',2,NULL)
INSERT INTO [c_IMMIGRATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'H1','H1 -Temp. Worker-distinguished merit',3,NULL)
INSERT INTO [c_IMMIGRATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'H1B','H1B -Temp Wkr-svcs in specialty occupant',4,NULL)
INSERT INTO [c_IMMIGRATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(5,'H2','H2 -Temporary Worker-laborer',5,NULL)
INSERT INTO [c_IMMIGRATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(6,'J1','J1 -Exchange Visitor',6,NULL)
INSERT INTO [c_IMMIGRATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(7,'J2','J2 -Spouse or Child of Exchange Visitor',7,NULL)
INSERT INTO [c_IMMIGRATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(8,'O1','O1-Temp-Extraordin Ability, Science',8,NULL)
INSERT INTO [c_IMMIGRATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(9,'PR','PR- Permanent Resident',9,NULL)
INSERT INTO [c_IMMIGRATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(10,'PRP','PRP - Permanent Resident/Pending',10,NULL)
INSERT INTO [c_IMMIGRATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(11,'TC','TC-Canadian Citizen, prior to Jan ''94',11,NULL)
INSERT INTO [c_IMMIGRATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(12,'TN','TN - Canadian Citizen, since Jan ''94',12,NULL)
INSERT INTO [c_IMMIGRATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(13,'CV','CV - Unknown at conversion',13,NULL)

INSERT INTO [c_INCOME_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Low-Income/Poverty','Low-Income/Poverty',1,NULL)
INSERT INTO [c_INCOME_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Working Poor','Working Poor',5,NULL)
INSERT INTO [c_INCOME_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Middle-Income','Middle-Income',2,NULL)
INSERT INTO [c_INCOME_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'Upper-Income','Upper-Income',4,NULL)
INSERT INTO [c_INCOME_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(5,'Prefer Not to Answer','Prefer Not to Answer',3,NULL)

INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(1,1,1,'Bacteria',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(2,1,2,'Helminths',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(3,1,3,'Mycoses',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(4,1,4,'Protozoa',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(5,1,5,'Prions',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(6,1,6,'Viruses',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(7,1,7,'Invertebrate vectors of disease',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(8,1,8,'Other',1)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(9,2,1,'Specify',1)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(10,3,1,'Basic biology',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(11,3,2,'Model development',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(12,3,3,'Technology development',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(13,3,4,'Diagnosis',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(14,3,5,'Drug development: Chemotherapy/prophylaxis',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(15,3,6,'Drug development: Understanding drug resistance',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(16,3,7,'Vaccine development/immunomodulators',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(17,3,8,'Transmission control',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(18,3,9,'Other',1)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(19,4,1,'Adaptive immunity',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(20,4,2,'Bioinformatics',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(21,4,3,'Ecology',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(22,4,4,'Enzymatic or other functional inhibitors',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(23,4,5,'Epidemiology',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(24,4,6,'Gene expression or regulation',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(25,4,7,'Genetic manipulation',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(26,4,8,'Genomics',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(27,4,9,'Host cell-pathogen interaction',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(28,4,10,'Host genetics',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(29,4,11,'Immune evasion or latency',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(30,4,12,'Immunoregulation',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(31,4,13,'Innate immunity',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(32,4,14,'Metabolism or physiology',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(33,4,15,'Microbial interactions',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(34,4,16,'Microbiome',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(35,4,17,'Modeling',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(36,4,18,'Nutrition',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(37,4,19,'Pathogen differentiation or replication',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(38,4,20,'Pathogen evolution or adaptive mutation',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(39,4,21,'Pathogenesis',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(40,4,22,'Proteomics',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(41,4,23,'Signaling',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(42,4,24,'Transport',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(43,4,25,'Vector biology',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(44,4,26,'Virulence',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(45,4,27,'Zoonoses',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(46,4,28,'Other',1)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(47,5,1,'Alzheimer''s disease',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(48,5,2,'Arthritis',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(49,5,3,'Atherosclerosis',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(50,5,4,'BPH',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(51,5,5,'Beta-amyloid accumulation',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(52,5,6,'Cancer',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(53,5,7,'Cardiovascular disease',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(54,5,8,'Cognitive decline',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(55,5,9,'Dementia',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(56,5,10,'Diabetes',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(57,5,11,'Eye disease/Macular degeneration/other',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(58,5,12,'Neurodegeneration/neuropathology',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(59,5,13,'Premature aging/Progeria/progeroid syndromes',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(60,5,14,'Osteoporosis',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(61,5,15,'Parkinson''s disease',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(62,5,16,'Sarcopenia',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(63,5,17,'Stroke',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(64,5,18,'Other',1)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(65,6,1,'Cell culture',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(66,6,2,'Yeast',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(67,6,3,'Caenorhabditis elegans',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(68,6,4,'Drosophila',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(69,6,5,'Mouse',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(70,6,6,'Rat',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(71,6,7,'Other mammal',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(72,6,8,'Non-human primate',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(73,6,9,'Human',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(74,6,10,'Other',1)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(75,7,1,'DNA',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(76,7,2,'Biomarkers',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(77,7,3,'Genetics',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(78,7,4,'Epidemiology',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(79,7,5,'Lifespan',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(80,7,6,'Stem cells',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(81,7,7,'Therapeutic targets',0)
INSERT INTO [c_KEYWORD] ([id],[category_id],[sequence_in_category],[description],[more])VALUES(82,7,8,'Other',1)

INSERT INTO [c_KEYWORD_CATEGORY] ([id],[description],[sequence_number])VALUES(1,'Pathogen Group',1)
INSERT INTO [c_KEYWORD_CATEGORY] ([id],[description],[sequence_number])VALUES(2,'Organism or Disease',2)
INSERT INTO [c_KEYWORD_CATEGORY] ([id],[description],[sequence_number])VALUES(3,'Objective',3)
INSERT INTO [c_KEYWORD_CATEGORY] ([id],[description],[sequence_number])VALUES(4,'Topic or Approach',4)
INSERT INTO [c_KEYWORD_CATEGORY] ([id],[description],[sequence_number])VALUES(5,'Age related disease',5)
INSERT INTO [c_KEYWORD_CATEGORY] ([id],[description],[sequence_number])VALUES(6,'Model System',6)
INSERT INTO [c_KEYWORD_CATEGORY] ([id],[description],[sequence_number])VALUES(7,'Major emphasis',7)

INSERT INTO [c_LINEAGE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'II','II',1,NULL)
INSERT INTO [c_LINEAGE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'III','III',2,NULL)
INSERT INTO [c_LINEAGE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'IV','IV',3,NULL)

INSERT INTO [c_LOCALE_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Rural','Rural',2,NULL)
INSERT INTO [c_LOCALE_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Suburban','Suburban',3,NULL)
INSERT INTO [c_LOCALE_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Urban','Urban',4,NULL)
INSERT INTO [c_LOCALE_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'Prefer Not to Answer','Prefer Not to Answer',1,NULL)

INSERT INTO [c_LOOKUPTABLE_PROPERTYKEY_MAPPING] ([id],[table_name],[abbr],[description],[sort_order],[end_date])VALUES(1,'State','StateAbbr','Description','SortOrder','EndDate')
INSERT INTO [c_LOOKUPTABLE_PROPERTYKEY_MAPPING] ([id],[table_name],[abbr],[description],[sort_order],[end_date])VALUES(2,'AddressType','AddressAbbr','Address','SortOrder','EndDate')
INSERT INTO [c_LOOKUPTABLE_PROPERTYKEY_MAPPING] ([id],[table_name],[abbr],[description],[sort_order],[end_date])VALUES(3,'Country','Abbr','CountryDesc','SortOrder','EndDate')
INSERT INTO [c_LOOKUPTABLE_PROPERTYKEY_MAPPING] ([id],[table_name],[abbr],[description],[sort_order],[end_date])VALUES(4,'EmailType','TypeName','Type','SortOrder','EndDate')
INSERT INTO [c_LOOKUPTABLE_PROPERTYKEY_MAPPING] ([id],[table_name],[abbr],[description],[sort_order],[end_date])VALUES(5,'Gender','Abbr','Gender','SortOrder','EndDate')
INSERT INTO [c_LOOKUPTABLE_PROPERTYKEY_MAPPING] ([id],[table_name],[abbr],[description],[sort_order],[end_date])VALUES(6,'OrganizationType','OrganizationAbbr','OrganizationName','SortOrder','EndDate')
INSERT INTO [c_LOOKUPTABLE_PROPERTYKEY_MAPPING] ([id],[table_name],[abbr],[description],[sort_order],[end_date])VALUES(7,'PasswordQuestion','PasswordQuestion_Abbr','PasswordQuestion','SortOrder','EndDate')
INSERT INTO [c_LOOKUPTABLE_PROPERTYKEY_MAPPING] ([id],[table_name],[abbr],[description],[sort_order],[end_date])VALUES(8,'PaymentEntity','Abbr','Entity','SortOrder','EndDate')
INSERT INTO [c_LOOKUPTABLE_PROPERTYKEY_MAPPING] ([id],[table_name],[abbr],[description],[sort_order],[end_date])VALUES(9,'PhoneType','Abbr','TypeName','SortOrder','EndDate')
INSERT INTO [c_LOOKUPTABLE_PROPERTYKEY_MAPPING] ([id],[table_name],[abbr],[description],[sort_order],[end_date])VALUES(10,'Prefix','Abbr','Prefix','SortOrder','EndDate')
INSERT INTO [c_LOOKUPTABLE_PROPERTYKEY_MAPPING] ([id],[table_name],[abbr],[description],[sort_order],[end_date])VALUES(11,'RatingType','Rating_Abbr','Rating_Desc','SortOrder','EndDate')
INSERT INTO [c_LOOKUPTABLE_PROPERTYKEY_MAPPING] ([id],[table_name],[abbr],[description],[sort_order],[end_date])VALUES(12,'ResearchStage','Abbr','Stage','SortOrder','EndDate')
INSERT INTO [c_LOOKUPTABLE_PROPERTYKEY_MAPPING] ([id],[table_name],[abbr],[description],[sort_order],[end_date])VALUES(13,'Suffix','Abbr','Suffix','SortOrder','EndDate')
INSERT INTO [c_LOOKUPTABLE_PROPERTYKEY_MAPPING] ([id],[table_name],[abbr],[description],[sort_order],[end_date])VALUES(14,'TranslationalAnswer','Abbr','Answer','SortOrder','EndDate')
INSERT INTO [c_LOOKUPTABLE_PROPERTYKEY_MAPPING] ([id],[table_name],[abbr],[description],[sort_order],[end_date])VALUES(15,'UserType','UserType_Abbr','UserType_Long','SortOrder','EndDate')
INSERT INTO [c_LOOKUPTABLE_PROPERTYKEY_MAPPING] ([id],[table_name],[abbr],[description],[sort_order],[end_date])VALUES(16,'WebAddressType','TypeName','Type','SortOrder','EndDate')

INSERT INTO [c_MEDIA_CODE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'BBC','BBC',NULL,NULL)

INSERT INTO [c_NOTE_SUBJECT] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Subject 1','Subject 1',1,NULL)
INSERT INTO [c_NOTE_SUBJECT] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Subject 2','Subject 2',2,NULL)
INSERT INTO [c_NOTE_SUBJECT] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Subject 3','Subject 3',3,NULL)

INSERT INTO [c_ORGANIZATION_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Governmental','Governmental',1,NULL)
INSERT INTO [c_ORGANIZATION_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Non-Governmental','Non-Governmental',2,NULL)

INSERT INTO [c_OTHER_SUPPORT_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Active','Active',1,NULL)
INSERT INTO [c_OTHER_SUPPORT_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Approved','Approved',2,NULL)
INSERT INTO [c_OTHER_SUPPORT_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Pending','Pending',3,NULL)

INSERT INTO [c_PASSWORD_QUESTION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Question 1','What is your favorite pet''s name?',2,NULL)
INSERT INTO [c_PASSWORD_QUESTION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Question 2','What is your mother''s maiden name?',4,NULL)
INSERT INTO [c_PASSWORD_QUESTION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Question 3','What is your favorite restaurant?',3,NULL)
INSERT INTO [c_PASSWORD_QUESTION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'Question 4','What is your favorite football team?',1,NULL)

INSERT INTO [c_PAYMENT_ENTITY] ([id],[entity],[abbr],[sort_order],[end_date])VALUES(1,'Foundation',NULL,1,NULL)
INSERT INTO [c_PAYMENT_ENTITY] ([id],[entity],[abbr],[sort_order],[end_date])VALUES(2,'Trust',NULL,2,NULL)

INSERT INTO [c_PAYMENT_METHOD] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Check','Check',1,NULL)
INSERT INTO [c_PAYMENT_METHOD] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'EFT','EFT',2,NULL)

INSERT INTO [c_PAYMENT_RECOMMENDATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Yes','Payment Recommended',2,NULL)
INSERT INTO [c_PAYMENT_RECOMMENDATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'No','Payment Not Recommended',1,NULL)

INSERT INTO [c_PDF_GENERATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'GEN','Generate',2,NULL)
INSERT INTO [c_PDF_GENERATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'DONTGEN','Do Not Generate',1,NULL)

INSERT INTO [c_PERCENT_AREAS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Admin','Administration',1,NULL)
INSERT INTO [c_PERCENT_AREAS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Patient Care','Patient Care',2,NULL)
INSERT INTO [c_PERCENT_AREAS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Research','Research',3,NULL)
INSERT INTO [c_PERCENT_AREAS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'Teaching','Teaching',4,NULL)
INSERT INTO [c_PERCENT_AREAS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(5,'Coursework','Coursework',5,NULL)
INSERT INTO [c_PERCENT_AREAS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(6,'Other','Other',6,NULL)

INSERT INTO [c_PERSON_ORG_AFFILIATION_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Fiscal Agent','Fiscal Agent',2,NULL)
INSERT INTO [c_PERSON_ORG_AFFILIATION_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Funding Partner','Funding Partner',3,NULL)
INSERT INTO [c_PERSON_ORG_AFFILIATION_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Evaluator','Evaluator',1,NULL)

INSERT INTO [c_PHONE_TYPE] ([id],[abbr],[phone_type],[sort_order],[end_date])VALUES(1,NULL,'Business',1,NULL)
INSERT INTO [c_PHONE_TYPE] ([id],[abbr],[phone_type],[sort_order],[end_date])VALUES(2,NULL,'Home',3,NULL)
INSERT INTO [c_PHONE_TYPE] ([id],[abbr],[phone_type],[sort_order],[end_date])VALUES(3,NULL,'Mobile',4,NULL)
INSERT INTO [c_PHONE_TYPE] ([id],[abbr],[phone_type],[sort_order],[end_date])VALUES(4,NULL,'Fax',2,NULL)
INSERT INTO [c_PHONE_TYPE] ([id],[abbr],[phone_type],[sort_order],[end_date])VALUES(5,NULL,'Other',5,NULL)

INSERT INTO [c_PI_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'PI','Primary Investigator',3,NULL)
INSERT INTO [c_PI_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'CoPI','Co-Primary Investigator',2,NULL)
INSERT INTO [c_PI_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'AddCoPI','Additional Primary Investigator',1,NULL)

INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Beg Grant In  Aid','Beginning Grant-In-Aid',4,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Scientist Dev Grant','Scientist Development Grant',21,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Career Achievement','Career Achievement',5,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'Career Reorient','Career Reorientation',6,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(5,'Early Career','Early Career',8,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(6,'Estab Investigator','Established Investigator',9,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(7,'Fellowship','Fellowship',10,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(8,'Adv Grant','Advanced Grant',1,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(9,'Advanced Grant','Beginning Grant',3,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(10,'Grant-In-Aid','Grant-In-Aid',11,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(11,'Standard Grant','Standard Grant',23,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(12,'Advanced Investigator','Advanced Investigator',2,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(13,'Clinician-Scientist Investigator','Clinician-Scientist Investigator',7,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(14,'Initial Investigator','Initial Investigator',12,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(15,'Lifetime Achievement','Lifetime Achievement',13,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(16,'Not Applicable','Not Applicable',14,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(17,'Other','Other',15,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(18,'Postdoctoral Fellowship','Postdoctoral Fellowship',17,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(19,'Pilot Program','Pilot Program',16,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(20,'Predoctoral Fellowship','Predoctoral Fellowship',18,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(21,'Research Program','Research Program',19,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(22,'Student Award','Student Award',24,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(23,'Scholarship','Scholarship',20,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(24,'Special Award','Special Award',22,NULL)
INSERT INTO [c_PORTFOLIO] ([id],[abbr],[description],[sort_order],[end_date])VALUES(25,'Travel Award','Travel Award',25,NULL)

INSERT INTO [c_PREFIX] ([prefix_id],[abbr],[prefix],[sort_order],[end_date])VALUES(1,'Mr.','Mr.',3,NULL)
INSERT INTO [c_PREFIX] ([prefix_id],[abbr],[prefix],[sort_order],[end_date])VALUES(2,'Mrs.','Mrs.',4,NULL)
INSERT INTO [c_PREFIX] ([prefix_id],[abbr],[prefix],[sort_order],[end_date])VALUES(3,'Ms.','Ms.',5,NULL)
INSERT INTO [c_PREFIX] ([prefix_id],[abbr],[prefix],[sort_order],[end_date])VALUES(4,'Dr.','Dr.',1,NULL)
INSERT INTO [c_PREFIX] ([prefix_id],[abbr],[prefix],[sort_order],[end_date])VALUES(5,'Miss','Miss',2,NULL)

INSERT INTO [c_PROCESS] ([id],[data_command_key],[name],[sort_order],[end_date])VALUES(1,'GenerateReviewAssignments','Bulk Assignments',NULL,NULL)
INSERT INTO [c_PROCESS] ([id],[data_command_key],[name],[sort_order],[end_date])VALUES(2,'GeneratePrefReviewAssignments','Committee Chair Assignment',NULL,NULL)
INSERT INTO [c_PROCESS] ([id],[data_command_key],[name],[sort_order],[end_date])VALUES(3,'GeneratePeerReviewAssignments','Peer Assignments',NULL,NULL)
INSERT INTO [c_PROCESS] ([id],[data_command_key],[name],[sort_order],[end_date])VALUES(4,'GeneratePrimaryConflicts','Conflict',NULL,NULL)
INSERT INTO [c_PROCESS] ([id],[data_command_key],[name],[sort_order],[end_date])VALUES(5,'GenerateSecondaryConflicts',' Secondary Conflict Check',NULL,NULL)
INSERT INTO [c_PROCESS] ([id],[data_command_key],[name],[sort_order],[end_date])VALUES(6,'GenerateCouncilReviewAssignments',' Bulk Assignments',NULL,NULL)
INSERT INTO [c_PROCESS] ([id],[data_command_key],[name],[sort_order],[end_date])VALUES(7,'GenerateViewScoreAssignments','View Scores and Critiques',NULL,NULL)

INSERT INTO [c_PROJECT_REPORT_OUTCOME] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Not Submitted','Not Submitted',NULL,NULL)

INSERT INTO [c_PROJECT_REPORT_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Incomplete','Incomplete',NULL,NULL)

INSERT INTO [c_PROJECT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Open','Open Project',3,NULL)
INSERT INTO [c_PROJECT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Nomination','Nominations Only Project',2,NULL)
INSERT INTO [c_PROJECT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Invitation','Invitations Only Project',1,NULL)

INSERT INTO [c_QUERY_OUTPUT] ([id],[abbr],[descr],[sort_order])VALUES(1,'Word','Word',4)
INSERT INTO [c_QUERY_OUTPUT] ([id],[abbr],[descr],[sort_order])VALUES(2,'Excel','Excel',2)
INSERT INTO [c_QUERY_OUTPUT] ([id],[abbr],[descr],[sort_order])VALUES(3,'HTML','HTML',3)
INSERT INTO [c_QUERY_OUTPUT] ([id],[abbr],[descr],[sort_order])VALUES(4,'E-mail Merge','E-mail Merge',1)

INSERT INTO [c_QUERY_TYPE] ([id],[abbr],[descr],[sort_order],[end_date])VALUES(1,'Staff','Staff Queries',3,NULL)
INSERT INTO [c_QUERY_TYPE] ([id],[abbr],[descr],[sort_order],[end_date])VALUES(2,'TYPE2','Type 2',4,'May 18 2005 12:00:00:000AM')
INSERT INTO [c_QUERY_TYPE] ([id],[abbr],[descr],[sort_order],[end_date])VALUES(3,'Finance','Finance Queries',2,NULL)
INSERT INTO [c_QUERY_TYPE] ([id],[abbr],[descr],[sort_order],[end_date])VALUES(4,'Application','Application Queries',1,NULL)

INSERT INTO [c_RACE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'American Indian/Alaska Native','American Indian or Alaska Native — A person having origins in any of the original peoples of North, Central and South America, and who maintains tribal affiliation or community attachment.',1,NULL)
INSERT INTO [c_RACE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Asian','Asian — A person having origins in any of the original people of the Far East, Southeast Asia, , Native Hawaiian, Pacific Islander or the Indian subcontinent including, for example, Cambodia, China, India, Japan, Korea, Malaysia, Pakistan,  Thailand, and Vietnam.',2,NULL)
INSERT INTO [c_RACE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Not Applicable','Not Applicable',5,NULL)
INSERT INTO [c_RACE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'Latino/Hispanic/Spanish','For eaxample - Mexican, Puerto Rican, Cuban',3,NULL)
INSERT INTO [c_RACE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(5,'Middle Eastern','',4,NULL)
INSERT INTO [c_RACE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(6,'White','White — A person having origins in any of the original peoples of Europe, the Middle East, or North Africa.',7,NULL)
INSERT INTO [c_RACE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(7,'Other Race/Ethnicity',NULL,6,NULL)

INSERT INTO [c_RATING] ([id],[rating],[name])VALUES(1,4.000000000000000e+000,'A')
INSERT INTO [c_RATING] ([id],[rating],[name])VALUES(2,3.000000000000000e+000,'B')
INSERT INTO [c_RATING] ([id],[rating],[name])VALUES(3,2.000000000000000e+000,'C')
INSERT INTO [c_RATING] ([id],[rating],[name])VALUES(4,1.000000000000000e+000,'D')
INSERT INTO [c_RATING] ([id],[rating],[name])VALUES(5,0.000000000000000e+000,'F')

INSERT INTO [c_RATING_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Project/Progress','Project/Progress',2,NULL)
INSERT INTO [c_RATING_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'Overall','Overall',1,NULL)

INSERT INTO [c_REPORT_OUTPUT_DEFINITION_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'APPLICATION','Application',NULL,NULL)
INSERT INTO [c_REPORT_OUTPUT_DEFINITION_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'REVIEWER','Reviewer',NULL,NULL)
INSERT INTO [c_REPORT_OUTPUT_DEFINITION_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'STAFF','Staff',NULL,NULL)

INSERT INTO [c_REQUEST_CONFLICT] ([id],[abbr],[description],[sort_order],[end_date])VALUES(0,'None','None',NULL,NULL)
INSERT INTO [c_REQUEST_CONFLICT] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Request','Request',NULL,NULL)
INSERT INTO [c_REQUEST_CONFLICT] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Conflict','Conflict',NULL,NULL)

INSERT INTO [c_RESEARCH_AREA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Anthropology','Anthropology',1,NULL)
INSERT INTO [c_RESEARCH_AREA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Communication Studies','Communication Studies',2,NULL)
INSERT INTO [c_RESEARCH_AREA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Demography','Demography',3,NULL)
INSERT INTO [c_RESEARCH_AREA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'Economics','Economics',4,NULL)
INSERT INTO [c_RESEARCH_AREA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(5,'Education','Education',5,NULL)
INSERT INTO [c_RESEARCH_AREA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(6,'Epidemiology','Epidemiology',6,NULL)
INSERT INTO [c_RESEARCH_AREA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(7,'Ethnic/Cultural Studies','Ethnic/Cultural Studies',7,NULL)
INSERT INTO [c_RESEARCH_AREA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(8,'Gender Studies','Gender Studies',8,NULL)
INSERT INTO [c_RESEARCH_AREA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(9,'Human Ecology','Human Ecology',9,NULL)
INSERT INTO [c_RESEARCH_AREA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(10,'Journalism','Journalism',10,NULL)
INSERT INTO [c_RESEARCH_AREA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(11,'Law/Legal Studies','Law/Legal Studies',11,NULL)
INSERT INTO [c_RESEARCH_AREA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(12,'Medicine/Health/Healthcare','Medicine/Health/Healthcare',12,NULL)
INSERT INTO [c_RESEARCH_AREA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(13,'Other','Other',13,NULL)
INSERT INTO [c_RESEARCH_AREA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(14,'Political Science','Political Science',14,NULL)
INSERT INTO [c_RESEARCH_AREA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(15,'Psychology','Psychology',15,NULL)
INSERT INTO [c_RESEARCH_AREA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(16,'Public Policy','Public Policy',16,NULL)
INSERT INTO [c_RESEARCH_AREA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(17,'Social Work/Counseling','Social Work/Counseling',17,NULL)
INSERT INTO [c_RESEARCH_AREA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(18,'Sociology','Sociology',18,NULL)
INSERT INTO [c_RESEARCH_AREA] ([id],[abbr],[description],[sort_order],[end_date])VALUES(19,'Urban Studies','Urban Studies',19,NULL)

INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'AFR','African Americans',1,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'AGE','Aging/elderly',2,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'ANG','Angiogenesis',3,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'ANP','Angioplasty',4,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(5,'ASI','Asian Americans',5,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(6,'BEH','Behavioral research',6,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(7,'CHO','Cholesterol',7,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(9,'DIA','Diabetes',9,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(10,'ECC','Emergency cardiac care/defibrillation/chain of survival',10,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(11,'EPI','Epidemiological research',11,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(12,'GEN','Gene therapy',12,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(13,'HAT','Heart attack',13,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(14,'HBP','High blood pressure',16,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(15,'HFL','Heart failure',14,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(16,'HIS','Hispanic/Latino Americans',17,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(17,'HVL','Heart valves',15,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(18,'IMG','Imaging',18,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(19,'MED','Medications',19,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(20,'NAT','Native Americans',20,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(21,'NUT','Nutrition',21,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(22,'OBS','Obesity',22,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(23,'OUT','Outcomes research',24,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(24,'PAT','Treatment/Patient Care',32,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(25,'PED','Pediatric research',25,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(26,'PHY','Physical activity/inactivity',26,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(28,'REH','Rehabilitation',27,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(29,'STR','Stroke',29,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(30,'SUR','Surgical techniques',30,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(31,'TAB','Smoking/Tobacco',28,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(32,'TRN','Transplantation',31,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(33,'WMN','Women',33,NULL)
INSERT INTO [c_RESEARCH_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(34,'Other','Other',23,NULL)

INSERT INTO [c_RESEARCH_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'CVD','CVD-related',1,NULL)
INSERT INTO [c_RESEARCH_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'CVSC','CVD and closely stroke-related',2,NULL)
INSERT INTO [c_RESEARCH_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'CVSB','CVD and broadly stroke-related',3,NULL)
INSERT INTO [c_RESEARCH_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'STCL','Closely stroke-related',4,NULL)
INSERT INTO [c_RESEARCH_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(5,'STBR','Broadly stroke-related',5,NULL)

INSERT INTO [c_RESEARCH_STAGE] ([id],[abbr],[stage],[sort_order],[end_date])VALUES(1,NULL,'very early - hypothesis testing',5,NULL)
INSERT INTO [c_RESEARCH_STAGE] ([id],[abbr],[stage],[sort_order],[end_date])VALUES(2,NULL,'early - preliminary data',1,NULL)
INSERT INTO [c_RESEARCH_STAGE] ([id],[abbr],[stage],[sort_order],[end_date])VALUES(3,NULL,'mid - some pre-clinical testing',3,NULL)
INSERT INTO [c_RESEARCH_STAGE] ([id],[abbr],[stage],[sort_order],[end_date])VALUES(4,NULL,'late - prototype development',2,NULL)
INSERT INTO [c_RESEARCH_STAGE] ([id],[abbr],[stage],[sort_order],[end_date])VALUES(5,NULL,'very late - prototype testing',6,NULL)
INSERT INTO [c_RESEARCH_STAGE] ([id],[abbr],[stage],[sort_order],[end_date])VALUES(6,NULL,'not clear',4,NULL)

INSERT INTO [c_REVIEW_ASSIGNMENT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Primary','Primary',1,NULL)
INSERT INTO [c_REVIEW_ASSIGNMENT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Secondary','Secondary',3,NULL)
INSERT INTO [c_REVIEW_ASSIGNMENT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Reader','Reader',2,NULL)

INSERT INTO [c_REVIEW_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Mentor','Mentor',1,NULL)
INSERT INTO [c_REVIEW_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Supervisor','Supervisor',3,NULL)
INSERT INTO [c_REVIEW_CONFLICT_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Personal','Personal',2,NULL)

INSERT INTO [c_REVIEW_PREFERENCE_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Qualified','Qualified',4,NULL)
INSERT INTO [c_REVIEW_PREFERENCE_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Able','Able',1,NULL)
INSERT INTO [c_REVIEW_PREFERENCE_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Not Able','Not Able',3,NULL)
INSERT INTO [c_REVIEW_PREFERENCE_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'Conflict','Conflict',2,NULL)

INSERT INTO [c_REVIEW_SOURCE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Internal - Auto','Internal - Auto',NULL,NULL)
INSERT INTO [c_REVIEW_SOURCE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Internal - Manual','Internal - Manual',NULL,NULL)
INSERT INTO [c_REVIEW_SOURCE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'External','External',NULL,NULL)

INSERT INTO [c_REVIEWER_ROLE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,NULL,'Member',2,NULL)
INSERT INTO [c_REVIEWER_ROLE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,NULL,'Chair',1,NULL)

INSERT INTO [c_REVIEWER_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Active','Active Reviewer',1,NULL)
INSERT INTO [c_REVIEWER_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Inactive','Inactive Reviewer',3,NULL)
INSERT INTO [c_REVIEWER_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Prospect','Prospective Reviewer',4,NULL)
INSERT INTO [c_REVIEWER_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'Former','Former Reviewer',2,NULL)

INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1005,'Acid-Base Balance, pH Regulation','Acid-Base Balance, pH Regulation',1,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1006,'Aging','Aging',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1010,'Allergy','Allergy',0,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1011,'Infectious Diseases of the CV System','Infectious Diseases of the CV System',1,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1015,'Alveolar & Airway Function','Alveolar & Airway Function',1,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1020,'Ambulatory Medicine','Ambulatory Medicine',0,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1022,'Clinical Electophysiology and Pacing','Clinical Electophysiology and Pacing',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1023,'Cardiac Catheterization / Interventions','Cardiac Catheterization / Interventions',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1024,'Myocarditis','Myocarditis',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1025,'Anesthesiology','Anesthesiology',0,1025,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1026,'Myocardial Apoptosis','Myocardial Apoptosis',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1030,'Angiotensin','Angiotensin',0,1160,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1031,'Animal Models of Atherosclerosis & Arterial Injury','Animal Models of Atherosclerosis & Arterial Injury',1,2000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1032,'Baroreflex Chemoreflex','Baroreflex Chemoreflex',1,1160,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1035,'Angiogenesis & Vasculogenesis','Angiogenesis & Vasculogenesis',1,2000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1040,'Applied Transplantation','Applied Transplantation',0,1940,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1045,'ARDS (Adult Respiratory Distress Syndromes) and Lu','ARDS (Adult Respiratory Distress Syndromes) and Lung Injury',1,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1050,'Arrhythmias & Cardiac Conduction','Arrhythmias & Cardiac Conduction',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1055,'Atherosclerosis (Cellular)','Atherosclerosis (Cellular)',0,2000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1056,'Cell Adhesion','Cell Adhesion',1,2000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1057,'Cytoskeleton & Motility','Cytoskeleton & Motility',0,2000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1060,'Atherosclerosis, Animal Models','Atherosclerosis, Animal Models',0,1530,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1065,'Atherosclerosis, Pathogenesis','Atherosclerosis, Pathogenesis',0,1530,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1066,'Atherosclerosis, Pathogenesis','Atherosclerosis, Pathogenesis',1,2000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1070,'ATPases','ATPases',0,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1075,'Bacterial Metabolism','Bacterial Metabolism',0,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1080,'Bacteriology, Virology, Infectious Diseases','Bacteriology, Virology, Infectious Diseases',0,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1085,'Behavior Studies','Behavior Studies',1,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1090,'Biomedical Ethics','Biomedical Ethics',1,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1095,'Blood-Brain Barrier','Blood-Brain Barrier',1,1100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1105,'Brain Imaging','Brain Imaging',1,1100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1110,'Calcium & Magnesium Transport & Regulation','Calcium & Magnesium Transport & Regulation',1,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1115,'Cardiac Rehabilitation','Cardiac Rehabilitation',1,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1120,'Cardiomyopathies','Cardiomyopathies',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1130,'Cardiovascular Complications of Renal Disease','Cardiovascular Complications of Renal Disease',0,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1132,'Diabetic Nephropathology','Diabetic Nephropathology',0,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1133,'Divalent Ion Metabolism & Function','Divalent Ion Metabolism & Function',1,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1140,'Cardiovascular Disease Markers','Cardiovascular Disease Markers',0,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1142,'Congestive Heart Failure','Congestive Heart Failure',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1145,'Cardiovascular Magnetic Resonance Imaging','Cardiovascular Magnetic Resonance Imaging',0,1805,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1150,'Cardiovascular Morphogenesis/Teratology','Cardiovascular Morphogenesis/Teratology',1,1135,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1155,'Cardiovascular Positron Emission Tomography (PET)','Cardiovascular Positron Emission Tomography (PET)',0,1805,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1156,'Cardiovascular Ultrasound','Cardiovascular Ultrasound',1,1805,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1165,'Cell Differentiation, Myocyte & Other Lineages','Cell Differentiation, Myocyte & Other Lineages',1,1135,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1166,'Cell Physiology of Ionic Transporters/Channels/Fun','Cell Physiology of Ionic Transporters/Channels/Function',1,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1167,'Cell Volume Regulation','Cell Volume Regulation',1,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1169,'Cell Biochemistry & Metabolism','Cell Biochemistry & Metabolism',1,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1170,'Cell Metabolism','Cell Metabolism',0,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1171,'Cellular & Immunological Mechanisms of Injury','Cellular & Immunological Mechanisms of Injury',1,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1185,'Cellular Cardiac & Vascular Muscle Physiology & Ph','Cellular Cardiac & Vascular Muscle Physiology & Pharmacology',1,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1190,'Cellular Electro Physiology, Voltage-Sensitive Ion','Cellular Electro Physiology, Voltage-Sensitive Ion Channels',1,1180,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1195,'Cerebral Blood Flow and Metabolism','Cerebral Blood Flow and Metabolism',1,1100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1200,'Cerebral Edema','Cerebral Edema',1,1100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1204,'Cerebral Ischemia/Reperfusion','Cerebral Ischemia/Reperfusion',1,1100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1205,'Behavioral Science, Epidemiology and Prevention','Behavioral Science, Epidemiology and Prevention',0,1100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1206,'Cerebral Vascular Biology','Cerebral Vascular Biology',1,1100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1210,'Cerebrovascular Disorders','Cerebrovascular Disorders',1,1100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1215,'Cholesterol Metabolism','Cholesterol Metabolism',0,1530,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1217,'Chromatin, Nuclear Matrix & Mitosis','Chromatin, Nuclear Matrix & Mitosis',1,2060,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1220,'Chromosomal Mapping','Chromosomal Mapping',1,1590,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1225,'Clinical Neurology','Clinical Neurology',1,1100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1230,'Clinical Trials','Clinical Trials',1,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1235,'Cloning, Sequencing, Expression of Proteins','Cloning, Sequencing, Expression of Proteins',1,1590,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1240,'Clotting Factors & Clotting Inhibitors','Clotting Factors & Clotting Inhibitors',1,1945,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1241,'Coagulation','Coagulation',1,1945,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1245,'Complex Lipids','Complex Lipids',0,1530,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1247,'Diabetes','Diabetes',0,1530,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1248,'Diabetic & Hypertensive Vascular Renal Disease','Diabetic & Hypertensive Vascular Renal Disease',1,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1250,'Complex Polysaccharides','Complex Polysaccharides',0,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1255,'Compliance','Compliance',0,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1259,'Depression','Depression',0,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1260,'Congenital Cardiovascular Malformations','Congenital Cardiovascular Malformations',0,1135,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1265,'Connective Tissue','Connective Tissue',0,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1270,'Contraction and Mechanical Properties of Muscle Ce','Contraction and Mechanical Properties of Muscle Cells',1,1180,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1275,'Coping Strategies/Stress Management','Coping Strategies/Stress Management',0,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1276,'Coronary Artery Disease','Coronary Artery Disease',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1280,'Coronary Circulation','Coronary Circulation',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1285,'Coronary/Vascular Development','Coronary/Vascular Development',1,1135,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1290,'CPR (Cardiopulmonary Resuscitation)','CPR (Cardiopulmonary Resuscitation)',1,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1294,'Cytoskeletal Signaling','Cytoskeletal Signaling',1,1605,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1295,'Critical Care Medicine','Critical Care Medicine',0,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1296,'Cytokines, Chemokines & Other Mediators','Cytokines, Chemokines & Other Mediators',1,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1297,'Exercise Physiology','Exercise Physiology',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1298,'Pharmacology','Pharmacology',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1300,'Developmental Electrophysiology','Developmental Electrophysiology',1,1135,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1305,'Developmental Physiology/Pharmacology/Metabolism','Developmental Physiology/Pharmacology/Metabolism',1,1135,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1315,'Cardiovascular Diseases of Immunogenic Origin','Cardiovascular Diseases of Immunogenic Origin',1,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1320,'Endothelial Cells','Endothelial Cells',1,2000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1325,'Endothelium Adhesion','Endothelium Adhesion',0,2000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1330,'Endothelium Structure and Function','Endothelium Structure and Function',1,2000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1335,'Eosinophils','Eosinophils',0,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1340,'Epidemiology','Epidemiology',1,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1345,'Epithelial Transport & Ions Channels','Epithelial Transport & Ions Channels',0,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1350,'Excitation Contraction Coupling in Muscle Cells','Excitation Contraction Coupling in Muscle Cells',1,1180,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1355,'Exercise/Physical Activity','Exercise/Physical Activity',1,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1360,'Experimental & Clinical Hypertension','Experimental & Clinical Hypertension',1,1160,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1365,'Experimental Organ & Tissue Transplantation','Experimental Organ & Tissue Transplantation',1,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1370,'Experimental Therapeutics','Experimental Therapeutics',0,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1375,'Genetic Epidemiology','Genetic Epidemiology',1,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1380,'Fetal and Perinatal Circulation','Fetal and Perinatal Circulation',1,1135,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1385,'Fibrinogen','Fibrinogen',1,1945,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1386,'Fibrinolysis','Fibrinolysis',1,1945,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1387,'Functional Genomics & Proteomics in Renal Disease','Functional Genomics & Proteomics in Renal Disease',1,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1390,'Gene Transcription','Gene Transcription',1,1590,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1391,'Gene Therapy','Gene Therapy',1,1590,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1392,'Homologous Recombination','Homologous Recombination',1,1590,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1393,'Cytokines','Cytokines',0,1605,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1394,'Cytokine Signaling','Cytokine Signaling',1,1605,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1395,'Growth Factors','Growth Factors',0,1605,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1396,'Growth Factors','Growth Factors',1,1605,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1400,'Health Promotion/Prevention','Health Promotion/Prevention',1,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1405,'Cost Effectiveness','Cost Effectiveness',1,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1410,'Hematology','Hematology',1,1945,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1415,'Hemodynamics','Hemodynamics',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1417,'Interventional Cardiology','Interventional Cardiology',0,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1420,'Hemostasis','Hemostasis',1,1945,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1425,'Homocystine Metabolism','Homocystine Metabolism',0,1530,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1430,'Hormones','Hormones',0,1605,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1435,'Human Genetics of Congenital CV Malformations','Human Genetics of Congenital CV Malformations',1,1135,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1440,'Human Learning/Cognition','Human Learning/Cognition',0,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1445,'Human Nutrition (Behavioral & Preventive Aspects)','Human Nutrition (Behavioral & Preventive Aspects)',1,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1450,'Hypertension: Experimental Models, Renovascular','Hypertension: Experimental Models, Renovascular',0,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1452,'Hypertension: Cell & Organ Physiology, Non-renal','Hypertension: Cell & Organ Physiology, Non-renal',0,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1453,'Mineral Metabolism (Na, K, Ca, PO, Mg)','Mineral Metabolism (Na, K, Ca, PO, Mg)',0,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1455,'Imaging Technology','Imaging Technology',1,1805,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1456,'Magnetic Resonance Spectroscopy','Magnetic Resonance Spectroscopy',1,1805,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1457,'Myocardial Imaging','Myocardial Imaging',1,1805,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1460,'Developing Myocardium - Physiology, Pharmacology,','Developing Myocardium - Physiology, Pharmacology, Metabolism & Disease',1,1135,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1461,'Development Molecular Biology','Development Molecular Biology',1,1135,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1465,'Immunochemistry & Immunopathology','Immunochemistry & Immunopathology',1,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1467,'Infant Respiratory Distress Syndrome','Infant Respiratory Distress Syndrome',0,1135,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1470,'Immunogenetics','Immunogenetics',1,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1480,'Infant Respiratory Distress Syndrome','Infant Respiratory Distress Syndrome',0,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1485,'Inflammation of the CV System','Inflammation of the CV System',0,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1490,'Cardiopulmonary Function & Disease','Cardiopulmonary Function & Disease',1,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1495,'Intermediate Filaments','Intermediate Filaments',0,1590,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1505,'Intracellular Signals','Intracellular Signals',0,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1506,'Intracellular Targeting','Intracellular Targeting',1,2060,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1507,'Ion Transport: Cell Physiology','Ion Transport: Cell Physiology',0,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1508,'Ion Transport: Molecular Biology','Ion Transport: Molecular Biology',0,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1510,'Lifestyle Modification','Lifestyle Modification',0,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1515,'Lipolytic Enzymes & Lipid Transfer','Lipolytic Enzymes & Lipid Transfer',1,1530,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1519,'Lipoprotein Biochemistry','Lipoprotein Biochemistry',1,1530,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1520,'Lipoprotein Cell Interactions','Lipoprotein Cell Interactions',1,1530,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1525,'Lipoproteins','Lipoproteins',0,1530,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1535,'Lung Cell & Molecular Biology','Lung Cell & Molecular Biology',1,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1545,'Lymphocytes','Lymphocytes',0,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1546,'MRI, MRA','MRI, MRA',1,1805,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1550,'Macrophage Biology','Macrophage Biology',1,2000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1555,'Macrophages','Macrophages',0,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1560,'Magnetic Resonance of Myocardium','Magnetic Resonance of Myocardium',0,1805,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1565,'Mast Cells','Mast Cells',0,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1569,'Interventions/Surgeries','Interventions/Surgeries',1,1940,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1570,'Mechanical Cardiac Assistance','Mechanical Cardiac Assistance',0,1940,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1571,'Mechanisms of Renal Progression & Salvage','Mechanisms of Renal Progression & Salvage',1,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1572,'Mechanical Surgical Assistance & Replacement','Mechanical Surgical Assistance & Replacement',1,1940,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1575,'Microbial Chemistry','Microbial Chemistry',1,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1576,'Microbial Genetics','Microbial Genetics',1,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1577,'Microbial Pathogenesis','Microbial Pathogenesis',1,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1580,'Microcirculation','Microcirculation',1,1160,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1585,'Mitochondria, Bioenergetics','Mitochondria, Bioenergetics',1,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1595,'Molecular Endocrinology','Molecular Endocrinology',0,1605,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1596,'Molecular Genetics of Renal Disease & Development','Molecular Genetics of Renal Disease & Development',1,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1597,'Molecular Genetics of Lung Disease','Molecular Genetics of Lung Disease',1,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1600,'Molecular Models of Congenital Cardiovascular Malf','Molecular Models of Congenital Cardiovascular Malformations',1,1135,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1610,'Muscle Protein Interactions','Muscle Protein Interactions',0,1590,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1615,'Myocardial Contractility','Myocardial Contractility',0,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1620,'Myocardial Imaging','Myocardial Imaging',0,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1625,'Myocardial Ischemia: Experimental and Clinical','Myocardial Ischemia: Experimental and Clinical',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1630,'Myocardial Metabolism','Myocardial Metabolism',0,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1635,'Myocardial Preservation','Myocardial Preservation',1,1940,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1640,'Myocardial Relaxation','Myocardial Relaxation',0,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1645,'Natriuretic Factors','Natriuretic Factors',0,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1650,'Neural Control of Cardiovascular Function','Neural Control of Cardiovascular Function',0,1160,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1652,'Hypertension: Whole Animal','Hypertension: Whole Animal',1,1160,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1653,'Hypertrophy','Hypertrophy',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1654,'Hypoxia & Ischemia','Hypoxia & Ischemia',1,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1655,'Neuromuscular Junction (Molecular)','Neuromuscular Junction (Molecular)',1,1590,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1660,'Neutrophils','Neutrophils',0,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1661,'Nitric Oxide in Myocardial Biology','Nitric Oxide in Myocardial Biology',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1662,'Nitric Oxide in the Vasculature','Nitric Oxide in the Vasculature',1,2000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1665,'Nonrespiratory Functions of the Lung','Nonrespiratory Functions of the Lung',0,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1666,'Oxygen Transport & Tissue Respiratory Processes','Oxygen Transport & Tissue Respiratory Processes',1,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1670,'Normal Cerebrovascular Function','Normal Cerebrovascular Function',1,1100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1671,'Nuclear Cardiology','Nuclear Cardiology',1,1805,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1680,'Nutrition, Lipids','Nutrition, Lipids',1,1530,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1685,'Nutrition, Obesity','Nutrition, Obesity',0,1530,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1695,'Outcomes Research','Outcomes Research',1,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1696,'Oxidant Stress','Oxidant Stress',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1697,'Oxidant Metabolism & Signaling','Oxidant Metabolism & Signaling',1,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1705,'Pediatric Cardiovascular Disease','Pediatric Cardiovascular Disease',1,1135,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1706,'Pulmonary Embryology','Pulmonary Embryology',1,1135,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1707,'Autonomic Neurophysiology','Autonomic Neurophysiology',1,1160,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1710,'Peripheral Vascular Interventions','Peripheral Vascular Interventions',0,1805,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1720,'Physical Biochemistry','Physical Biochemistry',1,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1725,'Physical Biochemistry of Muscle Proteins','Physical Biochemistry of Muscle Proteins',0,1590,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1740,'Plasminogen','Plasminogen',1,1945,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1745,'Platelet Activating Factor','Platelet Activating Factor',0,1945,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1750,'Platelets','Platelets',1,1945,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1755,'Postoperative Care (Critical Care)','Postoperative Care (Critical Care)',1,1940,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1760,'Preventive Cardiology','Preventive Cardiology',1,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1761,'Protein Stucture-function Relationships (site-dire','Protein Stucture-function Relationships (site-directed mutagenesis)',1,2060,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1762,'Protein/DNA Interactions','Protein/DNA Interactions',1,2060,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1763,'Protein/Protein Interactions Including Contractile','Protein/Protein Interactions Including Contractile Proteins',1,2060,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1765,'Preventive Therapeutics','Preventive Therapeutics',0,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1775,'Pulmonary Circulation & Vascular Function','Pulmonary Circulation & Vascular Function',0,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1779,'Pathophysiology, Cell & Molecular Biology of Pulmo','Pathophysiology, Cell & Molecular Biology of Pulmonary Edema',1,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1780,'Pulmonary Hypertension','Pulmonary Hypertension',1,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1785,'Pulmonary Metabolic Functions','Pulmonary Metabolic Functions',0,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1790,'Pulmonary Vascular Biology','Pulmonary Vascular Biology',1,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1795,'Quality of Life','Quality of Life',1,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1800,'Radiology','Radiology',1,1805,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1801,'Radionuclide Imaging (PET, SPECT & Others)','Radionuclide Imaging (PET, SPECT & Others)',1,1805,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1806,'Computed Tomography','Computed Tomography',1,1805,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1807,'Vascular Angioplasty & Interventions','Vascular Angioplasty & Interventions',1,1805,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1810,'Receptors','Receptors',1,1605,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1814,'Structural Studies of Contractile & Other Proteins','Structural Studies of Contractile & Other Proteins',1,2060,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1815,'Regulation & Alteration of Contractility of Muscle','Regulation & Alteration of Contractility of Muscle Cells',1,2060,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1816,'Muscle Protein Interactions','Muscle Protein Interactions',0,1180,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1817,'Structural Studies of Muscle Proteins','Structural Studies of Muscle Proteins',0,1180,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1820,'Regulation of Gene Expression','Regulation of Gene Expression',1,1605,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1825,'Regulation of Peripheral Circulation','Regulation of Peripheral Circulation',0,1160,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1826,'Remodeling','Remodeling',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1827,'Neurohumoral Control of the Heart','Neurohumoral Control of the Heart',1,1160,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1828,'Neurohumoral Control','Neurohumoral Control',1,1160,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1829,'Physiological Genomics','Physiological Genomics',1,1160,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1835,'Renal Biochemistry & Metabolism','Renal Biochemistry & Metabolism',0,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1840,'Renal Growth, Development & Aging','Renal Growth, Development & Aging',0,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1841,'Renal Growth, Differentiation & Angiogenesis','Renal Growth, Differentiation & Angiogenesis',1,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1845,'Renal Hemodynamics, Glomerular Function','Renal Hemodynamics, Glomerular Function',0,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1850,'Renal Hormones and Autacoids','Renal Hormones and Autacoids',0,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1855,'Renal Immunology and Pathology','Renal Immunology and Pathology',0,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1860,'Renal Molecular Biology and Genetics','Renal Molecular Biology and Genetics',0,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1865,'Renal Pharmacology','Renal Pharmacology',0,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1868,'Renal Physiology','Renal Physiology',0,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1870,'Renal Structure, Function and Disease','Renal Structure, Function and Disease',0,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1875,'Respiration in Health & Disease','Respiration in Health & Disease',0,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1876,'Pulmonary Physiology Pharmacology & Therapeutics','Pulmonary Physiology Pharmacology & Therapeutics',1,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1880,'Restenosis','Restenosis',0,2000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1885,'Risk Factors','Risk Factors',0,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1886,'Risk Factors, Non-Genetic','Risk Factors, Non-Genetic',0,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1887,'Risk Factors, Genetic','Risk Factors, Genetic',0,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1890,'Sarcoplasmic Reticulum','Sarcoplasmic Reticulum',0,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1895,'Self-Help Models','Self-Help Models',0,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1900,'Shock','Shock',1,1940,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1905,'Signal Transduction','Signal Transduction',1,1605,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1910,'Smooth Muscle Cells','Smooth Muscle Cells',1,2000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1915,'Social Support Systems','Social Support Systems',0,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1916,'Cohort/Case Control Studies','Cohort/Case Control Studies',0,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1930,'Stroke','Stroke',0,1100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1931,'Stroke: Molecular Mechanism & Neuroprotection','Stroke: Molecular Mechanism & Neuroprotection',1,1100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1932,'Structural & Matrix Biology','Structural & Matrix Biology',1,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1934,'Structure Function Correlations in the Kidney','Structure Function Correlations in the Kidney',1,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1935,'Structural Studies of Muscle Proteins','Structural Studies of Muscle Proteins',0,1590,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1936,'Transgenic Models','Transgenic Models',1,1590,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1937,'Subarachnoid Hemorrhage','Subarachnoid Hemorrhage',1,1100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1940,'Surgery','Surgery',0,1940,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1941,'Surgery, Congenital Heart Disease','Surgery, Congenital Heart Disease',1,1940,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1942,'Surgery, Ischemic Heart Disease','Surgery, Ischemic Heart Disease',1,1940,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1943,'Surgery, Valvular Disease','Surgery, Valvular Disease',1,1940,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1950,'Tissue Oxygen Metabolism','Tissue Oxygen Metabolism',0,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1951,'Transcriptional & Post-transcriptional Regulation','Transcriptional & Post-transcriptional Regulation',1,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1955,'Transmembrane Signalling','Transmembrane Signalling',0,1605,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1956,'Transplantation, Cardiac','Transplantation, Cardiac',1,1940,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1958,'Transplantation, Non-Cardiac','Transplantation, Non-Cardiac',1,1940,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1959,'Transporters & Ion Channels','Transporters & Ion Channels',1,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1960,'Transplantation Medicine','Transplantation Medicine',0,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1962,'Valvular Disease','Valvular Disease',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1965,'Ultrafast Computed Tomography','Ultrafast Computed Tomography',0,1805,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1970,'Vascular Cytokines','Vascular Cytokines',1,2000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1975,'Vascular Disease','Vascular Disease',1,1940,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1980,'Vascular Extracellular Matrix','Vascular Extracellular Matrix',1,2000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1981,'Vascular Growth Factors','Vascular Growth Factors',1,2000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1985,'Vascular Medicine','Vascular Medicine',0,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1990,'Vascular (Physiology & Pharmacology)','Vascular (Physiology & Pharmacology)',1,1160,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1991,'Vascular Cell Apoptosis','Vascular Cell Apoptosis',1,2000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1994,'Vascular Imaging','Vascular Imaging',1,1805,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1995,'Vascular Ultrasound','Vascular Ultrasound',0,1805,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(1996,'Echocardiography','Echocardiography',0,1805,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2005,'Vascular Wall Mechanics','Vascular Wall Mechanics',1,2000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2010,'Vasoactive Agents','Vasoactive Agents',1,1160,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2015,'Vasoactive Hormones','Vasoactive Hormones',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2017,'CNS Control of Cardiovascular Function','CNS Control of Cardiovascular Function',1,1160,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2020,'Ventricular Function','Ventricular Function',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2025,'Vessel Wall Diseases (Nonatherosclerotic)','Vessel Wall Diseases (Nonatherosclerotic)',1,2000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2026,'Virology','Virology',0,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2054,'Bioelectrics','Bioelectrics',1,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2055,'Bioelectrics and Signal Processing','Bioelectrics and Signal Processing',0,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2056,'Bioinformatics','Bioinformatics',1,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2057,'Biomaterials','Biomaterials',1,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2058,'Biomechanics','Biomechanics',1,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2059,'Drug Delivery','Drug Delivery',1,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2060,'Image Methods, Analysis & Processing','Image Methods, Analysis & Processing',1,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2061,'Modeling (Biosystem and Computational)','Modeling (Biosystem and Computational)',0,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2062,'Molecular/Cellular Tissue Engineering & Technologi','Molecular/Cellular Tissue Engineering & Technologies',1,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2063,'Sensors and Devices','Sensors and Devices',1,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2064,'Structural Biology','Structural Biology',0,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2065,'Chemistry & Chemical Synthesis','Chemistry & Chemical Synthesis',1,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2066,'Computation, Modeling & Simulation','Computation, Modeling & Simulation',1,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2067,'Defibrillators & Pacemakers','Defibrillators & Pacemakers',1,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2068,'Nanotechnology','Nanotechnology',1,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2069,'Non-linear Dynamics (Chaos & Fractals)','Non-linear Dynamics (Chaos & Fractals)',1,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2070,'Signal Processing & Analysis','Signal Processing & Analysis',1,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2071,'Molecular Biology of Ionic Transporters / Channels','Molecular Biology of Ionic Transporters / Channels',1,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2072,'Genetic Mapping','Genetic Mapping',1,1135,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2073,'Steroid & Peptide Natriuretic Factors','Steroid & Peptide Natriuretic Factors',1,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2074,'Echocardiography','Echocardiography',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2075,'Myocardial Structure & Pathology','Myocardial Structure & Pathology',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2076,'Intracellular pH Regulation','Intracellular pH Regulation',1,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2077,'Control of Ventilation','Control of Ventilation',1,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2078,'Cell Adhesion/Extracellular Matrix','Cell Adhesion/Extracellular Matrix',1,2060,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2160,'Drug Metabolism','Drug Metabolism',1,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2161,'Intracellular Trafficking','Intracellular Trafficking',1,2060,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2162,'Post Translational Modifications/Proteomics','Post Translational Modifications/Proteomics',1,2060,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2163,'Diabetes & Multiple Metabolic Syndrome','Diabetes & Multiple Metabolic Syndrome',1,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2164,'Obesity','Obesity',1,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2165,'Psycho/Social Factors','Psycho/Social Factors',1,1205,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2166,'Biotransport Processes','Biotransport Processes',1,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2167,'Computational Systems Biology','Computational Systems Biology',1,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2168,'Development of Pacers and Devices','Development of Pacers and Devices',1,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2169,'Electrophysiology Modeling','Electrophysiology Modeling',1,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2170,'Mechanical Cardiac Assistance & Replacement Techno','Mechanical Cardiac Assistance & Replacement Technology',1,2050,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2171,'Coronary Angiography & Coronary Interventions','Coronary Angiography & Coronary Interventions',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2172,'Physiological Genomics','Physiological Genomics',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2173,'Ablation','Ablation',1,3100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2174,'Arrhythmia','Arrhythmia',1,3100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2175,'Electrophysiological Testing','Electrophysiological Testing',1,3100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2176,'Mechanisms','Mechanisms',1,3100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2177,'Physiological Genomics','Physiological Genomics',1,3100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2178,'Pacing & Devices','Pacing & Devices',1,3100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2179,'Apoptosis','Apoptosis',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2180,'Endothelial Function','Endothelial Function',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2182,'Nitric Oxide','Nitric Oxide',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2184,'Physiological Genomics','Physiological Genomics',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2185,'Vascular Smooth Muscle Function','Vascular Smooth Muscle Function',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2186,'Autoimmune Diseases','Autoimmune Diseases',1,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2187,'Bacteria, Protozoa, Fungi & Viruses','Bacteria, Protozoa, Fungi & Viruses',1,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2188,'Endocarditis & Myocarditis','Endocarditis & Myocarditis',1,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2189,'Immunologic Mechanisms in Cardiovascular Diseases','Immunologic Mechanisms in Cardiovascular Diseases',1,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2190,'Animal Models of Lipoprotein Mechanism & Atheroscl','Animal Models of Lipoprotein Mechanism & Atherosclerosis',1,1530,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2191,'Atherosclerosis, Lipoprotein-Related Mechanisms','Atherosclerosis, Lipoprotein-Related Mechanisms',1,1530,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2193,'Foam Cell Biology','Foam Cell Biology',1,1530,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2194,'Metabolic Syndrome, Diabetic Dyslipidemia','Metabolic Syndrome, Diabetic Dyslipidemia',1,1530,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2195,'Pulmonary Endothelium & Nitric Oxide','Pulmonary Endothelium & Nitric Oxide',1,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2196,'Respiratory Genomics & Proteomics','Respiratory Genomics & Proteomics',1,1540,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2197,'Kinases & Phosphatases','Kinases & Phosphatases',1,1605,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2198,'Nitric Oxide & Reactive Oxygen Species','Nitric Oxide & Reactive Oxygen Species',1,1605,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2199,'Second Messengers','Second Messengers',1,1605,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2200,'Signaling / Apoptosis','Signaling / Apoptosis',1,1605,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2201,'Cellular Florescent Imaging','Cellular Florescent Imaging',1,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2202,'Cell Membranes','Cell Membranes',1,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2203,'Excitation Cessation Coupling','Excitation Cessation Coupling',1,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2204,'Molecular Pharmacology','Molecular Pharmacology',1,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2205,'Surgical Outcomes','Surgical Outcomes',1,1940,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2206,'Diabetes/Atherogenic Mechanisms','Diabetes/Atherogenic Mechanisms',1,2000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2207,'Aging','Aging',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2208,'Aging','Aging',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2209,'Myocarditis','Myocarditis',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2210,'Anesthesiology','Anesthesiology',1,1940,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2211,'Myocardial Apoptosis','Myocardial Apoptosis',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2212,'Baroreflex Chemoreflex','Baroreflex Chemoreflex',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2213,'Cytoskeleton & Motility','Cytoskeleton & Motility',1,2060,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2214,'Cardiomyopathies','Cardiomyopathies',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2215,'Congestive Heart Failure','Congestive Heart Failure',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2216,'Congenital Cardiovascular Disease','Congenital Cardiovascular Disease',1,1135,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2217,'Cellular Cardiac & Vascular Muscle Physiology & Ph','Cellular Cardiac & Vascular Muscle Physiology & Pharmacology',1,1180,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2218,'Cellular Electro Physiology, Voltage-Sensitive Ion','Cellular Electro Physiology, Voltage-Sensitive Ion Channels',1,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2219,'Coronary Artery Disease','Coronary Artery Disease',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2220,'Coronary Artery Disease','Coronary Artery Disease',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2221,'Coronary Circulation','Coronary Circulation',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2222,'Coronary Circulation','Coronary Circulation',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2223,'Exercise Physiology','Exercise Physiology',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2224,'Exercise Physiology','Exercise Physiology',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2225,'Pharmacology','Pharmacology',1,3100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2226,'Pharmacology','Pharmacology',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2227,'Pharmacology','Pharmacology',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2228,'Excitation Contraction Coupling in Muscle Cells','Excitation Contraction Coupling in Muscle Cells',1,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2229,'Experimental & Clinical Hypertension','Experimental & Clinical Hypertension',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2230,'Experimental & Clinical Hypertension','Experimental & Clinical Hypertension',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2231,'Experimental Therapeutics','Experimental Therapeutics',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2232,'Cytokines','Cytokines',1,1475,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2233,'Growth Factors','Growth Factors',1,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2234,'Hemodynamics','Hemodynamics',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2235,'Microcirculation','Microcirculation',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2236,'Microcirculation','Microcirculation',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2237,'Microcirculation','Microcirculation',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2238,'Myocardial Ischemia: Experimental and Clinical','Myocardial Ischemia: Experimental and Clinical',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2239,'Hypertrophy','Hypertrophy',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2240,'Hypertrophy','Hypertrophy',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2241,'Nitric Oxide in Myocardial Biology','Nitric Oxide in Myocardial Biology',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2242,'Nuclear Cardiology','Nuclear Cardiology',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2243,'Oxidant Stress','Oxidant Stress',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2244,'Oxidant Stress','Oxidant Stress',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2245,'Autonomic Neurophysiology','Autonomic Neurophysiology',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2246,'Autonomic Neurophysiology','Autonomic Neurophysiology',1,3100,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2247,'Autonomic Neurophysiology','Autonomic Neurophysiology',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2248,'Regulation of Gene Expression','Regulation of Gene Expression',1,1590,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2249,'Regulation of Gene Expression','Regulation of Gene Expression',1,2060,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2250,'Remodeling','Remodeling',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2251,'Remodeling','Remodeling',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2252,'Neurohumoral Control','Neurohumoral Control',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2253,'Neurohumoral Control','Neurohumoral Control',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2254,'Signal Transduction','Signal Transduction',1,1125,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2255,'Valvular Disease','Valvular Disease',1,3000,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2256,'Vasoactive Agents','Vasoactive Agents',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2257,'Vasoactive Hormones','Vasoactive Hormones',1,1160,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2258,'CNS Control of Cardiovascular Function','CNS Control of Cardiovascular Function',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2259,'Ventricular Function','Ventricular Function',1,2,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2260,'Structural Biology','Structural Biology',1,1175,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2261,'Echocardiography','Echocardiography',1,1805,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2262,'Echocardiography','Echocardiography',1,3200,NULL)
INSERT INTO [c_SCIENCE] ([id],[abbr],[description],[sort_order],[class_id],[end_date])VALUES(2263,'Regulation & Alteration of Contractility of Muscle','Regulation & Alteration of Contractility of Muscle Cells',1,1180,NULL)

INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,NULL,'Acute Coronary Syndromes: Clinical Science',1,NULL)
INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,NULL,'Cardiac and Vascular Signaling: Basic Science',2,NULL)
INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,NULL,'Cardiac Development/Geneitcs/Molecular Biology: Basic Science',3,NULL)
INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,NULL,'Cardiopulmonary and Critical Care: Clinical Science',4,NULL)
INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(5,NULL,'Cardiovascular Nursing: Clinical Science',5,NULL)
INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(6,NULL,'Clinical Electrophysiology/Pacing: Clinical Science',6,NULL)
INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(7,NULL,'Coronary Artery Disease/Valve/CV Surgery: Clinical Science',7,NULL)
INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(8,NULL,'Echocardiography: Clinical Science',8,NULL)
INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(9,NULL,'Electrophysiology: Basic Science',9,NULL)
INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(10,NULL,'Epidemiology: Population Science',10,NULL)
INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(11,NULL,'Health Policy and Outcomes Research: Population Science',11,NULL)
INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(12,NULL,'Heart Failure/Ventricular Function: Clinicial Science',12,NULL)
INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(13,NULL,'Human Genetics of Cardiovascular Disease and Therapy: Clinical Science',13,NULL)
INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(14,NULL,'Hypertension/PAD/Strike: Clinical Science',14,NULL)
INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(15,NULL,'Imagin/Exercise (MR/CT/Nuclear/Exercise): Clinical Science',15,NULL)
INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(16,NULL,'Integrative Biology: Basic Science',16,NULL)
INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(17,NULL,'Myocardial Ischemia/Function/Metabolism: Basic Science',17,NULL)
INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(18,NULL,'Pediatric and Congenital: Clinical Science',18,NULL)
INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(19,NULL,'Percutaneous Coronary Intervention: Clinical Science',19,NULL)
INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(20,NULL,'Prevention: Population Science',20,NULL)
INSERT INTO [c_SCIENCE_CATEGORY] ([id],[abbr],[description],[sort_order],[end_date])VALUES(21,NULL,'Vascular Biology/Atherosclerosis/Hemostasis/Lipid Metabolism: Basic Science',21,NULL)

INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Cardiovascular (Patho) Physiology','Cardiovascular (Patho) Physiology',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1025,'Anesthesiology','Anesthesiology',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1100,'Brain','Brain',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1125,'Cardiorenal','Cardiorenal',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1135,'Cardiovascular Development','Cardiovascular Development',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1160,'Cardiovascular Regulation','Cardiovascular Regulation',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1175,'Cell Transport, Function & Metabolism','Cell Transport, Function & Metabolism',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1180,'Cellular CV Physiology and Pharmacology','Cellular CV Physiology and Pharmacology',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1205,'Behavioral Science, Epidemiology and Prevention','Behavioral Science, Epidemiology and Prevention',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1475,'Immunology and Microbiology','Immunology and Microbiology',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1530,'Lipoproteins, Lipid Metabolism & Nutrition','Lipoproteins, Lipid Metabolism & Nutrition',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1540,'Lung, Respiration and Resuscitation','Lung, Respiration and Resuscitation',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1590,'Molecular Genetics','Molecular Genetics',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1605,'Molecular Signaling','Molecular Signaling',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1805,'Radiology and Imaging','Radiology and Imaging',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1940,'Surgery','Surgery',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1945,'Thrombosis','Thrombosis',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2000,'Vascular Wall Biology','Vascular Wall Biology',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2050,'Bioengineering and Biotechnology','Bioengineering and Biotechnology',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2060,'Basic Cell & Molecular Biology','Basic Cell & Molecular Biology',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3000,'Integrative Cardiac Biology/Regulation','Integrative Cardiac Biology/Regulation',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3100,'Electrophysiology & Arrhythmias/Regulation','Electrophysiology & Arrhythmias/Regulation',NULL,NULL)
INSERT INTO [c_SCIENCE_CLASSIFICATION] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3200,'Vascular Biology & Blood Pressure/Regulation','Vascular Biology & Blood Pressure/Regulation',NULL,NULL)

INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(1,1,NULL,'Unstable Angina, NSTEMI and STEMI: Diagnosis and Pathophysiology (Non-Catheter Based) - CLCD',1,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(2,1,NULL,'Unstable Angina: NSTEMI and STEMI: Druct/Catheter Interface (CLCD)',2,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(3,1,NULL,'Unstable Angina, NSTEMI and STEMI: Prognosis and Pharmacologic Therapy (Non Catheter Based) - CLCD',3,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(4,2,NULL,'Apoptosis (BCVS)',4,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(5,2,NULL,'Growth Factors, Cytokines, Signal Transduction (BCVS)',5,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(6,2,NULL,'Oxidant Stress (ATVB)',6,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(7,2,NULL,'Receptor Pharmacology (KCVD)',7,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(8,3,NULL,'Cardiac Development (BCVS)',8,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(9,3,NULL,'Gene Expression/Molecular Biology (BCVS)',9,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(10,3,NULL,'Genetically Engineered Models of Human Disease (ATVB)',10,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(11,3,NULL,'in-Vivo Gene Transfer: Experimental (ATVB)',11,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(12,3,NULL,'Molecular Bases of Hypertrophy (BCVS)',12,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(13,4,NULL,'Resuscitation, CPR, Emergency Cardiac Care, Critical Care, AED and Trauma (CPCC)',13,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(14,5,NULL,'Physiological Aspects (CVN)',14,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(15,5,NULL,'Prevention, Education and Patient Care (for rehabilitation, see Cardiac Rehabiliation/Exercise) - CV',15,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(16,5,NULL,'Psychosis and Behavioral Aspects (CVN)',16,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(17,6,NULL,'Arrhythmias: Diagnosis and Electrophysiology (CLCD)',17,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(18,6,NULL,'ECG and Non-Invasive Arrhythmia Testing (CLCD)',18,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(19,6,NULL,'Treatment of Arrhythmias: Ablation (CLCD)',19,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(20,6,NULL,'Treatment of Arrhythmias: ICD/Pacemaker - excluding CRT (CLCD)',20,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(21,6,NULL,'Treatment of Arrhythmias: Pharmacologic (CLCD)',21,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(22,7,NULL,'Cardiac Surgery: Coronary Artery Disease (CVSA)',22,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(23,7,NULL,'Cardiac Surgery: Valvular Heart Disease (CVSA)',23,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(24,7,NULL,'Cell Transplantation/Progenitor Cells/Cell Therapies: Clinical (CVSA)',24,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(25,7,NULL,'Ischemic Heart Disase: Chronic (CLCD)',25,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(26,7,NULL,'Myochardial Protection/Intraoperative Management (CVSA)',26,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(27,7,NULL,'Surgical Treatment of Arrhythmias (CVSA)',27,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(28,7,NULL,'Surgical Treatment of Heart Failure Transplantation (CVSA)',28,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(29,7,NULL,'Thoracic Aortic Disease and Aortic Stent Grafts (CVSA)',29,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(30,7,NULL,'Valvular Heart Disease: Diagnosis, Pathophysiology, Medical and Percutaneous Management',30,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(31,8,NULL,'Echocardiography: Emerging Technologies (CLCD)',31,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(32,8,NULL,'Echocardiography: Evaluiation of Cardiac Function (CLCD)',32,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(33,8,NULL,'Echocardiography in CAD: Stress and Contrast (CLCD)',33,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(34,8,NULL,'Echocardiography in Clinical Syndromes: Valve Disease, Adult Congenital Disease, Stroke, and Arrhyt',34,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(35,9,NULL,'Arrythmias in Experimental Models (BCVS)',35,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(36,9,NULL,'Cellular Aspects of Excitation-Contraction Coupling (BCVS)',36,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(37,9,NULL,'Cellular Electrophysiology/Electropharmacology (BCVS)',37,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(38,9,NULL,'Ion Channels and Membrane Transporters (BCVS)',38,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(39,10,NULL,'Epidemiology: Population Studies, Mass Field Trials (EPI)',39,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(40,10,NULL,'Genetic Epidemiology (EPI)',40,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(41,11,NULL,'Health Policy and Outcomes Research (QCOR)',41,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(42,12,NULL,'Heart Failure: Disease Management, Quality of Care, and Clinical Outcomes (CLCD)',42,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(43,12,NULL,'Heart Failure: Pathophysiology & Diagnosis (CLCD)',43,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(44,12,NULL,'Heart Failure: Resynchronization Therapy (CLCD)',44,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(45,12,NULL,'Medical Aspects of Transplantation (CLCD)',45,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(46,12,NULL,'Myocaridal (including Hypertophy)/Pericardial Disease (CLCD)',46,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(47,12,NULL,'Ventricular Function/Hemodynamics (CLCD)',47,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(48,13,NULL,'Human Genetics of Cardiovascular Disease and Therapy (FGTB)',48,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(49,14,NULL,'Cerebrovascular Disease/Stroke (STR)',49,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(50,14,NULL,'Hypertension: Clinical (HBPR)',50,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(51,14,NULL,'Peripheral Vascular Disease (non-coronary) - APVD',51,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(52,15,NULL,'Computed Tomography (CVRI)',52,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(53,15,NULL,'Exercise Physiology/Testing (for rehabilitation, see Cardiac Rehabilitation Exercise) - CLCD',53,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(54,15,NULL,'Magnetic Resonance/Clinical Spectroscopy (CVRI)',54,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(55,15,NULL,'Non-Coronary Vascular Ultrasound and Doppler (CVRI)',55,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(56,15,NULL,'Nuclear Cardiology: Isotope Imaging and PET (CLCD)',56,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(57,16,NULL,'Autonomic, Reflex, and Neurohormonal Control of Circulation (BCVS)',57,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(58,16,NULL,'Cardiorenal Physiology/Pathophysiology (KCVD)',58,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(59,16,NULL,'Hypertension: Experimental (HBPR)',59,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(60,16,NULL,'Pulmonary Circulation, Respitory Processes, and Lung Injury (CPCC)',60,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(61,17,NULL,'Cardiac Failure and Remodeling (BCVS)',61,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(62,17,NULL,'Experimental Myocardial Infarction (BCVS)',62,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(63,17,NULL,'Myocardial Energetics/Intermediary Metabolism (BCVS)',63,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(64,17,NULL,'Myocardial Structure and Pathology (BCVS)',64,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(65,17,NULL,'Protection of Ischemic Myocardium (BCVS)',65,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(66,17,NULL,'Ventricular Function/Mechanics (BCVS)',66,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(67,18,NULL,'Adult Congenital Heart Disease (CVDY)',67,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(68,18,NULL,'Pediatric Cardiac Surgery (CVDY)',68,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(69,18,NULL,'Pediatric Congenital and Acquired Heart Disease (CVDY)',69,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(70,18,NULL,'Pediatric Electrophysiology (CVDY)',70,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(71,18,NULL,'Pediatric Imaging (CVDY)',71,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(72,18,NULL,'Pediatric Interventional Cardiology (CVDY)',72,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(73,19,NULL,'Catheter-Based Coronary Imaging and Hemodynamics (CLCD)',73,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(74,19,NULL,'Catheter-Based Coronary Interventions: Experimental & New Technology (CLCD)',74,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(75,19,NULL,'Catheter-Based Coronary Interventions: Stents - Clinical Use (CLCD)',75,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(76,19,NULL,'Catheter-Based Coronary Non-Stent Interventions (balloon angioplasty, atherectomy, laser, other de',76,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(77,19,NULL,'Catheter-Based Non-Coronary Vascular Interventions',77,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(78,20,NULL,'Cardiac Rehabilitation/Exercise (EPI)',78,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(79,20,NULL,'Clinical and Experimental Aspects of Nutrition (NPAM)',79,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(80,20,NULL,'Diabetic CVD: Clinical and Experimental (NPAM)',80,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(81,20,NULL,'Obesity: Causes and Cardiac Risk (NPAM)',81,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(82,20,NULL,'Prevention Research: Population-Based, Individual Interventions, Risk Factor Modiciation (EPI)',82,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(83,21,NULL,'Angiogenesis (ATVB)',83,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(84,21,NULL,'Antithrombotic Treatment: Experimental (ATVB)',84,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(85,21,NULL,'Cell and Developmental Vascular Biology (ATVB)',85,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(86,21,NULL,'Coronary Circulation (BCVS)',86,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(87,21,NULL,'Endothelium & Vascular Tone (ATVB)',87,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(88,21,NULL,'Inflammation and Adhesion Molecules (ATVB)',88,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(89,21,NULL,'Lipid and Lipoprotein Metabolism: Basic & Cellular (ATVB)',89,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(90,21,NULL,'Lipid and Lipoprotein Metabolism:  Clinical (ATVB)',90,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(91,21,NULL,'Mechanisms of Atherosclerosis (ATVB)',91,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(92,21,NULL,'NO Synthase (ATVB)',92,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(93,21,NULL,'Plaque Rupture (ATVB)',93,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(94,21,NULL,'Platelets and Biology of Hemostasis (ATVB)',94,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(95,21,NULL,'Proliferation, Remodeling, Extracellular Matrix (ATVB)',95,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(96,21,NULL,'Regional Circulation/Microcirculation (BCVS)',96,NULL)
INSERT INTO [c_SCIENCE_KATZ] ([id],[category_id],[abbr],[description],[sort_order],[end_date])VALUES(97,21,NULL,'Reulation of Blood Coagulation and Fibrinolysis (ATVB)',97,NULL)

INSERT INTO [c_SITE_VISIT_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Approved','Approved',NULL,NULL)
INSERT INTO [c_SITE_VISIT_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Completed','Completed',NULL,NULL)
INSERT INTO [c_SITE_VISIT_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Pending','Pending',NULL,NULL)

INSERT INTO [c_SITE_VISIT_TYPE] ([id],[abbr],[descr],[sort_order],[end_date])VALUES(1,'On-Site','On-Site',NULL,NULL)

INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'AL','Alabama',1,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'AK','Alaska',2,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'AZ','Arizona',4,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'CA','California',7,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(5,'CO','Colorado',9,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(6,'CT','Connecticut',10,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(7,'DE','Delaware',11,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(8,'AR','Arkansas',5,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(9,'FL','Florida',13,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(10,'GA','Georgia',14,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(11,'HI','Hawaii',16,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(12,'ID','Idaho',17,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(13,'IL','Illinois',18,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(14,'IN','Indiana',19,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(15,'IA','Iowa',20,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(16,'KS','Kansas',21,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(17,'KY','Kentucky',22,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(18,'LA','Louisiana',24,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(19,'ME','Maine',25,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(20,'MD','Maryland',27,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(21,'MA','Massachusetts',28,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(22,'MI','Michigan',29,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(23,'MN','Minnesota',30,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(24,'MS','Mississippi',31,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(25,'MO','Missouri',32,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(26,'MT','Montana',33,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(27,'NE','Nebraska',34,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(28,'NV','Nevada',35,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(29,'NH','New Hampshire',37,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(30,'NM','New Mexico',39,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(31,'NY','New York',40,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(32,'NC','North Carolina',42,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(33,'ND','North Dakota',43,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(34,'OH','Ohio',46,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(35,'OK','Oklahoma',47,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(36,'OR','Oregon',49,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(37,'PA','Pennsylvania',50,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(38,'RI','Rhode Island',54,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(39,'SC','South Carolina',56,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(40,'SD','South Dakota',57,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(41,'TN','Tennessee',58,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(42,'TX','Texas',59,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(43,'UT','Utah',60,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(44,'VT','Vermont',61,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(45,'VA','Virginia',63,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(46,'WA','Washington',64,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(47,'WV','West Virginia',65,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(48,'WI','Wisconsin',66,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(49,'WY','Wyoming',67,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(50,'NJ','New Jersey',38,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(51,'DC','District of Columbia',12,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(52,'PR','Puerto Rico',52,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(53,'ON','Ontario',48,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(54,'PQ','Quebec',53,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(55,'BC','British Columbia',6,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(56,'VI','Virgin Islands',62,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(57,'AB','Alberta',3,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(58,'NS','Nova Scotia',45,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(59,'MB','Manitoba',26,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(60,'LB','Labrador',23,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(61,'NB','New Brunswick',36,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(62,'NF','Newfoundland',41,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(63,'NT','Northwest Territories',44,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(64,'PE','Prince Edward Island',51,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(65,'SK','Saskatchewan',55,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(66,'YT','Yukon',68,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(67,'GU','Guam',15,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(68,'CN','Canada',8,NULL)
INSERT INTO [c_STATE_PROV] ([id],[abbr],[description],[sort_order],[end_date])VALUES(69,'N/A','N/A',0,NULL)

INSERT INTO [c_SUFFIX] ([suffix_id],[abbr],[suffix],[sort_order],[end_date])VALUES(1,'Jr.','Jr.',4,NULL)
INSERT INTO [c_SUFFIX] ([suffix_id],[abbr],[suffix],[sort_order],[end_date])VALUES(2,'Sr.','Sr.',5,NULL)
INSERT INTO [c_SUFFIX] ([suffix_id],[abbr],[suffix],[sort_order],[end_date])VALUES(3,'Esq.','Esq.',1,NULL)
INSERT INTO [c_SUFFIX] ([suffix_id],[abbr],[suffix],[sort_order],[end_date])VALUES(4,'II','II',2,NULL)
INSERT INTO [c_SUFFIX] ([suffix_id],[abbr],[suffix],[sort_order],[end_date])VALUES(5,'III','III',3,NULL)

INSERT INTO [c_TENURE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Yes','Yes',1,NULL)
INSERT INTO [c_TENURE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'No','No',2,NULL)
INSERT INTO [c_TENURE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'N/A','Not Applicable',3,NULL)

INSERT INTO [c_TIME_PERIOD] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'2006','2006',1,NULL)
INSERT INTO [c_TIME_PERIOD] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'2007','2007',2,NULL)
INSERT INTO [c_TIME_PERIOD] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'2008','2008',3,NULL)
INSERT INTO [c_TIME_PERIOD] ([id],[abbr],[description],[sort_order],[end_date])VALUES(4,'2009','2009',4,NULL)
INSERT INTO [c_TIME_PERIOD] ([id],[abbr],[description],[sort_order],[end_date])VALUES(7,'2010','2010',5,'Jul 20 2006 12:00:00:000AM')

INSERT INTO [c_TRANSLATIONAL_ANSWER] ([id],[abbr],[answer],[sort_order],[end_date])VALUES(1,NULL,'Yes',3,NULL)
INSERT INTO [c_TRANSLATIONAL_ANSWER] ([id],[abbr],[answer],[sort_order],[end_date])VALUES(2,NULL,'No',1,NULL)
INSERT INTO [c_TRANSLATIONAL_ANSWER] ([id],[abbr],[answer],[sort_order],[end_date])VALUES(3,NULL,'Not Clear',2,NULL)

INSERT INTO [c_TRIP_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Completed','Completed',1,NULL)
INSERT INTO [c_TRIP_STATUS] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Planning','Planning',2,NULL)

INSERT INTO [c_TRIP_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Documentary','Documentary',NULL,NULL)
INSERT INTO [c_TRIP_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Interview','Interview',NULL,NULL)

INSERT INTO [c_USER_TYPE] ([id],[abbr],[description],[sort_order],[access_level],[frontdoor_page],[end_date])VALUES(1,'PUBLIC','Public',2,1,'frontdoors/FrontDoor.aspx',NULL)
INSERT INTO [c_USER_TYPE] ([id],[abbr],[description],[sort_order],[access_level],[frontdoor_page],[end_date])VALUES(2,'SMBR','Staff Member',3,2,'frontdoors/SAFrontDoor.aspx',NULL)
INSERT INTO [c_USER_TYPE] ([id],[abbr],[description],[sort_order],[access_level],[frontdoor_page],[end_date])VALUES(3,'ADMIN','Administrative',1,3,'frontdoors/SAFrontDoor.aspx',NULL)

INSERT INTO [c_WEB_ADDRESS_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(1,'Business','Business',1,NULL)
INSERT INTO [c_WEB_ADDRESS_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(2,'Personal','Personal',3,NULL)
INSERT INTO [c_WEB_ADDRESS_TYPE] ([id],[abbr],[description],[sort_order],[end_date])VALUES(3,'Other','Other',2,NULL)


--Update s_id_gen table and set is_code_table columns
exec spUPDATE_IDGEN

UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_CHOICE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_COUNTRY'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_ELIGIBILITY_STATUS'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_EMAIL_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_FACULTY_RANK_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_GENDER'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_GRANT_STATUS'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_NOTE_SUBJECT'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_ORGANIZATION_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_PASSWORD_QUESTION'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_PAYMENT_ENTITY'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_PERSON_ORG_AFFILIATION_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_PHONE_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_PI_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_PREFIX'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_PROJECT_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_RATING_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_RESEARCH_AREA'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_RESEARCH_STAGE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_REVIEWER_STATUS'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_STATE_PROV'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_SUFFIX'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_TRANSLATIONAL_ANSWER'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_USER_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_WEB_ADDRESS_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_ADDITIONAL_CONTACT_ROLE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_ADDRESS_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_BUDGET_PERIOD_DESCRIPTION'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_QUERY_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_PDF_GENERATION'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_COMPETITION_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_PORTFOLIO'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_CONSORTIA'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_ELIGIBILITY_ANSWER'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_ELIGIBILITY_QUESTION'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_ACADEMIC_POSITION'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_SCIENCE_CATEGORY'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_SCIENCE_KATZ'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_REVIEW_ASSIGNMENT_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_REVIEW_PREFERENCE_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_REVIEW_CONFLICT_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_REVIEWER_ROLE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_FIELD_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_BUDGET_PERIOD_NAME'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_TIME_PERIOD'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_QUERY_OUTPUT'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_RACE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_RESEARCH_CATEGORY'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_GRANTEE_PUBLICATION_STATUS'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_GRANTEE_PUBLICATION_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_GRANTEE_PROJ_STAFF_AFFILIATION_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_GRANTEE_PROJ_STAFF_AFFILIATION_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_ASSURANCES_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_ASSURANCES_STATUS'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_PAYMENT_RECOMMENDATION'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_GRANT_PROGRESS'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_GRANT_RECOMMENDATION'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_CAMPAIGN_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_MEDIA_CODE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_TRIP_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_TRIP_STATUS'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_SITE_VISIT_STATUS'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_SITE_VISIT_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'c_LOCALE_TYPE'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'a_WF_PROJECT_TASK_ELIGIBILITY_ANSWER'
UPDATE [s_ID_GEN] SET [is_code_table] = 1 where [table_name] = 'a_WF_TASK_ELIGIBILITY_OUTCOME'

