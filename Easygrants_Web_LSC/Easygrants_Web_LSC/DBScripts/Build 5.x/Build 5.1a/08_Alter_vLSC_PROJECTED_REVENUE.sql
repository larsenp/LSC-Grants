--Add serv_area_type column

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vLSC_PROJECTED_REVENUE_PIVOT]

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
	[42],
	[44],
	[46],
	[48],
	[50],
	[52],
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
		where wfta.wf_task_id = 20
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
	[42],
	[44],
	[46],
	[48],
	[50],
	[52],
	[54],
	[55],
	[99],
	[57],
	[58]
)) as piv

GO

ALTER VIEW [dbo].[vLSC_PROJECTED_REVENUE]

AS

SELECT [wfta_year]
      ,[recipient_id]
      ,o.organization_name recipient_name
      ,[serv_area]
      ,[serv_area_type]
      ,[10] [LSC_Basic_Fld]
      ,[28] [Intr_or_Invest]
      ,[22] [Fee_Awd_LSC_Cs]
      ,[23] [Publ_LSC]
      ,[24] [Cr_Ovr_Fnd_LSC]
      ,[20] [Ot_Fnd_LSC_Amt]
	  ,[10] + [28] + [22] + [23] + [24] + [20] AS [lsc_funding]
      ,[30] [Title_XX_SSI]
      ,[32] [Older_Amr_Care]
      ,[33] [Violence_Women]
      ,[34] [Other_Federal]
      ,[36] [Block_Grants]
      ,[40] [State_Grants]
      ,[42] [Local_Grants]
      ,[44] [United_Way]
      ,[46] [Fndtion_Grants]
      ,[48] [Bar_Grants]
      ,[50] [IOLTA]
      ,[52] [Fee_Awards]
      ,[54] [Cry_Ovr_Funds]
      ,[55] [Publication]
      ,[99] [Ot_Funds_Amt]
      ,[30] + [32] + [33] + [34] + [36] + [40] + [42] + [44] + [46] + [48] + [50] + [52] + [54] + [55] + [99] AS [non_lsc_funding]
      ,[57] [Client_Fees]
      ,[58] [For_Profit_Inc]
      ,[57] + [58] AS [client_serv]
      ,[10] + [28] + [22] + [23] + [24] + [20] + [30] + [32] + [33] + [34] + [36] + [40] + [42] + [44] + [46] + [48] + [50] + [52] + [54] + [55] + [99] + [57] + [58] AS [total]
  FROM vLSC_PROJECTED_REVENUE_PIVOT lprp
	JOIN ORGANIZATION o ON lprp.recipient_id = o.legacy_organization_id
