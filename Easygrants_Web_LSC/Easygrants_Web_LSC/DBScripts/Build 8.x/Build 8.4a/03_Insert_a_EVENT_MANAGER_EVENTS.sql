INSERT INTO [a_EVENT_MANAGER_EVENTS]
           ([id]
           ,[event_name]
           ,[event_type_id]
           ,[short_description]
           ,[long_description]
           ,[is_active]
           ,[process_name]
           ,[process_type_id]
           ,[sort_order])
     VALUES
           (7
           ,'Move TIG Application Budget to Grant'
           ,1
           ,'Copies TIG Application budget data to grant budget'
           ,'Copies TIG Application budget data to grant budget, creating grant budget if necessary'
           ,1
           ,'spLSC_POSTSUBMISSION_TIG_BUDGET'
           ,4
           ,1)

UPDATE s_ID_GEN
	SET next_id = 8
	WHERE table_name = 'a_EVENT_MANAGER_EVENTS'

