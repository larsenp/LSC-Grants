USE [Easygrants]
GO
/****** Object:  View [dbo].[vWFTA_TOP_LEVEL_BUDGET_ITEMS]    Script Date: 02/22/2008 17:04:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
vWFTA_TOP_LEVEL_BUDGET_ITEMS
Created by Peter Larsen 2/13/2008
This view, used for submission-level validation, associates workflow
task assignments with their corresponding budget items and returns
the top-level budget items associated with each task assignment, their 
category type (Projected Revenues, Projected Expenses, Current Revenues, 
Current Expenses), and the amount.

*/

CREATE VIEW [dbo].[vWFTA_TOP_LEVEL_BUDGET_ITEMS]

AS

SELECT bi.budget_item_id,
	wfta.wf_task_assignment_id,
	bc.category_type_id, 
	bi.amount
	FROM wf_task_assignment wfta
		LEFT JOIN grantee_project gp ON wfta.grantee_project_id = gp.grantee_project_id
		--LEFT JOIN budget b ON gp.grantee_project_id = b.grantee_project_id
		LEFT JOIN vLSC_WFTA_BUDGET_PERIOD lwbp ON wfta.wf_task_assignment_id = lwbp.wf_task_assignment_id
		LEFT JOIN budget_period bp ON lwbp.budget_period_id = bp.budget_period_id
		LEFT JOIN a_budget_category bcp ON gp.wf_project_id = bcp.project_id
			AND bcp.parent_id = 0
		LEFT JOIN a_budget_category bc ON bcp.budget_category_id = bc.parent_id
		LEFT JOIN budget_item bi ON bp.budget_period_id = bi.budget_period_id
			AND bc.budget_category_id = bi.budget_category_id

