CREATE VIEW vLSC_CLIENT_RACE

AS

SELECT lsc_client_race_gen_id,
	ISNULL(white_0_17, 0) + ISNULL(white_18_59, 0) + ISNULL(white_60_ovr, 0) white_total,
	ISNULL(black_0_17, 0) + ISNULL(black_18_59, 0) + ISNULL(black_60_ovr, 0) black_total,
	ISNULL(hisp_0_17, 0) + ISNULL(hisp_18_59, 0) + ISNULL(hisp_60_ovr, 0) hisp_total,
	ISNULL(nat_amr_0_17, 0) + ISNULL(nat_amr_18_59, 0) + ISNULL(nat_amr_60_ovr, 0) nat_amr_total,
	ISNULL(asian_0_17, 0) + ISNULL(asian_18_59, 0) + ISNULL(asian_60_ovr, 0) asian_total,
	ISNULL(other_0_17, 0) + ISNULL(other_18_59, 0) + ISNULL(other_60_ovr, 0) other_total,
	ISNULL(white_0_17, 0) + ISNULL(black_0_17, 0) + ISNULL(hisp_0_17, 0) + ISNULL(nat_amr_0_17, 0) + ISNULL(asian_0_17, 0) + ISNULL(other_0_17, 0) + 
		ISNULL(white_18_59, 0) + ISNULL(black_18_59, 0) + ISNULL(hisp_18_59, 0) + ISNULL(nat_amr_18_59, 0) + ISNULL(asian_18_59, 0) + ISNULL(other_18_59, 0) + 
		ISNULL(white_60_ovr, 0) + ISNULL(black_60_ovr, 0) + ISNULL(hisp_60_ovr, 0) + ISNULL(nat_amr_60_ovr, 0) + ISNULL(asian_60_ovr, 0) + ISNULL(other_60_ovr, 0) grand_total
	FROM LSC_CLIENT_RACE_GEN
