CREATE VIEW [dbo].[vLSC_ORGANIZATION_CURRENT_GRANTEE]

AS

SELECT DISTINCT o.organization_id,
	o.legacy_organization_id,
	CASE WHEN gp.grantee_project_id IS NULL THEN 0 ELSE 1 END is_current_grantee
	FROM ORGANIZATION o
		LEFT JOIN 
		(GRANTEE_PROJECT gp 
			JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
			JOIN a_COMPETITION c ON wfp.competition_id = c.id
				AND c.program_id = 1) 
		ON o.organization_id = gp.primary_organization_id
			AND gp.grant_status_id = 1
