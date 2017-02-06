/****** Object:  View [dbo].[vLSC_CLIENT_AGE_ETH_GEN]    Script Date: 03/09/2009 16:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_CLIENT_AGE_ETH_GEN]

AS

SELECT o.legacy_organization_id recipient_id,
	o.organization_name,
	wcy.wfta_year,
	c.abbr serv_area,
	sat.description funding_type,
	spsa.abbr serv_area_state,
	spg.abbr grantee_state,
	isnull(crg.men, 0) men,
	isnull(crg.women, 0) women,
	isnull(crg.groups, 0) groups,
	isnull(crg.white_0_17, 0) white_0_17,
	isnull(crg.black_0_17, 0) black_0_17,
	isnull(crg.hisp_0_17, 0) hisp_0_17,
	isnull(crg.nat_amr_0_17, 0) nat_amr_0_17,
	isnull(crg.asian_0_17, 0) asian_0_17,
	isnull(crg.other_0_17, 0) other_0_17,
	ca.total_0_17,
	isnull(crg.white_18_59, 0) white_18_59,
	isnull(crg.black_18_59, 0) black_18_59,
	isnull(crg.hisp_18_59, 0) hisp_18_59,
	isnull(crg.nat_amr_18_59, 0) nat_amr_18_59,
	isnull(crg.asian_18_59, 0) asian_18_59,
	isnull(crg.other_18_59, 0) other_18_59,
	ca.total_18_59,
	isnull(crg.white_60_ovr, 0) white_60_ovr,
	isnull(crg.black_60_ovr, 0) black_60_ovr,
	isnull(crg.hisp_60_ovr, 0) hisp_60_ovr,
	isnull(crg.nat_amr_60_ovr, 0) nat_amr_60_ovr,
	isnull(crg.asian_60_ovr, 0) asian_60_ovr,
	isnull(crg.other_60_ovr, 0) other_60_ovr,
	ca.total_60_ovr,
	cr.white_total,
	cr.black_total,
	cr.hisp_total,
	cr.nat_amr_total,
	cr.asian_total,
	cr.other_total,
	cr.grand_total,
	crg.lsc_client_race_gen_id,
	crg.wf_task_assignment_id,
	o.organization_id,
	wcy.time_period_id,
	c.id competition_id,
	sa.service_area_type_id,
	sa.state_province_id serv_area_state_province_id,
	a.state_province_id grantee_state_province_id
	FROM LSC_CLIENT_RACE_GEN crg
		JOIN WF_TASK_ASSIGNMENT wfta ON crg.wf_task_assignment_id = wfta.wf_task_assignment_id
		JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
		JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		JOIN vLSC_CLIENT_RACE cr ON crg.lsc_client_race_gen_id = cr.lsc_client_race_gen_id
		JOIN vLSC_CLIENT_AGE ca ON crg.lsc_client_race_gen_id = ca.lsc_client_race_gen_id
		JOIN LSC_a_SERVICE_AREA sa ON c.id = sa.competition_id
		JOIN LSC_c_SERVICE_AREA_TYPE sat ON sa.service_area_type_id = sat.id
		JOIN c_STATE_PROV spsa ON sa.state_province_id = spsa.id
		LEFT JOIN ADDRESS a ON o.organization_id = a.entity_id
			AND	a.entity_type_id = 2
			AND a.is_primary = 1
		LEFT JOIN c_STATE_PROV spg ON a.state_province_id = spg.id