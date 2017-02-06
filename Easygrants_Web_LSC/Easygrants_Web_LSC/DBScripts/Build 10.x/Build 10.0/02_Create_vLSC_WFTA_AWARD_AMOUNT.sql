CREATE VIEW vLSC_WFTA_AWARD_AMOUNT

AS

SELECT wfta.wf_task_assignment_id
	,a.Amount award_amount
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
		JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		JOIN [LSC-SQL].RINDB.dbo.AWARD a ON o.legacy_organization_id = a.Org_ID
			AND wcy.wfta_year = a.Year
			AND c.description = a.serv_area_id
