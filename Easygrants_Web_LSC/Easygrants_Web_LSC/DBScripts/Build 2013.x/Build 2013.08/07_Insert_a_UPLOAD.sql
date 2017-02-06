

INSERT INTO [a_UPLOAD]
           ([upload_id]
           ,[upload_name]
           ,[allowed_file_extensions]
           ,[is_required]
           ,[create_date])
     VALUES
           (40
           ,'TIG Draft Evaluation Plan'
           ,'.doc, .docx, .pdf, .xls, .xlsx, .rtf'
           ,1
           ,getdate())



UPDATE a_UPLOAD
	SET allowed_file_extensions = allowed_file_extensions + ', .xls, .xlsx'
	WHERE upload_id in (16, 17, 18)
	
UPDATE s_ID_GEN
	SET next_id = 41
	WHERE table_name = 'a_UPLOAD'