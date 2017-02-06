--Check the ID's before running the script. 

--select * from LSC_REVIEW_CYCLE_STAGE lrcs
            -- right join REVIEW_CYCLE_STAGE  rcs ON lrcs.REVIEW_CYCLE_STAGE_id = rcs.REVIEW_CYCLE_STAGE_id
--where name like '%TIG%'

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (46
           ,46
           ,16)

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (47
           ,47
           ,16)