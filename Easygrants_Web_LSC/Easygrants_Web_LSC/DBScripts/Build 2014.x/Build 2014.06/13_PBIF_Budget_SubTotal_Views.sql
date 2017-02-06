IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vLSC_PBIF_BUDGET_CATEGORY_TOTAL_BY_FUNDING_TYPE_PIVOT]'))
DROP VIEW [dbo].[vLSC_PBIF_BUDGET_CATEGORY_TOTAL_BY_FUNDING_TYPE_PIVOT]
GO
CREATE VIEW [dbo].[vLSC_PBIF_BUDGET_CATEGORY_TOTAL_BY_FUNDING_TYPE_PIVOT]

AS
SELECT lsc_pbif_budget_id,
  	[1_1], [1_2], [1_3], [1_4],
	[4_1], [4_2], [4_3], [4_4],
	[13_1], [13_2], [13_3], [13_4]

	FROM
	(SELECT bctft.lsc_pbif_budget_id,
	   		CAST(tbl.sort_order AS VARCHAR(10)) + '_' + CAST(tbft.id AS VARCHAR(2)) line_funding_type,
		ISNULL(bctft.amount, 0) amount
		FROM vLSC_PBIF_BUDGET_CATEGORY_TOTAL_BY_FUNDING_TYPE bctft
			join LSC_PBIF_BUDGET tb ON bctft.lsc_pbif_budget_id = tb.lsc_pbif_budget_id
			join a_BUDGET_CATEGORY tbl ON bctft.budget_category_id = tbl.budget_category_id
			join LSC_a_PBIF_BUDGET_FUNDING_TYPE tbft ON bctft.lsc_pbif_budget_funding_type_id = tbft.id) AS lines
		PIVOT
			(SUM(amount)
				FOR line_funding_type in 
					([1_1], [1_2], [1_3], [1_4],
	                 [4_1], [4_2], [4_3], [4_4],
	                 [13_1], [13_2], [13_3], [13_4])
		         	) AS pvt

GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vLSC_PBIF_BUDGET_SUBTOTAL_BC]'))
DROP VIEW [dbo].[vLSC_PBIF_BUDGET_SUBTOTAL_BC]
GO
CREATE VIEW [dbo].[vLSC_PBIF_BUDGET_SUBTOTAL_BC]

AS

SELECT tb.[lsc_pbif_budget_id]
	,tb.lsc_pbif_budget_type_id
	,tb.wf_task_assignment_id
	,gp.grantee_project_id
	,gp.legacy_grant_id pbif
      , tbp.[1_1] per_exp_1
      , tbp.[1_2] per_exp_2
      , tbp.[1_3] per_exp_3
      , tbp.[1_4] per_exp_4
      , tbp.[4_1] proj_exp_1
      , tbp.[4_2] proj_exp_2
      , tbp.[4_3] proj_exp_3
      , tbp.[4_4] proj_exp_4
      , tbp.[13_1] tp_1
      , tbp.[13_2] tp_2
      , tbp.[13_3] tp_3
      , tbp.[13_4] tp_4
     
  FROM vLSC_PBIF_BUDGET_CATEGORY_TOTAL_BY_FUNDING_TYPE_PIVOT tbp
	JOIN LSC_PBIF_BUDGET tb ON tbp.lsc_pbif_budget_id = tb.lsc_pbif_budget_id
	JOIN WF_TASK_ASSIGNMENT wfta ON tb.wf_task_assignment_id = wfta.wf_task_assignment_id
	JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id

UNION ALL

SELECT tb.[lsc_pbif_budget_id]
	,tb.lsc_pbif_budget_type_id
	,NULL wf_task_assignment_id
	,gp.grantee_project_id
	,gp.legacy_grant_id tig
      , tbp.[1_1] per_exp_1
      , tbp.[1_2] per_exp_2
      , tbp.[1_3] per_exp_3
      , tbp.[1_4] per_exp_4
      , tbp.[4_1] proj_exp_1
      , tbp.[4_2] proj_exp_2
      , tbp.[4_3] proj_exp_3
      , tbp.[4_4] proj_exp_4
      , tbp.[13_1] tp_1
      , tbp.[13_2] tp_2
      , tbp.[13_3] tp_3
      , tbp.[13_4] tp_4
	FROM [vLSC_PBIF_BUDGET_CATEGORY_TOTAL_BY_FUNDING_TYPE_PIVOT] tbp
	JOIN LSC_PBIF_BUDGET tb ON tbp.lsc_pbif_budget_id = tb.lsc_pbif_budget_id
	JOIN GRANTEE_PROJECT gp ON tb.grantee_project_id = gp.grantee_project_id


GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vLSC_PBIF_BUDGET_CATEGORY_TOTAL]'))
DROP VIEW [dbo].[vLSC_PBIF_BUDGET_CATEGORY_TOTAL]
GO
CREATE VIEW [dbo].[vLSC_PBIF_BUDGET_CATEGORY_TOTAL] as

select lsc_pbif_budget_id,Parent.budget_category_id budget_category_id,SUM(LSC_PBIF_BUDGET_ITEM.amount) amount,Parent.sort_order  from LSC_PBIF_BUDGET_ITEM
inner join a_BUDGET_CATEGORY on a_BUDGET_CATEGORY.budget_category_id = LSC_PBIF_BUDGET_ITEM.budget_category_id
inner join a_BUDGET_CATEGORY Parent on a_BUDGET_CATEGORY.parent_id = Parent.budget_category_id
group by lsc_pbif_budget_id,Parent.budget_category_id,Parent.sort_order

GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vLSC_PBIF_BUDGET_CATEGORY_TOTAL_PIVOT]'))
DROP VIEW [dbo].[vLSC_PBIF_BUDGET_CATEGORY_TOTAL_PIVOT]
GO
CREATE VIEW [dbo].[vLSC_PBIF_BUDGET_CATEGORY_TOTAL_PIVOT]

AS

SELECT lsc_pbif_budget_id,
	[1], [4], [13]
	FROM (SELECT lsc_pbif_budget_id,
			amount,sort_order
		FROM vLSC_PBIF_BUDGET_CATEGORY_TOTAL) AS lines
	PIVOT (MAX(amount)
		FOR sort_order IN ([1], [4], [13])
		) AS pvt


GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vLSC_PBIF_BUDGET_TOTAL_SUBTOTAL_PCT_BC]'))
DROP VIEW [dbo].[vLSC_PBIF_BUDGET_TOTAL_SUBTOTAL_PCT_BC]
GO
CREATE VIEW [dbo].[vLSC_PBIF_BUDGET_TOTAL_SUBTOTAL_PCT_BC]

AS

SELECT tbt.lsc_pbif_budget_id,
	tbt.budget_total,
	ISNULL(pbctp.[1],0) per_exp,
	tbcp.[2] sal_wage,
	tbcp.[3] fringe,
	ISNULL(pbctp.[4],0) pro_exp,
	tbcp.[5] travel,
	tbcp.[6] equip,
	tbcp.[7] software,
	tbcp.[8] supplies,
	tbcp.[9] communication,
	tbcp.[10] training,
	tbcp.[11] evaluation,
	tbcp.[12] other,
	ISNULL(pbctp.[13],0) third_party,
	tbcp.[14] contracts,
	tbcp.[15] sub_contracts,
	tbftp.[1] inno_fund_share,
	tbftp.[2] applicant_share,
	tbftp.[3] cash_other_partners,
	tbftp.[4] in_kind_partners,
	tbftpp.[1] inno_fund_share_pct,
	tbftpp.[2] applicant_share_pct,
	tbftpp.[3] cash_other_partners_pct,
	tbftpp.[4] in_kind_partners_pct
	FROM dbo.vLSC_PBIF_BUDGET_TOTAL tbt
		LEFT JOIN vLSC_PBIF_BUDGET_BY_FUNDING_TYPE_PIVOT tbftp ON tbt.lsc_pbif_budget_id = tbftp.lsc_pbif_budget_id
		LEFT JOIN vLSC_PBIF_BUDGET_BY_FUNDING_TYPE_PCT_PIVOT tbftpp ON tbftp.lsc_pbif_budget_id = tbftpp.lsc_pbif_budget_id
		LEFT JOIN vLSC_PBIF_BUDGET_BY_CATEGORY_PIVOT tbcp ON tbt.lsc_pbif_budget_id = tbcp.lsc_pbif_budget_id
		LEFT JOIN vLSC_PBIF_BUDGET_CATEGORY_TOTAL_PIVOT pbctp ON tbt.lsc_PBIF_budget_id=pbctp.lsc_pbif_budget_id
GO