--Add project tasks for post-PQV renewal applications for 2011 grants
--This corrects an error in Build 10.1, script 07, in which the @time_period_id parameter was mistakenly set to 6 instead of 16.
--Since there is no time period with id = 6, no project tasks were incorrectly added by that script.
--All that needs to be done is to rerun the stored procedure with the correct parameter.

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 16,
	@wf_task_id = 67, --post-PQV renewal application 2011
	@start_date = '2011-05-21',
	@open_date = '2011-05-21',
	@due_date = '2011-06-07',
	@close_date = '2011-06-30',
	@end_date = '2011-12-31'