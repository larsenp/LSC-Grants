
CREATE VIEW [dbo].[vLSC_EXPENDITURE_BY_TYPE_SEC_A_TOTAL]

AS

SELECT lebt.grantee_project_id,
	SUM(lebtsap.amount_by_type) expenditure_type_total,
	AVG(lebtsap.budget_item_total) budget_item_total,
	CASE WHEN AVG(lebtsap.budget_item_total) = 0 THEN NULL
		ELSE 100*SUM(lebtsap.amount_by_type)/AVG(lebtsap.budget_item_total) END AS percent_of_item
	FROM vLSC_EXPENDITURE_BY_TYPE_SEC_A_PERCENT lebtsap
		JOIN LSC_EXPENDITURE_BY_TYPE lebt ON lebtsap.lsc_expenditure_by_type_id = lebt.lsc_expenditure_by_type_id
	GROUP BY lebt.grantee_project_id