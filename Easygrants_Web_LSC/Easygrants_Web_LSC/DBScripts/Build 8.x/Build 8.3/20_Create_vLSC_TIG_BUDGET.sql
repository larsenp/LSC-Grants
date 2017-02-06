CREATE VIEW vLSC_TIG_BUDGET

AS

SELECT lsc_tig_budget_id,
	SUM(amount) budget_total
	FROM LSC_TIG_BUDGET_ITEM
	GROUP BY lsc_tig_budget_id