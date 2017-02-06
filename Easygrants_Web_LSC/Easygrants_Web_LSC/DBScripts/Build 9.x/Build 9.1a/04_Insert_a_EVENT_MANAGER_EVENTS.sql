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
           (9
           ,'TIG Review Revised Budget - Post-Submission'
           ,1
           ,'Copies revised budget data to grant'
           ,'Copies revised budget data to grant and generates grant award package if payment schedule review is complete'
           ,1
           ,'spLSC_POSTSUBMISSION_TIG_REVIEW_BUDGET_REVISION'
           ,4
           ,1)

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
           (10
           ,'TIG Review Revised Payment Schedule - Post-Submission'
           ,1
           ,'Copies revised payment schedule data to grant'
           ,'Copies revised payment schedule data to grant and generates grant award package if payment schedule review is complete'
           ,1
           ,'spLSC_POSTSUBMISSION_TIG_REVIEW_PAYMENT_SCHEDULE_REVISION'
           ,4
           ,1)

UPDATE s_ID_GEN
	SET next_id = 11
	WHERE table_name = 'a_EVENT_MANAGER_EVENTS'

