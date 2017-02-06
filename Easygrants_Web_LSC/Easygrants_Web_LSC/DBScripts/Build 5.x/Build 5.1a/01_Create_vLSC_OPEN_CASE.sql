/****** Object:  View [dbo].[vLSC_OPEN_CASE]    Script Date: 04/16/2009 08:32:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_OPEN_CASE]

AS

SELECT wfta.wf_task_assignment_id,
	o.legacy_organization_id OrgID,
	wcy.wfta_year YearID,
	c.abbr serv_area,
	rsa.ID ServiceAreaID,
	CASE WHEN oc.lsc_attorney_pai_status_id = 2 THEN 4 ELSE rsat.ID END ServiceAreaTypeID,
	oc.con_fin,
	oc.education,
	oc.employment,
	oc.family,
	oc.juvenile,
	oc.health,
	oc.housing,
	oc.income,
	oc.individual,
	oc.misc,
	oc.education + oc.employment + oc.family + oc.juvenile + oc.health + oc.housing + oc.income + oc.individual + oc.misc total
	FROM LSC_OPEN_CASE oc
		JOIN WF_TASK_ASSIGNMENT wfta ON oc.wf_task_assignment_id = wfta.wf_task_assignment_id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
		JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		JOIN [LSC-SQL].RINDB.dbo.tblx_ServiceArea rsa ON c.abbr = rsa.Item
		JOIN LSC_a_SERVICE_AREA sa ON c.id = sa.competition_id
		JOIN LSC_c_SERVICE_AREA_TYPE sat ON sa.service_area_type_id = sat.id
		JOIN [LSC-SQL].RINDB.dbo.tblx_ServiceAreaType rsat ON sat.abbr = rsat.item
