INSERT INTO [s_SYSTEM_SETTINGS]([id], [sys_settings_name], [page_key], [sys_settings_value]) 
	VALUES(4, 'GoogleAnalytics', NULL, 'UA-5275041-1');

Update s_id_gen set next_id = 5 where table_name='s_SYSTEM_SETTINGS';