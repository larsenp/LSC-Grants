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
           ,'Create Subgrant Approval Request OPP Staff and Deputy Director review tasks'
           ,1
           ,'Create Subgrant Approval Request OPP Staff and Deputy Director review tasks'
           ,'Create Subgrant Approval Request OPP Staff and Deputy Director review tasks'
           ,1
           ,'spLSC_POSTSUBMISSION_SUBGRANT_APPROVAL_REQ_REVIEW_AA'
           ,4
           ,1)