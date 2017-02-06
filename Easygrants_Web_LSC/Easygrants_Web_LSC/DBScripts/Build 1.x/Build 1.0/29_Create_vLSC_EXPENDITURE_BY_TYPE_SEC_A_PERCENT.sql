USE [Easygrants_Migration]
GO
/****** Object:  View [dbo].[vLSC_EXPENDITURE_BY_TYPE_SEC_A_PERCENT]    Script Date: 03/06/2008 11:27:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_EXPENDITURE_BY_TYPE_SEC_A_PERCENT]

AS

SELECT lebt.lsc_expenditure_by_type_id,
	ISNULL(lebt.amount, 0) amount_by_type,
	ISNULL(bi.amount, 0) budget_item_total,
	CASE WHEN ISNULL(bi.amount, 0) = 0 THEN NULL
		ELSE 100*ISNULL(lebt.amount, 0)/bi.amount END AS percent_by_type
	FROM LSC_EXPENDITURE_BY_TYPE lebt
		LEFT JOIN LSC_a_EXPENDITURE_TYPE let on lebt.lsc_expenditure_type_id = let.lsc_expenditure_type_id
		LEFT JOIN vLSC_WFTA_BUDGET_PERIOD lwbp ON lebt.wf_task_assignment_id = lwbp.wf_task_assignment_id
		--LEFT JOIN BUDGET b ON lebt.grantee_project_id = b.grantee_project_id
		--LEFT JOIN BUDGET_PERIOD bp on lwbp.budget_period_id = bp.budget_id
		LEFT JOIN BUDGET_ITEM bi on lwbp.budget_period_id = bi.budget_period_id
		LEFT JOIN a_BUDGET_CATEGORY bc on bi.budget_category_id = bc.budget_category_id
		LEFT JOIN a_BUDGET_CATEGORY bcp on bc.parent_id = bcp.budget_category_id
	WHERE let.lsc_expenditure_section_id = 1
		AND bc.category_type_id = 1
		AND bcp.parent_id = 0
		