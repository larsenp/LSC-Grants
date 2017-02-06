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
           (16
           ,'TIG Application post-submission processing'
           ,1
           ,'Processes grant data following application submission'
           ,'Processes grant data following application submission'
           ,1
           ,'spLSC_POSTSUBMISSION_TIG_APPLICATION'
           ,4
           ,1)

UPDATE s_ID_GEN
	SET next_id = 17
	WHERE table_name = 'a_EVENT_MANAGER_EVENTS'

