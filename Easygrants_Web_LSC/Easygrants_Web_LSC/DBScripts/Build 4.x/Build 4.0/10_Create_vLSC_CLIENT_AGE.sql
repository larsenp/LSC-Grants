CREATE VIEW vLSC_CLIENT_AGE

AS

SELECT lsc_client_race_gen_id,
	ISNULL(white_0_17, 0) + ISNULL(black_0_17, 0) + ISNULL(hisp_0_17, 0) + ISNULL(nat_amr_0_17, 0) + ISNULL(asian_0_17, 0) + ISNULL(other_0_17, 0) total_0_17,
	ISNULL(white_18_59, 0) + ISNULL(black_18_59, 0) + ISNULL(hisp_18_59, 0) + ISNULL(nat_amr_18_59, 0) + ISNULL(asian_18_59, 0) + ISNULL(other_18_59, 0) total_18_59,
	ISNULL(white_60_ovr, 0) + ISNULL(black_60_ovr, 0) + ISNULL(hisp_60_ovr, 0) + ISNULL(nat_amr_60_ovr, 0) + ISNULL(asian_60_ovr, 0) + ISNULL(other_60_ovr, 0) total_60_ovr
	FROM LSC_CLIENT_RACE_GEN
