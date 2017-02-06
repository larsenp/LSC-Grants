SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vLSC_INTERIM_EXPENSES_TOTAL_PIVOT]

AS

select wf_task_assignment_id,
	[6_8], 
	[6_9],
	[6_10],
	[6_11],
	[7_1],
	[7_2],
	[7_3],
	[7_4],
	[7_5],
	[7_6],
	[7_7],
	[7_8],
	[7_9],
	[7_10],
	[7_11],
	[7_12],
	[7_13],
	[7_14],
	[7_15],
	[7_16],
	[7_17],
	[7_18],
	[7_19],
	[7_20]
from
	(select wfta.wf_task_assignment_id,
		cast(bcp.sort_order as varchar(3)) + '_' + cast(bc.sort_order as varchar(3)) category_sort,
		isnull(bi.amount, 0) amount
		from WF_TASK_ASSIGNMENT wfta
			join vLSC_WFTA_BUDGET_PERIOD wbp on wfta.wf_task_assignment_id = wbp.wf_task_assignment_id
			join budget_item bi on wbp.budget_period_id = bi.budget_period_id
			join a_budget_category bc on bi.budget_category_id = bc.budget_category_id
			join a_budget_category bcp on bc.parent_id = bcp.budget_category_id
		where wfta.wf_task_id = 78
			and bc.category_type_id = 6) as expense
	pivot
	(sum(amount)
		for category_sort in ([6_8], 
			[6_9],
			[6_10],
			[6_11],
			[7_1],
			[7_2],
			[7_3],
			[7_4],
			[7_5],
			[7_6],
			[7_7],
			[7_8],
			[7_9],
			[7_10],
			[7_11],
			[7_12],
			[7_13],
			[7_14],
			[7_15],
			[7_16],
			[7_17],
			[7_18],
			[7_19],
			[7_20])) as piv

