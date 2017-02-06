
INSERT INTO [dbo].[a_EVENT_MANAGER_EVENTS]
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
           (21
           ,'PBIF Application post-submission processing'
           ,1
           ,'Processes grant data following application submission'
           ,'Processes grant data following application submission'
           ,1
           ,'spLSC_POSTSUBMISSION_PBIF_APPLICATION'
           ,4
           ,1)

UPDATE s_ID_GEN set next_id = (SELECT max(id)+1 from a_EVENT_MANAGER_EVENTS) where table_name = 'a_EVENT_MANAGER_EVENTS'

GO





