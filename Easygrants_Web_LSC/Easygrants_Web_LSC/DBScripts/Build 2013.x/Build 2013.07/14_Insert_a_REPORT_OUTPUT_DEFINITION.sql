INSERT INTO [a_REPORT_OUTPUT_DEFINITION]
           ([report_output_definition_id]
           ,[definition_key]
           ,[description]
           ,[entity_dataobject_key]
           ,[output_MIME_type]
           ,[delete_on_view])
     VALUES
           (68
           ,'TIGLOI_O_R_WI_VP'
           ,'TIG LOI Vice President Review - O/R/WI'
           ,'WfTaskAssignment'
           ,'application/pdf'
           ,0)

INSERT INTO [a_REPORT_OUTPUT_DEFINITION]
           ([report_output_definition_id]
           ,[definition_key]
           ,[description]
           ,[entity_dataobject_key]
           ,[output_MIME_type]
           ,[delete_on_view])
     VALUES
           (69
           ,'TIGLOI_O_R_WI_President'
           ,'TIG LOI President Review - O/R/WI'
           ,'WfTaskAssignment'
           ,'application/pdf'
           ,0)

UPDATE s_ID_GEN
	SET next_id = 70
	WHERE table_name = 'a_REPORT_OUTPUT_DEFINITION'


select * from a_REPORT_OUTPUT_DEFINITION where definition_key like '%LOI%'