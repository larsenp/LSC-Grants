DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'a_REPORT_OUTPUT_DEFINITION', @mode = 2

INSERT a_REPORT_OUTPUT_DEFINITION
           (report_output_definition_id
           ,definition_key
           ,description
           ,entity_dataobject_key
           ,output_MIME_type
           ,delete_on_view)
     VALUES
           (@new_id
           ,'TIGFinalBudget2014'
           ,'TIG Final Budget (2014 and later)'
           ,'WfTaskAssignment'
           ,'application/pdf'
           ,0)
