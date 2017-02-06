INSERT LSC_c_NET_ASSET_FUND_BALANCE_RANGE_WAIVER
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(3
		,'N/A'
		,'N/A'
		,3)

UPDATE s_ID_GEN
	SET next_id = 4
	WHERE table_name = 'LSC_c_NET_ASSET_FUND_BALANCE_RANGE_WAIVER'
