INSERT LSC_c_GAR_CYCLE
	(id
	,abbr
	,description
	,sort_order
	,is_interim
	,time_period_id)
	VALUES
		(16
		,'2014 Interim'
		,'2014 Interim GAR Cycle'
		,20140
		,1
		,19)

UPDATE s_ID_GEN
	SET next_id = 17
	where table_name = 'LSC_c_GAR_CYCLE'