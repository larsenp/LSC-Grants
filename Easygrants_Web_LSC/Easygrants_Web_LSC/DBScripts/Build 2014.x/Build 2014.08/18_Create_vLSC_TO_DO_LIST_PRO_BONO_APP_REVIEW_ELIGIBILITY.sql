--Tentatively replaced by vLSC_TO_DO_LIST_PRO_BONO_APP_REVIEW_DETAIL
/*CREATE VIEW [dbo].[vLSC_TO_DO_LIST_PRO_BONO_APP_REVIEW_ELIGIBILITY]

AS
SELECT 	wfta.wf_task_assignment_id,
	wfta.person_id,
	wfta.wf_task_id,
	wft.description wf_task,
	wfta.wf_task_status_id,
	wfts.description wf_task_status,
	wfta.wf_task_outcome_id,
	wfto.description wf_task_outcome,
	wft.sort_order task_sort_order,
	CASE WHEN wfta.start_date IS NULL THEN wfpt.start_date ELSE wfta.start_date END start_date,
	CASE WHEN wfta.open_date IS NULL THEN wfpt.open_date ELSE wfta.open_date END open_date,
	CASE WHEN wfta.due_date IS NULL THEN wfpt.due_date ELSE wfta.due_date END due_date,
	CASE WHEN wfta.close_date IS NULL THEN wfpt.close_date ELSE wfta.close_date END close_date,
	CASE WHEN wfta.end_date IS NULL THEN wfpt.end_date ELSE wfta.end_date END end_date,
	wftm.module_name,
	wftm.module_config_filename,
	rod.report_output_definition_id,
	gp.legacy_grant_id grant_number,
	o.legacy_organization_id recipient_id,
	o.organization_name
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN a_WF_TASK wft ON wfta.wf_task_id = wft.id
		JOIN a_WF_TASK_STATUS wfts ON wfta.wf_task_status_id = wfts.id
		LEFT JOIN a_WF_TASK_OUTCOME wfto ON wfta.wf_task_outcome_id = wfto.id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT_TASK wfpt ON wfta.wf_task_id = wfpt.wf_task_id
			AND gp.wf_project_id = wfpt.wf_project_id
		JOIN a_WF_TASK_MODULE wftm ON wfta.wf_task_id = wftm.wf_task_id
			AND wfta.wf_task_role_id = wftm.wf_task_role_id
		LEFT JOIN a_WF_PROJECT_TASK_PDF wfptp ON wfpt.id = wfptp.wf_project_task_id
		LEFT JOIN a_REPORT_OUTPUT_DEFINITION rod ON wfptp.final_pdf_report_key = rod.definition_key
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
	WHERE wfta.wf_task_id = 103
		AND wfta.wf_task_status_id <> 3
*/