--Make the application task assignments available immediately.
UPDATE a_WF_PROJECT_TASK
	SET start_date = getdate(), 
		open_date = getdate()
	WHERE wf_task_id in (41, 42)
