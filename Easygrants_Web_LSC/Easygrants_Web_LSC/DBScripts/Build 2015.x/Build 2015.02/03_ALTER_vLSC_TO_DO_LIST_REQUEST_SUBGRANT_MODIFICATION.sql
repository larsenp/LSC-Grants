
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[vLSC_TO_DO_LIST_REQUEST_SUBGRANT_MODIFICATION]

AS
SELECT 	wfta.wf_task_assignment_id,
	wfta.grantee_project_id,
	wfta.person_id,
    wfta_app.wf_task_id wf_task_id_app,
	wfta.wf_task_id,
	wft.description wf_task,
	wfta.wf_task_status_id,
	wfts.description wf_task_status,
	wfta.wf_task_outcome_id,
	wfto.description wf_task_outcome,
	CASE WHEN wfta.start_date IS NULL THEN wfpt.start_date ELSE wfta.start_date END start_date,
	CASE WHEN wfta.open_date IS NULL THEN wfpt.open_date ELSE wfta.open_date END open_date,
	CASE WHEN wfta.due_date IS NULL THEN wfpt.due_date ELSE wfta.due_date END due_date,
	CASE WHEN wfta.close_date IS NULL THEN wfpt.close_date ELSE wfta.close_date END close_date,
	CASE WHEN wfta.end_date IS NULL THEN wfpt.end_date ELSE wfta.end_date END end_date,
	wftm.module_name,
	wftm.module_config_filename,
	rod.report_output_definition_id,
	ws.subgrantee_name,
	ws.start_date subgrant_start_date
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN a_WF_TASK wft ON wfta.wf_task_id = wft.id
		JOIN a_WF_TASK_STATUS wfts ON wfta.wf_task_status_id = wfts.id
		LEFT JOIN a_WF_TASK_OUTCOME wfto ON wfta.wf_task_outcome_id = wfto.id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		JOIN a_WF_PROJECT_TASK wfpt ON wfta.wf_task_id = wfpt.wf_task_id
			AND gp.wf_project_id = wfpt.wf_project_id
		JOIN a_WF_TASK_MODULE wftm ON wfta.wf_task_id = wftm.wf_task_id
			AND wfta.wf_task_role_id = wftm.wf_task_role_id
		LEFT JOIN a_WF_PROJECT_TASK_PDF wfptp ON wfpt.id = wfptp.wf_project_task_id
		LEFT JOIN a_REPORT_OUTPUT_DEFINITION rod ON wfptp.final_pdf_report_key = rod.definition_key
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_app on wfta.grantee_project_id = wfta_app.grantee_project_id
			AND wfta_app.wf_task_id = 53
		LEFT JOIN LSC_WFTA_SUBGRANT ws ON wfta_app.wf_task_assignment_id = ws.wf_task_assignment_id
	WHERE wfta.wf_task_id = 73
		AND wfta.wf_task_status_id <> 3
		AND c.program_id = 3
		AND wfta_app.wf_task_id = 53


UNION ALL


SELECT 	wfta.wf_task_assignment_id,
	wfta.grantee_project_id,
	wfta.person_id,
    wfta_app_step2.wf_task_id wf_task_id_app,
	wfta.wf_task_id,
	wft.description wf_task,
	wfta.wf_task_status_id,
	wfts.description wf_task_status,
	wfta.wf_task_outcome_id,
	wfto.description wf_task_outcome,
	CASE WHEN wfta.start_date IS NULL THEN wfpt.start_date ELSE wfta.start_date END start_date,
	CASE WHEN wfta.open_date IS NULL THEN wfpt.open_date ELSE wfta.open_date END open_date,
	CASE WHEN wfta.due_date IS NULL THEN wfpt.due_date ELSE wfta.due_date END due_date,
	CASE WHEN wfta.close_date IS NULL THEN wfpt.close_date ELSE wfta.close_date END close_date,
	CASE WHEN wfta.end_date IS NULL THEN wfpt.end_date ELSE wfta.end_date END end_date,
	wftm.module_name,
	wftm.module_config_filename,
	rod.report_output_definition_id,
	ws.subgrantee_name,
	ws.start_date subgrant_start_date
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN a_WF_TASK wft ON wfta.wf_task_id = wft.id
		JOIN a_WF_TASK_STATUS wfts ON wfta.wf_task_status_id = wfts.id
		LEFT JOIN a_WF_TASK_OUTCOME wfto ON wfta.wf_task_outcome_id = wfto.id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		JOIN a_WF_PROJECT_TASK wfpt ON wfta.wf_task_id = wfpt.wf_task_id
			AND gp.wf_project_id = wfpt.wf_project_id
		JOIN a_WF_TASK_MODULE wftm ON wfta.wf_task_id = wftm.wf_task_id
			AND wfta.wf_task_role_id = wftm.wf_task_role_id
		LEFT JOIN a_WF_PROJECT_TASK_PDF wfptp ON wfpt.id = wfptp.wf_project_task_id
		LEFT JOIN a_REPORT_OUTPUT_DEFINITION rod ON wfptp.final_pdf_report_key = rod.definition_key
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_app_step2 on wfta.grantee_project_id = wfta_app_step2.grantee_project_id
			AND wfta_app_step2.wf_task_id = 116
		LEFT JOIN LSC_WFTA_SUBGRANT ws ON wfta_app_step2.wf_task_assignment_id = ws.wf_task_assignment_id
	WHERE wfta.wf_task_id = 73
		AND wfta.wf_task_status_id <> 3
		AND c.program_id = 3
		AND wfta_app_step2.wf_task_id = 116
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

