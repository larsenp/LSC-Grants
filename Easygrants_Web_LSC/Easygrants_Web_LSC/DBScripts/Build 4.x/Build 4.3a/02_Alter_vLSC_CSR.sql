/****** Object:  View [dbo].[vLSC_CSR]    Script Date: 02/10/2009 13:54:25 ******/
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
	csr.*
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