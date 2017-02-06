
/****** Object:  View [dbo].[vLSC_PBIF_BUDGET_SUBTOTAL_BC]    Script Date: 03-02-2015 19:11:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[vLSC_PBIF_BUDGET_SUBTOTAL_BC]

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
	  , tbp.[1_5] per_exp_5
      , tbp.[4_1] proj_exp_1
      , tbp.[4_2] proj_exp_2
      , tbp.[4_3] proj_exp_3
      , tbp.[4_4] proj_exp_4
      , tbp.[4_5] proj_exp_5
      , tbp.[13_1] tp_1
      , tbp.[13_2] tp_2
      , tbp.[13_3] tp_3
      , tbp.[13_4] tp_4
	  , tbp.[13_5] tp_5
     
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
	  , tbp.[1_5] per_exp_5
      , tbp.[4_1] proj_exp_1
      , tbp.[4_2] proj_exp_2
      , tbp.[4_3] proj_exp_3
      , tbp.[4_4] proj_exp_4
      , tbp.[4_5] proj_exp_5
      , tbp.[13_1] tp_1
      , tbp.[13_2] tp_2
      , tbp.[13_3] tp_3
      , tbp.[13_4] tp_4
	  , tbp.[13_5] tp_5
	FROM [vLSC_PBIF_BUDGET_CATEGORY_TOTAL_BY_FUNDING_TYPE_PIVOT] tbp
	JOIN LSC_PBIF_BUDGET tb ON tbp.lsc_pbif_budget_id = tb.lsc_pbif_budget_id
	JOIN GRANTEE_PROJECT gp ON tb.grantee_project_id = gp.grantee_project_id




GO


