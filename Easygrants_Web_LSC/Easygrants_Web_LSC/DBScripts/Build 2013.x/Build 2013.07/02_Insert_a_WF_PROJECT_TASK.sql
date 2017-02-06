CREATE TABLE #pt
    (ident int identity(0,1),
    id int,
    wf_project_id int,
    wf_task_id int,
    start_date datetime,
    open_date datetime,
    due_date datetime,
    close_date datetime,
    end_date datetime,
    sort_order int,
    description varchar(100),
    initial_project_task bit default 0)

--Populate temp table
INSERT #pt (wf_project_id ,
    wf_task_id ,
    start_date ,
    open_date ,
    due_date ,
    close_date ,
    end_date ,
    sort_order ,
    description)
    select wfp.id wf_project_id,
        91,
        '2013-4-25',
        '2013-4-25',
        '2013-5-17',
        '2013-6-1',
        '2013-6-1',
        wft.sort_order,
        wfp.description + ' Review 1607 Compliance Report - OPP Staff'
        from wf_task_assignment wfta
            join a_wf_task wft on wfta.wf_task_id = wft.id
            join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
            join a_wf_project wfp on gp.wf_project_id = wfp.id
            join lsc_a_service_area sa on wfp.competition_id = sa.competition_id
            join lsc_c_service_area_type sat on sa.service_area_type_id = sat.id
            left join a_wf_project_task wfpt on wfp.id = wfpt.wf_project_id
                and wfpt.wf_task_id = 91
        where wfta.wf_task_id = 89
            and wfpt.id is null

DECLARE @rowcount int, @first_new_id int

SELECT @rowcount = count(*) FROM #pt

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'a_WF_PROJECT_TASK', @count = @rowcount, @mode = 2

UPDATE #pt
    SET id = ident + @first_new_id

--Insert to database table
INSERT a_WF_PROJECT_TASK (id,
    wf_project_id ,
    wf_task_id ,
    start_date ,
    open_date ,
    due_date ,
    close_date ,
    end_date ,
    sort_order ,
    description,
    initial_project_task)
    SELECT id,
        wf_project_id ,
        wf_task_id ,
        start_date ,
        open_date ,
        due_date ,
        close_date ,
        end_date ,
        sort_order ,
        description,
        initial_project_task
        FROM #pt

select * from #pt
drop table #pt 