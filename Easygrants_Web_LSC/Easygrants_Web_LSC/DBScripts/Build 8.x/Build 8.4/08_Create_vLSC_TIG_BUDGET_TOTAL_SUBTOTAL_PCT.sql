CREATE VIEW vLSC_TIG_BUDGET_TOTAL_SUBTOTAL_PCT

AS

SELECT tbt.lsc_tig_budget_id,
	tbt.budget_total,
	tblp.[1] personnel,
	tblp.[2] fringe,
	tblp.[3] space_cost,
	tblp.[4] travel,
	tblp.[5] equip_purchase,
	tblp.[6] equip_rent,
	tblp.[7] telecom,
	tblp.[8] comm,
	tblp.[9] software,
	tblp.[10] supplies,
	tblp.[11] contracts,
	tblp.[12] eval_cost,
	tblp.[13] training,
	tblp.[14] audit_cost,
	tblp.[15] other,
	tbftp.[1] grant_request,
	tbftp.[2] program_contribution,
	tbftp.[3] lsc_partners,
	tbftp.[4] non_lsc,
	tbftpp.[1] grant_request_pct,
	tbftpp.[2] program_contribution_pct,
	tbftpp.[3] lsc_partners_pct,
	tbftpp.[4] non_lsc_pct
	FROM dbo.vLSC_TIG_BUDGET_TOTAL tbt
		LEFT JOIN vLSC_TIG_BUDGET_BY_LINE_PIVOT tblp ON tbt.lsc_tig_budget_id = tblp.lsc_tig_budget_id
		LEFT JOIN vLSC_TIG_BUDGET_BY_FUNDING_TYPE_PIVOT tbftp ON tbt.lsc_tig_budget_id = tbftp.lsc_tig_budget_id
		LEFT JOIN vLSC_TIG_BUDGET_BY_FUNDING_TYPE_PCT_PIVOT tbftpp ON tbftp.lsc_tig_budget_id = tbftpp.lsc_tig_budget_id
