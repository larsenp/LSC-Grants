CREATE VIEW vLSC_PRO_BONO_RISK_ASSESSMENT_FLAG

AS

SELECT pbrar.wf_task_assignment_id
	,wfta.grantee_project_id
	,ISNULL(pai_waivers, 0) 
		| ISNULL(tig_performance, 0) 
		| ISNULL(special_grant_conditions, 0) 
		| ISNULL(oce_compliance_fiscal_reviews, 0) 
		| ISNULL(oig_investigation_matters, 0) 
		| ISNULL(issue_contractor_subgrantee, 0) due_diligence_flag
	FROM LSC_PRO_BONO_RISK_ASSESSMENT_REVIEW pbrar
		JOIN WF_TASK_ASSIGNMENT wfta ON pbrar.wf_task_assignment_id = wfta.wf_task_assignment_id
