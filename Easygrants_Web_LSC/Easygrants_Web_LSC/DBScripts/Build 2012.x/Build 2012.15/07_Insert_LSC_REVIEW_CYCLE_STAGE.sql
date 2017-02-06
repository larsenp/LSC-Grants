-- Run this after review cycles has been created in the system. 
--- Chcek the ID's in live system. Execute this script after review stages has been created. 

DECLARE @new_id int

EXEC @new_id = getid_sel @table = 'LSC_REVIEW_CYCLE_STAGE'

INSERT LSC_REVIEW_CYCLE_STAGE
	(lsc_review_cycle_stage_id
	,review_cycle_stage_id
	,time_period_id)
	VALUES(@new_id
		,99
		,18)


EXEC @new_id = getid_sel @table = 'LSC_REVIEW_CYCLE_STAGE'

INSERT LSC_REVIEW_CYCLE_STAGE
	(lsc_review_cycle_stage_id
	,review_cycle_stage_id
	,time_period_id)
	VALUES(@new_id
		,100
		,18)



EXEC @new_id = getid_sel @table = 'LSC_REVIEW_CYCLE_STAGE'

INSERT LSC_REVIEW_CYCLE_STAGE
	(lsc_review_cycle_stage_id
	,review_cycle_stage_id
	,time_period_id)
	VALUES(@new_id
		,101
		,18)

EXEC @new_id = getid_sel @table = 'LSC_REVIEW_CYCLE_STAGE'

INSERT LSC_REVIEW_CYCLE_STAGE
	(lsc_review_cycle_stage_id
	,review_cycle_stage_id
	,time_period_id)
	VALUES(@new_id
		,102
		,18)


EXEC @new_id = getid_sel @table = 'LSC_REVIEW_CYCLE_STAGE'

INSERT LSC_REVIEW_CYCLE_STAGE
	(lsc_review_cycle_stage_id
	,review_cycle_stage_id
	,time_period_id)
	VALUES(@new_id
		,103
		,18)


EXEC @new_id = getid_sel @table = 'LSC_REVIEW_CYCLE_STAGE'

INSERT LSC_REVIEW_CYCLE_STAGE
	(lsc_review_cycle_stage_id
	,review_cycle_stage_id
	,time_period_id)
	VALUES(@new_id
		,104
		,18)