UPDATE LSC_c_FINANCIAL_GOV_BODY
	SET end_date = '2015-1-1'
	WHERE id = 1

INSERT LSC_c_FINANCIAL_GOV_BODY
	(id
	,abbr
	,description
	,sort_order)
	VALUES(
		7
		,'Other'
		,'Other'
		,7)

UPDATE s_ID_GEN
	SET next_id = 8
	WHERE table_name = 'LSC_c_FINANCIAL_GOV_BODY'