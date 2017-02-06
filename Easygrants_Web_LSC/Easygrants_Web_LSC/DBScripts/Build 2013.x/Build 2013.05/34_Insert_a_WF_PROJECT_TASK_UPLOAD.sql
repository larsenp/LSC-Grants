--Associate new file types and existing file types with all funding cycles active for 2013
--(2014 competition, 2013 and 2012 renewal - associations for existing file types have already been made for 2012 renewal.)

--Create temp table for data to be inserted
create table #wfptu
	(ident int identity(0,1),
	wf_project_task_upload_id int,
	wf_project_task_id int,
	upload_id int,
	is_required bit,
	general_upload bit)

--Program Evaluation and Monitoring Report (PEM) - traditional and post-PQV comp
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		5,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (2,66)
			and wfp.time_period_id = 19

--Applicant PAI Plan - traditional and post-PQV comp 2014, traditional and post-PQV renewal 2013 (basic field service areas only)
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		6,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
			join lsc_a_service_area sa on wfp.competition_id = sa.competition_id
		where wfpt.wf_task_id in (2,66)
			and wfp.time_period_id = 19
			and sa.service_area_type_id = 1

insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		6,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
			join lsc_a_service_area sa on wfp.competition_id = sa.competition_id
		where wfpt.wf_task_id in (4,67)
			and wfp.time_period_id = 18
			and sa.service_area_type_id = 1

--Financial audits - traditional comp only (new applicants only - thus excluded from post-PQV comp)
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		8,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 2
			and wfp.time_period_id = 19

--Technology plan - comp 2014, renewal 2013
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		13,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (2,66)
			and wfp.time_period_id = 19

insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		13,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (4,67)
			and wfp.time_period_id = 18

--Organizational Chart - all
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		22,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where (wfpt.wf_task_id in (2,66) and wfp.time_period_id = 19)
			or (wfpt.wf_task_id in (4,67) and wfp.time_period_id = 18)

--Resumes - standard and post-PQV comp
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		23,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (2,66) and wfp.time_period_id = 19

--IRS Form 990 - all
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		28,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where (wfpt.wf_task_id in (2,66) and wfp.time_period_id = 19)
			or (wfpt.wf_task_id in (4,67) and wfp.time_period_id = 18)

--Accounting Manual - all
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		29,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where (wfpt.wf_task_id in (2,66) and wfp.time_period_id = 19)
			or (wfpt.wf_task_id in (4,67) and wfp.time_period_id = 18)

--LRI - standard and post-PQV comp
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		26,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (2,66) and wfp.time_period_id = 19

--Governing/Policy Body Plan - post-PQV comp
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		25,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id = 66 and wfp.time_period_id = 19

--Certificate of Good Standing (standard and post-PQV competitive applications)
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		31,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (2,66) and wfp.time_period_id = 19

--Segregation of Duties Worksheet (all competitive applications)
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		32,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (2,66) and wfp.time_period_id = 19

--Current Budget Schedules (all competitive applications) (new: upload_id = 33)
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		33,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (2,66) and wfp.time_period_id = 19

--Fidelity Bond or Insurance Policy (all competitive applications) (new: upload_id = 34)
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		34,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (2,66) and wfp.time_period_id = 19

--Special Fiscal Grant Conditions from Other Funders (new: upload_id = 35)
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		35,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (2,66) and wfp.time_period_id = 19

--BOD Finance Committee Charter or Description (new: upload_id = 36)
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		36,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (2,66) and wfp.time_period_id = 19

--BOD Audit Committee Charter or Description (new: upload_id = 37)
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		37,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (2,66) and wfp.time_period_id = 19

--Subgrant information - 2014 competitive apps
insert  #wfptu
	(wf_project_task_id,
	upload_id,
	general_upload)
	select wfpt.id,
		38,
		0
		from a_wf_project_task wfpt
			join a_wf_project wfp on wfpt.wf_project_id = wfp.id
		where wfpt.wf_task_id in (2,66)
			and wfp.time_period_id = 19

--Assign IDs for insertion into database
declare @first_id int,
	@row_count int

select @row_count  = count(*) from #wfptu

exec @first_id = [spGETID_RANGE_SEL]
	@table = 'a_WF_PROJECT_TASK_UPLOAD',
	@count = @row_count,
	@mode = 2

update #wfptu
	set wf_project_task_upload_id = ident + @first_id

--insert into database
insert a_wf_project_task_upload
	(wf_project_task_upload_id,
	wf_project_task_id,
	upload_id,
	is_required,
	general_upload)
	select wf_project_task_upload_id,
		wf_project_task_id,
		upload_id,
		is_required,
		general_upload
		from #wfptu

select * from #wfptu

drop table #wfptu
