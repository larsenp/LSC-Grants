CREATE VIEW vLSC_REVIEW_CATEGORY_WEIGHTING

AS

SELECT lsc_review_category_id,
	SUM(weighting) weighting
	FROM LSC_a_REVIEW_CRITERION
	WHERE lsc_review_category_id IS NOT NULL
	GROUP BY lsc_review_category_id
