
CREATE TABLE [dbo].[GRANTEE_PROJECT_FUNDING_SOURCES_HISTORY](
	[funding_sources_history_id] [int] NOT NULL,
	[id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[fund_id] [int] NOT NULL,
	[amount_allocated] [money] NOT NULL,
	[funding_source_status_id] [int] NOT NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
	[change_type] [varchar](50) NULL,
	[history_modify_user] [int] NULL,
	[history_modify_date] [datetime] NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_FUNDING_SOURCES_HISTORY] PRIMARY KEY CLUSTERED 
(
	[funding_sources_history_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF



INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description]) 
	VALUES('GRANTEE_PROJECT_FUNDING_SOURCES_HISTORY', 1, 0, NULL);

