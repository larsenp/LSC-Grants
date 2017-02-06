INSERT INTO [LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (7
           ,7
           ,7)

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (8
           ,8
           ,7)

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (9
           ,9
           ,7)

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (10
           ,10
           ,16)

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (11
           ,11
           ,16)

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (12
           ,12
           ,16) 

update s_ID_GEN
	SET next_id = 13
	where table_name = 'lsc_review_cycle_stage'