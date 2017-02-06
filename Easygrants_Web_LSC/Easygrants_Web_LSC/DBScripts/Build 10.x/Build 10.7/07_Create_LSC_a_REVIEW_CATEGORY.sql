/****** Object:  Table [dbo].[LSC_a_REVIEW_CATEGORY]    Script Date: 06/28/2011 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_a_REVIEW_CATEGORY](
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[lsc_review_performance_area_id] [int] NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_a_REVIEW_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--pa1: c1, c2, c3
INSERT INTO [LSC_a_REVIEW_CATEGORY]
           ([id]
           ,[lsc_review_performance_area_id]
           ,[sort_order])
     VALUES
           (1
           ,13
           ,1)

--pa1: c4
INSERT INTO [LSC_a_REVIEW_CATEGORY]
           ([id]
           ,[lsc_review_performance_area_id]
           ,[sort_order])
     VALUES
           (2
           ,13
           ,2)

--pa2: c1
INSERT INTO [LSC_a_REVIEW_CATEGORY]
           ([id]
           ,[lsc_review_performance_area_id]
           ,[sort_order])
     VALUES
           (4
           ,14
           ,1)

--pa2: c2, c3
INSERT INTO [LSC_a_REVIEW_CATEGORY]
           ([id]
           ,[lsc_review_performance_area_id]
           ,[sort_order])
     VALUES
           (5
           ,14
           ,2)

--pa3: c1a
INSERT INTO [LSC_a_REVIEW_CATEGORY]
           ([id]
           ,[lsc_review_performance_area_id]
           ,[sort_order])
     VALUES
           (6
           ,15
           ,1)

--pa3: c1b
INSERT INTO [LSC_a_REVIEW_CATEGORY]
           ([id]
           ,[lsc_review_performance_area_id]
           ,[sort_order])
     VALUES
           (7
           ,15
           ,2)

--pa3: c1c
INSERT INTO [LSC_a_REVIEW_CATEGORY]
           ([id]
           ,[lsc_review_performance_area_id]
           ,[sort_order])
     VALUES
           (8
           ,15
           ,3)

--pa3: c2
INSERT INTO [LSC_a_REVIEW_CATEGORY]
           ([id]
           ,[lsc_review_performance_area_id]
           ,[sort_order])
     VALUES
           (9
           ,15
           ,4)

--pa3: c3, c4
INSERT INTO [LSC_a_REVIEW_CATEGORY]
           ([id]
           ,[lsc_review_performance_area_id]
           ,[sort_order])
     VALUES
           (10
           ,15
           ,5)

--pa4: c1
INSERT INTO [LSC_a_REVIEW_CATEGORY]
           ([id]
           ,[lsc_review_performance_area_id]
           ,[sort_order])
     VALUES
           (11
           ,16
           ,1)

--pa4: c2
INSERT INTO [LSC_a_REVIEW_CATEGORY]
           ([id]
           ,[lsc_review_performance_area_id]
           ,[sort_order])
     VALUES
           (12
           ,16
           ,2)

--pa4: c3
INSERT INTO [LSC_a_REVIEW_CATEGORY]
           ([id]
           ,[lsc_review_performance_area_id]
           ,[sort_order])
     VALUES
           (13
           ,16
           ,3)

--pa4: c4
INSERT INTO [LSC_a_REVIEW_CATEGORY]
           ([id]
           ,[lsc_review_performance_area_id]
           ,[sort_order])
     VALUES
           (14
           ,16
           ,4)

--pa4: c5
INSERT INTO [LSC_a_REVIEW_CATEGORY]
           ([id]
           ,[lsc_review_performance_area_id]
           ,[sort_order])
     VALUES
           (15
           ,16
           ,5)

--pa4: c6
INSERT INTO [LSC_a_REVIEW_CATEGORY]
           ([id]
           ,[lsc_review_performance_area_id]
           ,[sort_order])
     VALUES
           (16
           ,16
           ,6)

--pa4: c7
INSERT INTO [LSC_a_REVIEW_CATEGORY]
           ([id]
           ,[lsc_review_performance_area_id]
           ,[sort_order])
     VALUES
           (17
           ,16
           ,7)

--pa4: c9
INSERT INTO [LSC_a_REVIEW_CATEGORY]
           ([id]
           ,[lsc_review_performance_area_id]
           ,[sort_order])
     VALUES
           (18
           ,16
           ,8)


INSERT s_ID_GEN
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	VALUES('LSC_a_REVIEW_CATEGORY',
		19,
		1,
		1)

GO

SET ANSI_PADDING OFF
