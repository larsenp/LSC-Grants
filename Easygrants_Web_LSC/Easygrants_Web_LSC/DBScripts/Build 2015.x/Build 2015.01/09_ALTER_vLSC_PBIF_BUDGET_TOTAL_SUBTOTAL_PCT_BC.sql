
/****** Object:  View [dbo].[vLSC_PBIF_BUDGET_TOTAL_SUBTOTAL_PCT_BC]    Script Date: 03-02-2015 19:07:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[vLSC_PBIF_BUDGET_TOTAL_SUBTOTAL_PCT_BC]

AS

SELECT tbt.lsc_pbif_budget_id,
	tbt.budget_total,
	ISNULL(pbctp.[1],0) per_exp,
	tbcp.[2] sal_wage,
	tbcp.[3] fringe,
	ISNULL(pbctp.[4],0) pro_exp,
	tbcp.[5] travel,
	tbcp.[6] equip,
	tbcp.[7] software,
	tbcp.[8] supplies,
	tbcp.[9] communication,
	tbcp.[10] training,
	tbcp.[11] evaluation,
	tbcp.[12] other,
	ISNULL(pbctp.[13],0) third_party,
	tbcp.[14] contracts,
	tbcp.[15] sub_contracts,
	tbftp.[1] inno_fund_share,
	tbftp.[2] applicant_share,
	tbftp.[3] cash_other_partners,
	tbftp.[4] in_kind_partners,
	tbftp.[5] cash_in_kind_support,
	tbftpp.[1] inno_fund_share_pct,
	tbftpp.[2] applicant_share_pct,
	tbftpp.[3] cash_other_partners_pct,
	tbftpp.[4] in_kind_partners_pct,
	tbftpp.[5] cash_in_kind_support_pct
	FROM dbo.vLSC_PBIF_BUDGET_TOTAL tbt
		LEFT JOIN vLSC_PBIF_BUDGET_BY_FUNDING_TYPE_PIVOT tbftp ON tbt.lsc_pbif_budget_id = tbftp.lsc_pbif_budget_id
		LEFT JOIN vLSC_PBIF_BUDGET_BY_FUNDING_TYPE_PCT_PIVOT tbftpp ON tbftp.lsc_pbif_budget_id = tbftpp.lsc_pbif_budget_id
		LEFT JOIN vLSC_PBIF_BUDGET_BY_CATEGORY_PIVOT tbcp ON tbt.lsc_pbif_budget_id = tbcp.lsc_pbif_budget_id
		LEFT JOIN vLSC_PBIF_BUDGET_CATEGORY_TOTAL_PIVOT pbctp ON tbt.lsc_PBIF_budget_id=pbctp.lsc_pbif_budget_id


GO


