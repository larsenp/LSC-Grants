--1. FIX 2015 REVIEWS

--Reviews of competitive applications (previously configured to display renewal review PDF)
update a_wf_project_task_pdf
	set final_pdf_report_key = 'CompApp_VicePresidentReview'
		,description = 'Competition App Vice President Review'
    from vlsc_comp_wfta_org_servarea_year cwosy
        join grantee_project gp on cwosy.grantee_project_id = gp.grantee_project_id
        join a_wf_project_task wfpt on cwosy.wf_task_id = wfpt.wf_task_id
            and gp.wf_project_id = wfpt.wf_project_id
        join a_wf_project_task_pdf wfptp on wfpt.id = wfptp.wf_project_task_id
    where cwosy.wfta_year = 2015
        and cwosy.wf_task_id = 87 

--Reviews of renewal applications (no PDF configuration in place)
CREATE TABLE #wfptp(
	ident int identity(0,1),
	[id] [int] NULL,
	[wf_project_task_id] [int] NOT NULL,
	[report_output_definition_type_id] [int] NOT NULL,
	[final_pdf_report_key] [varchar](50) NOT NULL,
	[description] [varchar](100) NULL,
	[generation_id] [bit] NOT NULL)

insert #wfptp
	([wf_project_task_id] ,
	[report_output_definition_type_id] ,
	[final_pdf_report_key] ,
	[description] ,
	[generation_id])
	select wfpt.id
		,2
		,'RenewalApp_VicePresidentReview'
		,'Renewal App Vice President Review'
		,0
		from vlsc_comp_wfta_org_servarea_year cwosy
			join grantee_project gp on cwosy.grantee_project_id = gp.grantee_project_id
			join a_wf_project_task wfpt on cwosy.wf_task_id = wfpt.wf_task_id
				and gp.wf_project_id = wfpt.wf_project_id
		where cwosy.wfta_year = 2015
			and cwosy.wf_task_id = 88 

declare @rowcount int, @new_id int

select @rowcount = count(*) from #wfptp

exec @new_id = spGETID_RANGE_SEL @table = 'a_WF_PROJECT_TASK_PDF'
	,@count = @rowcount

update #wfptp
	set id = ident + @new_id

insert a_WF_PROJECT_TASK_PDF
	(id,
	[wf_project_task_id] ,
	[report_output_definition_type_id] ,
	[final_pdf_report_key] ,
	[description] ,
	[generation_id])
	select id,
		[wf_project_task_id] ,
		[report_output_definition_type_id] ,
		[final_pdf_report_key] ,
		[description] ,
		[generation_id]
		from #wfptp

select * from #wfptp
drop table #wfptp

--2. FIX OTHER MISCONFIGURED REVIEWS

--competitive reviews (none missing, some misconfigured)
update a_wf_project_task_pdf
	set final_pdf_report_key = 'CompApp_VicePresidentReview'
		,description = 'Competition App Vice President Review'
	from a_wf_project_task wfpt
		left join a_wf_project_task_pdf wfptp on wfpt.id = wfptp.wf_project_task_id
	where wfpt.wf_task_id = 87
		and wfptp.final_pdf_report_key <> 'CompApp_VicePresidentReview'

--renewal reviews (some missing, none misconfigured)
CREATE TABLE #wfptp(
	ident int identity(0,1),
	[id] [int] NULL,
	[wf_project_task_id] [int] NOT NULL,
	[report_output_definition_type_id] [int] NOT NULL,
	[final_pdf_report_key] [varchar](50) NOT NULL,
	[description] [varchar](100) NULL,
	[generation_id] [bit] NOT NULL)

insert #wfptp
	([wf_project_task_id] ,
	[report_output_definition_type_id] ,
	[final_pdf_report_key] ,
	[description] ,
	[generation_id])
	select wfpt.id
		,2
		,'RenewalApp_VicePresidentReview'
		,'Renewal App Vice President Review'
		,0
		from a_wf_project_task wfpt
			left join a_wf_project_task_pdf wfptp on wfpt.id = wfptp.wf_project_task_id
		where wfpt.wf_task_id = 88
			and wfptp.id is null

