
ALTER VIEW [dbo].[vLSC_TO_DO_LIST_REVIEW_SUBGRANT_APPROVAL_REQUEST]

AS

SELECT wfta_rev.wf_task_assignment_id,
	wfta_rev.person_id,
	wfta_rev.wf_task_status_id,
	wft.description task,
	ws.subgrantee_name,
	o.organization_name,
	ws.start_date subgrant_start_date,
	ws.end_date subgrant_end_date,
	wfts.description task_status,
	CASE WHEN wfta_rev.start_date IS NULL THEN wfpt.start_date ELSE wfta_rev.start_date END start_date,
	CASE WHEN wfta_rev.open_date IS NULL THEN wfpt.open_date ELSE wfta_rev.open_date END open_date,
--	CASE WHEN wfta_rev.due_date IS NULL THEN wfpt.due_date ELSE wfta_rev.due_date END due_date,
    CASE WHEN wfta_rev.wf_task_id = 64 THEN oce_aa_review_due 
         WHEN wfta_rev.wf_task_id = 83 THEN oce_staff_review_due 
         WHEN wfta_rev.wf_task_id = 84 THEN opp_staff_review_due 
		 WHEN wfta_rev.wf_task_id = 85 THEN opp_director_review_due 
		 WHEN wfta_rev.wf_task_id = 86 THEN oce_director_review_due End due_date, 
	CASE WHEN wfta_rev.close_date IS NULL THEN wfpt.close_date ELSE wfta_rev.close_date END close_date,
	CASE WHEN wfta_rev.end_date IS NULL THEN wfpt.end_date ELSE wfta_rev.end_date END end_date,
	wftm.module_name,
	wftm.module_config_filename
 FROM WF_TASK_ASSIGNMENT wfta_rev
		JOIN a_WF_TASK wft ON wfta_rev.wf_task_id = wft.id
		JOIN GRANTEE_PROJECT gp ON wfta_rev.grantee_project_id = gp.grantee_project_id
		JOIN WF_TASK_ASSIGNMENT wfta_req ON gp.grantee_project_id = wfta_req.grantee_project_id
			AND wfta_req.wf_task_id = 53
		JOIN LSC_WFTA_SUBGRANT ws ON wfta_req.wf_task_assignment_id = ws.wf_task_assignment_id
		JOIN a_WF_TASK_STATUS wfts ON wfta_rev.wf_task_status_id = wfts.id
		JOIN a_WF_PROJECT_TASK wfpt ON wfta_rev.wf_task_id = wfpt.wf_task_id
			AND gp.wf_project_id = wfpt.wf_project_id
		JOIN a_WF_TASK_MODULE wftm ON wfta_rev.wf_task_id = wftm.wf_task_id
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
        left join vLSC_SUBGRANT_REVIEW_DUE_DATES dd on dd.grantee_project_id = gp.grantee_project_id
	WHERE wfta_rev.wf_task_id IN (64, 65, 84, 85, 86)
		AND wfta_rev.wf_task_status_id <> 3
