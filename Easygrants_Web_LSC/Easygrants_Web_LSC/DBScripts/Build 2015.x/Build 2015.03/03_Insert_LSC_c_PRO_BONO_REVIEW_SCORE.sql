INSERT LSC_c_PRO_BONO_REVIEW_SCORE
	(id
	,time_period_id
	,score_value
	,description)
	VALUES
		(5
		,20
		,0
		,'Not Acceptable')

INSERT LSC_c_PRO_BONO_REVIEW_SCORE
	(id
	,time_period_id
	,score_value
	,description)
	VALUES
		(6
		,20
		,1
		,'Acceptable')

INSERT LSC_c_PRO_BONO_REVIEW_SCORE
	(id
	,time_period_id
	,score_value
	,description)
	VALUES
		(7
		,20
		,2
		,'Good')

INSERT LSC_c_PRO_BONO_REVIEW_SCORE
	(id
	,time_period_id
	,score_value
	,description)
	VALUES
		(8
		,20
		,3
		,'Excellent')

UPDATE s_ID_GEN
	SET next_id = 9
	WHERE table_name = 'LSC_c_PRO_BONO_REVIEW_SCORE'