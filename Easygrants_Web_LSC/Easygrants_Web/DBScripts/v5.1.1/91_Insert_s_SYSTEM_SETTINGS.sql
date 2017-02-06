INSERT INTO [s_SYSTEM_SETTINGS]([id], [sys_settings_name], [page_key]) 
	VALUES(3, 'Map Settings', 'MapSettingsList');


Update s_id_gen set next_id = 4 where table_name='s_SYSTEM_SETTINGS';
