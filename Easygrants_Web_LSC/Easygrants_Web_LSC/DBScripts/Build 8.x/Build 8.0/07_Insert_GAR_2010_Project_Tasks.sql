/*
Execute these statements one at a time. For unknown reasons, some of them result in 
primary key errors. This can be resolved by rerunning each statement that fails.

To verify whether a particular statement ran successfully, run the following select,
substituting the @wf_task_id value used in the statement:

select wfpt.* 
	from a_wf_project_task wfpt
		join a_wf_project wfp on wfpt.wf_project_id = wfp.id
	where wfp.time_period_id = 7
		and wfpt.wf_task_id = @wf_task_id
*/

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 8, --D-1
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-15',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 9, --D-3
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-15',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 10, --G-3
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-01',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 11, --G-3(d)
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-01',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 12, --G-4
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-01',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 13, --G-5
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-01',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 14, --G-5(d)
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-01',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 15, --J-1
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-15',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 16, --M
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-15',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 17, --G-6
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-01',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 18, --L
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-15',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 19, --D-2
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-15',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 20, --D-4
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-15',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 21, --G-1
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-01',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 22, --G-1(d)
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-01',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 23, --J-2
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-15',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 24, --E-0
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-15',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 25, --E-1(a)
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-15',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 26, --E-1(b)
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-15',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 27, --E-1(c)
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-15',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 28, --E-2(a)
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-15',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

exec spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 7,
	@wf_task_id = 29, --E-2(c)
	@start_date = '2010-01-15',
	@open_date = '2010-01-15',
	@due_date = '2010-03-15',
	@close_date = '2010-05-31',
	@end_date = '2010-05-31'

