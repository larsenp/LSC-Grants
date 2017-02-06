----Run after the stage has been created for OCE Director Review for 
--                                            Traditional/PPQV Competition/Renewal Review cycles


/*Check the ID's before running the below script and run for all 6 review cycles
select * from LSC_REVIEW_CYCLE_STAGE lrcs
             right join REVIEW_CYCLE_STAGE rcs ON lrcs.REVIEW_CYCLE_STAGE_id = rcs.REVIEW_CYCLE_STAGE_id
where name like '%2012%'  */


INSERT INTO [LSC_REVIEW_CYCLE_STAGE]    -- 2012 Competition Applications OCE Director Review
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (36
           ,43
           ,17)
           
           
INSERT INTO [LSC_REVIEW_CYCLE_STAGE]       -- 2012 Renewals of 2011 Grants OCE Director Review
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (37
           ,44
           ,17)

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]       -- 2012 Renewals of 2010 Grants OCE Director Review
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (38
           ,45
           ,17)



INSERT INTO [LSC_REVIEW_CYCLE_STAGE]    -- 2012 PPQV Competition Applications OCE Director Review
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (39
           ,46
           ,17)

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]    -- 2012 PPQV Renewals of 2010 Grants OCE Director Review
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (40
           ,47
           ,17)

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]    -- 2012 PPQV Renewals of 2011 Grants OCE Director Review
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (41
           ,48
           ,17)





