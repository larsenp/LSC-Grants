/****** Object:  View [dbo].[vLSC_CLIENT_SERVICES_LIM_SVC]    Script Date: 04/16/2009 08:45:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_CLIENT_SERVICES_LIM_SVC]

AS

SELECT wf_task_assignment_id,
	[1],
	[2],
	[3],
	[4],
	[5],
	[6],
	[7],
	[8],
	[9],
	[10]
	FROM
		(SELECT wf_task_assignment_id,
			lsc_legal_problem_type_id,
			cases_closed_limited_svc
			FROM LSC_CLIENT_SERVICES) AS cs
		PIVOT
		(SUM(cases_closed_limited_svc)
			FOR lsc_legal_problem_type_id IN ([1],
				[2],
				[3],
				[4],
				[5],
				[6],
				[7],
				[8],
				[9],
				[10])) AS piv
go

CREATE VIEW [dbo].[vLSC_CLIENT_SERVICES_EXT_SVC]

AS

SELECT wf_task_assignment_id,
	[1],
	[2],
	[3],
	[4],
	[5],
	[6],
	[7],
	[8],
	[9],
	[10]
	FROM
		(SELECT wf_task_assignment_id,
			lsc_legal_problem_type_id,
			cases_closed_extended_svc
			FROM LSC_CLIENT_SERVICES) AS cs
		PIVOT
		(SUM(cases_closed_extended_svc)
			FOR lsc_legal_problem_type_id IN ([1],
				[2],
				[3],
				[4],
				[5],
				[6],
				[7],
				[8],
				[9],
				[10])) AS piv

go

CREATE VIEW [dbo].[vLSC_CLIENT_SERVICES_OPEN]

AS

SELECT wf_task_assignment_id,
	[1],
	[2],
	[3],
	[4],
	[5],
	[6],
	[7],
	[8],
	[9],
	[10]
	FROM
		(SELECT wf_task_assignment_id,
			lsc_legal_problem_type_id,
			cases_open
			FROM LSC_CLIENT_SERVICES) AS cs
		PIVOT
		(SUM(cases_open)
			FOR lsc_legal_problem_type_id IN ([1],
				[2],
				[3],
				[4],
				[5],
				[6],
				[7],
				[8],
				[9],
				[10])) AS piv
go

CREATE VIEW [dbo].[vLSC_CLIENT_SERVICES]

AS

SELECT csls.wf_task_assignment_id,
	o.legacy_organization_id OrgID,
	wcy.wfta_year YearID,
	c.abbr serv_area,
	rsa.ID ServiceAreaID,
	CASE WHEN wfta.wf_task_id = 22 THEN 4 ELSE rsat.ID END ServiceAreaTypeID,
	csls.[1] Con_Brief_Serv,
	cses.[1] Con_Extnd_Serv,
	cso.[1] Con_Cases_Open,
	csls.[2] Edu_Brief_Serv,
	cses.[2] Edu_Extnd_Serv,
	cso.[2] Edu_Cases_Open,
	csls.[3] Emp_Brief_Serv,
	cses.[3] Emp_Extnd_Serv,
	cso.[3] Emp_Cases_Open,
	csls.[4] Fam_Brief_Serv,
	cses.[4] Fam_Extnd_Serv,
	cso.[4] Fam_Cases_Open,
	csls.[5] Juv_Brief_Serv,
	cses.[5] Juv_Extnd_Serv,
	cso.[5] Juv_Cases_Open,
	csls.[6] Hea_Brief_Serv,
	cses.[6] Hea_Extnd_Serv,
	cso.[6] Hea_Cases_Open,
	csls.[7] Hou_Brief_Serv,
	cses.[7] Hou_Extnd_Serv,
	cso.[7] Hou_Cases_Open,
	csls.[8] Inc_Brief_Serv,
	cses.[8] Inc_Extnd_Serv,
	cso.[8] Inc_Cases_Open,
	csls.[9] Ind_Brief_Serv,
	cses.[9] Ind_Extnd_Serv,
	cso.[9] Ind_Cases_Open,
	csls.[10] Mis_Brief_Serv,
	cses.[10] Mis_Extnd_Serv,
	cso.[10] Mis_Cases_Open
	FROM vLSC_CLIENT_SERVICES_LIM_SVC csls
		JOIN vLSC_CLIENT_SERVICES_EXT_SVC cses ON csls.wf_task_assignment_id = cses.wf_task_assignment_id
		JOIN vLSC_CLIENT_SERVICES_OPEN cso ON csls.wf_task_assignment_id = cso.wf_task_assignment_id
		JOIN WF_TASK_ASSIGNMENT wfta ON csls.wf_task_assignment_id = wfta.wf_task_assignment_id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
		JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		JOIN [LSC-SQL].RINDB.dbo.tblx_ServiceArea rsa ON c.abbr = rsa.Item
		JOIN LSC_a_SERVICE_AREA sa ON c.id = sa.competition_id
		JOIN LSC_c_SERVICE_AREA_TYPE sat ON sa.service_area_type_id = sat.id
		JOIN [LSC-SQL].RINDB.dbo.tblx_ServiceAreaType rsat ON sat.abbr = rsat.item
