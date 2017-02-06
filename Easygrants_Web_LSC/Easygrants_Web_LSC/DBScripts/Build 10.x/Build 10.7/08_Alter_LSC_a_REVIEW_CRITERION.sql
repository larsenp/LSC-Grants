ALTER TABLE LSC_a_REVIEW_CRITERION
	ADD lsc_review_category_id int

GO

UPDATE LSC_a_REVIEW_CRITERION
	SET lsc_review_category_id = cat.id
	FROM LSC_a_REVIEW_PERFORMANCE_AREA pa 
		join LSC_a_REVIEW_CATEGORY cat on pa.id = cat.lsc_review_performance_area_id
		join LSC_a_REVIEW_CRITERION cr on pa.id = cr.lsc_review_performance_area_id
	WHERE pa.sort_order = 1
		AND cat.sort_order = 1
		AND cr.abbr in ('1', '2', '3')

UPDATE LSC_a_REVIEW_CRITERION
	SET lsc_review_category_id = cat.id
	FROM LSC_a_REVIEW_PERFORMANCE_AREA pa 
		join LSC_a_REVIEW_CATEGORY cat on pa.id = cat.lsc_review_performance_area_id
		join LSC_a_REVIEW_CRITERION cr on pa.id = cr.lsc_review_performance_area_id
	WHERE pa.sort_order = 1
		AND cat.sort_order = 2
		AND cr.abbr in ('4')

UPDATE LSC_a_REVIEW_CRITERION
	SET lsc_review_category_id = cat.id
	FROM LSC_a_REVIEW_PERFORMANCE_AREA pa 
		join LSC_a_REVIEW_CATEGORY cat on pa.id = cat.lsc_review_performance_area_id
		join LSC_a_REVIEW_CRITERION cr on pa.id = cr.lsc_review_performance_area_id
	WHERE pa.sort_order = 2
		AND cat.sort_order = 1
		AND cr.abbr in ('1')

UPDATE LSC_a_REVIEW_CRITERION
	SET lsc_review_category_id = cat.id
	FROM LSC_a_REVIEW_PERFORMANCE_AREA pa 
		join LSC_a_REVIEW_CATEGORY cat on pa.id = cat.lsc_review_performance_area_id
		join LSC_a_REVIEW_CRITERION cr on pa.id = cr.lsc_review_performance_area_id
	WHERE pa.sort_order = 2
		AND cat.sort_order = 2
		AND cr.abbr in ('2 and 3')

UPDATE LSC_a_REVIEW_CRITERION
	SET lsc_review_category_id = cat.id
	FROM LSC_a_REVIEW_PERFORMANCE_AREA pa 
		join LSC_a_REVIEW_CATEGORY cat on pa.id = cat.lsc_review_performance_area_id
		join LSC_a_REVIEW_CRITERION cr on pa.id = cr.lsc_review_performance_area_id
	WHERE pa.sort_order = 3
		AND cat.sort_order = 1
		AND cr.abbr in ('1a')

UPDATE LSC_a_REVIEW_CRITERION
	SET lsc_review_category_id = cat.id
	FROM LSC_a_REVIEW_PERFORMANCE_AREA pa 
		join LSC_a_REVIEW_CATEGORY cat on pa.id = cat.lsc_review_performance_area_id
		join LSC_a_REVIEW_CRITERION cr on pa.id = cr.lsc_review_performance_area_id
	WHERE pa.sort_order = 3
		AND cat.sort_order = 2
		AND cr.abbr in ('1b')

UPDATE LSC_a_REVIEW_CRITERION
	SET lsc_review_category_id = cat.id
	FROM LSC_a_REVIEW_PERFORMANCE_AREA pa 
		join LSC_a_REVIEW_CATEGORY cat on pa.id = cat.lsc_review_performance_area_id
		join LSC_a_REVIEW_CRITERION cr on pa.id = cr.lsc_review_performance_area_id
	WHERE pa.sort_order = 3
		AND cat.sort_order = 3
		AND cr.abbr in ('1c')

UPDATE LSC_a_REVIEW_CRITERION
	SET lsc_review_category_id = cat.id
	FROM LSC_a_REVIEW_PERFORMANCE_AREA pa 
		join LSC_a_REVIEW_CATEGORY cat on pa.id = cat.lsc_review_performance_area_id
		join LSC_a_REVIEW_CRITERION cr on pa.id = cr.lsc_review_performance_area_id
	WHERE pa.sort_order = 3
		AND cat.sort_order = 4
		AND cr.abbr in ('2')

