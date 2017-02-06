---Run this script after OPP updating the inquiries through evaluation tool and OIT updating the proper ID's below. 
-- select * from lsc_a_review_inquiry



Update lsc_a_review_inquiry
set form_page_key = 'PV_Outcome_prev_priorities'
where id =  398


Update lsc_a_review_inquiry
set form_page_key = 'PV_Intake_Methods_Relative_Percent'
where id =  468
