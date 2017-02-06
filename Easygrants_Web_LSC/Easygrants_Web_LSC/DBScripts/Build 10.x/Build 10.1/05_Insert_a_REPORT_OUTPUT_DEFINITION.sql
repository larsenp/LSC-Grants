INSERT INTO [a_REPORT_OUTPUT_DEFINITION]
           ([report_output_definition_id]
           ,[definition_key]
           ,[description]
           ,[entity_dataobject_key]
           ,[output_MIME_type]
           ,[delete_on_view])
     VALUES
           (24
           ,'PostPQVCompetitiveApplication'
           ,'Post-PQV Competitive Grant Application'
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
           (25
           ,'PostPQVRenewalApplication'
           ,'Post-PQV Grant Renewal Application'
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
           (26
           ,'TIGLOI_O_R_WI_Staff'
           ,'TIG LOI Staff Review - O/R/WI'
           ,'WfTaskAssignment'
           ,'application/pdf'
           ,0)

UPDATE s_ID_GEN
	SET next_id = 27
	WHERE table_name = 'a_REPORT_OUTPUT_DEFINITION'



