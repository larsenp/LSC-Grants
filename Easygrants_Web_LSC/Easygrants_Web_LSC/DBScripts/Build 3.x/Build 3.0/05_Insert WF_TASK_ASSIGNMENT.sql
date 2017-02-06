--Create Upload Certification task assignments.

create table #wfta
	(ident int identity (0,1),
	wf_task_assignment_id int,
	wf_task_id int,
	wf_task_status_id int,
	wf_task_outcome_id int,
	grantee_project_id int,
	person_id int,
	wf_task_role_id int,
	award_term_id int)

--Create one task assignment per organization
insert #wfta
	(grantee_project_id,
	person_id)
	select max(wfta.grantee_project_id),
		max(wfta.person_id)
		from wf_task_assignment wfta
			join vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
			join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		where wcy.wfta_year = 2009
			and wfta.wf_task_status_id = 2
			and wfta.wf_task_id in (2,4)
		group by gp.primary_organization_id

update #wfta
	set wf_task_id = 7,
		wf_task_status_id = 1,
		wf_task_outcome_id = 13,
		wf_task_role_id = 1

--Set award_term_id = award_term_id from this year's renewal application
update #wfta
	set award_term_id = wfta.award_term_id
	from #wfta
		join wf_task_assignment wfta on #wfta.grantee_project_id = wfta.grantee_project_id
			and wfta.wf_task_id = 4
		join vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
			and wcy.wfta_year = 2009

--Set award_term_id = 1 if in competition this year
update #wfta
	set award_term_id = 1
	from #wfta
		join wf_task_assignment wfta on #wfta.grantee_project_id = wfta.grantee_project_id
			and wfta.wf_task_id = 2
		join vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
			and wcy.wfta_year = 2009

declare @first_id int,
	@row_count int

select @row_count  = count(*) from #wfta

exec @first_id = [spGETID_RANGE_SEL]
	@table = 'WF_TASK_ASSIGNMENT',
	@count = @row_count,
	@mode = 2

update #wfta
	set wf_task_assignment_id = ident + @first_id

insert wf_task_assignment
	(wf_task_assignment_id,
	wf_task_id,
	wf_task_status_id,
	wf_task_outcome_id,
	grantee_project_id,
	person_id,
	wf_task_role_id,
	award_term_id)
	select wf_task_assignment_id,
		wf_task_id,
		wf_task_status_id,
		wf_task_outcome_id,
		grantee_project_id,
		person_id,
		wf_task_role_id,
		award_term_id
		from #wfta

select * from #wfta

drop table #wfta

