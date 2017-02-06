/****** Object:  Table [dbo].[LSC_a_PRO_BONO_CATEGORY]    Script Date: 06/18/2014 17:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_a_PRO_BONO_CATEGORY](
	[id] [int] NOT NULL,
	[time_period_id] [int] NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[max_score] [int] NULL,
	[weighting] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_a_PRO_BONO_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT INTO s_ID_GEN (table_name,next_id, is_code_table) VALUES ('LSC_a_PRO_BONO_CATEGORY',1,1)

CREATE TABLE [dbo].[LSC_a_PRO_BONO_SUBCATEGORY](
	[id] [int] NOT NULL,
	[lsc_pro_bono_category_id] [int] NULL,
	[abbr] [varchar](200) NULL,
	[description] [varchar](1000) NULL,
	[max_score] [int] NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_a_PRO_BONO_SUBCATEGORY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT INTO s_ID_GEN (table_name,next_id, is_code_table) VALUES ('LSC_a_PRO_BONO_SUBCATEGORY',1,1)

CREATE TABLE [dbo].[LSC_PRO_BONO_REVIEW_SCORE](
	[lsc_pro_bono_review_score_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[lsc_pro_bono_category_id] [int] NULL,
	[lsc_pro_bono_subcategory_id] [int] NULL,
	[score] [int] NULL,
	[comment] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_PRO_BONO_REVIEW_SCORE] PRIMARY KEY CLUSTERED 
(
	[lsc_pro_bono_review_score_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT INTO s_ID_GEN (table_name,next_id, is_code_table) VALUES ('LSC_PRO_BONO_REVIEW_SCORE',1,0)

SET ANSI_PADDING OFF
