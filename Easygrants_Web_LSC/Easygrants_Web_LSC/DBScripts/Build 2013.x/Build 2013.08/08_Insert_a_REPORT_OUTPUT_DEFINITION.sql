INSERT INTO [a_REPORT_OUTPUT_DEFINITION]
           ([report_output_definition_id]
           ,[definition_key]
           ,[description]
           ,[entity_dataobject_key]
           ,[output_MIME_type]
           ,[delete_on_view])
     VALUES
           (70
           ,'SandyApplication'
           ,'Submit Sandy Grant Application'
           ,'WfTaskAssignment'
           ,'application/pdf'
           ,0)

UPDATE s_ID_GEN
	SET next_id = 71
	WHERE table_name = 'a_REPORT_OUTPUT_DEFINITION'