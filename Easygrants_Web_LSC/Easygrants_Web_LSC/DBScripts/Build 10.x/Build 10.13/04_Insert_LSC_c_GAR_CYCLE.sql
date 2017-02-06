INSERT LSC_c_GAR_CYCLE
	(id,
	abbr,
	description,
	sort_order)
	VALUES(11,
		'2011',
		'2011 Year-End GAR Cycle',
		2011)

UPDATE s_ID_GEN
	SET next_id = 12
	WHERE table_name = 'LSC_c_GAR_CYCLE'
