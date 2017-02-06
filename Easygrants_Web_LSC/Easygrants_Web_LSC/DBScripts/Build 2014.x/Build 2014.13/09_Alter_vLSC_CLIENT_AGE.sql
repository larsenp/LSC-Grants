ALTER VIEW [dbo].[vLSC_CLIENT_AGE]

AS

SELECT crg.lsc_client_race_gen_id,
	ISNULL(crg.white_0_17, 0) + ISNULL(crg.black_0_17, 0) + ISNULL(crg.hisp_0_17, 0) + ISNULL(crg.nat_amr_0_17, 0) + ISNULL(crg.asian_0_17, 0) + ISNULL(crg.other_0_17, 0) total_0_17,
	NULL total_18_35,
	NULL total_36_59,
	ISNULL(crg.white_18_59, 0) + ISNULL(crg.black_18_59, 0) + ISNULL(crg.hisp_18_59, 0) + ISNULL(crg.nat_amr_18_59, 0) + ISNULL(crg.asian_18_59, 0) + ISNULL(crg.other_18_59, 0) total_18_59,
	ISNULL(crg.white_60_ovr, 0) + ISNULL(crg.black_60_ovr, 0) + ISNULL(crg.hisp_60_ovr, 0) + ISNULL(crg.nat_amr_60_ovr, 0) + ISNULL(crg.asian_60_ovr, 0) + ISNULL(crg.other_60_ovr, 0) total_60_ovr
	FROM LSC_CLIENT_RACE_GEN crg
		JOIN vWFTA_COMPETITION_YEAR wcy ON crg.wf_task_assignment_id = wcy.wf_task_assignment_id
	WHERE wcy.wfta_year <= 2013

UNION ALL

SELECT crg.lsc_client_race_gen_id,
	ISNULL(crg.white_0_17, 0) + ISNULL(crg.black_0_17, 0) + ISNULL(crg.hisp_0_17, 0) + ISNULL(crg.nat_amr_0_17, 0) + ISNULL(crg.asian_0_17, 0) + ISNULL(crg.other_0_17, 0) total_0_17,
	ISNULL(crg.white_18_35, 0) + ISNULL(crg.black_18_35, 0) + ISNULL(crg.hisp_18_35, 0) + ISNULL(crg.nat_amr_18_35, 0) + ISNULL(crg.asian_18_35, 0) + ISNULL(crg.other_18_35, 0)  total_18_35,
	ISNULL(crg.white_36_59, 0) + ISNULL(crg.black_36_59, 0) + ISNULL(crg.hisp_36_59, 0) + ISNULL(crg.nat_amr_36_59, 0) + ISNULL(crg.asian_36_59, 0) + ISNULL(crg.other_36_59, 0) total_36_59,
	ISNULL(cr.white_18_59, 0) + ISNULL(cr.black_18_59, 0) + ISNULL(cr.hisp_18_59, 0) + ISNULL(cr.nat_amr_18_59, 0) + ISNULL(cr.asian_18_59, 0) + ISNULL(cr.other_18_59, 0) total_18_59,
	ISNULL(crg.white_60_ovr, 0) + ISNULL(crg.black_60_ovr, 0) + ISNULL(crg.hisp_60_ovr, 0) + ISNULL(crg.nat_amr_60_ovr, 0) + ISNULL(crg.asian_60_ovr, 0) + ISNULL(crg.other_60_ovr, 0) total_60_ovr
	FROM LSC_CLIENT_RACE_GEN crg
		JOIN vWFTA_COMPETITION_YEAR wcy ON crg.wf_task_assignment_id = wcy.wf_task_assignment_id
		JOIN vLSC_CLIENT_RACE cr ON crg.lsc_client_race_gen_id = cr.lsc_client_race_gen_id
	WHERE wcy.wfta_year >= 2014
