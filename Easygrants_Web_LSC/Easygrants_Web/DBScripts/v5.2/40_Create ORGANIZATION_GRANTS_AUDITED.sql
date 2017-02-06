GO
/****** Object:  Table [dbo].[ORGANIZATION_GRANTS_AUDITED]    Script Date: 10/22/2008 17:42:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORGANIZATION_GRANTS_AUDITED](
	[id] [int] NOT NULL,
	[organization_id] [int] NULL,
	[grantee_project_id] [int] NULL,
 CONSTRAINT [PK_ORGANIZATION_GRANTS_AUDITED] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]



INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description]) 
	VALUES('ORGANIZATION_GRANTS_AUDITED', 1, 0, NULL);