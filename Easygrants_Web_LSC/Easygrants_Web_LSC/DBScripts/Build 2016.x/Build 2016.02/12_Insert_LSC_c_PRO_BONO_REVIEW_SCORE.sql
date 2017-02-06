DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'LSC_c_PRO_BONO_REVIEW_SCORE', @mode = 2

INSERT LSC_c_PRO_BONO_REVIEW_SCORE
	(id
	,time_period_id
	,score_value
	,description)
	VALUES
		(@new_id
		,21
		,0
		,'Not Acceptable')

EXEC @new_id = getid_sel @table = 'LSC_c_PRO_BONO_REVIEW_SCORE', @mode = 2

INSERT LSC_c_PRO_BONO_REVIEW_SCORE
	(id
	,time_period_id
	,score_value
	,description)
	VALUES
		(@new_id
		,21
		,1
		,'Acceptable')

EXEC @new_id = getid_sel @table = 'LSC_c_PRO_BONO_REVIEW_SCORE', @mode = 2

INSERT LSC_c_PRO_BONO_REVIEW_SCORE
	(id
	,time_period_id
	,score_value
	,description)
	VALUES
		(@new_id
		,21
		,2
		,'Good')

EXEC @new_id = getid_sel @table = 'LSC_c_PRO_BONO_REVIEW_SCORE', @mode = 2

INSERT LSC_c_PRO_BONO_REVIEW_SCORE
	(id
	,time_period_id
	,score_value
	,description)
	VALUES
		(@new_id
		,21
		,3
		,'Excellent')

