ALTER VIEW [dbo].[vLSC_DP_COMPONENTS_PAI]

AS

SELECT CAST(pc.lsc_pai_case_id AS VARCHAR(5)) + '-PBIH' lsc_pai_case_id
	,CAST(dbo.fnLSC_DP_GAR_WFTA_GRANTEE_PROJECT(cwosy.wf_task_assignment_id) AS VARCHAR(5)) + '-' + CAST(cwosy.wfta_year AS VARCHAR(4)) grant_key
	,'Pro Bono (In House)' category
	,pc.Pro_Bono_CR cases_referred
	,pc.Pro_Bono_CC cases_closed
	,pc.Pro_Bono_AAR attorneys_accepting_cases
	,pc.Pro_Bono_AAP attorneys_agreeing_take_cases
	,pc.Pro_Bono_LSAR law_graduates_accepting_cases
	,pc.Pro_Bono_LSAP law_graduates_agreeing_take_cases
	,pc.Pro_Bono_PLAR paralegals_accepting_cases
	,pc.Pro_Bono_PLAP paralegals_agreeing_take_cases
	FROM LSC_PAI_CASE pc
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON pc.wf_task_assignment_id = cwosy.wf_task_assignment_id
	WHERE cwosy.wfta_year > 2007
		AND cwosy.wfta_year < 2016
		AND cwosy.wf_task_id = 15
		AND cwosy.wf_task_status_id = 2

UNION ALL

SELECT CAST(pc.lsc_pai_case_id AS VARCHAR(5)) + '-PBS' lsc_pai_case_id
	,CAST(dbo.fnLSC_DP_GAR_WFTA_GRANTEE_PROJECT(cwosy.wf_task_assignment_id) AS VARCHAR(5)) + '-' + CAST(cwosy.wfta_year AS VARCHAR(4)) grant_key
	,'Pro Bono (Subgrant)' category
	,pc.Pro_Bono_S_CR cases_referred
	,pc.Pro_Bono_S_CC cases_closed
	,pc.Pro_Bono_S_AAR attorneys_accepting_cases
	,pc.Pro_Bono_S_AAP attorneys_agreeing_take_cases
	,pc.Pro_Bono_S_LSAR law_graduates_accepting_cases
	,pc.Pro_Bono_S_LSAP law_graduates_agreeing_take_cases
	,pc.Pro_Bono_S_PLAR paralegals_accepting_cases
	,pc.Pro_Bono_S_PLAP paralegals_agreeing_take_cases
	FROM LSC_PAI_CASE pc
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON pc.wf_task_assignment_id = cwosy.wf_task_assignment_id
	WHERE cwosy.wfta_year > 2007
		AND cwosy.wfta_year < 2016
		AND cwosy.wf_task_id = 15
		AND cwosy.wf_task_status_id = 2

UNION ALL

SELECT CAST(pc.lsc_pai_case_id AS VARCHAR(5)) + '-J' lsc_pai_case_id
	,CAST(dbo.fnLSC_DP_GAR_WFTA_GRANTEE_PROJECT(cwosy.wf_task_assignment_id) AS VARCHAR(5)) + '-' + CAST(cwosy.wfta_year AS VARCHAR(4)) grant_key
	,'Judicare/Reduced Fee Panel' category
	,pc.Judicare_CR cases_referred
	,pc.Judicare_CC cases_closed
	,pc.Judicare_AAR attorneys_accepting_cases
	,pc.Judicare_AAP attorneys_agreeing_take_cases
	,pc.Judicare_LSAR law_graduates_accepting_cases
	,pc.Judicare_LSAP law_graduates_agreeing_take_cases
	,pc.Judicare_PLAR paralegals_accepting_cases
	,pc.Judicare_PLAP paralegals_agreeing_take_cases
	FROM LSC_PAI_CASE pc
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON pc.wf_task_assignment_id = cwosy.wf_task_assignment_id
	WHERE cwosy.wfta_year > 2007
		AND cwosy.wfta_year < 2016
		AND cwosy.wf_task_id = 15
		AND cwosy.wf_task_status_id = 2

