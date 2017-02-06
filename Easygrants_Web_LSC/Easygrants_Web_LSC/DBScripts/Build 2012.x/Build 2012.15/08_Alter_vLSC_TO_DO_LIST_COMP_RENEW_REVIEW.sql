ALTER VIEW [dbo].[vLSC_TO_DO_LIST_COMP_RENEW_REVIEW]

AS

SELECT MIN(wfta.wf_task_assignment_id) wf_task_assignment_id
	,wfta.person_id
	,wfta.wf_task_id
	,wft.description wf_task
	,wftm.module_name
	,wftm.module_config_filename
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN a_WF_TASK wft ON wfta.wf_task_id = wft.id
        JOIN a_WF_TASK_STATUS wfts ON wfta.wf_task_status_id = wfts.id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		LEFT JOIN vWFTA_COMPETITION_YEAR wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		JOIN a_WF_PROJECT_TASK wfpt ON wfta.wf_task_id = wfpt.wf_task_id
			AND gp.wf_project_id = wfpt.wf_project_id
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
		JOIN a_WF_TASK_MODULE wftm ON wfta.wf_task_id = wftm.wf_task_id
			AND wfta.wf_task_role_id = wftm.wf_task_role_id
	WHERE wfta.wf_task_id in (47, 52, 56, 57, 74, 75, 87, 88) 
		AND wfta.wf_task_status_id <> 3
		AND c.program_id = 1 
		AND wft.wf_task_type_id = 4
        AND getdate() > CASE WHEN wfta.start_date IS NULL THEN wfpt.start_date ELSE wfta.start_date END
        AND getdate() < CASE WHEN wfta.end_date IS NULL THEN wfpt.end_date ELSE wfta.end_date END
	GROUP BY wfta.person_id
		,wfta.wf_task_id
		,wft.description
		,wftm.module_name
		,wftm.module_config_filename
