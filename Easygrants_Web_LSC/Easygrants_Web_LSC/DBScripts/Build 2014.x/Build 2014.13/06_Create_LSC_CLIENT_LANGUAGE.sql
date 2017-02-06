SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_CLIENT_LANGUAGE](
	[lsc_client_language_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[lsc_lang_code_id] [int] NULL,
	[count] [int] NULL,
 CONSTRAINT [PK_LSC_CLIENT_LANGUAGE] PRIMARY KEY CLUSTERED 
(
	[lsc_client_language_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT s_ID_GEN
	(table_name
	,next_id
	,is_code_table
	,lookup_table_type_id)
	VALUES
		('LSC_CLIENT_LANGUAGE'
		,1
		,0
		,1)

