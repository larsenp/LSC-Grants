CREATE VIEW [dbo].[vLSC_TIG_BUDGET_TOTAL_SUBTOTAL_PCT_BC]

AS

SELECT tbt.lsc_tig_budget_id,
	tbt.budget_total,
	tbcp.[1] sal_wage,
	tbcp.[2] fringe,
	tbcp.[3] travel,
	tbcp.[4] equipment,
	tbcp.[5] telecom,
	tbcp.[6] comm,
	tbcp.[7] software,
	tbcp.[8] supplies,
	tbcp.[9] contracts,
	tbcp.[10] proj_eval,
	tbcp.[11] training,
	tbcp.[12] other,
	tbcp.[13] conf_fee,
	tbftp.[1] grant_request,
	tbftp.[2] program_contribution,
	tbftp.[3] lsc_partners,
	tbftp.[4] non_lsc,
	tbftpp.[1] grant_request_pct,
	tbftpp.[2] program_contribution_pct,
	tbftpp.[3] lsc_partners_pct,
	tbftpp.[4] non_lsc_pct
	FROM dbo.vLSC_TIG_BUDGET_TOTAL tbt
		LEFT JOIN vLSC_TIG_BUDGET_BY_FUNDING_TYPE_PIVOT tbftp ON tbt.lsc_tig_budget_id = tbftp.lsc_tig_budget_id
		LEFT JOIN vLSC_TIG_BUDGET_BY_FUNDING_TYPE_PCT_PIVOT tbftpp ON tbftp.lsc_tig_budget_id = tbftpp.lsc_tig_budget_id
		LEFT JOIN vLSC_TIG_BUDGET_BY_CATEGORY_PIVOT tbcp ON tbt.lsc_tig_budget_id = tbcp.lsc_tig_budget_id