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
           (23
           ,'PBIF Create Risk Assessment Review task'
           ,1
           ,'Create risk assessment review task on submission of primary and secondary reviews'
           ,'Create risk assessment review task on submission of primary and secondary reviews'
           ,1
           ,'spLSC_ASSIGN_PBIF_RISK_ASSESSMENT_REVIEW'
           ,4
           ,1)

UPDATE s_ID_GEN set next_id = (SELECT max(id)+1 from a_EVENT_MANAGER_EVENTS) where table_name = 'a_EVENT_MANAGER_EVENTS'