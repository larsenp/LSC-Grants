update wf_task_assignment
    set start_date = '2016-1-14'
        ,open_date = '2016-1-14'
    from wf_task_assignment wfta
        join vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
    where wcy.lsc_gar_cycle_id = 18
        and wfta.wf_task_status_id = 1