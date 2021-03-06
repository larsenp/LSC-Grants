declare @year int
	,@start_date varchar(10)
	,@open_date varchar(10)
	,@due_date varchar(10)
	,@close_date varchar(10)
	,@end_date varchar(10)

set @year = 2015
set @start_date = '2014-10-2'
set @open_date = '2014-10-2'
set @due_date = '2014-10-20'
set @close_date = '2014-11-15'
set @end_date = '2014-11-20'

create table #wfta
    (wfta_key varchar(20)
    ,grantee_project_id int
    ,ident int identity(0,1)
    ,wf_task_assignment_id int
	,award_term_id int)

/*For each grantee not in compliance, find one grant from the current cycle (either active or application) 
to which to assign the compliance report. The grant to be assigned will be the first grant for the grantee 
when ordered by service area type (preference to basic field) and service area name*/
insert #wfta(wfta_key)
    select min(cast(sa.service_area_type_id as varchar(1)) + '_' + c.description + '_' + cast(gp15.grantee_project_id as varchar(4)))
        from vLSC_BOARD_COMPLIANCE bc
            JOIN c_TIME_PERIOD tp ON bc.time_period_id = tp.id
            JOIN ORGANIZATION o ON bc.organization_id = o.organization_id
            JOIN GRANTEE_PROJECT gp15 ON o.organization_id = gp15.primary_organization_id --grant projected to be active in 2015
			JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON gp15.grantee_project_id = cwosy.grantee_project_id
				AND cwosy.wf_task_id in (2,4,66,67)
				AND cwosy.wfta_year = @year
            JOIN GRANTEE_PROJECT gp_a ON o.organization_id = gp_a.primary_organization_id --grant currently active 
				AND gp_a.grant_status_id = 1
            JOIN a_WF_PROJECT wfp ON gp15.wf_project_id = wfp.id
            JOIN a_COMPETITION c ON wfp.competition_id = c.id
            JOIN LSC_a_SERVICE_AREA sa ON c.id = sa.competition_id
        where tp.sort_order = @year
	        and bc.lsc_board_info_source_id = 1
            and overall_compliant = 0
            and c.program_id = 1
        group by o.organization_id

--Extract grantee project ID (assumes four-digit ID)
update #wfta
    set grantee_project_id = substring(wfta_key, len(wfta_key) - 3, 4)

--Set award term ID
update #wfta
	set award_term_id = @year - tp.sort_order + 1
	from #wfta
		join grantee_project gp on #wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project wfp on gp.wf_project_id = wfp.id
		join c_time_period tp on wfp.time_period_id = tp.id

--Prepare rows for insert
declare @new_id int, @rowcount int

select @rowcount = count(*) from #wfta

exec @new_id = spgetid_range_sel
    @table = 'wf_task_assignment'
    ,@count = @rowcount
    ,@mode = 2

update #wfta
    set wf_task_assignment_id = ident + @new_id

--Insert into LSC Grants database
insert wf_task_assignment
	(wf_task_assignment_id
	,wf_task_id
	,wf_task_status_id
	,wf_task_outcome_id
	,grantee_project_id
	,person_id
	,wf_task_role_id
	,open_date
	,due_date
	,close_date
	,start_date
	,end_date
	,award_term_id
	,create_date)
	select
		#wfta.wf_task_assignment_id
		,89
		,1
		,204
		,#wfta.grantee_project_id
		,gp.primary_person_id
		,8
		,@open_date
		,@due_date
		,@close_date
		,@start_date
		,@end_date
		,#wfta.award_term_id
		,getdate()
		from #wfta
			join grantee_project gp on #wfta.grantee_project_id = gp.grantee_project_id
	

select * from #wfta

drop table #wfta 
