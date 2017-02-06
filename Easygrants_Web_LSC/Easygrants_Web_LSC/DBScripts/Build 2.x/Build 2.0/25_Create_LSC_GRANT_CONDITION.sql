/****** Object:  Table [dbo].[LSC_GRANT_CONDITION]    Script Date: 05/27/2008 14:51:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_GRANT_CONDITION](
	[lsc_grant_condition_id] [int] NOT NULL,
	[reviewed_wf_task_assignment_id] [int] NULL,
	[lsc_grant_condition_type_id] [int] NULL,
	[comment] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_GRANT_CONDITION] PRIMARY KEY CLUSTERED 
(
	[lsc_grant_condition_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_GRANT_CONDITION', 1, 0)