declare @rowcount int, @new_id int

select @rowcount = count(*) from #wfptp

exec @new_id = spGETID_RANGE_SEL @table = 'a_WF_PROJECT_TASK_PDF'
	,@count = @rowcount

update #wfptp
	set id = ident + @new_id

insert a_WF_PROJECT_TASK_PDF
	(id,
	[wf_project_task_id] ,
	[report_output_definition_type_id] ,
	[final_pdf_report_key] ,
	[description] ,
	[generation_id])
	select id,
		[wf_project_task_id] ,
		[report_output_definition_type_id] ,
		[final_pdf_report_key] ,
		[description] ,
		[generation_id]
		from #wfptp


select * from #wfptp
drop table #wfptp

--3. FIX PDF GENERATION
--For competitive reviews, remove renewal PDFs already created and substitute competitive PDFs
update report_output
	set definition_id = 58
		,status = 0
		,gen_request_date = dateadd(d, 1, getdate()) --add one day to current date so that requests submitted through UI will take precedence
	from vlsc_comp_wfta_org_servarea_year cwosy
		join report_output ro on cwosy.wf_task_assignment_id = ro.entity_id
		join a_report_output_definition rod on ro.definition_id = rod.report_output_definition_id
	where wf_task_id = 87
		and ro.definition_id <> 58
		
--For submitted competitive reviews, generate missing PDFs
create table #ro
	(ident int identity(0,1)
	,report_output_id int
	,entity_id int
	,definition_id int
	,gen_request_date datetime
	,status int)

insert #ro
	(entity_id
	,definition_id
	,gen_request_date
	,status)
	select cwosy.wf_task_assignment_id
		,58
		,dateadd(d, 1, getdate()) --add one day to current date so that requests submitted through UI will take precedence
		,0
		from vlsc_comp_wfta_org_servarea_year cwosy
			left join report_output ro on cwosy.wf_task_assignment_id = ro.entity_id
			left join a_report_output_definition rod on ro.definition_id = rod.report_output_definition_id
		where wf_task_id = 87
			and cwosy.wf_task_status_id = 2
			and ro.definition_id is null

declare @rowcount int, @new_id int

select @rowcount = count(*) from #ro

exec @new_id = spGETID_RANGE_SEL @table = 'REPORT_OUTPUT'
	,@count = @rowcount

update #ro
	set report_output_id = ident + @new_id

INSERT REPORT_OUTPUT
	(report_output_id
	,entity_id
	,definition_id
	,gen_request_date
	,status)
	SELECT report_output_id
		,entity_id
		,definition_id
		,gen_request_date
		,status
		FROM #ro

select * from #ro
drop table #ro

--For submitted renewal reviews, generate missing PDFs
create table #ro
	(ident int identity(0,1)
	,report_output_id int
	,entity_id int
	,definition_id int
	,gen_request_date datetime
	,status int)

insert #ro
	(entity_id
	,definition_id
	,gen_request_date
	,status)
	select cwosy.wf_task_assignment_id
		,59
		,dateadd(d, 1, getdate()) --add one day to current date so that requests submitted through UI will take precedence
		,0
		from vlsc_comp_wfta_org_servarea_year cwosy
			left join report_output ro on cwosy.wf_task_assignment_id = ro.entity_id
			left join a_report_output_definition rod on ro.definition_id = rod.report_output_definition_id
		where wf_task_id = 88
			and cwosy.wf_task_status_id = 2
			and ro.definition_id is null

declare @rowcount int, @new_id int

select @rowcount = count(*) from #ro

exec @new_id = spGETID_RANGE_SEL @table = 'REPORT_OUTPUT'
	,@count = @rowcount

update #ro
	set report_output_id = ident + @new_id

INSERT REPORT_OUTPUT
	(report_output_id
	,entity_id
	,definition_id
	,gen_request_date
	,status)
	SELECT report_output_id
		,entity_id
		,definition_id
		,gen_request_date
		,status
		FROM #ro

select * from #ro
drop table #ro
