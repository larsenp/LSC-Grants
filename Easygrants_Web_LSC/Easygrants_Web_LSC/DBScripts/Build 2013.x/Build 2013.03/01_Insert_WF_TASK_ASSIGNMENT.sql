create table #wfta
    (wfta_key varchar(20)
    ,grantee_project_id int
    ,ident int identity(0,1)
    ,wf_task_assignment_id int
	,award_term_id int)

/*For each grantee not in compliance, find one active grant to which to assign the compliance report.
The grant to be assigned will be the first grant for the grantee when ordered by service area type
(preference to basic field) and service area name*/

insert #wfta(wfta_key)
    select min(cast(sa.service_area_type_id as varchar(1)) + '_' + c.description + '_' + cast(gp.grantee_project_id as varchar(4)))
        from vLSC_BOARD_COMPLIANCE bc
            JOIN c_TIME_PERIOD tp ON bc.time_period_id = tp.id
            JOIN ORGANIZATION o ON bc.organization_id = o.organization_id
            JOIN GRANTEE_PROJECT gp ON o.organization_id = gp.primary_organization_id
            JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
            JOIN a_COMPETITION c ON wfp.competition_id = c.id
            JOIN LSC_a_SERVICE_AREA sa ON c.id = sa.competition_id
        where tp.sort_order = 2013
            and bc.is_nic_data = 0
            and overall_compliant = 0
            and gp.grant_status_id = 1
            and c.program_id = 1
        group by o.organization_id

--Extract grantee project ID (assumes four-digit ID)
update #wfta
    set grantee_project_id = substring(wfta_key, len(wfta_key) - 3, 4)

--Set award term ID
update #wfta
	set award_term_id = 2013 - tp.sort_order + 1
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
		,'2013-3-8'
		,'2013-3-31'
		,'2013-4-15'
		,'2013-3-8'
		,'2013-4-15'
		,#wfta.award_term_id
		,getdate()
		from #wfta
			join grantee_project gp on #wfta.grantee_project_id = gp.grantee_project_id
	

select * from #wfta

drop table #wfta 
