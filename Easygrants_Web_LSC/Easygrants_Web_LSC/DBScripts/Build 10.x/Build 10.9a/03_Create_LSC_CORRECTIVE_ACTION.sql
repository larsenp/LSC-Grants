/****** Object:  Table [dbo].[LSC_CORRECTIVE_ACTION]    Script Date: 07/18/2011 16:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_CORRECTIVE_ACTION](
	[lsc_corrective_action_id] [int] NOT NULL,
	[lsc_oce_visit_id] [int] NULL,
	[corrective_action_number] [int] NULL,
	[corrective_action_text] [varchar](max) NULL,
	[grantee_response] [varchar](max) NULL,
	[corrective_action_completed] [bit] NULL,
	[corrective_action_comment] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_CORRECTIVE_ACTION] PRIMARY KEY CLUSTERED 
(
	[lsc_corrective_action_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT s_ID_GEN
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	VALUES('LSC_CORRECTIVE_ACTION',
		1,
		0,
		1)
