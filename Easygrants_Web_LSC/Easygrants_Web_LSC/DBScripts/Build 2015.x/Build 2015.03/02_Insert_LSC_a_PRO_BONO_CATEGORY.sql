INSERT LSC_a_PRO_BONO_CATEGORY
	(id
	,time_period_id
	,abbr
	,description
	,sort_order
	,max_score
	,weighting)
	VALUES
		(4
		,20
		,'Project Description'
		,'Project Description'
		,1
		,3
		,60)

INSERT LSC_a_PRO_BONO_CATEGORY
	(id
	,time_period_id
	,abbr
	,description
	,sort_order
	,max_score
	,weighting)
	VALUES
		(5
		,20
		,'Organizational Capacity, Staffing and Project Partners'
		,'Organizational Capacity, Staffing and Project Partners'
		,2
		,3
		,25)

INSERT LSC_a_PRO_BONO_CATEGORY
	(id
	,time_period_id
	,abbr
	,description
	,sort_order
	,max_score
	,weighting)
	VALUES
		(6
		,20
		,'Budget and Timeline'
		,'Budget and Timeline'
		,3
		,3
		,15)

UPDATE s_ID_GEN
	SET next_id = 7
	WHERE table_name = 'LSC_a_PRO_BONO_CATEGORY'