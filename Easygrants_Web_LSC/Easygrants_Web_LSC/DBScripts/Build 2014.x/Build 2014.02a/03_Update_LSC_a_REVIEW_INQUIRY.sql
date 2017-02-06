UPDATE q15
	SET base_inquiry_id = q14.base_inquiry_id
	FROM LSC_a_REVIEW_INQUIRY q14
		JOIN LSC_a_REVIEW_CRITERION c14 ON q14.lsc_review_criterion_id = c14.id
		JOIN LSC_a_REVIEW_CATEGORY cat14 ON c14.lsc_review_category_id = cat14.id
		JOIN LSC_a_REVIEW_PERFORMANCE_AREA pa14 ON cat14.lsc_review_performance_area_id = pa14.id
		LEFT JOIN LSC_a_REVIEW_PERFORMANCE_AREA pa15 ON pa14.sort_order = pa15.sort_order
			AND pa15.time_period_id = 20
		LEFT JOIN LSC_a_REVIEW_CATEGORY cat15 ON pa15.id = cat15.lsc_review_performance_area_id
			AND cat14.sort_order = cat15.sort_order
		LEFT JOIN LSC_a_REVIEW_CRITERION c15 ON cat15.id = c15.lsc_review_category_id
			AND c14.abbr = c15.abbr
		LEFT JOIN LSC_a_REVIEW_INQUIRY q15 ON c15.id = q15.lsc_review_criterion_id
			AND q14.abbr = q15.abbr
	WHERE pa14.time_period_id = 19
