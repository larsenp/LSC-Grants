EXEC spLSC_INSERT_RENEWAL_WFTA
	@time_period_id = 20,
	@start_date = '2014-4-12',
	@open_date = '2014-4-12',
	@due_date = '2014-6-2',
	@close_date = '2014-6-30',
	@end_date = '2014-12-31',
	@start_date_postpqv = '2014-5-17',
	@open_date_postpqv = '2014-5-17',
	@due_date_postpqv = '2014-6-16',
	@close_date_postpqv = '2014-6-30'

GO

/*
--Schedule C
UPDATE WF_TASK_ASSIGNMENT
	SET start_date = '2013-7-6',
		open_date = '2013-7-6',
		due_date = '2013-8-12',
		close_date = '2013-8-30'
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON wfta.wf_task_assignment_id = cwosy.wf_task_assignment_id
	WHERE cwosy.serv_area in ('LA-11', 'NJ-18', 'PA-8')
		AND wfta.wf_task_id = 67
		AND cwosy.wfta_year = 2014


*/
