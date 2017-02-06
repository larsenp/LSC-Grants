--Change fiscal application id 

UPDATE a_REPORT_OUTPUT_DEFINITION
	Set report_output_definition_id = 73
	where report_output_definition_id = 72

INSERT INTO a_REPORT_OUTPUT_DEFINITION
(report_output_definition_id,
definition_key,
[description],
entity_dataobject_key,
output_MIME_type,
delete_on_view,
generation_id)
VALUES
(
  72,
  'SubmitApp_PBIF',
  'Submit PBIF Application',
  'WfTaskAssignment',
  'application/pdf',
  0,
  NULL
  )
