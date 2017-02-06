CREATE TABLE [dbo].[LSC_c_GAR_CYCLE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_GAR_CYCLE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT LSC_c_GAR_CYCLE
	(id,
	abbr,
	[description],
	sort_order)
	VALUES (1,
		'2001/2002',
		'2001/2002 GAR Cycle',
		2001)

INSERT LSC_c_GAR_CYCLE
	(id,
	abbr,
	[description],
	sort_order)
	VALUES (2,
		'2002/2003',
		'2002/2003 GAR Cycle',
		2002)

INSERT LSC_c_GAR_CYCLE
	(id,
	abbr,
	[description],
	sort_order)
	VALUES (3,
		'2003/2004',
		'2003/2004 GAR Cycle',
		2003)

INSERT LSC_c_GAR_CYCLE
	(id,
	abbr,
	[description],
	sort_order)
	VALUES (4,
		'2004/2005',
		'2004/2005 GAR Cycle',
		2004)

INSERT LSC_c_GAR_CYCLE
	(id,
	abbr,
	[description],
	sort_order)
	VALUES (5,
		'2005/2006',
		'2005/2006 GAR Cycle',
		2005)

INSERT LSC_c_GAR_CYCLE
	(id,
	abbr,
	[description],
	sort_order)
	VALUES (6,
		'2006/2007',
		'2006/2007 GAR Cycle',
		2006)

INSERT LSC_c_GAR_CYCLE
	(id,
	abbr,
	[description],
	sort_order)
	VALUES (7,
		'2007/2008',
		'2007/2008 GAR Cycle',
		2007)

INSERT LSC_c_GAR_CYCLE
	(id,
	abbr,
	[description],
	sort_order)
	VALUES (8,
		'2008/2009',
		'2008/2009 GAR Cycle',
		2008)

INSERT LSC_c_GAR_CYCLE
	(id,
	abbr,
	[description],
	sort_order)
	VALUES (9,
		'2009/2010',
		'2009/2010 GAR Cycle',
		2009)

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table]
           ,[lookup_table_type_id])
     VALUES
           ('LSC_c_GAR_CYCLE'
           ,10
           ,1
           ,2)
