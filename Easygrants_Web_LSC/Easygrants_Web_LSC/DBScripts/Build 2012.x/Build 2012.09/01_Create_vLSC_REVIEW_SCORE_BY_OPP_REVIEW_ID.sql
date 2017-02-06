CREATE VIEW [dbo].[vLSC_REVIEW_SCORE_BY_OPP_REVIEW_ID]

AS

SELECT wfta.wf_task_assignment_id review_wfta_id,
	lrai.lsc_review_inquiry_id,
	lrai.lsc_review_inquiry_score_id,
	lris.value score,
	NULL oce_wfta_id
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN lsc_review_assignment_inquiry lrai ON wfta.wf_task_assignment_id = lrai.wf_task_assignment_id
		JOIN LSC_c_REVIEW_INQUIRY_SCORE lris ON lrai.lsc_review_inquiry_score_id = lris.id
	WHERE wfta.wf_task_id = 5

UNION ALL

SELECT wfta_opp.wf_task_assignment_id review_wfta_id,
	lrai.lsc_review_inquiry_id,
	lrai.lsc_review_inquiry_score_id,
	lris.value score,
	wfta_oce.wf_task_assignment_id oce_wfta_id
	FROM WF_TASK_ASSIGNMENT wfta_opp
		JOIN vWFTA_COMPETITION_YEAR wcy_opp ON wfta_opp.wf_task_assignment_id = wcy_opp.wf_task_assignment_id
		JOIN (WF_TASK_ASSIGNMENT wfta_oce  
			JOIN vWFTA_COMPETITION_YEAR wcy_oce ON wfta_oce.wf_task_assignment_id = wcy_oce.wf_task_assignment_id)
			ON wfta_opp.grantee_project_id = wfta_oce.grantee_project_id
				AND wcy_opp.wfta_year = wcy_oce.wfta_year
				AND wfta_oce.wf_task_id = 83
		JOIN lsc_review_assignment_inquiry lrai ON wfta_oce.wf_task_assignment_id = lrai.wf_task_assignment_id
		JOIN LSC_c_REVIEW_INQUIRY_SCORE lris ON lrai.lsc_review_inquiry_score_id = lris.id
	WHERE wfta_opp.wf_task_id = 5
