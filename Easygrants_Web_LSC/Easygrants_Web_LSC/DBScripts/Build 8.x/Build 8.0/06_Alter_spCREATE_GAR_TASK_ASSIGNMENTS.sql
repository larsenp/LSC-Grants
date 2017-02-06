/****** Object:  StoredProcedure [dbo].[spCREATE_GAR_TASK_ASSIGNMENTS]    Script Date: 01/06/2010 15:45:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spCREATE_GAR_TASK_ASSIGNMENTS] 
    (@report_year int,
	@open_date datetime,
	@early_due_date datetime,
	@late_due_date datetime,
	@close_date datetime,
	@start_date datetime)

/*
@report_year represents the year for which actual data forms are being assigned.
For example, if @report_year = 2009, the stored procedure will create assignments
for actual data forms for 2009 and for projected data forms for 2010.
*/

AS

--Create temp table for active competition grants
create table #grants
    (organization_id int,
    grantee_project_id int,
    person_id int,
    wf_project_id int,
    service_area varchar(10),
    service_area_type_id int,
    is_primary_service_area bit)

--Populate grants table
insert #grants
    (organization_id,
    grantee_project_id,
    person_id,
    wf_project_id,
    service_area,
    service_area_type_id)
    select gp.primary_organization_id,
        gp.grantee_project_id,
        gp.primary_person_id,
        gp.wf_project_id,
        c.description,
        sa.service_area_type_id
        from grantee_project gp
            join a_wf_project wfp on gp.wf_project_id = wfp.id
            join a_competition c on wfp.competition_id = c.id
            join LSC_a_SERVICE_AREA sa on wfp.competition_id = sa.competition_id
        where gp.grant_status_id = 1
            and c.program_id = 1

--The following cursor will iterate through the grants table and designate a "primary" service
--area for each grantee. This is a somewhat arbitrary designation used to designate the service
--area to which forms that are assigned only once per grantee will be assigned.
--If the grantee has exactly one basic field service area, that service
--area will be designated as primary. If the grantee has more than one basic field service area,
--the first one in alphabetical order will be designated as primary. If the grantee has no basic
--field service areas, the first service area based on service area type id and service area name, 
--in alphabetical order, will be designated primary.
declare @grantee_project_id int, @organization_id int, @prev_org_id int

set @prev_org_id = 0

declare g cursor for
    select grantee_project_id,
        organization_id
        from #grants
        order by organization_id, 
            service_area_type_id,
            service_area
open g
fetch next from g into @grantee_project_id, @organization_id 

while(@@fetch_status=0)
begin
    if @organization_id <> @prev_org_id
        update #grants
            set is_primary_service_area = 1
            where grantee_project_id = @grantee_project_id
    set @prev_org_id = @organization_id
    fetch next from g into @grantee_project_id, @organization_id 
end

close g
deallocate g

--Create temp table for task assignments
create table #gar
    (ident int identity(0,1),
    wf_task_assignment_id int,
    wf_task_id int,
    wf_task_status_id int,
    wf_task_outcome_id int,
    grantee_project_id int,
    wf_project_id int,
    person_id int,
    wf_task_role_id int,
    open_date datetime,
    due_date datetime,
    close_date datetime,
    start_date datetime,
    award_term_id int)

--Populate temp table with one task assignment for every combination of active grant and GAR task
--for forms assigned to every service area
insert #gar
    (wf_task_id,
    wf_task_status_id,
    grantee_project_id,
    wf_project_id,
    person_id,
    wf_task_role_id,
	open_date ,
	close_date ,
	start_date )
    select wft.id,
        1,
        g.grantee_project_id,
        g.wf_project_id,
        g.person_id,
        8,
		@open_date ,
		@close_date ,
		@start_date
        from a_wf_task wft
            join lsc_a_wf_task lwft on wft.id = lwft.wf_task_id
            cross join #grants g
        where wft.wf_task_type_id = 3
            and lwft.assign_report_per_service_area = 1
            and lwft.is_pai = 0

