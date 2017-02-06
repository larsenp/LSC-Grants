

CREATE VIEW [dbo].[vLSC_PBIF_BUDGET_BY_FUNDING_TYPE_PCT_PIVOT]

AS

SELECT lsc_pbif_budget_id,
	[1], [2], [3], [4]
	FROM (SELECT lsc_pbif_budget_id,
		lsc_pbif_budget_funding_type_id,
		budget_pct
		FROM vLSC_PBIF_BUDGET_BY_FUNDING_TYPE_PCT tbftp
			JOIN vLSC_PBIF_BUDGET_BY_FUNDING_TYPE tbft ON tbftp.lsc_pbif_budget_by_funding_type_id = tbft.lsc_pbif_budget_by_funding_type_id) AS lines
	PIVOT (SUM(budget_pct)
		FOR lsc_pbif_budget_funding_type_id IN ([1], [2], [3], [4])
		) AS pvt

GO

CREATE VIEW [dbo].[vLSC_PBIF_BUDGET_BY_FUNDING_TYPE_PIVOT]

AS

SELECT lsc_pbif_budget_id,
	[1], [2], [3], [4]
	FROM (SELECT lsc_pbif_budget_id,
		lsc_pbif_budget_funding_type_id,
		funding_type_total
		FROM vLSC_PBIF_BUDGET_BY_FUNDING_TYPE) AS lines
	PIVOT (SUM(funding_type_total)
		FOR lsc_pbif_budget_funding_type_id IN ([1], [2], [3], [4])
		) AS pvt

GO

CREATE VIEW [dbo].[vLSC_PBIF_BUDGET_TOTAL_SUBTOTAL_PCT_BC]

AS

SELECT tbt.lsc_pbif_budget_id,
	tbt.budget_total,
	ISNULL(tbcp.[1],0) per_exp,
	tbcp.[2] sal_wage,
	tbcp.[3] fringe,
	ISNULL(tbcp.[4],0) pro_exp,
	tbcp.[5] travel,
	tbcp.[6] equip,
	tbcp.[7] software,
	tbcp.[8] supplies,
	tbcp.[9] communication,
	tbcp.[10] training,
	tbcp.[11] evaluation,
	tbcp.[12] other,
	ISNULL(tbcp.[13],0) third_party,
	tbcp.[14] contracts,
	tbcp.[15] sub_contracts,
	tbftp.[1] inno_fund_share,
	tbftp.[2] applicant_share,
	tbftp.[3] cash_other_partners,
	tbftp.[4] in_kind_partners,
	tbftpp.[1] inno_fund_share_pct,
	tbftpp.[2] applicant_share_pct,
	tbftpp.[3] cash_other_partners_pct,
	tbftpp.[4] in_kind_partners_pct
	FROM dbo.vLSC_PBIF_BUDGET_TOTAL tbt
		LEFT JOIN vLSC_PBIF_BUDGET_BY_FUNDING_TYPE_PIVOT tbftp ON tbt.lsc_pbif_budget_id = tbftp.lsc_pbif_budget_id
		LEFT JOIN vLSC_PBIF_BUDGET_BY_FUNDING_TYPE_PCT_PIVOT tbftpp ON tbftp.lsc_pbif_budget_id = tbftpp.lsc_pbif_budget_id
		LEFT JOIN vLSC_PBIF_BUDGET_BY_CATEGORY_PIVOT tbcp ON tbt.lsc_pbif_budget_id = tbcp.lsc_pbif_budget_id
GO