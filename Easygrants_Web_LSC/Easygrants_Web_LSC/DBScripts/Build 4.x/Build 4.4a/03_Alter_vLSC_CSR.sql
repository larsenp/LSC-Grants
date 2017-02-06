/****** Object:  View [dbo].[vLSC_CSR]    Script Date: 02/24/2009 09:20:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vLSC_CSR]
AS
SELECT o.organization_id,
	o.legacy_organization_id recipient_id,
	c.id competition_id,
	c.abbr service_area,
	sa.service_area_type_id,
	sat.abbr funding_type,
	sa.state_province_id,
	sp.abbr state,
	wcy.time_period_id,
	wcy.wfta_year,
	ct.description case_type,
	ct.lsc_case_category_id,
	cc.description case_category,
	aps.description attorney_pai_status,
	csr.lsc_csr_id,
	csr.wf_task_assignment_id,
	csr.lsc_case_type_id,
	csr.lsc_attorney_pai_status_id,
	ISNULL(csr.A, 0) A,
	ISNULL(csr.B, 0) B,
	ISNULL(csr.C, 0) C,
	ISNULL(csr.D, 0) D,
	ISNULL(csr.E, 0) E,
	ISNULL(csr.F, 0) F,
	ISNULL(csr.G, 0) G,
	ISNULL(csr.H, 0) H,
	ISNULL(csr.I, 0) I,
	ISNULL(csr.Ia, 0) Ia,
	ISNULL(csr.Ib, 0) Ib,
	ISNULL(csr.Ic, 0) Ic,
	ISNULL(csr.J, 0) J,
	ISNULL(csr.K, 0) K,
	ISNULL(csr.L, 0) L
	FROM LSC_CSR csr
		JOIN WF_TASK_ASSIGNMENT wfta ON csr.wf_task_assignment_id = wfta.wf_task_assignment_id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		JOIN LSC_a_SERVICE_AREA sa ON c.id = sa.competition_id
		JOIN LSC_c_SERVICE_AREA_TYPE sat ON sa.service_area_type_id = sat.id
		JOIN LSC_c_CASE_TYPE ct ON csr.lsc_case_type_id = ct.id 
		JOIN LSC_c_CASE_CATEGORY cc ON ct.lsc_case_category_id = cc.id
		JOIN c_STATE_PROV sp ON sa.state_province_id = sp.id
		LEFT JOIN LSC_c_ATTORNEY_PAI_STATUS aps ON csr.lsc_attorney_pai_status_id = aps.id
	WHERE wcy.wfta_year < 2008

UNION ALL

SELECT o.organization_id,
	o.legacy_organization_id recipient_id,
	c.id competition_id,
	c.abbr service_area,
	sa.service_area_type_id,
	sat.abbr funding_type,
	sa.state_province_id,
	sp.abbr state,
	wcy.time_period_id,
	wcy.wfta_year,
	ct.description case_type,
	ct.lsc_case_category_id,
	cc.description case_category,
	aps.description attorney_pai_status,
	csr.lsc_csr_id,
	csr.wf_task_assignment_id,
	csr.lsc_case_type_id,
	CASE WHEN wfta.wf_task_id = 10 then 1
		WHEN wfta.wf_task_id = 11 then 2 END lsc_attorney_pai_status_id,
	ISNULL(csr.A, 0) A,
	ISNULL(csr.B, 0) B,
	ISNULL(csr.C, 0) C,
	ISNULL(csr.D, 0) D,
	ISNULL(csr.E, 0) E,
	ISNULL(csr.F, 0) F,
	ISNULL(csr.G, 0) G,
	ISNULL(csr.H, 0) H,
	ISNULL(csr.Ia, 0) + ISNULL(csr.Ib, 0) + ISNULL(csr.Ic, 0) I,
	ISNULL(csr.Ia, 0) Ia,
	ISNULL(csr.Ib, 0) Ib,
	ISNULL(csr.Ic, 0) Ic,
	ISNULL(csr.J, 0) J,
	ISNULL(csr.K, 0) K,
	ISNULL(csr.L, 0) L
	FROM LSC_CSR csr
		JOIN WF_TASK_ASSIGNMENT wfta ON csr.wf_task_assignment_id = wfta.wf_task_assignment_id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		JOIN LSC_a_SERVICE_AREA sa ON c.id = sa.competition_id
		JOIN LSC_c_SERVICE_AREA_TYPE sat ON sa.service_area_type_id = sat.id
		JOIN LSC_c_CASE_TYPE ct ON csr.lsc_case_type_id = ct.id 
		JOIN LSC_c_CASE_CATEGORY cc ON ct.lsc_case_category_id = cc.id
		JOIN c_STATE_PROV sp ON sa.state_province_id = sp.id
		LEFT JOIN LSC_c_ATTORNEY_PAI_STATUS aps ON aps.id = CASE WHEN wfta.wf_task_id = 10 then 1
			WHEN wfta.wf_task_id = 11 then 2 END
	WHERE wcy.wfta_year > 2007
