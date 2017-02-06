--Should have been taken care of by Build 8.3, script 19, but wasn't in production.

insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values
		('lsc_tig_budget_item',
		1,
		0,
		1)