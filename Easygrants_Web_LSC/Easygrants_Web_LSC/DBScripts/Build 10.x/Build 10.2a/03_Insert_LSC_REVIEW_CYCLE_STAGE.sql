--Reference Mantis 2750

DECLARE @new_id INT
EXEC @new_id = getid_sel @table = 'LSC_REVIEW_CYCLE_STAGE',
	@mode = 2

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (@new_id
           ,13
           ,7)

EXEC @new_id = getid_sel @table = 'LSC_REVIEW_CYCLE_STAGE',
	@mode = 2

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (@new_id
           ,14
           ,7)

EXEC @new_id = getid_sel @table = 'LSC_REVIEW_CYCLE_STAGE',
	@mode = 2

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (@new_id
           ,15
           ,7)

EXEC @new_id = getid_sel @table = 'LSC_REVIEW_CYCLE_STAGE',
	@mode = 2

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (@new_id
           ,16
           ,7)

EXEC @new_id = getid_sel @table = 'LSC_REVIEW_CYCLE_STAGE',
	@mode = 2

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (@new_id
           ,17
           ,7)

EXEC @new_id = getid_sel @table = 'LSC_REVIEW_CYCLE_STAGE',
	@mode = 2

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (@new_id
           ,18
           ,7)

EXEC @new_id = getid_sel @table = 'LSC_REVIEW_CYCLE_STAGE',
	@mode = 2

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (@new_id
           ,25
           ,16)

EXEC @new_id = getid_sel @table = 'LSC_REVIEW_CYCLE_STAGE',
	@mode = 2

INSERT INTO [LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
     VALUES
           (@new_id
           ,26
           ,16)

