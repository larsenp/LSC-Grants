CREATE VIEW [dbo].[vLSC_TIG_BUDGET_BY_CATEGORY]

AS

SELECT CAST(tbi.lsc_tig_budget_id AS VARCHAR(6)) + '_' + CAST(tbi.budget_category_id AS VARCHAR(6)) lsc_tig_budget_by_category_id,
	tbi.lsc_tig_budget_id,
	tbi.budget_category_id,
	SUM(isnull(tbi.amount, 0)) category_total,
	SUM(isnull(case when tbi.lsc_tig_budget_funding_type_id = 1 then 0 else amount end, 0)) non_tig_total,
	bc.sort_order
	FROM LSC_TIG_BUDGET_ITEM tbi
		JOIN a_BUDGET_CATEGORY bc ON tbi.budget_category_id = bc.budget_category_id
	WHERE tbi.budget_category_id IS NOT NULL
	GROUP BY tbi.lsc_tig_budget_id,
		tbi.budget_category_id,
		bc.sort_order
