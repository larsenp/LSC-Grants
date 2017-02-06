
update Lsc_a_Review_Inquiry
set form_page_key = 'PV_Data_Methods'
from lsc_a_review_performance_area pa
            join lsc_a_review_criterion c on pa.id = c.lsc_review_performance_area_id
            join lsc_a_review_inquiry i on c.id = i.lsc_review_criterion_id
    where  pa.time_period_id = 17 and i.abbr='F1'
    
update Lsc_a_Review_Inquiry
set form_page_key = 'PV_Data_Sources'
from lsc_a_review_performance_area pa
            join lsc_a_review_criterion c on pa.id = c.lsc_review_performance_area_id
            join lsc_a_review_inquiry i on c.id = i.lsc_review_criterion_id
    where  pa.time_period_id = 17 and i.abbr='F2'

update Lsc_a_Review_Inquiry
set form_page_key = 'PV_Intake_System'
from lsc_a_review_performance_area pa
            join lsc_a_review_criterion c on pa.id = c.lsc_review_performance_area_id
            join lsc_a_review_inquiry i on c.id = i.lsc_review_criterion_id
    where  pa.time_period_id = 17 and i.abbr='F3'


update Lsc_a_Review_Inquiry
set form_page_key = 'PV_LEP'
from lsc_a_review_performance_area pa
            join lsc_a_review_criterion c on pa.id = c.lsc_review_performance_area_id
            join lsc_a_review_inquiry i on c.id = i.lsc_review_criterion_id
    where  pa.time_period_id = 17 and i.abbr='F4'

update Lsc_a_Review_Inquiry
set form_page_key = 'PV_Training'
from lsc_a_review_performance_area pa
            join lsc_a_review_criterion c on pa.id = c.lsc_review_performance_area_id
            join lsc_a_review_inquiry i on c.id = i.lsc_review_criterion_id
    where  pa.time_period_id = 17 and i.abbr='F5'

update Lsc_a_Review_Inquiry
set form_page_key = 'PV_Legal_Work_Mngt'
from lsc_a_review_performance_area pa
            join lsc_a_review_criterion c on pa.id = c.lsc_review_performance_area_id
            join lsc_a_review_inquiry i on c.id = i.lsc_review_criterion_id
    where  pa.time_period_id = 17 and i.abbr='F6'

update Lsc_a_Review_Inquiry
set form_page_key = 'PV_CaseHandling'
from lsc_a_review_performance_area pa
            join lsc_a_review_criterion c on pa.id = c.lsc_review_performance_area_id
            join lsc_a_review_inquiry i on c.id = i.lsc_review_criterion_id
    where  pa.time_period_id = 17 and i.abbr='F7'

update Lsc_a_Review_Inquiry
set form_page_key = 'PV_CaseDevelopment'
from lsc_a_review_performance_area pa
            join lsc_a_review_criterion c on pa.id = c.lsc_review_performance_area_id
            join lsc_a_review_inquiry i on c.id = i.lsc_review_criterion_id
    where  pa.time_period_id = 17 and i.abbr='F8'

update Lsc_a_Review_Inquiry
set form_page_key = 'PV_PAI'
from lsc_a_review_performance_area pa
            join lsc_a_review_criterion c on pa.id = c.lsc_review_performance_area_id
            join lsc_a_review_inquiry i on c.id = i.lsc_review_criterion_id
    where  pa.time_period_id = 17 and i.abbr='F9'

update Lsc_a_Review_Inquiry
set form_page_key = 'PV_Recruit_PA' 
from lsc_a_review_performance_area pa
            join lsc_a_review_criterion c on pa.id = c.lsc_review_performance_area_id
            join lsc_a_review_inquiry i on c.id = i.lsc_review_criterion_id
    where  pa.time_period_id = 17 and i.abbr='F10'

update Lsc_a_Review_Inquiry
set form_page_key = 'PV_Retain_PA'
from lsc_a_review_performance_area pa
            join lsc_a_review_criterion c on pa.id = c.lsc_review_performance_area_id
            join lsc_a_review_inquiry i on c.id = i.lsc_review_criterion_id
    where  pa.time_period_id = 17 and i.abbr='F11'

update Lsc_a_Review_Inquiry
set form_page_key = 'PV_Board_Policies'
from lsc_a_review_performance_area pa
            join lsc_a_review_criterion c on pa.id = c.lsc_review_performance_area_id
            join lsc_a_review_inquiry i on c.id = i.lsc_review_criterion_id
    where  pa.time_period_id = 17 and i.abbr='F12'
    
update Lsc_a_Review_Inquiry
set form_page_key = 'PV_Continuity_Oper'
from lsc_a_review_performance_area pa
            join lsc_a_review_criterion c on pa.id = c.lsc_review_performance_area_id
            join lsc_a_review_inquiry i on c.id = i.lsc_review_criterion_id
    where  pa.time_period_id = 17 and i.abbr='F13'
