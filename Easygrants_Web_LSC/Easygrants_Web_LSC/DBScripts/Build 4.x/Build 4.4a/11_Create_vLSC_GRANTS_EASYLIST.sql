/****** Object:  View [dbo].[vLSC_GRANTS_EASYLIST]    Script Date: 03/05/2009 08:55:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_GRANTS_EASYLIST]

AS

SELECT gp.grantee_project_id,
	gp.legacy_grant_id,
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
	pgm.description funding_source
	FROM GRANTEE_PROJECT gp
		JOIN c_GRANT_STATUS gs ON gp.grant_status_id = gs.id
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
		JOIN PERSON p ON gp.primary_person_id = p.person_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN c_TIME_PERIOD tp ON wfp.time_period_id = tp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		JOIN a_PROGRAM pgm ON c.program_id = pgm.id