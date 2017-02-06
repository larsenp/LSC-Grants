CREATE VIEW vLSC_PPQV_REVIEW_SCORE_OPP_OCE

AS

SELECT lrac.wf_task_assignment_id opp_wfta_id,
	NULL oce_wfta_id,
	lrac.lsc_review_assignment_category_id,
	lrac.lsc_review_category_id,
	lris.value score
	FROM LSC_REVIEW_ASSIGNMENT_CATEGORY lrac
		JOIN LSC_a_REVIEW_CRITERION c ON lrac.lsc_review_category_id = c.lsc_review_category_id
		JOIN LSC_c_REVIEW_INQUIRY_SCORE lris ON lrac.lsc_review_inquiry_score_id = lris.id
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON lrac.wf_task_assignment_id = cwosy.wf_task_assignment_id
		JOIN LSC_a_REVIEW_PERFORMANCE_AREA pa on c.lsc_review_performance_area_id = pa.id
	WHERE cwosy.wfta_year > 2012
		AND c.abbr = '4'
		AND pa.sort_order = 4

UNION ALL

SELECT wfta_opp.wf_task_assignment_id opp_wfta_id,
	wfta_oce.wf_task_assignment_id oce_wfta_id,
	NULL lsc_review_assignment_category_id,
	cr.lsc_review_category_id,
	lris.value score
	FROM WF_TASK_ASSIGNMENT wfta_opp
		JOIN WF_TASK_ASSIGNMENT wfta_oce ON wfta_opp.grantee_project_id = wfta_oce.grantee_project_id
			AND wfta_oce.wf_task_id = 83
		JOIN LSC_REVIEW_ASSIGNMENT_INQUIRY rai ON wfta_oce.wf_task_assignment_id = rai.wf_task_assignment_id
		JOIN LSC_c_REVIEW_INQUIRY_SCORE lris ON rai.lsc_review_inquiry_score_id = lris.id
		JOIN LSC_a_REVIEW_INQUIRY q ON rai.lsc_review_inquiry_id = q.id
		JOIN LSC_a_REVIEW_CRITERION cr ON q.lsc_review_criterion_id = cr.id
	WHERE wfta_opp.wf_task_id = 68
