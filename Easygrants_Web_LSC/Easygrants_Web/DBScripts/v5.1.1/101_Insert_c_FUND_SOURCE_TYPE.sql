INSERT INTO [c_FUND_SOURCE_TYPE]([id], [abbr], [description], [sort_order]) 
	VALUES(1, 'Default Fund Type', 'Default Fund Type', 1);

INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description]) 
	VALUES('c_FUND_SOURCE_TYPE', 2, 1, NULL);