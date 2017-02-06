ALTER TABLE a_PROCESS_TYPE ADD workflow_event_type_id int;
GO
UPDATE a_PROCESS_TYPE SET workflow_event_type_id = 2 where id = 5
GO
UPDATE a_PROCESS_TYPE SET workflow_event_type_id = 1 where workflow_event_type_id is null
GO
ALTER TABLE a_PROCESS_TYPE ALTER COLUMN workflow_event_type_id int not null;
GO