UNION ALL

SELECT CAST(pc.lsc_pai_case_id AS VARCHAR(5)) + '-CV' lsc_pai_case_id
	,CAST(dbo.fnLSC_DP_GAR_WFTA_GRANTEE_PROJECT(cwosy.wf_task_assignment_id) AS VARCHAR(5)) + '-' + CAST(cwosy.wfta_year AS VARCHAR(4)) grant_key
	,'Contract (Volume Case Services)' category
	,pc.Contr_Vol_CR cases_referred
	,pc.Contr_Vol_CC cases_closed
	,pc.Contr_Vol_AAR attorneys_accepting_cases
	,pc.Contr_Vol_AAP attorneys_agreeing_take_cases
	,pc.Contr_Vol_LSAR law_graduates_accepting_cases
	,pc.Contr_Vol_LSAP law_graduates_agreeing_take_cases
	,pc.Contr_Vol_PLAR paralegals_accepting_cases
	,pc.Contr_Vol_PLAP paralegals_agreeing_take_cases
	FROM LSC_PAI_CASE pc
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON pc.wf_task_assignment_id = cwosy.wf_task_assignment_id
	WHERE cwosy.wfta_year > 2007
		AND cwosy.wfta_year < 2016
		AND cwosy.wf_task_id = 15
		AND cwosy.wf_task_status_id = 2

UNION ALL

SELECT CAST(pc.lsc_pai_case_id AS VARCHAR(5)) + '-CI' lsc_pai_case_id
	,CAST(dbo.fnLSC_DP_GAR_WFTA_GRANTEE_PROJECT(cwosy.wf_task_assignment_id) AS VARCHAR(5)) + '-' + CAST(cwosy.wfta_year AS VARCHAR(4)) grant_key
	,'Contract (Individual Cases)' category
	,pc.Contr_Indv_CR cases_referred
	,pc.Contr_Indv_CC cases_closed
	,pc.Contr_Indv_AAR attorneys_accepting_cases
	,pc.Contr_Indv_AAP attorneys_agreeing_take_cases
	,pc.Contr_Indv_LSAR law_graduates_accepting_cases
	,pc.Contr_Indv_LSAP law_graduates_agreeing_take_cases
	,pc.Contr_Indv_PLAR paralegals_accepting_cases
	,pc.Contr_Indv_PLAP paralegals_agreeing_take_cases
	FROM LSC_PAI_CASE pc
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON pc.wf_task_assignment_id = cwosy.wf_task_assignment_id
	WHERE cwosy.wfta_year > 2007
		AND cwosy.wfta_year < 2016
		AND cwosy.wf_task_id = 15
		AND cwosy.wf_task_status_id = 2

UNION ALL

SELECT CAST(pc.lsc_pai_case_id AS VARCHAR(5)) + '-CC' lsc_pai_case_id
	,CAST(dbo.fnLSC_DP_GAR_WFTA_GRANTEE_PROJECT(cwosy.wf_task_assignment_id) AS VARCHAR(5)) + '-' + CAST(cwosy.wfta_year AS VARCHAR(4)) grant_key
	,'Co-Counsel' category
	,pc.Co_Council_CR cases_referred
	,pc.Co_Council_CC cases_closed
	,pc.Co_Council_AAR attorneys_accepting_cases
	,pc.Co_Council_AAP attorneys_agreeing_take_cases
	,' ' law_graduates_accepting_cases
	,' ' law_graduates_agreeing_take_cases
	,' ' paralegals_accepting_cases
	,' ' paralegals_agreeing_take_cases
	FROM LSC_PAI_CASE pc
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON pc.wf_task_assignment_id = cwosy.wf_task_assignment_id
	WHERE cwosy.wfta_year > 2007
		AND cwosy.wfta_year < 2011
		AND cwosy.wf_task_id = 15
		AND cwosy.wf_task_status_id = 2

