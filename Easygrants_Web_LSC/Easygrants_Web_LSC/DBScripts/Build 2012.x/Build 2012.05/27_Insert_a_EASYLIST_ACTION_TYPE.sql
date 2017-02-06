exec spupdate_idgen @select = 0

declare @new_id int

exec @new_id = getid_sel @table = 'a_easylist_action_type'

insert a_easylist_action_type
	(id,
	data_object_definition_key,
	easylist_action_id,
	sort_order)
	values(@new_id,
		'GARTracking',
		49,
		6)
