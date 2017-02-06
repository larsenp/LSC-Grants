INSERT INTO [a_REPORT_OUTPUT_DEFINITION]
           ([report_output_definition_id]
           ,[definition_key]
           ,[description]
           ,[entity_dataobject_key]
           ,[output_MIME_type]
           ,[delete_on_view]
           ,[generation_id])
     VALUES
           (9
           ,'TIGAppOpenReplicationWebImp'
           ,'TIG Application - Open/Replication/Web Imp.'
           ,'WfTaskAssignment'
           ,'application/pdf'
           ,0
           ,NULL)

INSERT INTO [a_REPORT_OUTPUT_DEFINITION]
           ([report_output_definition_id]
           ,[definition_key]
           ,[description]
           ,[entity_dataobject_key]
           ,[output_MIME_type]
           ,[delete_on_view]
           ,[generation_id])
     VALUES
           (10
           ,'TIGAppWebRenewalCont'
           ,'TIG Application - Website Renewal/Continuation'
           ,'WfTaskAssignment'
           ,'application/pdf'
           ,0
           ,NULL)

UPDATE s_ID_GEN
	SET next_id = 11
	WHERE table_name = 'a_REPORT_OUTPUT_DEFINITION'
