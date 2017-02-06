SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vLSC_EXPENDITURE_BY_TYPE_SEC_A_TOTAL]

AS

SELECT lebt.wf_task_assignment_id,
	SUM(ISNULL(lebt.amount, 0)) expenditure_type_total,
	AVG(lebtsap.budget_item_total) budget_item_total,
	CASE WHEN AVG(lebtsap.budget_item_total) = 0 THEN NULL
		ELSE 100*SUM(lebtsap.amount_by_type)/AVG(lebtsap.budget_item_total) END AS percent_of_item
	FROM LSC_EXPENDITURE_BY_TYPE lebt
		JOIN LSC_a_EXPENDITURE_TYPE let ON lebt.lsc_expenditure_type_id = let.lsc_expenditure_type_id
		LEFT JOIN vLSC_EXPENDITURE_BY_TYPE_SEC_A_PERCENT lebtsap ON lebt.lsc_expenditure_by_type_id = lebtsap.lsc_expenditure_by_type_id
	WHERE let.lsc_expenditure_section_id = 1
	GROUP BY lebt.wf_task_assignment_id

