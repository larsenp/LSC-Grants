INSERT INTO [a_CORRESPONDENCE_DEFINITION]
           ([correspondence_definition_id]
           ,[correspondence_key]
           ,[title]
           ,[correspondence_to]
           ,[correspondence_from]
           ,[correspondence_cc]
           ,[correspondence_bcc]
           ,[subject]
           ,[body]
           ,[is_html]
           ,[user_id]
           ,[id]
           ,[correspondence_description]
           ,[is_log]
           ,[definition_key_id]
           ,[correspondence_from_name])

	SELECT [correspondence_definition_id]
		  ,[correspondence_key]
		  ,[title]
		  ,[correspondence_to]
		  ,[correspondence_from]
		  ,[correspondence_cc]
		  ,[correspondence_bcc]
		  ,[subject]
		  ,[body]
		  ,[is_html]
		  ,[user_id]
		  ,[id]
		  ,[correspondence_description]
		  ,[is_log]
		  ,[definition_key_id]
		  ,[correspondence_from_name]
	  FROM [lsc-eg5dev].Easygrants_tig_migration_test.[dbo].[a_CORRESPONDENCE_DEFINITION]
		where correspondence_definition_id in (1003, 1004)

UPDATE s_id_gen 
	SET next_id = 1005
	where table_name = 'a_correspondence_definition'
