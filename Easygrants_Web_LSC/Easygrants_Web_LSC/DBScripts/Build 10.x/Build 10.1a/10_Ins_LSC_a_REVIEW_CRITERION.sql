--Insert PA1, Criterion 3, PA2, Criteria 2 and 3, and PA4, Criterion 8 for purposes of PQV reports
--(competitive application review groups these two together as criteria 2 & 3)

CREATE TABLE #c(
	ident int identity(0,1),
	[id] [int] NULL,
	[lsc_review_performance_area_id] [int] NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL)

INSERT #c
	([lsc_review_performance_area_id],
	[abbr],
	[description])
	SELECT id,
		'3',
		'Implementation'
		FROM LSC_a_REVIEW_PERFORMANCE_AREA
		WHERE sort_order = 1

INSERT #c
	([lsc_review_performance_area_id],
	[abbr],
	[description])
	SELECT id,
		'2',
		'Engagement with the low-income population'
		FROM LSC_a_REVIEW_PERFORMANCE_AREA
		WHERE sort_order = 2

INSERT #c
	([lsc_review_performance_area_id],
	[abbr],
	[description])
	SELECT id,
		'3',
		'Access and utilization by the low-income population'
		FROM LSC_a_REVIEW_PERFORMANCE_AREA
		WHERE sort_order = 2

INSERT #c
	([lsc_review_performance_area_id],
	[abbr],
	[description])
	SELECT id,
		'8',
		'Coherent and comprehensive delivery structure'
		FROM LSC_a_REVIEW_PERFORMANCE_AREA
		WHERE sort_order = 4

DECLARE @next_id int,
	@rowcount int

EXECUTE @next_id = [spGETID_RANGE_SEL] 
   @table = 'LSC_a_REVIEW_CRITERION'
  ,@count = @rowcount
  ,@mode = 2

UPDATE #c
	SET id = ident + @next_id

INSERT INTO [LSC_a_REVIEW_CRITERION]
           ([id]
           ,[lsc_review_performance_area_id]
           ,[abbr]
           ,[description])
	SELECT [id]
           ,[lsc_review_performance_area_id]
           ,[abbr]
           ,[description]
		FROM #c

SELECT * FROM #c
DROP TABLE #c
