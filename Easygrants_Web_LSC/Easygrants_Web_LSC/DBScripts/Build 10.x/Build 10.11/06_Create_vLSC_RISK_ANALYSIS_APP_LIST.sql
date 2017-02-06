CREATE VIEW vLSC_RISK_ANALYSIS_APP_LIST

AS

SELECT wfta_app.wf_task_assignment_id app_wfta_id,
	wfta_app.wf_task_id app_task_id,
	wfta_rev.wf_task_assignment_id rev_wfta_id,
	wfta_app.grantee_project_id,
	cwosy_app.serv_area,
	gp.primary_organization_id organization_id,
	cwosy_app.wfta_year,
	rod.report_output_definition_id,
	CASE WHEN wfta_app.wf_task_id = 2 THEN rts.total_score
		WHEN wfta_app.wf_task_id IN (4,67) THEN NULL
		WHEN wfta_app.wf_task_id = 66 THEN prts.total_score END total_score,
	f.fund_amount,
	CASE WHEN sa.service_area_type_id = 1 THEN sa.adj_poor_popul
		WHEN sa.service_area_type_id = 2 THEN sa.migr_poor_popul
		WHEN sa.service_area_type_id = 3 THEN NULL END poor_popul
	FROM WF_TASK_ASSIGNMENT wfta_app	
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy_app ON wfta_app.wf_task_assignment_id = cwosy_app.wf_task_assignment_id
		JOIN WF_TASK_ASSIGNMENT wfta_rev ON wfta_app.grantee_project_id = wfta_rev.grantee_project_id
			AND wfta_rev.wf_task_id in (5, 6, 68, 69)
			AND wfta_rev.wf_task_status_id <> 3
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy_rev ON wfta_rev.wf_task_assignment_id = cwosy_rev.wf_task_assignment_id 
			AND cwosy_app.wfta_year = cwosy_rev.wfta_year
		JOIN GRANTEE_PROJECT gp ON wfta_app.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_WF_PROJECT_TASK wfpt ON wfta_app.wf_task_id = wfpt.wf_task_id
			AND gp.wf_project_id = wfpt.wf_project_id
		JOIN a_WF_PROJECT_TASK_PDF wfptp ON wfpt.id = wfptp.wf_project_task_id
			AND wfptp.report_output_definition_type_id = 1
		JOIN a_REPORT_OUTPUT_DEFINITION rod ON wfptp.final_pdf_report_key = rod.definition_key
		LEFT JOIN vREVIEW_TOTAL_SCORE rts ON wfta_rev.wf_task_assignment_id = rts.review_wfta_id
		LEFT JOIN vLSC_PPQV_REVIEW_TOTAL_SCORE prts ON wfta_rev.wf_task_assignment_id = prts.wf_task_assignment_id
		JOIN a_FUND f ON wfp.fund_id = f.fund_id 
		JOIN LSC_a_SERVICE_AREA sa ON wfp.competition_id = sa.competition_id
	WHERE wfta_app.wf_task_id in (2,4,66,67)

