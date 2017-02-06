INSERT LSC_c_GAR_CYCLE
	(id
	,abbr
	,description
	,sort_order
	,is_interim
	,time_period_id)
	VALUES
		(14
		,'2013 Interim'
		,'2013 Interim GAR Cycle'
		,20130
		,1
		,18)

UPDATE s_ID_GEN
	SET next_id = 15
	where table_name = 'LSC_c_GAR_CYCLE'