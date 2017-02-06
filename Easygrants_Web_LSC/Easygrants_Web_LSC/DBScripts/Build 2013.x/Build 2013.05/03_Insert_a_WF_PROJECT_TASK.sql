--This script creates all project tasks associations required for the 2014 competition/renewal application cycle.
--The stored procedure that it calls also handles associating tasks with PDFs and workgroups,
--as needed.

--Nominal go-live date for NIC and traditional applications is 4/8/13.
--Nominal go-live date for post-PQV applications is 5/17/13 (schedule B).
--Nominal go-live date for post-PQV applications is 7/5/13 (schedule C).
--This script sets the respective start and open dates a day later to avoid inadvertently opening too soon since the 
--RFP publication decision is often made on the scheduled publication date.
--Other system dates are not yet determined as of the creation of this script 2/2/11.

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 19,
	@wf_task_id = 1, --NIC
	@start_date = '2013-4-15',
	@open_date = '2013-4-15',
	@due_date = '2013-05-10',
	@close_date = '2013-05-11',
	@end_date = '2013-07-14'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 19,
	@wf_task_id = 3, --NIC review
	@start_date = '2013-4-15',
	@open_date = '2013-4-15',
	@due_date = '2013-05-15',
	@close_date = '2013-05-31',
	@end_date = '2013-07-15'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 19,
	@wf_task_id = 2, --competitive application
	@start_date = '2013-4-15',
	@open_date = '2013-4-15',
	@due_date = '2013-06-3',
	@close_date = '2013-06-30',
	@end_date = '2013-12-31'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 19,
	@wf_task_id = 66, --post-PQV competitive application
	@start_date = '2013-05-18',
	@open_date = '2013-05-18',
	@due_date = '2013-06-17',
	@close_date = '2013-06-30',
	@end_date = '2013-12-31'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 18, --2013
	@wf_task_id = 4, --standard renewal application
	@start_date = '2013-4-15',
	@open_date = '2013-4-9',
	@due_date = '2013-06-3',
	@close_date = '2013-06-30',
	@end_date = '2013-12-31'

GO

spLSC_INSERT_PROJECT_TASKS
	@time_period_id = 18, --2013
	@wf_task_id = 67, --post-PQV renewal application
	@start_date = '2013-05-18',
	@open_date = '2013-05-18',
	@due_date = '2013-06-17',
	@close_date = '2013-06-30',
	@end_date = '2013-12-31'

GO

--Delete renewal project tasks associated with service areas in competition in both 2013 and 2014
delete a_wf_project_task
	from a_wf_project_task wfpt
		join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		join a_wf_project wfp19 on wfp.competition_id = wfp19.competition_id
			and wfp19.time_period_id = 19
	where wfp.time_period_id = 18
		and wfpt.wf_task_id in (4,67)


--Schedule C for post-PQV competitive and renewal applications
UPDATE a_WF_PROJECT_TASK
	SET  start_date = '2013-7-6',
		open_date = '2013-7-6',
		due_date = '2013-8-12',
		close_date = '2013-8-30'
	FROM a_COMPETITION c
		JOIN a_WF_PROJECT wfp ON c.id = wfp.competition_id
		JOIN a_WF_PROJECT_TASK wfpt ON wfp.id = wfpt.wf_project_id
	WHERE c.description in ('LA-11', 'NJ-18', 'PA-8', 'MVA', 'VA-18', 'MO-4', 'TX-13')
		AND ((wfp.time_period_id = 19 AND wfpt.wf_task_id = 66)
			OR (wfp.time_period_id IN (17, 18) AND wfpt.wf_task_id = 67))