UNION ALL

SELECT CAST(pc.lsc_pai_case_id AS VARCHAR(5)) + '-LRS' lsc_pai_case_id
	,CAST(dbo.fnLSC_DP_GAR_WFTA_GRANTEE_PROJECT(cwosy.wf_task_assignment_id) AS VARCHAR(5)) + '-' + CAST(cwosy.wfta_year AS VARCHAR(4)) grant_key
	,'Lawyer Referral Service' category
	,pc.LRS_CR cases_referred
	,pc.LRS_CC cases_closed
	,pc.LRS_AAR attorneys_accepting_cases
	,pc.LRS_AAP attorneys_agreeing_take_cases
	,' ' law_graduates_accepting_cases
	,' ' law_graduates_agreeing_take_cases
	,' ' paralegals_accepting_cases
	,' ' paralegals_agreeing_take_cases
	FROM LSC_PAI_CASE pc
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON pc.wf_task_assignment_id = cwosy.wf_task_assignment_id
	WHERE cwosy.wfta_year > 2007
		AND cwosy.wfta_year < 2011
		AND cwosy.wf_task_id = 15
		AND cwosy.wf_task_status_id = 2

UNION ALL

SELECT CAST(pc.lsc_pai_case_id AS VARCHAR(5)) + '-O' lsc_pai_case_id
	,CAST(dbo.fnLSC_DP_GAR_WFTA_GRANTEE_PROJECT(cwosy.wf_task_assignment_id) AS VARCHAR(5)) + '-' + CAST(cwosy.wfta_year AS VARCHAR(4)) grant_key
	,'Other' category
	,pc.Other_CR cases_referred
	,pc.Other_CC cases_closed
	,pc.Other_AAR attorneys_accepting_cases
	,pc.Other_AAP attorneys_agreeing_take_cases
	,' ' law_graduates_accepting_cases
	,' ' law_graduates_agreeing_take_cases
	,' ' paralegals_accepting_cases
	,' ' paralegals_agreeing_take_cases
	FROM LSC_PAI_CASE pc
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON pc.wf_task_assignment_id = cwosy.wf_task_assignment_id
	WHERE cwosy.wfta_year > 2007
		AND cwosy.wfta_year < 2011
		AND cwosy.wf_task_id = 15
		AND cwosy.wf_task_status_id = 2

UNION ALL

SELECT CAST(pc.lsc_pai_case_id AS VARCHAR(5)) + '-CCPB' lsc_pai_case_id
	,CAST(dbo.fnLSC_DP_GAR_WFTA_GRANTEE_PROJECT(cwosy.wf_task_assignment_id) AS VARCHAR(5)) + '-' + CAST(cwosy.wfta_year AS VARCHAR(4)) grant_key
	,'Co-Counsel (Pro Bono)' category
	,pc.CoCounsel_PB_CR cases_referred
	,pc.CoCounsel_PB_CC cases_closed
	,pc.CoCounsel_PB_AAR attorneys_accepting_cases
	,pc.CoCounsel_PB_AAP attorneys_agreeing_take_cases
	,pc.CoCounsel_PB_LSAR law_graduates_accepting_cases
	,pc.CoCounsel_PB_LSAP law_graduates_agreeing_take_cases
	,pc.CoCounsel_PB_PLAR paralegals_accepting_cases
	,pc.CoCounsel_PB_PLAP paralegals_agreeing_take_cases
	FROM LSC_PAI_CASE pc
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON pc.wf_task_assignment_id = cwosy.wf_task_assignment_id
	WHERE cwosy.wfta_year > 2010
		AND cwosy.wfta_year < 2016
		AND cwosy.wf_task_id = 15
		AND cwosy.wf_task_status_id = 2

UNION ALL

