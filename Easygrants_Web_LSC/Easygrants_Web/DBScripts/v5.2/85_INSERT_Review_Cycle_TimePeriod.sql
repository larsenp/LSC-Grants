Insert into Review_cycle_TimePeriod SELECT id , id , time_period_id from a_review_cycle
Update s_id_gen set next_id = (select max(review_cycle_timeperiod_id)+1 from Review_cycle_TimePeriod) where table_name='Review_cycle_TimePeriod'
update a_review_cycle set time_period_id = null