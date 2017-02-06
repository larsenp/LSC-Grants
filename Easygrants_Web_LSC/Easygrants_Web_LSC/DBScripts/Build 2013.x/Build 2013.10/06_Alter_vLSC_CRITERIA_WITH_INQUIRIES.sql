ALTER VIEW [dbo].[vLSC_CRITERIA_WITH_INQUIRIES]

AS

SELECT c.id criterion_id
	,pa.time_period_id
	,pa.sort_order pa
	,c.abbr c
	,c.description criterion
    ,cat.sort_order category
	FROM LSC_a_REVIEW_PERFORMANCE_AREA pa
		JOIN LSC_a_REVIEW_CATEGORY cat ON pa.id = cat.lsc_review_performance_area_id
		JOIN LSC_a_REVIEW_CRITERION c ON cat.id = c.lsc_review_category_id
		JOIN LSC_a_REVIEW_INQUIRY q ON c.id = q.lsc_review_criterion_id
	GROUP BY pa.time_period_id
		,pa.sort_order
		,c.id
		,c.abbr
		,c.description
        ,cat.sort_order
