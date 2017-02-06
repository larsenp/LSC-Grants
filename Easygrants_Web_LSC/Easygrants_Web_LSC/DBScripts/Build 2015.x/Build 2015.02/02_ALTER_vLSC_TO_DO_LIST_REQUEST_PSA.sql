ALTER VIEW [dbo].[vLSC_TO_DO_LIST_REQUEST_PSA]

AS
SELECT 	wfta_1.wf_task_assignment_id,
	wfta_1.grantee_project_id,
	wfta_1.person_id,
	wfta_1.wf_task_id,
	wft.description wf_task,
	wfta_1.wf_task_status_id,
	wfts.description wf_task_status,
	wfta_1.wf_task_outcome_id,
	wfto.description wf_task_outcome,
	CASE WHEN wfta_1.start_date IS NULL THEN wfpt.start_date ELSE wfta_1.start_date END start_date,
	CASE WHEN wfta_1.open_date IS NULL THEN wfpt.open_date ELSE wfta_1.open_date END open_date,
	CASE WHEN wfta_1.due_date IS NULL THEN wfpt.due_date ELSE wfta_1.due_date END due_date,
	CASE WHEN wfta_1.close_date IS NULL THEN wfpt.close_date ELSE wfta_1.close_date END close_date,
	CASE WHEN wfta_1.end_date IS NULL THEN wfpt.end_date ELSE wfta_1.end_date END end_date,
	wftm.module_name,
	wftm.module_config_filename,
	rod.report_output_definition_id,
	ws.subgrantee_name,
	ws.start_date subgrant_start_date,
	wfta_2.wf_task_assignment_id wfta_id_step_2,
    CASE WHEN wfta_2.wf_task_status_id = 2 AND wfta_mod.wf_task_assignment_id IS NOT NULL THEN wfta_mod.wf_task_assignment_id  
        WHEN wfta_2.wf_task_status_id = 2 AND wfta_mod.wf_task_assignment_id IS NULL THEN NULL END wfta_id_modification
--    CASE WHEN wfta_2.wf_task_status_id = 2 THEN wfta_mod.wf_task_assignment_id ELSE NULL END wfta_id_modification

	FROM WF_TASK_ASSIGNMENT wfta_1
		JOIN a_WF_TASK wft ON wfta_1.wf_task_id = wft.id
		JOIN a_WF_TASK_STATUS wfts ON wfta_1.wf_task_status_id = wfts.id
		LEFT JOIN a_WF_TASK_OUTCOME wfto ON wfta_1.wf_task_outcome_id = wfto.id
		JOIN GRANTEE_PROJECT gp ON wfta_1.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		JOIN a_WF_PROJECT_TASK wfpt ON wfta_1.wf_task_id = wfpt.wf_task_id
			AND gp.wf_project_id = wfpt.wf_project_id
		JOIN a_WF_TASK_MODULE wftm ON wfta_1.wf_task_id = wftm.wf_task_id
			AND wfta_1.wf_task_role_id = wftm.wf_task_role_id
		LEFT JOIN a_WF_PROJECT_TASK_PDF wfptp ON wfpt.id = wfptp.wf_project_task_id
		LEFT JOIN a_REPORT_OUTPUT_DEFINITION rod ON wfptp.final_pdf_report_key = rod.definition_key
		JOIN LSC_wfta_SUBGRANT ws ON wfta_1.wf_task_assignment_id = ws.wf_task_assignment_id
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_2 ON wfta_1.grantee_project_id = wfta_2.grantee_project_id
			AND wfta_2.wf_task_id = 116
		LEFT JOIN WF_TASK_ASSIGNMENT wfta_mod ON wfta_2.grantee_project_id = wfta_mod.grantee_project_id
			AND wfta_mod.wf_task_id = 73
			AND wfta_mod.wf_task_status_id = 1
	WHERE wfta_1.wf_task_id in (101,116)
		AND wfta_1.wf_task_status_id <> 3
		AND c.program_id = 3