USE [Easygrants]
GO
/****** Object:  Table [dbo].[LSC_AWARD]    Script Date: 03/05/2008 10:13:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_AWARD](
	[lsc_award_id] [int] NOT NULL,
	[grantee_project_id] [int] NULL,
	[award_amount] [money] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[legacy_award_id] [int] NULL,
	[time_period_id] [int] NULL,
 CONSTRAINT [PK_LSC_AWARD] PRIMARY KEY CLUSTERED 
(
	[lsc_award_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_AWARD', 1, 0)