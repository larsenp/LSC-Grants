--Insert PA3, Criterion 1 for purposes of PQV reports
--(competitive application review subdivides this criterion into 1a, 1b, and 1c)

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
		'1',
		'Legal representation'
		FROM LSC_a_REVIEW_PERFORMANCE_AREA
		WHERE sort_order = 3

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
