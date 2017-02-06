EXEC spLSC_NEW_FUNDING_CYCLE @serv_area = 'AS-1', @new_time_period_id = 17

GO

--The stored procedure spLSC_INSERT_PROJECT_TASKS has been modified so that it will not insert duplicate project tasks.
--The following set of stored procedure calls result in project tasks being set up only for the new AS-1 2012 funding cycle.

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 17,
	@wf_task_id = 1, --NIC
	@start_date = '2011-04-12',
	@open_date = '2011-04-12',
	@due_date = '2011-05-13',
	@close_date = '2011-05-14',
	@end_date = '2011-07-15'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 17,
	@wf_task_id = 3, --NIC review
	@start_date = '2011-04-12',
	@open_date = '2011-04-12',
	@due_date = '2011-05-15',
	@close_date = '2011-05-31',
	@end_date = '2011-07-15'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 17,
	@wf_task_id = 2, --competitive application
	@start_date = '2011-04-12',
	@open_date = '2011-04-12',
	@due_date = '2011-06-07',
	@close_date = '2011-06-30',
	@end_date = '2011-12-31'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 17,
	@wf_task_id = 4, --renewal application
	@start_date = '2011-04-12',
	@open_date = '2011-04-12',
	@due_date = '2011-06-07',
	@close_date = '2011-06-30',
	@end_date = '2011-12-31'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 17,
	@wf_task_id = 66, --post-PQV competitive application
	@start_date = '2011-05-14',
	@open_date = '2011-05-14',
	@due_date = '2011-06-07',
	@close_date = '2011-06-30',
	@end_date = '2011-12-31'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 17,
	@wf_task_id = 67, --post-PQV renewal application 2012
	@start_date = '2011-05-14',
	@open_date = '2011-05-14',
	@due_date = '2011-06-07',
	@close_date = '2011-06-30',
	@end_date = '2011-12-31'

GO


spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 17,
	@wf_task_id = 5, --competitive application review
	@start_date = '2011-6-8',
	@open_date = '2011-6-8',
	@due_date = '2011-09-03',
	@close_date = '2011-12-31',
	@end_date = '2011-12-31'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 17,
	@wf_task_id = 6, --renewal application review
	@start_date = '2011-6-8',
	@open_date = '2011-6-8',
	@due_date = '2011-09-03',
	@close_date = '2011-12-31',
	@end_date = '2011-12-31'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 17,
	@wf_task_id = 7, --upload certification
	@start_date = '2011-08-06',
	@open_date = '2011-08-06',
	@due_date = '2011-08-23',
	@close_date = '2011-9-1',
	@end_date = '2011-9-30'

