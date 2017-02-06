DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'LSC_a_PRO_BONO_CATEGORY', @mode = 2

INSERT LSC_a_PRO_BONO_CATEGORY
	(id
	,time_period_id
	,abbr
	,description
	,sort_order
	,max_score
	,weighting)
	VALUES
		(@new_id
		,21
		,'Project Design'	
		,'Project Design'	
		,1
		,3
		,60)

EXEC @new_id = getid_sel @table = 'LSC_a_PRO_BONO_CATEGORY', @mode = 2

INSERT LSC_a_PRO_BONO_CATEGORY
	(id
	,time_period_id
	,abbr
	,description
	,sort_order
	,max_score
	,weighting)
	VALUES
		(@new_id
		,21
		,'Project Staff, Organizational Capacity and Project Partners'
		,'Project Staff, Organizational Capacity and Project Partners'
		,2
		,3
		,25)

EXEC @new_id = getid_sel @table = 'LSC_a_PRO_BONO_CATEGORY', @mode = 2

INSERT LSC_a_PRO_BONO_CATEGORY
	(id
	,time_period_id
	,abbr
	,description
	,sort_order
	,max_score
	,weighting)
	VALUES
		(@new_id
		,21
		,'Budget and Timeline'
		,'Budget and Timeline'
		,3
		,3
		,15)
