--Add non_tig_total for use in Contracts form

/****** Object:  View [dbo].[vLSC_TIG_BUDGET_BY_LINE]    Script Date: 04/25/2011 12:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vLSC_TIG_BUDGET_BY_LINE]

AS

SELECT CAST(lsc_tig_budget_id AS VARCHAR(6)) + '_' + CAST(lsc_tig_budget_line_id AS VARCHAR(4)) lsc_tig_budget_by_line_id,
	lsc_tig_budget_id,
	lsc_tig_budget_line_id,
	SUM(isnull(amount, 0)) line_total,
	SUM(isnull(case when lsc_tig_budget_funding_type_id = 1 then 0 else amount end, 0)) non_tig_total
	FROM LSC_TIG_BUDGET_ITEM
	GROUP BY lsc_tig_budget_id,
		lsc_tig_budget_line_id
