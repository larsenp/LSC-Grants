--This script creates all project tasks associations required for the 2011 competition cycle.
--The stored procedure that it calls also handles associating tasks with PDFs and workgroups,
--as needed.

--Nominal go-live date for NIC and traditional applications is 4/9/12.
--Nominal go-live date for post-PQV applications is 5/18/12 (schedule B).
--Nominal go-live date for post-PQV applications is 7/3/12 (schedule C).
--This script sets the respective start and open dates a day later to avoid inadvertently opening too soon since the 
--RFP publication decision is often made on the scheduled publication date.
--Other system dates are not yet determined as of the creation of this script 2/2/11.

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 18,
	@wf_task_id = 1, --NIC
	@start_date = '2012-4-10',
	@open_date = '2012-4-10',
	@due_date = '2012-05-11',
	@close_date = '2012-05-12',
	@end_date = '2012-07-15'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 18,
	@wf_task_id = 3, --NIC review
	@start_date = '2012-4-10',
	@open_date = '2012-4-10',
	@due_date = '2012-05-15',
	@close_date = '2012-05-31',
	@end_date = '2012-07-15'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 18,
	@wf_task_id = 2, --competitive application
	@start_date = '2012-4-10',
	@open_date = '2012-4-10',
	@due_date = '2012-06-4',
	@close_date = '2012-06-30',
	@end_date = '2012-12-31'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 18,
	@wf_task_id = 66, --post-PQV competitive application
	@start_date = '2012-05-19',
	@open_date = '2012-05-19',
	@due_date = '2012-06-18',
	@close_date = '2012-06-30',
	@end_date = '2012-12-31'

GO

--Schedule C for post-PQV competitive application
UPDATE a_WF_PROJECT_TASK
	SET  start_date = '2012-7-4',
		open_date = '2012-7-4',
		due_date = '2012-8-13',
		close_date = '2012-8-30'
	FROM a_COMPETITION c
		JOIN a_WF_PROJECT wfp ON c.id = wfp.competition_id
		JOIN a_WF_PROJECT_TASK wfpt ON wfp.id = wfpt.wf_project_id
	WHERE c.description in ('GA-1', 'MS-9', 'NMS-1')
		AND wfp.time_period_id = 18
		AND wfpt.wf_task_id = 66

