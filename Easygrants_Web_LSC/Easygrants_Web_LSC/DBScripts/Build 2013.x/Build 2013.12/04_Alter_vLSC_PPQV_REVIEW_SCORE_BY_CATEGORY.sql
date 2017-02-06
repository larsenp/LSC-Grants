SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vLSC_PPQV_REVIEW_SCORE_BY_CATEGORY]

AS
--For all categories except PA4 C4, use the category score from the OPP review adjusted by the sum of the weightings of the constituent criteria.
SELECT lrac.wf_task_assignment_id,
	lrac.lsc_review_assignment_category_id,
	MAX(lris.value) score,
	SUM(ISNULL(c.weighting, 0)) weighting,
	MAX(lris.value)*SUM(ISNULL(c.weighting, 0))/5 weighted_score
	FROM LSC_REVIEW_ASSIGNMENT_CATEGORY lrac
		JOIN LSC_a_REVIEW_CRITERION c ON lrac.lsc_review_category_id = c.lsc_review_category_id
		JOIN LSC_c_REVIEW_INQUIRY_SCORE lris ON lrac.lsc_review_inquiry_score_id = lris.id
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON lrac.wf_task_assignment_id = cwosy.wf_task_assignment_id
		JOIN LSC_a_REVIEW_CATEGORY ca ON lrac.lsc_review_category_id = ca.id
		JOIN LSC_a_REVIEW_PERFORMANCE_AREA pa on ca.lsc_review_performance_area_id = pa.id
	WHERE cwosy.wfta_year <> 2013
		OR c.abbr <> '4'
		OR pa.sort_order <> 4
	GROUP BY lrac.wf_task_assignment_id,
		lrac.lsc_review_assignment_category_id,
		lrac.lsc_review_category_id

UNION ALL

--For the category consisting of PA4 C4, use the mean of the OPP review score and the OCE review inquiry scores
SELECT lrac.wf_task_assignment_id,
	MAX(prsoo.lsc_review_assignment_category_id),
	AVG(prsoo.score) score,
	AVG(ISNULL(rcw.weighting, 0)) weighting,
	AVG(prsoo.score)*AVG(ISNULL(rcw.weighting, 0))/5 weighted_score
	FROM LSC_REVIEW_ASSIGNMENT_CATEGORY lrac
		JOIN vLSC_PPQV_REVIEW_SCORE_OPP_OCE prsoo ON lrac.wf_task_assignment_id = prsoo.opp_wfta_id
			AND lrac.lsc_review_category_id = prsoo.lsc_review_category_id
		JOIN vLSC_REVIEW_CATEGORY_WEIGHTING rcw ON lrac.lsc_review_category_id = rcw.lsc_review_category_id
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON lrac.wf_task_assignment_id = cwosy.wf_task_assignment_id
		JOIN LSC_a_REVIEW_CATEGORY ca ON lrac.lsc_review_category_id = ca.id
		JOIN LSC_a_REVIEW_PERFORMANCE_AREA pa on ca.lsc_review_performance_area_id = pa.id
	WHERE cwosy.wfta_year = 2013
		AND ca.sort_order = 4
		AND pa.sort_order = 4
	GROUP BY lrac.wf_task_assignment_id,
		prsoo.lsc_review_category_id
