
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vLSC_GAR_EASYLIST]

AS

SELECT 	wfta.wf_task_assignment_id,
	wfta.wf_task_id,
	wft.description wf_task,
	wfta.wf_task_status_id,
	wfts.description wf_task_status,
	wfta.wf_task_outcome_id,
	wfto.description wf_task_outcome,
	o.organization_id,
	o.legacy_organization_id,
	o.organization_name,
	p.name_last,
	p.name_first,
	gp.wf_project_id,
	wfp.competition_id,
    wfp.description,
	c.program_id,
	c.description service_area,
	wcy.wfta_year,
	CASE WHEN c.program_id = 2 THEN gp.legacy_grant_id ELSE NULL END tig
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN a_WF_TASK wft ON wfta.wf_task_id = wft.id
		JOIN a_WF_TASK_STATUS wfts ON wfta.wf_task_status_id = wfts.id
		LEFT JOIN a_WF_TASK_OUTCOME wfto ON wfta.wf_task_outcome_id = wfto.id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
		LEFT JOIN PERSON p ON wfta.person_id = p.person_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		LEFT JOIN vWFTA_COMPETITION_YEAR wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
	WHERE wft.wf_task_type_id = 3

