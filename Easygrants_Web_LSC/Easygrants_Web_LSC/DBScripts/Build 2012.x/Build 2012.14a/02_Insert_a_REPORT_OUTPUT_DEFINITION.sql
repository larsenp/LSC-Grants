

ALTER TABLE a_REPORT_OUTPUT_DEFINITION 
  ALTER COLUMN definition_key varchar(40)


INSERT INTO [a_REPORT_OUTPUT_DEFINITION]
           ([report_output_definition_id]
           ,[definition_key]
           ,[description]
           ,[entity_dataobject_key]
           ,[output_MIME_type]
           ,[delete_on_view])
     VALUES
           (56
           ,'ReviewSubgrantApprovalRequestOPPStaff'
           ,'Review Subgrant Approval Request - OPP Staff'
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
           (57
           ,'ReviewSubgrantApprovalRequestOPPDirector'
           ,'Review Subgrant Approval Request - OPP Director'
           ,'WfTaskAssignment'
           ,'application/pdf'
           ,0)


UPDATE s_ID_GEN
	SET next_id = 58
	WHERE table_name = 'a_REPORT_OUTPUT_DEFINITION'
