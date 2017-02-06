--Add PPQV Review for competition and Renewal (wf_task_id = 68, 69)

/****** Object:  View [dbo].[vTO_DO_LIST_REVIEW]    Script Date: 06/08/2011 18:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vTO_DO_LIST_REVIEW]

AS

SELECT wfta.wf_task_assignment_id,
	wfta.person_id,
	wft.description task,
	o.organization_name,
	o.legacy_organization_id,
	c.abbr serv_area,
	wfp.description funding_cycle,
	wfts.description wf_task_status,
	CASE WHEN wfta.start_date IS NULL THEN wfpt.start_date ELSE wfta.start_date END start_date,
	CASE WHEN wfta.open_date IS NULL THEN wfpt.open_date ELSE wfta.open_date END open_date,
	CASE WHEN wfta.due_date IS NULL THEN wfpt.due_date ELSE wfta.due_date END due_date,
	CASE WHEN wfta.close_date IS NULL THEN wfpt.close_date ELSE wfta.close_date END close_date,
	CASE WHEN wfta.end_date IS NULL THEN wfpt.end_date ELSE wfta.end_date END end_date,
	wftm.module_name,
	wftm.module_config_filename,
	wft.is_copy_allowed,
	wft.id wf_task_id,
	sp.abbr app_st
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_TASK wft ON wfta.wf_task_id = wft.id
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		JOIN a_WF_TASK_STATUS wfts ON wfta.wf_task_status_id = wfts.id
		JOIN a_WF_PROJECT_TASK wfpt ON wfta.wf_task_id = wfpt.wf_task_id
			AND gp.wf_project_id = wfpt.wf_project_id
		JOIN a_WF_TASK_MODULE wftm ON wfta.wf_task_id = wftm.wf_task_id
			AND wfta.wf_task_role_id = wftm.wf_task_role_id
		LEFT JOIN ADDRESS a ON o.organization_id = a.entity_id
			AND a.entity_type_id = 2
			AND a.is_primary = 1
		LEFT JOIN c_STATE_PROV sp ON a.state_province_id = sp.id
	WHERE wfta.wf_task_status_id <> 3
		AND wfta.wf_task_role_id = 7
		AND c.program_id = 1
        AND (wft.id < 48 or wft.id = 72 or wft.id = 68 or wft.id = 69)
