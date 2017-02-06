--This script creates all project tasks associations required for the 2011 competition cycle.
--The stored procedure that it calls also handles associating tasks with PDFs and workgroups,
--as needed.

--Nominal go-live date for NIC and traditional applications is 4/11/11.
--Nominal go-live date for post-PQV applications is 5/13/11.
--This script sets the respective start and open dates a day later to avoid inadvertently opening too soon since the 
--RFP publication decision is often made on the scheduled publication date.
--Other system dates are not yet determined as of the creation of this script 2/2/11.

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

--The following two stored procedure calls are to be used for the 2012 cycle only.
--They "retrofit" the post-PQV renewal application task into the 2011 and 2010 cycles.
spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 6,
	@wf_task_id = 67, --post-PQV renewal application 2011
	@start_date = '2011-05-14',
	@open_date = '2011-05-14',
	@due_date = '2011-06-07',
	@close_date = '2011-06-30',
	@end_date = '2011-12-31'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 67, --post-PQV renewal application 2010
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
