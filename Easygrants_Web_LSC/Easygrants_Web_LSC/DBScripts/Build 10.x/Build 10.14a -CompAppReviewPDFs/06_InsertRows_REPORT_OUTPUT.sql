CREATE TABLE #ro
    (ident int identity(0,1),
    report_output_id int,
    entity_id int,
    definition_id int,
    gen_request_date datetime,
    status int)


insert #ro
    (entity_id ,
    definition_id ,
    gen_request_date,
    status )
select 
	wfta.wf_task_assignment_id,
	rod.report_output_definition_id,
	getdate(),
	0
    from wf_task_assignment wfta
        join vlsc_comp_wfta_org_servarea_year cwosy on wfta.wf_task_assignment_id = cwosy.wf_task_assignment_id
        left join report_output ro on wfta.wf_task_assignment_id = ro.entity_id
            and ro.definition_id = 17
      join grantee_project gp ON wfta.grantee_project_id = gp.grantee_project_id  
      join a_wf_project wfp ON gp.wf_project_id  = wfp.id
      join a_wf_project_task wfpt ON wfpt.wf_project_id = wfp.id and wfpt.wf_task_id = 5
      join a_wf_project_task_pdf wfptp ON wfptp.wf_project_task_id = wfpt.id
      join a_report_output_definition rod ON rod.definition_key = wfptp.final_pdf_report_key 
    where wfta.wf_task_id = 5
        and cwosy.wfta_year = 2012 and wfta.wf_task_status_id <> 3
        and ro.report_output_id is null


DECLARE @rowcount int, @first_new_id int

SELECT @rowcount = count(*) FROM #ro

    EXEC @first_new_id = spGETID_RANGE_SEL @table = 'REPORT_OUTPUT', @count = @rowcount, @mode = 2

    UPDATE #ro
        SET report_output_id = ident + @first_new_id

---Insertion into the actual data table.
INSERT REPORT_OUTPUT
    (report_output_id,
    entity_id,
    definition_id,
    gen_request_date,
    status)
        SELECT report_output_id,
            entity_id,
            definition_id,
            gen_request_date,
            status
         FROM #ro

SELECT ro.*
    FROM #ro
        JOIN REPORT_OUTPUT ro ON #ro.report_output_id = ro.report_output_id

DROP TABLE #ro


