DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'LSC_REVIEW_CYCLE_STAGE', @mode = 2

INSERT LSC_REVIEW_CYCLE_STAGE
	(lsc_review_cycle_stage_id
	,review_cycle_stage_id
	,time_period_id)
	VALUES
		(@new_id
		,261
		,21)

EXEC @new_id = getid_sel @table = 'LSC_REVIEW_CYCLE_STAGE', @mode = 2

INSERT LSC_REVIEW_CYCLE_STAGE
	(lsc_review_cycle_stage_id
	,review_cycle_stage_id
	,time_period_id)
	VALUES
		(@new_id
		,262
		,21)
