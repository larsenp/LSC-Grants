update LSC_a_REVIEW_CATEGORY
set sort_order = 9 
--select * 
from LSC_a_REVIEW_CATEGORY cat
       join lsc_a_review_performance_area pa on pa.id = cat.lsc_review_performance_area_id
where cat.description = 'PA4, C9'
and time_period_id = 19

update LSC_a_REVIEW_CATEGORY
set sort_order = 8 
--select * 
from LSC_a_REVIEW_CATEGORY cat
       join lsc_a_review_performance_area pa on pa.id = cat.lsc_review_performance_area_id
where cat.description = 'PA4, C8'
and time_period_id = 19