exec spUpdate_IDGen

declare @user_id int

select @user_id = easygrants_user_id
	from easygrants_user
	where login_username = 'larsenp@lsc.gov'

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
	create_user int,
	create_date datetime,
	[description] varchar(100),
	generation_id int)

insert #wfpt
	(wf_project_id,
	wf_task_id,
	start_date,
	open_date,
	due_date,
	close_date,
	end_date,
	sort_order,
	create_user,
	create_date,
	[description],
	generation_id)
	select wfp.id wf_project_id,
		5 wf_task_id,
		'2008-05-16' start_date,
		'2008-05-16' open_date,
		'2008-08-01' due_date,
		'2008-08-01' close_date,
		'2008-08-01' end_date,
		5 sort_order,
		@user_id create_user,
		getdate() create_date,
		wfp.description + ' Application Review' [description],
		1 generation_id
		from a_wf_project wfp
			left join a_wf_project_task wfpt on wfp.id = wfpt.wf_project_id
				and wfpt.wf_task_id = 5
		where wfp.time_period_id = 4
			and wfpt.id is null

insert #wfpt
	(wf_project_id,
	wf_task_id,
	start_date,
	open_date,
	due_date,
	close_date,
	end_date,
	sort_order,
	create_user,
	create_date,
	[description],
	generation_id)
	select wfp.id wf_project_id,
		6 wf_task_id,
		'2008-05-16' start_date,
		'2008-05-16' open_date,
		'2008-08-01' due_date,
		'2008-08-01' close_date,
		'2008-08-01' end_date,
		6 sort_order,
		@user_id create_user,
		getdate() create_date,
		wfp.description + ' Application Renewal Review' [description],
		1 generation_id
		from a_wf_project wfp
			join a_wf_project_task wfpt_r on wfp.id = wfpt_r.wf_project_id
				and wfpt_r.wf_task_id = 4
			left join a_wf_project_task wfpt on wfp.id = wfpt.wf_project_id
				and wfpt.wf_task_id = 6
		where wfp.time_period_id in (2,3)
			and wfpt.id is null

DECLARE @rowcount int, @first_new_id int

SELECT @rowcount = count(*) FROM #wfpt

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'a_wf_project_task', @count = @rowcount, @mode = 2

UPDATE #wfpt
	SET id = ident + @first_new_id 

INSERT a_WF_PROJECT_TASK
	(id,
	wf_project_id,
	wf_task_id,
	start_date,
	open_date,
	due_date,
	close_date,
	end_date,
	sort_order,
	create_user,
	create_date,
	description,
	generation_id)
	SELECT id,
		wf_project_id,
		wf_task_id,
		start_date,
		open_date,
		due_date,
		close_date,
		end_date,
		sort_order,
		create_user,
		create_date,
		description,
		generation_id
		FROM #wfpt

select * from #wfpt

drop table #wfpt

