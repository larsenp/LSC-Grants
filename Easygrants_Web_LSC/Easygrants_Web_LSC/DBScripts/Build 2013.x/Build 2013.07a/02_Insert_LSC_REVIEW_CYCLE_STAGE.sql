DECLARE @new_id int

EXEC @new_id = getid_sel @table = 'LSC_REVIEW_CYCLE_STAGE'

INSERT LSC_REVIEW_CYCLE_STAGE
	(lsc_review_cycle_stage_id
	,review_cycle_stage_id
	,time_period_id)
	VALUES(@new_id
		,107
		,18)

EXEC @new_id = getid_sel @table = 'LSC_REVIEW_CYCLE_STAGE'

INSERT LSC_REVIEW_CYCLE_STAGE
	(lsc_review_cycle_stage_id
	,review_cycle_stage_id
	,time_period_id)
	VALUES(@new_id
		,108
		,18)
