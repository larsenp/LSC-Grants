ALTER TABLE LSC_a_REVIEW_INQUIRY
	ADD outline VARCHAR(MAX)
	
GO

UPDATE q14
	SET outline = q13.description
	FROM LSC_a_REVIEW_INQUIRY q14
		JOIN LSC_a_REVIEW_CRITERION c14 ON q14.lsc_review_criterion_id = c14.id
		JOIN LSC_a_REVIEW_CATEGORY cat14 ON c14.lsc_review_category_id = cat14.id
		JOIN LSC_a_REVIEW_PERFORMANCE_AREA pa14 ON cat14.lsc_review_performance_area_id = pa14.id
		JOIN LSC_a_REVIEW_PERFORMANCE_AREA pa13 ON pa14.sort_order = pa13.sort_order
		JOIN LSC_a_REVIEW_CATEGORY cat13 ON pa13.id = cat13.lsc_review_performance_area_id
			AND cat14.sort_order = cat13.sort_order
		JOIN LSC_a_REVIEW_CRITERION c13 ON cat13.id = c13.lsc_review_category_id
			AND c14.abbr = c13.abbr
		JOIN LSC_a_REVIEW_INQUIRY q13 ON c13.id = q13.lsc_review_criterion_id
			AND q14.abbr = q13.abbr
	WHERE pa14.time_period_id = 19
		AND pa13.time_period_id = 18
