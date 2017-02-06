GO
/****** Object:  Table [dbo].[ORGANIZATION_DUE_DILIGENCE]    Script Date: 10/23/2008 10:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ORGANIZATION_DUE_DILIGENCE](
	[id] [int] NOT NULL,
	[organization_id] [int] NOT NULL,
	[tax_status_id] [int] NULL,
	[advanecd_ruling_expiration_date] [datetime] NULL,
	[last_verification_date] [datetime] NULL,
	[organization_audited] [bit] NULL,
	[audit_notes] [varchar](max) NULL,
 CONSTRAINT [PK_ORGANIZATION_DUE_DILIGENCE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF





INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description]) 
	VALUES('ORGANIZATION_DUE_DILIGENCE', 1, 0, NULL);