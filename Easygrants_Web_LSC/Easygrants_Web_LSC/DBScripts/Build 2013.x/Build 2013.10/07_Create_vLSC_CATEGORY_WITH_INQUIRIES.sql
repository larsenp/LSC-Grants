CREATE VIEW [dbo].[vLSC_CATEGORY_WITH_INQUIRIES]

AS
SELECT  q.id inquiry_id
    ,c.id criterion_id
	,pa.time_period_id
	,pa.sort_order pa
    ,cat.sort_order cat
    ,q.sort_order q
	,c.abbr c_abbr
    ,q.abbr q_abbr
    ,cat.description category_desc
	,c.description criterion_desc
    ,q.description inquiry_desc
	FROM LSC_a_REVIEW_PERFORMANCE_AREA pa
		JOIN LSC_a_REVIEW_CATEGORY cat ON pa.id = cat.lsc_review_performance_area_id
		JOIN LSC_a_REVIEW_CRITERION c ON cat.id = c.lsc_review_category_id
		JOIN LSC_a_REVIEW_INQUIRY q ON c.id = q.lsc_review_criterion_id
	GROUP BY q.id 
    ,c.id 
	,pa.time_period_id
	,pa.sort_order 
    ,cat.sort_order 
    ,q.sort_order 
	,c.abbr 
    ,q.abbr 
    ,cat.description 
	,c.description 
    ,q.description 