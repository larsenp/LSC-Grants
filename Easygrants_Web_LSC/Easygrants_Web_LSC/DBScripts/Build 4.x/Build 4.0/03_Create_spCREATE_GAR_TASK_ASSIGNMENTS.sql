CREATE PROCEDURE spCREATE_GAR_TASK_ASSIGNMENTS 
	(@report_year int)

AS

--Create temp table
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
insert #gar
	(wf_task_id,
	wf_task_status_id,
	grantee_project_id,
	wf_project_id,
	person_id,
	wf_task_role_id)
	select wft.id,
		1,
		gp.grantee_project_id,
		gp.wf_project_id,
		gp.primary_person_id,
		8
		from a_wf_task wft
			cross join grantee_project gp 
		where wft.wf_task_type_id = 3
			and gp.grant_status_id = 1

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

--Populate wf_task_assignment_id
DECLARE @rowcount int, @first_new_id int; 

SELECT @rowcount = count(*) FROM #gar

EXEC @first_new_id = Easygrants_Migration.dbo.spGETID_RANGE_SEL 
	@table = 'WF_TASK_ASSIGNMENT', 
	@count = @rowcount, @mode = 2; 

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

GO

EXEC spCREATE_GAR_TASK_ASSIGNMENTS @report_year = 2008

GO