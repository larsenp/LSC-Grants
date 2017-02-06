--Add subgrantee name

ALTER VIEW [dbo].[vLSC_APPS_EASYLIST]

AS

SELECT wfta.wf_task_assignment_id ,
    o.organization_id,
    o.legacy_organization_id,
    o.organization_name,
	wfp.id wf_project_id,
    wfp.description funding_cycle,
	c.id competition_id,
    c.abbr service_area,
	p.id program_id,
    p.description program,
	wcy.time_period_id wfta_time_period_id,
    wcy.wfta_year,
    wfta.wf_task_id,
	wft.description wf_task,
    wfta.wf_task_status_id,
	wfts.description wf_task_status,
	per.person_id,
	per.name_last primary_contact_last,
	per.name_first primary_contact_first,
    per.name_last + ', ' + per.name_first primary_contact_last_first,
	ws.subgrantee_name
    FROM WF_TASK_ASSIGNMENT wfta
        JOIN a_WF_TASK wft ON wfta.wf_task_id = wft.id
		JOIN a_WF_TASK_STATUS wfts ON wfta.wf_task_status_id = wfts.id
        JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
        JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
        JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
        JOIN a_COMPETITION c ON wfp.competition_id = c.id
        JOIN a_PROGRAM p on c.program_id = p.id
        LEFT JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
        LEFT JOIN PERSON per ON wfta.person_id = per.person_id
		LEFT JOIN LSC_WFTA_SUBGRANT ws ON wfta.wf_task_assignment_id = ws.wf_task_assignment_id
    WHERE wft.wf_task_type_id = 1 

