CREATE TABLE [dbo].[GRANTEE_PROJECT_FUNDING_SOURCES](
	[id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[fund_id] [int] NOT NULL,
	[amount_allocated] [money] NOT NULL,
	[funding_source_status_id] [int] NOT NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_GRANTEE_PROJECT_FUNDING_SOURCES] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description]) 
	VALUES('GRANTEE_PROJECT_FUNDING_SOURCES', 1, 0, NULL);











