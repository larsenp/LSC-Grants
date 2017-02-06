ALTER VIEW vLSC_COMP_APPL_FISCAL_SCORE_BY_PART

AS

SELECT lsc_comp_appl_fiscal_id
	,subtotal_part_i
	,subtotal_part_ii
	,subtotal_part_iii
	,subtotal_part_iv
	,subtotal_part_v
	,subtotal_part_vi
	,subtotal_part_vii
	,NULL AS subtotal_part_viii
	FROM vLSC_COMP_APPL_FISCAL_SCORE_BY_PART_2014

UNION ALL

SELECT lsc_comp_appl_fiscal_id
	,subtotal_part_i
	,subtotal_part_ii
	,subtotal_part_iii
	,subtotal_part_iv
	,subtotal_part_v
	,subtotal_part_vi
	,subtotal_part_vii
	,subtotal_part_viii
	FROM vLSC_COMP_APPL_FISCAL_SCORE_BY_PART_2015
