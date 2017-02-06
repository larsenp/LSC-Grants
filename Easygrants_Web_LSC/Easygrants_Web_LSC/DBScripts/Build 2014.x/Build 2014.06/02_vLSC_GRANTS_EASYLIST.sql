
ALTER VIEW [dbo].[vLSC_GRANTS_EASYLIST]

AS
SELECT gp.grantee_project_id,
	CASE WHEN c.program_id = 2 THEN gp.legacy_grant_id ELSE NULL END legacy_grant_id,
	gp.grant_status_id,
	gs.abbr grant_status,
	o.organization_id,
	o.legacy_organization_id recipient_id,
	o.organization_name,
	p.name_last primary_contact_last,
	p.name_first primary_contact_first,
	p.name_last + ', ' + p.name_first primary_contact_last_first,
	wfp.time_period_id,
	tp.sort_order grant_year,
	c.id competition_id,
	c.abbr service_area,
	pgm.id program_id,
	pgm.description funding_source,
	gpt.purpose grant_title,
	sp.abbr StateAbbr,
	sp.id StateID,
	sp.description [Description],
    v.TIG_SubgranteeName [TIG_SubgranteeName]
	FROM GRANTEE_PROJECT gp
		JOIN c_GRANT_STATUS gs ON gp.grant_status_id = gs.id
		left JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
		LEFT JOIN PERSON p ON gp.primary_person_id = p.person_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		left JOIN c_TIME_PERIOD tp ON wfp.time_period_id = tp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		JOIN a_PROGRAM pgm ON c.program_id = pgm.id
		LEFT JOIN ADDRESS a ON o.organization_id=a.entity_id
								AND a.entity_type_id = 2
								AND a.is_primary = 1
		LEFT JOIN c_state_prov sp ON a.state_province_id =  sp.ID
		LEFT JOIN LSC_GRANTEE_PROJECT_TIG gpt ON gp.grantee_project_id = gpt.grantee_project_id
        LEFT JOIN vLSC_GRANTS_TIG_SUBGRANTEE_NAME v ON gp.grantee_project_id = v.grantee_project_id
WHERE c.program_id in (1,2,4,5,6) 


Union All

SELECT  
    gp.grantee_project_id,
	CASE WHEN c.program_id = 2 THEN gp.legacy_grant_id ELSE NULL END legacy_grant_id,
	gp.grant_status_id,
	gs.abbr grant_status,
	o.organization_id,
	o.legacy_organization_id recipient_id,
	o.organization_name,
	p.name_last primary_contact_last,
	p.name_first primary_contact_first,
	p.name_last + ', ' + p.name_first primary_contact_last_first,
	tp.id,
	tp.sort_order grant_year,
	c.id competition_id,
	c.abbr service_area,
	pgm.id program_id,
	pgm.description funding_source,
    gpt.purpose grant_title,
	sp.abbr StateAbbr,
	sp.id StateID,
	sp.description [Description],
    v.TIG_SubgranteeName [TIG_SubgranteeName]
FROM wf_task_assignment wfta
        join LSC_WFTA_SUBGRANT wftas ON wftas.wf_task_assignment_id = wfta.wf_task_assignment_id
		join grantee_project gp ON wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project wfp ON gp.wf_project_id = wfp.id
		join a_competition c ON wfp.competition_id = c.id
        join c_time_period tp ON Year(wftas.start_date) = tp.abbr
		join a_wf_task wft ON wfta.wf_task_id = wft.id
        JOIN c_GRANT_STATUS gs ON gp.grant_status_id = gs.id
        JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
        LEFT JOIN PERSON p ON gp.primary_person_id = p.person_id
        JOIN a_PROGRAM pgm ON c.program_id = pgm.id
		LEFT JOIN ADDRESS a ON o.organization_id=a.entity_id
								AND a.entity_type_id = 2
								AND a.is_primary = 1
		LEFT JOIN c_state_prov sp ON a.state_province_id =  sp.ID
        LEFT JOIN LSC_GRANTEE_PROJECT_TIG gpt ON gp.grantee_project_id = gpt.grantee_project_id
        LEFT JOIN vLSC_GRANTS_TIG_SUBGRANTEE_NAME v ON gp.grantee_project_id = v.grantee_project_id
WHERE c.program_id = 3


GO


