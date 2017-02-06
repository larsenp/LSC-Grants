INSERT LSC_c_SUBGRANT_GRANT_TYPE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(5
		,'Pro Bono'
		,'Pro Bono Innovation Fund'
		,5)

UPDATE s_ID_GEN
	SET next_id = 6
	WHERE table_name = 'LSC_c_SUBGRANT_GRANT_TYPE'