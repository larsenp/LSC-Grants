--Avoid divide by zero error when budget total = 0
--Account for renaming of vLSC_TIG_BUDGET to vLSC_TIG_BUDGET_TOTAL

ALTER VIEW [dbo].[vLSC_TIG_BUDGET_BY_FUNDING_TYPE_PCT]

AS

SELECT tbft.lsc_tig_budget_by_funding_type_id,
	tbft.funding_type_total,
	tbt.budget_total,
	CASE WHEN tbt.budget_total = 0 THEN NULL
		ELSE cast(tbft.funding_type_total as decimal) / cast(tbt.budget_total as decimal) END budget_pct
	FROM vLSC_TIG_BUDGET_BY_FUNDING_TYPE tbft
		JOIN vLSC_TIG_BUDGET_TOTAL tbt ON tbft.lsc_tig_budget_id = tbt.lsc_tig_budget_id