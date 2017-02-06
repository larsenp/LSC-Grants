declare @new_id int

exec @new_id = getid_sel @table = 'lsc_review_cycle_stage'

insert lsc_review_cycle_stage
    (lsc_review_cycle_stage_id
    ,review_cycle_stage_id
    ,time_period_id)
    values(@new_id
        ,180
        ,20) 
		  
