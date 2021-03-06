

CREATE TABLE [dbo].[s_SHAREPOINT_LOG](
	[id] [int] NOT NULL,
	[event_type_id] [int] NULL,
	[definition_key] [varchar](500) NULL,
	[unique_id] [int] NULL,
	[old_value] [varchar](500) NULL,
	[new_value] [varchar](500) NULL,
	[sharepoint_conversion_status] [int] NULL CONSTRAINT [DF_s_SHAREPOINT_LOG_sharepoint_conversion_status]  DEFAULT ((0)),
	[create_date] [datetime] NULL,
	[create_user] [int] NULL,
 CONSTRAINT [PK_s_SHAREPOINT_LOG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF




INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description]) 
	VALUES('s_SHAREPOINT_LOG', 1, 0, NULL);

