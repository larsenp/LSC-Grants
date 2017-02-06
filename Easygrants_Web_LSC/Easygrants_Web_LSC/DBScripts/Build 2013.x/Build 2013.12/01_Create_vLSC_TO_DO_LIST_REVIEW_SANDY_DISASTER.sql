CREATE VIEW [dbo].[vLSC_TO_DO_LIST_REVIEW_SANDY_DISASTER]

AS

SELECT wfta_rev.wf_task_assignment_id,
	wfta_rev.person_id,
	wfta_rev.wf_task_status_id,
	wft.description task,
	o.organization_name,
	o.legacy_organization_id recipient_id,
	wfts.description task_status,
	CASE WHEN wfta_rev.start_date IS NULL THEN wfpt.start_date ELSE wfta_rev.start_date END start_date,
	CASE WHEN wfta_rev.open_date IS NULL THEN wfpt.open_date ELSE wfta_rev.open_date END open_date,
	CASE WHEN wfta_rev.due_date IS NULL THEN wfpt.due_date ELSE wfta_rev.due_date END due_date,
	CASE WHEN wfta_rev.close_date IS NULL THEN wfpt.close_date ELSE wfta_rev.close_date END close_date,
	CASE WHEN wfta_rev.end_date IS NULL THEN wfpt.end_date ELSE wfta_rev.end_date END end_date,
	wftm.module_name,
	wftm.module_config_filename
 FROM WF_TASK_ASSIGNMENT wfta_rev
		JOIN a_WF_TASK wft ON wfta_rev.wf_task_id = wft.id
		JOIN GRANTEE_PROJECT gp ON wfta_rev.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_TASK_STATUS wfts ON wfta_rev.wf_task_status_id = wfts.id
		JOIN a_WF_PROJECT_TASK wfpt ON wfta_rev.wf_task_id = wfpt.wf_task_id
			AND gp.wf_project_id = wfpt.wf_project_id
		JOIN a_WF_TASK_MODULE wftm ON wfta_rev.wf_task_id = wftm.wf_task_id
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
	WHERE wfta_rev.wf_task_id IN (94, 95)
		AND wfta_rev.wf_task_status_id <> 3
