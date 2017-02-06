INSERT a_REPORT_OUTPUT_DEFINITION
	(report_output_definition_id
	,definition_key
	,description
	,entity_dataobject_key
	,output_MIME_type
	,delete_on_view)
	VALUES
		(87
		,'PBIFLOIReviewPrimary'
		,'PBIF LOI Review - Primary'
		,'WfTaskAssignment'
		,'application/pdf'
		,0)

UPDATE s_ID_GEN
	SET next_id = 88
	WHERE table_name = 'a_REPORT_OUTPUT_DEFINITION'

select * from  a_REPORT_OUTPUT_DEFINITION where report_output_definition_id= 87