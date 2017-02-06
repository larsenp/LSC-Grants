
/****** Object:  View [dbo].[vLSC_PBIF_BUDGET_BY_FUNDING_TYPE_PIVOT]    Script Date: 03-02-2015 19:05:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[vLSC_PBIF_BUDGET_BY_FUNDING_TYPE_PIVOT]

AS

SELECT lsc_pbif_budget_id,
	[1], [2], [3], [4],[5]
	FROM (SELECT lsc_pbif_budget_id,
		lsc_pbif_budget_funding_type_id,
		funding_type_total
		FROM vLSC_PBIF_BUDGET_BY_FUNDING_TYPE) AS lines
	PIVOT (SUM(funding_type_total)
		FOR lsc_pbif_budget_funding_type_id IN ([1], [2], [3], [4],[5])
		) AS pvt



GO


