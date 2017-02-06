INSERT INTO [c_FILE_EXTENSIONS]([id], [abbr], [description], [sort_order]) 
	VALUES(7, '.docx', '.docx', 7);

INSERT INTO [c_FILE_EXTENSIONS]([id], [abbr], [description], [sort_order]) 
	VALUES(8, '.xlsx', '.xlsx', 8);

INSERT INTO [c_FILE_EXTENSIONS]([id], [abbr], [description], [sort_order]) 
	VALUES(9, '.pptx', '.pptx', 9);




Update s_id_gen set next_id=10 where table_name='c_FILE_EXTENSIONS';
