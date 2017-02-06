INSERT INTO [a_MAP_SETTINGS]([id], [map_key], [easygrants_site_name], [easygrants_site_url], [map_site_url], [map_width], [map_height], [map_zoom], [marker_color]) 
	VALUES(1, 'ABQIAAAANlcMtZ15pKeQ4BfGv9OiWxT2yXp_ZAY8_ufC3CFXhHIE1NvwkxQ1CLAFk2diiq2uJA7g_zEXEfPP5g', 'localhost', 'localhost', 'http://maps.google.com/staticmap', 500, 150, 5, 'red');

INSERT INTO [a_MAP_SETTINGS]([id], [map_key], [easygrants_site_name], [easygrants_site_url], [map_site_url], [map_width], [map_height], [map_zoom], [marker_color]) 
	VALUES(2, 'ABQIAAAANlcMtZ15pKeQ4BfGv9OiWxQFprhH2X9Vf-WhqlVgv4xaChB81xQ_Hkc9ze6oSsRH0UPx9EYHXKIoCg', 'Easygrants Stage', '63.210.59.28', 'http://maps.google.com/staticmap', 500, 150, 5, 'red');

update s_id_gen set next_id = 3 where table_name = 'a_MAP_SETTINGS'