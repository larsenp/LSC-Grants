
GO
/****** Object:  Table [dbo].[c_ORGANIZATION_FISCAL_YEAR]    Script Date: 10/22/2008 17:29:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[c_ORGANIZATION_FISCAL_YEAR](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](300) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_ORGANIZATION_FISCAL_YEAR] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [c_ORGANIZATION_FISCAL_YEAR]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(1, 'FY2006', 'FY2006', 1, NULL);

INSERT INTO [c_ORGANIZATION_FISCAL_YEAR]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(2, 'FY2007', 'FY2007', 2, NULL);

INSERT INTO [c_ORGANIZATION_FISCAL_YEAR]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(3, 'FY2008', 'FY2008', 3, NULL);

INSERT INTO [c_ORGANIZATION_FISCAL_YEAR]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(4, 'FY2009', 'FY2009', 4, NULL);

INSERT INTO [c_ORGANIZATION_FISCAL_YEAR]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(5, 'FY2010', 'FY2010', 5, NULL);




INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description]) 
	VALUES('c_ORGANIZATION_FISCAL_YEAR', 6, 1, NULL);