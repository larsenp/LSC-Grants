--Add wf_task_type_id = 4 (External review)

ALTER VIEW [dbo].[vLSC_COMP_WFTA_ORG_SERVAREA_YEAR]

AS

SELECT wfta.wf_task_assignment_id,
	o.organization_id,
	o.legacy_organization_id recipient_id,
	c.id competition_id,
	c.description serv_area,
	wcy.wfta_year,
	wfta.wf_task_id,
	wft.description task,
	wfta.wf_task_status_id
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN a_WF_TASK wft ON wfta.wf_task_id = wft.id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
		JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
	WHERE wft.wf_task_type_id IN (1,3,4)
		AND c.program_id = 1