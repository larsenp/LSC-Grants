/****** Object:  Table [dbo].[LSC_c_RENEWAL_RECOMMENDATION]    Script Date: 06/02/2008 09:30:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_RENEWAL_RECOMMENDATION](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_RENEWAL_RECOMMENDATION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT LSC_c_RENEWAL_RECOMMENDATION
	(id, abbr, description, sort_order)
	VALUES
		(1, 'RENEW', 'Renew Grant', 1)

INSERT LSC_c_RENEWAL_RECOMMENDATION
	(id, abbr, description, sort_order)
	VALUES
		(2, 'RENEW SPECIAL', 'Renew Grant with Special Conditions', 2)

INSERT LSC_c_RENEWAL_RECOMMENDATION
	(id, abbr, description, sort_order)
	VALUES
		(3, 'DO NOT RENEW', 'Do Not Renew Grant', 3)

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_c_RENEWAL_RECOMMENDATION', 4, 1)