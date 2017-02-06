--This script creates all project tasks associations required for the 2010 competition cycle.
--The stored procedure that it calls also handles associating tasks with PDFs and workgroups,
--as needed.

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 1, --NIC
	@start_date = '2009-04-10',
	@open_date = '2009-04-10',
	@due_date = '2009-05-15',
	@close_date = '2009-05-16',
	@end_date = '2009-07-15'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 2, --competitive application
	@start_date = '2009-04-10',
	@open_date = '2009-04-10',
	@due_date = '2009-06-05',
	@close_date = '2009-06-30',
	@end_date = '2009-12-31'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 3, --NIC review
	@start_date = '2009-04-10',
	@open_date = '2009-04-10',
	@due_date = '2009-05-15',
	@close_date = '2009-05-16',
	@end_date = '2009-07-15'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 4, --renewal application
	@start_date = '2009-04-10',
	@open_date = '2009-04-10',
	@due_date = '2009-06-05',
	@close_date = '2009-06-30',
	@end_date = '2009-12-31'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 5, --competitive application review
	@start_date = '2009-6-8',
	@open_date = '2009-6-8',
	@due_date = '2009-09-04',
	@close_date = '2009-12-31',
	@end_date = '2009-12-31'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 6, --renewal application review
	@start_date = '2009-6-8',
	@open_date = '2009-6-8',
	@due_date = '2009-09-04',
	@close_date = '2009-12-31',
	@end_date = '2009-12-31'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 7, --upload certification
	@start_date = '2009-08-06',
	@open_date = '2009-08-06',
	@due_date = '2009-08-23',
	@close_date = '2009-9-1',
	@end_date = '2009-9-30'
