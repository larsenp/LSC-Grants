DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'a_EVENT_MANAGER_EVENTS'

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
           (@new_id
           ,'Copy TIG payment schedule from task assignment to grant'
           ,1
           ,'Copies TIG payment schedule from task assignment to grant'
           ,'Copies TIG payment schedule from task assignment to grant'
           ,1
           ,'spLSC_POSTSUBMISSION_TIG_COPY_PAYMENT_SCHEDULE_TO_GRANT'
           ,4
           ,1)

EXEC @new_id = getid_sel @table = 'a_EVENT_MANAGER_EVENTS'

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
           (@new_id
           ,'Update Date Received in TIG grant file'
           ,1
           ,'Update Date Received in TIG grant file'
           ,'Update Date Received in TIG grant file'
           ,1
           ,'spLSC_POSTSUBMISSION_TIG_UPDATE_DATE_RECEIVED'
           ,4
           ,1)
