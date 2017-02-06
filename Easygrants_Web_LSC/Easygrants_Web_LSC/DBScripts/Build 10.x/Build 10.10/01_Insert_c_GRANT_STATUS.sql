INSERT c_GRANT_STATUS
	(id,
	abbr,
	description,
	sort_order)
	VALUES(9,
		'Negotiation',
		'Negotiation',
		9)

UPDATE s_ID_GEN
	SET next_id = 10
	WHERE table_name = 'c_GRANT_STATUS'
