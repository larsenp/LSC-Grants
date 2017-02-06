--Insert project tasks for Upload Certification task

create table #wfpt
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
	description varchar(100))

insert #wfpt
	(wf_project_id,
	wf_task_id,
	start_date,
	open_date,
	due_date,
	close_date,
	end_date,
	sort_order,
	description)
	select wfp.id,
		7,
		'8/5/2008',
		'8/5/2008',
		'8/19/2008',
		'8/20/2008',
		'9/30/2008',
		7,
		'Certification Upload'
		from wf_task_assignment wfta
			join vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
			join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
			join a_wf_project wfp on gp.wf_project_id = wfp.id
		where wcy.wfta_year = 2009
			and wfta.wf_task_status_id = 2
			and wfta.wf_task_id in (2,4)

declare @first_id int,
	@row_count int

select @row_count  = count(*) from #wfpt

exec @first_id = [spGETID_RANGE_SEL]
	@table = 'a_WF_PROJECT_TASK',
	@count = @row_count,
	@mode = 2

update #wfpt
	set id = ident + @first_id

insert a_wf_project_task
	(id,
	wf_project_id,
	wf_task_id,
	start_date,
	open_date,
	due_date,
	close_date,
	end_date,
	sort_order,
	description)
	select id,
		wf_project_id,
		wf_task_id,
		start_date,
		open_date,
		due_date,
		close_date,
		end_date,
		sort_order,
		description
	from #wfpt

select * from #wfpt

drop table #wfpt
	