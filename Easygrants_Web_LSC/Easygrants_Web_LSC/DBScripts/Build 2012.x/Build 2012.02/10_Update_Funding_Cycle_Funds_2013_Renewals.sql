update a_wf_project
    set fund_id = f.fund_id
    from wf_task_assignment wfta
        join vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
        join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
        join a_wf_project wfp on gp.wf_project_id = wfp.id
        join a_competition c on wfp.competition_id = c.id
        join a_fund f on c.description + ' ' + cast(wcy.wfta_year as varchar(4)) = f.fund_name
    where wfta.wf_task_id in (4, 67)
        and wcy.wfta_year = 2013
