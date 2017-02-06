INSERT INTO [a_REPORT_OUTPUT_DEFINITION]
([report_output_definition_id]
,[definition_key]
,[description]
,[entity_dataobject_key]
,[output_MIME_type]
,[delete_on_view])
VALUES
(33
,'PostPQVCompApp_StaffReview'
,'Post PQV Competition Staff Review'
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
(34
,'PostPQVRenewApp_StaffReview'
,'Post PQV Renewal Staff Review'
,'WfTaskAssignment'
,'application/pdf'
,0)



UPDATE s_ID_GEN
SET next_id = 35
WHERE table_name = 'a_REPORT_OUTPUT_DEFINITION'