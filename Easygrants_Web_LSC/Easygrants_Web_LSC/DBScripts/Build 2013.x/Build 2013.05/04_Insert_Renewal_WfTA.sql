EXEC spLSC_INSERT_RENEWAL_WFTA
	@time_period_id = 19,
	@start_date = '2013-4-15',
	@open_date = '2013-4-15',
	@due_date = '2013-06-3',
	@close_date = '2013-06-30',
	@end_date = '2013-12-31',
	@start_date_postpqv = '2013-05-18',
	@open_date_postpqv = '2013-05-18',
	@due_date_postpqv = '2013-6-17',
	@close_date_postpqv = '2013-6-30'

GO

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


