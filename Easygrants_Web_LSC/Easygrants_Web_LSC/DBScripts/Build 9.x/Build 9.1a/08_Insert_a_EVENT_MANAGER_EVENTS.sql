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
           (11
           ,'TIG Review Grant Award Package post-submission'
           ,1
           ,'Sets notification date when grant award package is approved'
           ,'Sets notification date when grant award package is approved'
           ,1
           ,'spLSC_POSTSUBMISSION_TIG_REVIEW_GRANT_AWARD_PACKAGE'
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
           (12
           ,'TIG Grant Award Letter Upload post-submission'
           ,1
           ,'Sets contract received date when grant award letter is uploaded'
           ,'Sets contract received date when grant award letter is uploaded'
           ,1
           ,'spLSC_POSTSUBMISSION_TIG_GRANT_AWARD_LETTER_UPLOAD'
           ,4
           ,1)

UPDATE s_ID_GEN
	SET next_id = 13
	WHERE table_name = 'a_EVENT_MANAGER_EVENTS'

