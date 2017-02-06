INSERT INTO [c_REPORT_OUTPUT_DEFINITION_TYPE]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(4, 'PROJECT  SUMMARY', 'Project Summary', NULL, NULL);

UPDATE [s_ID_GEN] SET [NEXT_ID] = 5 where [table_name] = 'c_REPORT_OUTPUT_DEFINITION_TYPE';




INSERT INTO [a_REPORT_OUTPUT_DEFINITION]([report_output_definition_id], [definition_key], [description], [entity_dataobject_key], [output_MIME_type], [delete_on_view], [generation_id]) 
	VALUES(1, 'StaffQueryExcel', 'Staff Query Report', NULL, 'application/vnd.ms-excel', 1, NULL);

INSERT INTO [a_REPORT_OUTPUT_DEFINITION]([report_output_definition_id], [definition_key], [description], [entity_dataobject_key], [output_MIME_type], [delete_on_view], [generation_id]) 
	VALUES(2, 'SNIC', 'Notice of Intent to Compete', 'WfTaskAssignment', 'application/pdf', 0, NULL);

UPDATE [s_ID_GEN] SET [NEXT_ID] = 3 where [table_name] = 'a_REPORT_OUTPUT_DEFINITION';




INSERT INTO [a_WF_PROJECT_PDF]([id], [wf_project_id], [report_output_definition_type_id], [final_pdf_report_key], [description], [generation_id]) 
	VALUES(1, 1, 4, 'SNIC', 'Notice of Intent to Compete', 1);

UPDATE [s_ID_GEN] SET [NEXT_ID] = 2 where [table_name] = 'a_WF_PROJECT_PDF';