UPDATE LSC_a_REVIEW_CRITERION
	SET lsc_review_category_id = cat.id
	FROM LSC_a_REVIEW_PERFORMANCE_AREA pa 
		join LSC_a_REVIEW_CATEGORY cat on pa.id = cat.lsc_review_performance_area_id
		join LSC_a_REVIEW_CRITERION cr on pa.id = cr.lsc_review_performance_area_id
	WHERE pa.sort_order = 3
		AND cat.sort_order = 5
		AND cr.abbr in ('3', '4')

UPDATE LSC_a_REVIEW_CRITERION
	SET lsc_review_category_id = cat.id
	FROM LSC_a_REVIEW_PERFORMANCE_AREA pa 
		join LSC_a_REVIEW_CATEGORY cat on pa.id = cat.lsc_review_performance_area_id
		join LSC_a_REVIEW_CRITERION cr on pa.id = cr.lsc_review_performance_area_id
	WHERE pa.sort_order = 4
		AND cat.sort_order = 1
		AND cr.abbr in ('1')

UPDATE LSC_a_REVIEW_CRITERION
	SET lsc_review_category_id = cat.id
	FROM LSC_a_REVIEW_PERFORMANCE_AREA pa 
		join LSC_a_REVIEW_CATEGORY cat on pa.id = cat.lsc_review_performance_area_id
		join LSC_a_REVIEW_CRITERION cr on pa.id = cr.lsc_review_performance_area_id
	WHERE pa.sort_order = 4
		AND cat.sort_order = 2
		AND cr.abbr in ('2')

UPDATE LSC_a_REVIEW_CRITERION
	SET lsc_review_category_id = cat.id
	FROM LSC_a_REVIEW_PERFORMANCE_AREA pa 
		join LSC_a_REVIEW_CATEGORY cat on pa.id = cat.lsc_review_performance_area_id
		join LSC_a_REVIEW_CRITERION cr on pa.id = cr.lsc_review_performance_area_id
	WHERE pa.sort_order = 4
		AND cat.sort_order = 3
		AND cr.abbr in ('3')

UPDATE LSC_a_REVIEW_CRITERION
	SET lsc_review_category_id = cat.id
	FROM LSC_a_REVIEW_PERFORMANCE_AREA pa 
		join LSC_a_REVIEW_CATEGORY cat on pa.id = cat.lsc_review_performance_area_id
		join LSC_a_REVIEW_CRITERION cr on pa.id = cr.lsc_review_performance_area_id
	WHERE pa.sort_order = 4
		AND cat.sort_order = 4
		AND cr.abbr in ('4')

UPDATE LSC_a_REVIEW_CRITERION
	SET lsc_review_category_id = cat.id
	FROM LSC_a_REVIEW_PERFORMANCE_AREA pa 
		join LSC_a_REVIEW_CATEGORY cat on pa.id = cat.lsc_review_performance_area_id
		join LSC_a_REVIEW_CRITERION cr on pa.id = cr.lsc_review_performance_area_id
	WHERE pa.sort_order = 4
		AND cat.sort_order = 5
		AND cr.abbr in ('5')

UPDATE LSC_a_REVIEW_CRITERION
	SET lsc_review_category_id = cat.id
	FROM LSC_a_REVIEW_PERFORMANCE_AREA pa 
		join LSC_a_REVIEW_CATEGORY cat on pa.id = cat.lsc_review_performance_area_id
		join LSC_a_REVIEW_CRITERION cr on pa.id = cr.lsc_review_performance_area_id
	WHERE pa.sort_order = 4
		AND cat.sort_order = 6
		AND cr.abbr in ('6')

UPDATE LSC_a_REVIEW_CRITERION
	SET lsc_review_category_id = cat.id
	FROM LSC_a_REVIEW_PERFORMANCE_AREA pa 
		join LSC_a_REVIEW_CATEGORY cat on pa.id = cat.lsc_review_performance_area_id
		join LSC_a_REVIEW_CRITERION cr on pa.id = cr.lsc_review_performance_area_id
	WHERE pa.sort_order = 4
		AND cat.sort_order = 7
		AND cr.abbr in ('7')

UPDATE LSC_a_REVIEW_CRITERION
	SET lsc_review_category_id = cat.id
	FROM LSC_a_REVIEW_PERFORMANCE_AREA pa 
		join LSC_a_REVIEW_CATEGORY cat on pa.id = cat.lsc_review_performance_area_id
		join LSC_a_REVIEW_CRITERION cr on pa.id = cr.lsc_review_performance_area_id
	WHERE pa.sort_order = 4
		AND cat.sort_order = 8
		AND cr.abbr in ('9')
