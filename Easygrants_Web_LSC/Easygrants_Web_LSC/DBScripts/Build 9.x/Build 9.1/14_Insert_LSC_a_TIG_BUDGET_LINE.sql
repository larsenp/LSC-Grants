INSERT LSC_a_TIG_BUDGET_LINE
	(id,
	abbr,
	description,
	sort_order)
	VALUES(16,
		16,
		'Conference Fee',
		16)

UPDATE s_ID_GEN
	SET next_id = 17
	WHERE table_name = 'LSC_a_TIG_BUDGET_LINE'
