
ALTER VIEW [dbo].[vREVIEW_SCORE_BY_CRITERION]

AS

select lrai.wf_task_assignment_id review_wfta_id,
	lri.lsc_review_criterion_id,
	avg(lris.value) score,
	lrc.weighting,
	avg(lris.value)*lrc.weighting/5 weighted_score
	from lsc_review_assignment_inquiry lrai
		join LSC_c_REVIEW_INQUIRY_SCORE lris on lrai.lsc_review_inquiry_score_id = lris.id
		join dbo.LSC_a_REVIEW_INQUIRY lri on lrai.lsc_review_inquiry_id = lri.id
		join dbo.LSC_a_REVIEW_CRITERION lrc on lri.lsc_review_criterion_id = lrc.id
	group by lrai.wf_task_assignment_id,
		lri.lsc_review_criterion_id,
		lrc.weighting
