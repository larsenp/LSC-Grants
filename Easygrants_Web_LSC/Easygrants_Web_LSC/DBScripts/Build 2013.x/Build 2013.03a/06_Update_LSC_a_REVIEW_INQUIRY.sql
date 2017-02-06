UPDATE q14
	SET form_page_key = q13.form_page_key
	FROM LSC_a_REVIEW_INQUIRY q13
		JOIN LSC_a_REVIEW_CRITERION c13 ON q13.lsc_review_criterion_id = c13.id
		JOIN LSC_a_REVIEW_CATEGORY cat13 ON c13.lsc_review_category_id = cat13.id
		JOIN LSC_a_REVIEW_PERFORMANCE_AREA pa13 ON cat13.lsc_review_performance_area_id = pa13.id
		JOIN c_TIME_PERIOD tp13 ON pa13.time_period_id = tp13.id
		JOIN LSC_a_REVIEW_PERFORMANCE_AREA pa14 ON pa13.sort_order = pa14.sort_order
		JOIN c_TIME_PERIOD tp14 ON pa14.time_period_id = tp14.id	
		JOIN LSC_a_REVIEW_CATEGORY cat14 ON cat13.description = cat14.description
			AND pa14.id = cat14.lsc_review_performance_area_id
		JOIN LSC_a_REVIEW_CRITERION c14 ON c13.abbr = c14.abbr
			AND cat14.id = c14.lsc_review_category_id
		JOIN LSC_a_REVIEW_INQUIRY q14 ON q13.abbr = q14.abbr
			AND c14.id = q14.lsc_review_criterion_id
	WHERE tp13.sort_order = 2013
		AND tp14.sort_order = 2014
		AND q13.form_page_key IS NOT NULL
