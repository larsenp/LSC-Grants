IF NOT EXISTS(SELECT * FROM a_REPORT_OUTPUT_DEFINITION WHERE definition_key='SubmitLOI_PBIF')

BEGIN
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
  86,
  'SubmitLOI_PBIF',
  'Submit PBIF LOI',
  'WfTaskAssignment',
  'application/pdf',
  0,
  NULL
  )

  END
  GO