--Populate temp table with one task assignment for every combination of active grant and GAR task
--for forms assigned only to basic field service areas
insert #gar
    (wf_task_id,
    wf_task_status_id,
    grantee_project_id,
    wf_project_id,
    person_id,
    wf_task_role_id,
	open_date ,
	close_date ,
	start_date)
    select wft.id,
        1,
        g.grantee_project_id,
        g.wf_project_id,
        g.person_id,
        8,
		@open_date ,
		@close_date ,
		@start_date
        from a_wf_task wft
            join lsc_a_wf_task lwft on wft.id = lwft.wf_task_id
            cross join #grants g
        where wft.wf_task_type_id = 3
            and lwft.assign_report_per_service_area = 1
            and lwft.is_pai = 1
            and g.service_area_type_id = 1

--Populate temp table with one task assignment for every combination of active grant and GAR task
--for forms assigned once per grantee
insert #gar
    (wf_task_id,
    wf_task_status_id,
    grantee_project_id,
    wf_project_id,
    person_id,
    wf_task_role_id,
	open_date ,
	close_date ,
	start_date)
    select wft.id,
        1,
        g.grantee_project_id,
        g.wf_project_id,
        g.person_id,
        8,
		@open_date ,
		@close_date ,
		@start_date
        from a_wf_task wft
            join lsc_a_wf_task lwft on wft.id = lwft.wf_task_id
            cross join #grants g
        where wft.wf_task_type_id = 3
            and lwft.assign_report_per_service_area = 0
            and g.is_primary_service_area = 1

--set task outcome
update #gar
    set wf_task_outcome_id = wfto.id
    from #gar
        join a_wf_task_outcome wfto on #gar.wf_task_id = wfto.task_id
            and wfto.abbr = 'IN PROC'

--set award_term_id based on current year
update #gar
    set award_term_id = @report_year + 1 - tp.sort_order
    from #gar
        join a_wf_project wfp on #gar.wf_project_id = wfp.id
        join c_time_period tp on wfp.time_period_id = tp.id

--adjust award_term_id for projected grantee report task assignments
update #gar
    set award_term_id = award_term_id + 1
    from #gar
        join lsc_a_wf_task lwft on #gar.wf_task_id = lwft.wf_task_id
    where lwft.is_projected = 1

--Set due date
update #gar
	set due_date = @early_due_date
	from #gar g 
		join lsc_a_wf_task lwft on g.wf_task_id = lwft.wf_task_id
	where lwft.gar_is_early_due_date = 1

update #gar
	set due_date = @late_due_date
	from #gar g 
		join lsc_a_wf_task lwft on g.wf_task_id = lwft.wf_task_id
	where lwft.gar_is_early_due_date = 0

--Populate wf_task_assignment_id
DECLARE @rowcount int, @first_new_id int; 

SELECT @rowcount = count(*) FROM #gar

EXEC @first_new_id = spGETID_RANGE_SEL 
    @table = 'WF_TASK_ASSIGNMENT', 
    @count = @rowcount, 
    @mode = 2; 

UPDATE #gar 
    SET wf_task_assignment_id = ident + @first_new_id

--Insert data rows
INSERT WF_TASK_ASSIGNMENT
    (wf_task_assignment_id,
    wf_task_id,
    wf_task_status_id,
    wf_task_outcome_id,
    grantee_project_id,
    person_id,
    wf_task_role_id,
    open_date,
    due_date,
    close_date,
    start_date,
    award_term_id)
    SELECT wf_task_assignment_id,
        wf_task_id,
        wf_task_status_id,
        wf_task_outcome_id,
        grantee_project_id,
        person_id,
        wf_task_role_id,
        open_date,
        due_date,
        close_date,
        start_date,
        award_term_id
        FROM #gar

drop table #gar
