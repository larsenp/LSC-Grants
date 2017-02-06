DELETE FROM c_FILE_EXTENSIONS WHERE id in (7,8,9,10)

INSERT INTO [c_FILE_EXTENSIONS]([id], [abbr], [description], [sort_order]) 
	VALUES(7, 'jpg', 'jpg', 7);


INSERT INTO [c_FILE_EXTENSIONS]([id], [abbr], [description], [sort_order]) 
	VALUES(8, '.docx', '.docx', 8);

INSERT INTO [c_FILE_EXTENSIONS]([id], [abbr], [description], [sort_order]) 
	VALUES(9, '.xlsx', '.xlsx', 9);

INSERT INTO [c_FILE_EXTENSIONS]([id], [abbr], [description], [sort_order]) 
	VALUES(10, '.pptx', '.pptx', 10);




Update s_id_gen set next_id=11 where table_name='c_FILE_EXTENSIONS';