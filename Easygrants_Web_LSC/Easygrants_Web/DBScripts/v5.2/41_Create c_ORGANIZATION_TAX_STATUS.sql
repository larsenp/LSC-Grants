GO
/****** Object:  Table [dbo].[c_ORGANIZATION_TAX_STATUS]    Script Date: 10/23/2008 10:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_ORGANIZATION_TAX_STATUS](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](300) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_ORGANIZATION_TAX_STATUS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


INSERT INTO [c_ORGANIZATION_TAX_STATUS]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(1, 'Non-profit 501(c)(3)', 'Non-profit 501(c)(3)', 1, NULL);

INSERT INTO [c_ORGANIZATION_TAX_STATUS]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(2, 'Public', 'Public, e.g. State Agency', 2, NULL);

INSERT INTO [c_ORGANIZATION_TAX_STATUS]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(3, 'Other Non-profit', 'Other Non-profit', 3, NULL);

INSERT INTO [c_ORGANIZATION_TAX_STATUS]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(4, 'For-profit', 'For-profit Organization', 4, NULL);

INSERT INTO [c_ORGANIZATION_TAX_STATUS]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(5, 'Individual', 'Individual Consultant', 5, NULL);

INSERT INTO [c_ORGANIZATION_TAX_STATUS]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(6, 'Advanced Non-Profit', 'Advanced Non-Profit 501(c)(3)', 6, NULL);


INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description]) 
	VALUES('c_ORGANIZATION_TAX_STATUS', 7, 0, NULL);