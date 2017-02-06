ALTER TABLE LSC_a_REVIEW_INQUIRY
	ADD base_inquiry_id INT
	
GO

UPDATE LSC_a_REVIEW_INQUIRY
	SET base_inquiry_id = q.id
	FROM LSC_a_REVIEW_INQUIRY q
		JOIN LSC_a_REVIEW_CRITERION c ON q.lsc_review_criterion_id = c.id
		JOIN LSC_a_REVIEW_CATEGORY cat ON c.lsc_review_category_id = cat.id
		JOIN LSC_a_REVIEW_PERFORMANCE_AREA pa ON cat.lsc_review_performance_area_id = pa.id
	WHERE pa.time_period_id = 19