SELECT CAST(pc.lsc_pai_case_id AS VARCHAR(5)) + '-CCC' lsc_pai_case_id
	,CAST(dbo.fnLSC_DP_GAR_WFTA_GRANTEE_PROJECT(cwosy.wf_task_assignment_id) AS VARCHAR(5)) + '-' + CAST(cwosy.wfta_year AS VARCHAR(4)) grant_key
	,'Co-Counsel (Compensated)' category
	,pc.CoCounsel_Comp_CR cases_referred
	,pc.CoCounsel_Comp_CC cases_closed
	,pc.CoCounsel_Comp_AAR attorneys_accepting_cases
	,pc.CoCounsel_Comp_AAP attorneys_agreeing_take_cases
	,pc.CoCounsel_Comp_LSAR law_graduates_accepting_cases
	,pc.CoCounsel_Comp_LSAP law_graduates_agreeing_take_cases
	,pc.CoCounsel_Comp_PLAR paralegals_accepting_cases
	,pc.CoCounsel_Comp_PLAP paralegals_agreeing_take_cases
	FROM LSC_PAI_CASE pc
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON pc.wf_task_assignment_id = cwosy.wf_task_assignment_id
	WHERE cwosy.wfta_year > 2010
		AND cwosy.wfta_year < 2016
		AND cwosy.wf_task_id = 15
		AND cwosy.wf_task_status_id = 2

UNION ALL

SELECT CAST(pc.lsc_pai_case_id AS VARCHAR(5)) + '-OPB' lsc_pai_case_id
	,CAST(dbo.fnLSC_DP_GAR_WFTA_GRANTEE_PROJECT(cwosy.wf_task_assignment_id) AS VARCHAR(5)) + '-' + CAST(cwosy.wfta_year AS VARCHAR(4)) grant_key
	,'Other (Pro Bono)' category
	,pc.Other_PB_CR cases_referred
	,pc.Other_PB_CC cases_closed
	,pc.Other_PB_AAR attorneys_accepting_cases
	,pc.Other_PB_AAP attorneys_agreeing_take_cases
	,pc.Other_PB_LSAR law_graduates_accepting_cases
	,pc.Other_PB_LSAP law_graduates_agreeing_take_cases
	,pc.Other_PB_PLAR paralegals_accepting_cases
	,pc.Other_PB_PLAP paralegals_agreeing_take_cases
	FROM LSC_PAI_CASE pc
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON pc.wf_task_assignment_id = cwosy.wf_task_assignment_id
	WHERE cwosy.wfta_year > 2010
		AND cwosy.wfta_year < 2016
		AND cwosy.wf_task_id = 15
		AND cwosy.wf_task_status_id = 2

UNION ALL

SELECT CAST(pc.lsc_pai_case_id AS VARCHAR(5)) + '-OC' lsc_pai_case_id
	,CAST(dbo.fnLSC_DP_GAR_WFTA_GRANTEE_PROJECT(cwosy.wf_task_assignment_id) AS VARCHAR(5)) + '-' + CAST(cwosy.wfta_year AS VARCHAR(4)) grant_key
	,'Other (Compensated)' category
	,pc.Other_Comp_CR cases_referred
	,pc.Other_Comp_CC cases_closed
	,pc.Other_Comp_AAR attorneys_accepting_cases
	,pc.Other_Comp_AAP attorneys_agreeing_take_cases
	,pc.Other_Comp_LSAR law_graduates_accepting_cases
	,pc.Other_Comp_LSAP law_graduates_agreeing_take_cases
	,pc.Other_Comp_PLAR paralegals_accepting_cases
	,pc.Other_Comp_PLAP paralegals_agreeing_take_cases
	FROM LSC_PAI_CASE pc
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON pc.wf_task_assignment_id = cwosy.wf_task_assignment_id
	WHERE cwosy.wfta_year > 2010
		AND cwosy.wfta_year < 2016
		AND cwosy.wf_task_id = 15
		AND cwosy.wf_task_status_id = 2
