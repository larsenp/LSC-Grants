Delete from a_EVENT_MANAGER_EVENTS

INSERT INTO [a_EVENT_MANAGER_EVENTS]([id], [event_name], [event_type_id], [short_description], [long_description], [is_active], [process_name], [process_type_id], [sort_order]) 
	VALUES(1, 'Pre-Assignment Event', 1, 'Checks to make sure Prefix is present', 'Checks to make sure Prefix is present', 1, 'spPREASSIGNMENT_PREFIXCHECK', 1, 1);

INSERT INTO [a_EVENT_MANAGER_EVENTS]([id], [event_name], [event_type_id], [short_description], [long_description], [is_active], [process_name], [process_type_id], [sort_order]) 
	VALUES(2, 'Post-Assignment Event', 1, 'Appends EVENT MANAGER to project title', 'Appends EVENT MANAGER to project title', 1, 'spPOSTASSIGNMENT_PROJECTTITLE_MODIFY', 2, 1);

INSERT INTO [a_EVENT_MANAGER_EVENTS]([id], [event_name], [event_type_id], [short_description], [long_description], [is_active], [process_name], [process_type_id], [sort_order]) 
	VALUES(3, 'Pre-Submission Event', 1, 'Validates for budget total less than a million', 'Validates for budget total less than a million', 1, 'spPRESUBMISSION_BUDGET_CHECK', 3, 1);

INSERT INTO [a_EVENT_MANAGER_EVENTS]([id], [event_name], [event_type_id], [short_description], [long_description], [is_active], [process_name], [process_type_id], [sort_order]) 
	VALUES(4, 'Post-Submission Event', 1, 'If last name contains ''a'' altum admin is assigned as grant primary staff contact', 'If last name contains ''a'' altum admin is assigned as grant primary staff contact', 1, 'spPOSTSUBMISSION_PRIMARY_STAFF', 4, 1);

INSERT INTO [a_EVENT_MANAGER_EVENTS]([id], [event_name], [event_type_id], [short_description], [long_description], [is_active], [process_name], [process_type_id], [sort_order]) 
	VALUES(5, 'Post-Submission Workflow Event', 1, 'Sets the requested amount to 2 million if the grant primary person state in the address is VA', 'Sets the requested amount to 2 million if the grant primary person state in the address is VA', 1, 'spPOSTSUBMISSIONWORKFLOW_STATE_CHECK', 5, 1);


INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description], [lookup_table_type_id]) 
	VALUES('a_EVENT_MANAGER_EVENTS', 6, 0, NULL, 1);