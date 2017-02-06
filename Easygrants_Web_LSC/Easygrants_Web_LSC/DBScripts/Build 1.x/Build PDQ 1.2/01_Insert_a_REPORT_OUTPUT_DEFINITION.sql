declare @next_id int

exec @next_id = getid_sel @table = 'a_report_output_definition'

insert a_report_output_definition
	(report_output_definition_id,
	definition_key,
	description,
	entity_dataobject_key,
	output_MIME_type,
	delete_on_view)
	values
		(@next_id,
		'Renewal',
		'Renewal Application',
		'WfTaskAssignment', 
		'application/pdf',
		0)