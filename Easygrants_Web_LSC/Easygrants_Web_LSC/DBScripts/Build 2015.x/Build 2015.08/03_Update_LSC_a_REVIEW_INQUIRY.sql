select i.*
from dbo.LSC_a_REVIEW_PERFORMANCE_AREA p
   join dbo.LSC_a_REVIEW_CATEGORY cat on cat.lsc_review_performance_area_id = p.id
   join dbo.LSC_a_REVIEW_CRITERION c on c.lsc_review_category_id = cat.id
   join dbo.LSC_a_REVIEW_INQUIRY i on i.lsc_review_criterion_id = c.id
where time_period_id = 21 and p.sort_order = 3 and c.abbr = '2'
and i.abbr like 'F%'

Update LSC_a_REVIEW_INQUIRY
set form_page_key = 'PV_PAI'
where id = 579

Update LSC_a_REVIEW_INQUIRY
set form_page_key = 'PV_Recruit_PA'
where id = 581

Update LSC_a_REVIEW_INQUIRY
set form_page_key = 'PV_Retain_PA'
where id = 582 

Update LSC_a_REVIEW_INQUIRY
set form_page_key = 'PV_Accomplish_Clients_PAI'
where id = 584