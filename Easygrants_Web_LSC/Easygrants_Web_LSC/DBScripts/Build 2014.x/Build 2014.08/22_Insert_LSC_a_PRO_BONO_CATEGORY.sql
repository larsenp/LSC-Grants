INSERT LSC_a_PRO_BONO_CATEGORY
	(id
	,time_period_id
	,abbr
	,description
	,sort_order
	,weighting
	,max_score)
	VALUES (1
		,19
		,'Project Design'
		,'Project Design'
		,1
		,60
		,4)

INSERT LSC_a_PRO_BONO_CATEGORY
	(id
	,time_period_id
	,abbr
	,description
	,sort_order
	,weighting
	,max_score)
	VALUES (2
		,19
		,'Organizational Capacity and Staffing'
		,'Organizational Capacity and Staffing'
		,2
		,25
		,4)

INSERT LSC_a_PRO_BONO_CATEGORY
	(id
	,time_period_id
	,abbr
	,description
	,sort_order
	,weighting
	,max_score)
	VALUES (3
		,19
		,'Cost-Effectiveness and Budget Adequacy'
		,'Cost-Effectiveness and Budget Adequacy'
		,3
		,15
		,4)

UPDATE s_ID_GEN
	SET next_id = 4
	WHERE table_name = 'LSC_a_PRO_BONO_CATEGORY'