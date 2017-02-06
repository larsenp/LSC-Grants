INSERT INTO [a_REPORT_OUTPUT_DEFINITION]
           ([report_output_definition_id]
           ,[definition_key]
           ,[description]
           ,[entity_dataobject_key]
           ,[output_MIME_type]
           ,[delete_on_view]
           ,[generation_id])
     VALUES
           (36
           ,'CompApp_OCEDirReview'
           ,'Competition App OCE Director Review'
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
           (37
           ,'RenewalApp_OCEDirReview'
           ,'Renewal App OCE Director Review'
           ,'WfTaskAssignment'
           ,'application/pdf'
           ,0
           ,NULL)


UPDATE s_ID_GEN
	SET next_id = 38
	WHERE table_name = 'a_REPORT_OUTPUT_DEFINITION'
