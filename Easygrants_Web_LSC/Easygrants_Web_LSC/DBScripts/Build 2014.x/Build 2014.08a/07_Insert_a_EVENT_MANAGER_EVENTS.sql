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
           (22
           ,'PBIF Eligibility Review post-submission processing'
           ,1
           ,'Processes grant data following eligibility review submission'
           ,'Processes grant data following eligibility review submission'
           ,1
           ,'spLSC_POSTSUBMISSION_PBIF_ELIGIBILITY_REVIEW'
           ,4
           ,1)

UPDATE s_ID_GEN set next_id = (SELECT max(id)+1 from a_EVENT_MANAGER_EVENTS) where table_name = 'a_EVENT_MANAGER_EVENTS'
