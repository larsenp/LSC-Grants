EXEC spLSC_INSERT_RENEWAL_WFTA
	@time_period_id = 18,
	@start_date = '2012-4-10',
	@open_date = '2012-4-10',
	@due_date = '2012-06-4',
	@close_date = '2012-06-30',
	@end_date = '2012-12-31',
	@start_date_postpqv = '2012-5-19',
	@open_date_postpqv = '2012-5-19',
	@due_date_postpqv = '2012-6-18',
	@close_date_postpqv = '2012-7-15'

GO

--Schedule C
UPDATE WF_TASK_ASSIGNMENT
	SET start_date = '2012-7-4',
		open_date = '2012-7-4',
		due_date = '2012-8-13',
		close_date = '2012-8-30'
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON wfta.wf_task_assignment_id = cwosy.wf_task_assignment_id
	WHERE cwosy.recipient_id in (331100, 618010, 744100)
		AND wfta.wf_task_id = 67
		AND cwosy.wfta_year = 2013

--Southeast Louisiana (619081) is a post-PQV grantee but will submit a standard renewal application
--for its new service area, LA-1, which was not a subject of the PQV.
UPDATE WF_TASK_ASSIGNMENT
	SET wf_task_id = 4
	FROM vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy
		JOIN WF_TASK_ASSIGNMENT wfta ON cwosy.wf_task_assignment_id = wfta.wf_task_assignment_id
	WHERE cwosy.recipient_id = 619081
		AND cwosy.wfta_year = 2013
		AND cwosy.serv_area = 'LA-1'