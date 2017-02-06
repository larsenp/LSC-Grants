USE [Easygrants]
GO
/****** Object:  View [dbo].[vWFTA_MID_LEVEL_BUDGET_ITEMS]    Script Date: 05/05/2008 11:16:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vWFTA_MID_LEVEL_BUDGET_ITEMS]
AS

SELECT bi.budget_item_id,
	wfta.wf_task_assignment_id,
	bc.category_type_id, 
	bc.sort_order,
	bi.amount
	FROM wf_task_assignment wfta
		LEFT JOIN grantee_project gp ON wfta.grantee_project_id = gp.grantee_project_id
		LEFT JOIN vLSC_WFTA_BUDGET_PERIOD lwbp ON wfta.wf_task_assignment_id = lwbp.wf_task_assignment_id
		LEFT JOIN budget_period bp ON lwbp.budget_period_id = bp.budget_period_id
		LEFT JOIN a_budget_category bcgp ON gp.wf_project_id = bcgp.project_id
			AND bcgp.parent_id = 0
		LEFT JOIN a_budget_category bcp ON bcgp.budget_category_id = bcp.parent_id
		LEFT JOIN a_budget_category bc ON bcp.budget_category_id = bc.parent_id
		LEFT JOIN budget_item bi ON bp.budget_period_id = bi.budget_period_id
			AND bc.budget_category_id = bi.budget_category_id
