INSERT INTO [a_EVENT_MANAGER_EVENTS]([id], [event_name], [event_type_id], [short_description], [long_description], [is_active], [process_name], [process_type_id], [sort_order]) 
	VALUES(6, 'Pre-Assignment Suffix Event', 1, 'Checks to make sure Suffix is present', 'Checks to make sure Suffix is present', 1, 'spPREASSIGNMENT_SUFFIXCHECK', 1, 1);


INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description], [lookup_table_type_id]) 
	VALUES('a_EVENT_MANAGER_EVENTS', 7, 0, NULL, 1);