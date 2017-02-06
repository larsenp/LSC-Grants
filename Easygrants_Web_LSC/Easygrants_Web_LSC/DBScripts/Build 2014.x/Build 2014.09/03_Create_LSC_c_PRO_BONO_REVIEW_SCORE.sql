CREATE TABLE [dbo].[LSC_c_PRO_BONO_REVIEW_SCORE](
	[id] [int] NOT NULL,
	[time_period_id] [int] NULL,
	[score_value] [int] NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_LSC_c_PRO_BONO_REVIEW_SCORE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT LSC_c_PRO_BONO_REVIEW_SCORE
	(id
	,time_period_id
	,score_value
	,description)
	VALUES
		(1
		,19
		,1
		,'Not Acceptable')

INSERT LSC_c_PRO_BONO_REVIEW_SCORE
	(id
	,time_period_id
	,score_value
	,description)
	VALUES
		(2
		,19
		,2
		,'Acceptable')

INSERT LSC_c_PRO_BONO_REVIEW_SCORE
	(id
	,time_period_id
	,score_value
	,description)
	VALUES
		(3
		,19
		,3
		,'Good')

INSERT LSC_c_PRO_BONO_REVIEW_SCORE
	(id
	,time_period_id
	,score_value
	,description)
	VALUES
		(4
		,19
		,4
		,'Excellent')

INSERT INTO s_ID_GEN (table_name,next_id, is_code_table) VALUES ('LSC_c_PRO_BONO_REVIEW_SCORE',5,1)

