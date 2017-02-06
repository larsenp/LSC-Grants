spLSC_INSERT_PROJECT_TASKS
    @time_period_id = 20,
    @wf_task_id = 1, --NIC
    @start_date = '2014-4-12',
    @open_date = '2014-4-12',
    @due_date = '2014-5-9',
    @close_date = '2014-5-10',
    @end_date = '2014-7-14'

GO

spLSC_INSERT_PROJECT_TASKS
    @time_period_id = 20,
    @wf_task_id = 3, --NIC review
    @start_date = '2014-4-12',
    @open_date = '2014-4-12',
    @due_date = '2014-5-15',
    @close_date = '2014-5-31',
    @end_date = '2014-7-15'

GO

spLSC_INSERT_PROJECT_TASKS
    @time_period_id = 20,
    @wf_task_id = 2, --competitive application
    @start_date = '2014-4-12',
    @open_date = '2014-4-12',
    @due_date = '2014-6-2',
    @close_date = '2014-6-30',
    @end_date = '2014-12-31'

GO

spLSC_INSERT_PROJECT_TASKS
    @time_period_id = 20,
    @wf_task_id = 66, --post-PQV competitive application
    @start_date = '2014-4-12', --note for 2016 cycle: these are the wrong dates; use Schedule B dates for post-PQV apps
    @open_date = '2014-4-12',
    @due_date = '2014-6-16',
    @close_date = '2014-6-30',
    @end_date = '2014-12-31'

GO

spLSC_INSERT_PROJECT_TASKS
    @time_period_id = 19, --2014
    @wf_task_id = 4, --standard renewal application
    @start_date = '2014-4-12',
    @open_date = '2014-4-12',
    @due_date = '2014-6-2',
    @close_date = '2014-6-30',
    @end_date = '2014-12-31'

GO

spLSC_INSERT_PROJECT_TASKS
    @time_period_id = 19, --2014
    @wf_task_id = 67, --post-PQV renewal application
    @start_date = '2014-4-12', --note for 2016 cycle: these are the wrong dates; use Schedule B dates for post-PQV apps
    @open_date = '2014-4-12',
    @due_date = '2014-6-16',
    @close_date = '2014-6-30',
    @end_date = '2014-12-31'

GO

--Schedule C for post-PQV competitive application
/*
UPDATE a_WF_PROJECT_TASK
    SET start_date = '2013-7-4',
        open_date = '2013-7-4',
        due_date = '2013-8-12',
        close_date = '2013-8-30'
    FROM a_COMPETITION c
        JOIN a_WF_PROJECT wfp ON c.id = wfp.competition_id
        JOIN a_WF_PROJECT_TASK wfpt ON wfp.id = wfpt.wf_project_id
    WHERE c.description in (??)
        AND wfp.time_period_id = 19
        AND wfpt.wf_task_id = 66

*/ 