-- OPP Director Review - 2012 Applications

/*Check the ID's before running the below script and run for all 6 review cycles
select * from LSC_REVIEW_CYCLE_STAGE lrcs
             right join REVIEW_CYCLE_STAGE rcs ON lrcs.REVIEW_CYCLE_STAGE_id = rcs.REVIEW_CYCLE_STAGE_id
where name like '%2012%'  */

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]    -- 2012 Competition Applications OPP Director Review
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (42
           ,49
           ,17)
           
           
INSERT INTO [LSC_REVIEW_CYCLE_STAGE]       -- 2012 Renewals of 2011 Grants OPP Director Review
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (43
           ,50
           ,17)

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]       -- 2012 Renewals of 2010 Grants OPP Director Review
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (44
           ,51
           ,17)



INSERT INTO [LSC_REVIEW_CYCLE_STAGE]    -- 2012 PPQV Competition Applications OPP Director Review
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (45
           ,52
           ,17)

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]    -- 2012 PPQV Renewals of 2010 Grants OPP Director Review
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (46
           ,53
           ,17)

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]    -- 2012 PPQV Renewals of 2011 Grants OPP Director Review
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (47
           ,54
           ,17)



--President Review - 2012 Cycle

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]    -- 2012 Competition Applications President Review
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (49
           ,55
           ,17)
           
           
INSERT INTO [LSC_REVIEW_CYCLE_STAGE]       -- 2012 Renewals of 2011 Grants President Review
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (50
           ,56
           ,17)

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]       -- 2012 Renewals of 2010 Grants President Review
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (51
           ,57
           ,17)



INSERT INTO [LSC_REVIEW_CYCLE_STAGE]    -- 2012 PPQV Competition Applications President Review
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (52
           ,59
           ,17)

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]    -- 2012 PPQV Renewals of 2010 Grants President Review
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (53
           ,60
           ,17)

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]    -- 2012 PPQV Renewals of 2011 Grants President Review
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (54
           ,58
           ,17)
