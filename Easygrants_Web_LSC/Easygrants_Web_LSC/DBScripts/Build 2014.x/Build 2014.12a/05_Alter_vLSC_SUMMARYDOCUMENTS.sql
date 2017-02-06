ALTER VIEW [dbo].[vLSC_SUMMARYDOCUMENTS]

AS

SELECT     2*wfta.wf_task_assignment_id*(select max(report_output_definition_id) from a_report_output_definition) + rd.report_output_definition_id AS summary_document_id,
	wfta.wf_task_assignment_id, 
    wfta.wf_task_assignment_id AS entity_id, 
	gp.grantee_project_id, 
	1 AS PDF, 
	ro.gen_request_date AS doc_submitted_date, 
    wfta.submitted_date AS wfta_submitted_date, 
	wfta.person_id, 
	rd.report_output_definition_id AS definition_id, 
	rd.description AS document_title, 
    dbo.a_WF_PROJECT_TASK_PDF.description
FROM dbo.WF_TASK_ASSIGNMENT AS wfta 
	INNER JOIN dbo.GRANTEE_PROJECT AS gp ON gp.grantee_project_id = wfta.grantee_project_id 
	INNER JOIN dbo.a_WF_PROJECT_TASK ON dbo.a_WF_PROJECT_TASK.wf_project_id = gp.wf_project_id 
		AND dbo.a_WF_PROJECT_TASK.wf_task_id = wfta.wf_task_id 
	INNER JOIN dbo.a_WF_PROJECT_TASK_PDF ON dbo.a_WF_PROJECT_TASK_PDF.wf_project_task_id = dbo.a_WF_PROJECT_TASK.id 
	INNER JOIN dbo.a_REPORT_OUTPUT_DEFINITION AS rd ON rd.definition_key = dbo.a_WF_PROJECT_TASK_PDF.final_pdf_report_key 
	LEFT OUTER JOIN dbo.REPORT_OUTPUT AS ro ON wfta.wf_task_assignment_id = ro.entity_id 
		AND ro.definition_id = rd.report_output_definition_id
	where rd.entity_dataobject_key = 'wftaskassignment'

UNION ALL

SELECT     2*gp.grantee_project_id*(select max(report_output_definition_id) from a_report_output_definition) + rd.report_output_definition_id + 1 AS summary_document_id,
	NULL as wf_task_assignment_id, 
    gp.grantee_project_id AS entity_id, 
	gp.grantee_project_id, 
	1 AS PDF, 
	ro.gen_request_date AS doc_submitted_date, 
    null AS wfta_submitted_date, 
	NULL AS person_id, 
	rd.report_output_definition_id AS definition_id, 
	rd.description AS document_title, 
    dbo.a_WF_PROJECT_TASK_PDF.description
FROM dbo.GRANTEE_PROJECT AS gp 
	INNER JOIN dbo.a_WF_PROJECT_TASK ON dbo.a_WF_PROJECT_TASK.wf_project_id = gp.wf_project_id 
	INNER JOIN dbo.a_WF_PROJECT_TASK_PDF ON dbo.a_WF_PROJECT_TASK_PDF.wf_project_task_id = dbo.a_WF_PROJECT_TASK.id 
	INNER JOIN dbo.a_REPORT_OUTPUT_DEFINITION AS rd ON rd.definition_key = dbo.a_WF_PROJECT_TASK_PDF.final_pdf_report_key 
	LEFT OUTER JOIN dbo.REPORT_OUTPUT AS ro ON gp.grantee_project_id = ro.entity_id 
		AND ro.definition_id = rd.report_output_definition_id
	where rd.entity_dataobject_key = 'granteeproject'
