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
           (8
           ,'TIG Application post-review processing'
           ,1
           ,'Processes grant data following final approval/rejection'
           ,'Processes grant data following final approval/rejection'
           ,1
           ,'spLSC_POSTSUBMISSION_TIG_REVIEW_O_R_WI_PRESIDENT'
           ,4
           ,1)

UPDATE s_ID_GEN
	SET next_id = 9
	WHERE table_name = 'a_EVENT_MANAGER_EVENTS'

