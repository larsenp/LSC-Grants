ALTER VIEW vREVIEW_SCORE_BY_CRITERION

AS

select rso.review_wfta_id,
	lri.lsc_review_criterion_id,
	avg(rso.score) score,
	lrc.weighting,
	avg(rso.score)*lrc.weighting/5 weighted_score
	from vLSC_REVIEW_SCORE_BY_OPP_REVIEW_ID rso
		join dbo.LSC_a_REVIEW_INQUIRY lri on rso.lsc_review_inquiry_id = lri.id
		join dbo.LSC_a_REVIEW_CRITERION lrc on lri.lsc_review_criterion_id = lrc.id
	group by rso.review_wfta_id,
		lri.lsc_review_criterion_id,
		lrc.weighting
