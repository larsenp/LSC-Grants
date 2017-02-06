
/****** Object:  View [dbo].[vLSC_PBIF_BUDGET_BY_FUNDING_TYPE_PCT_PIVOT]    Script Date: 03-02-2015 19:06:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dbo].[vLSC_PBIF_BUDGET_BY_FUNDING_TYPE_PCT_PIVOT]

AS

SELECT lsc_pbif_budget_id,
	[1], [2], [3], [4],[5]
	FROM (SELECT lsc_pbif_budget_id,
		lsc_pbif_budget_funding_type_id,
		budget_pct
		FROM vLSC_PBIF_BUDGET_BY_FUNDING_TYPE_PCT tbftp
			JOIN vLSC_PBIF_BUDGET_BY_FUNDING_TYPE tbft ON tbftp.lsc_pbif_budget_by_funding_type_id = tbft.lsc_pbif_budget_by_funding_type_id) AS lines
	PIVOT (SUM(budget_pct)
		FOR lsc_pbif_budget_funding_type_id IN ([1], [2], [3], [4],[5])
		) AS pvt



GO


