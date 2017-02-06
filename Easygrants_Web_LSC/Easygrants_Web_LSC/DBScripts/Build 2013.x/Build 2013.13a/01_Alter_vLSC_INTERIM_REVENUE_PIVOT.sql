/****** Object:  View [dbo].[vLSC_INTERIM_REVENUE_PIVOT]    Script Date: 07/10/2013 15:25:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[vLSC_INTERIM_REVENUE_PIVOT]

AS
select wfta_year,
	recipient_id,
	serv_area,
	serv_area_type,
	[10], 
	[28],
	[22],
	[23],
	[24],
	[20],
	[30],
	[32],
	[33],
	[34],
	[36],
	[40],
    [41],
	[42],
	[43],
	[44],
	[45],
	[46],
	[48],
	[50],
	[52],
	[53],
	[54],
	[55],
	[99],
	[57],
	[58]
from
	(select wcy.wfta_year,
		o.legacy_organization_id recipient_id,
		c.abbr serv_area,
		sat.abbr serv_area_type,
		bc.lsc_fund_code,
		bi.amount
		from WF_TASK_ASSIGNMENT wfta
			join vLSC_WFTA_BUDGET_PERIOD wbp on wfta.wf_task_assignment_id = wbp.wf_task_assignment_id
			join vWFTA_COMPETITION_YEAR wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
			join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
			join organization o on gp.primary_organization_id = o.organization_id
			join a_wf_project wfp on gp.wf_project_id = wfp.id
			join a_competition c on wfp.competition_id = c.id
			join budget_item bi on wbp.budget_period_id = bi.budget_period_id
			join a_budget_category bc on bi.budget_category_id = bc.budget_category_id
			join lsc_a_service_area sa on c.id = sa.competition_id
			join lsc_c_service_area_type sat on sa.service_area_type_id = sat.id
		where wfta.wf_task_id = 79
			and bc.category_type_id = 7) as fund
	pivot
	(sum(amount)
	for lsc_fund_code in (	[10], 
	[28],
	[22],
	[23],
	[24],
	[20],
	[30],
	[32],
	[33],
	[34],
	[36],
	[40],
    [41],
	[42],
	[43],
	[44],
	[45],
	[46],
	[48],
	[50],
	[52],
	[53],
	[54],
	[55],
	[99],
	[57],
	[58]
)) as piv
