/****** Object:  StoredProcedure [dbo].[spGRANTEE_PROFILE_STAFF_OVERVIEW]    Script Date: 05/26/2009 09:35:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spGRANTEE_PROFILE_STAFF_OVERVIEW]
	(@comp_year int,	--most recent application and review submission
	@report_year int)	--most recent GAR submission

AS

--Establish time period IDs based on year parameter
declare @curr_time_period_id int,
	@prev_time_period_id int

select @curr_time_period_id = id
	from c_time_period
	where sort_order = @comp_year

select @prev_time_period_id = id
	from c_time_period
	where sort_order = @comp_year - 1

--Create temp tables for grants and organizations
create table #grants
	(grantee_project_id int,
	organization_id int,
	app_wfta_id int,
	app_wf_task_id int,
	app_type varchar(1),
	rev_wfta_id int,
	rev_person_id int,
	current_lsc_funding money,
	serv_area_type_id int,
	last_year_comp int,
	poor_popul int)

create table #orgs
	(organization_id int,
	recipient_id int,
	organization_name varchar(250),
	common_organization_name varchar(250),
	reviewer_name varchar(200),
	current_lsc_funding_bf money default 0,
	current_lsc_funding_mw money default 0,
	current_lsc_funding_na money default 0,
	current_lsc_funding_total money default 0,
	last_year_comp int,
	score decimal(38,6),
	poor_popul int,
	curr_tig_year int,
	curr_tig_funding int default 0,
	curr_tig_recipient varchar(3),
	prior_tig_funding int default 0,
	prior_tig_recipient varchar(3),
	app_type char(1),
	non_lsc_funding money default 0,
	atty_count int, 
	non_atty_count int,
	total_staff_count int,
	last_oce_visit datetime,
	last_oce_visit_type varchar(100),
	last_opp_visit datetime,
	last_opp_visit_type varchar(100),
	next_oce_visit datetime,
	next_oce_visit_type varchar(100),
	next_opp_visit datetime,
	next_opp_visit_type varchar(100),
	next_visit_description varchar(200),
	office_count int,
	lrap_participant_pre_2009 varchar(3) default 'No',
	lrap_participant_2009 varchar(3) default 'No',
	mentor_participant varchar(20) default 'No',
	service_type varchar(50) default 'Full Service Program',
	compliance_issues varchar(100) default 'None identified by OCE.',
	special_grant_conditions varchar(3) default 'No',
	rural_urban_mixed varchar(10),
	exec_dir varchar(100),
	exec_dir_from_staffing varchar(100),
	exec_dir_years int,
	board_chair varchar(100),
	city varchar(50),
	state varchar(2),
	pai_resolution_passed varchar(3),
	service_areas varchar(500),
	comp_year int,
	report_year int)

--Initial insert of grants information
insert #grants
	(grantee_project_id,
	organization_id,
	app_wfta_id,
	app_wf_task_id,
	app_type,
	current_lsc_funding,
	serv_area_type_id,
	poor_popul)
	select gp.grantee_project_id,
		o.organization_id,
		wfta_app.wf_task_assignment_id,
		wfta_app.wf_task_id,
		case wfta_app.wf_task_id when 2 then 'C' when 4 then 'R' end,
		a.amount,
		sa.service_area_type_id,
		sa.poor_popul
		from [lsc-sql].rindb.dbo.AWARD a
			JOIN ORGANIZATION o ON a.org_id = o.legacy_organization_id
			JOIN a_COMPETITION c ON a.serv_area_id = c.abbr
			JOIN a_WF_PROJECT wfp ON c.id = wfp.competition_id
			left join grantee_project gp on wfp.id = gp.wf_project_id
			JOIN wf_task_assignment wfta_app ON gp.grantee_project_id = wfta_app.grantee_project_id
			left join vWFTA_COMPETITION_YEAR wcy on wfta_app.wf_task_assignment_id = wcy.wf_task_assignment_id
			left join lsc_a_service_area sa on c.id = sa.competition_id
		WHERE a.year = @comp_year
			and wfta_app.wf_task_id in (2,4)
			and wfta_app.wf_task_status_id = 2
			and wcy.wfta_year = @comp_year

--Initial insert of org information
insert #orgs
	(organization_id,
	poor_popul,
	comp_year,
	report_year)
	select organization_id,
		sum(poor_popul),
		@comp_year,
		@report_year
		from #grants
		group by organization_id

--Set additional org information based on ID
update #orgs
	set recipient_id = o.legacy_organization_id
	from #orgs
		join organization o on #orgs.organization_id = o.organization_id


update #orgs
	set organization_name = r.r_legalname,
		common_organization_name = r.r_shortname
	from #orgs o
		join [lsc-sql].rindb.dbo.rmaster r on o.recipient_id = r.org_id


--Determine competitive application reviewers
update #grants
	set rev_wfta_id = wfta.wf_task_assignment_id,
		rev_person_id = wfta.person_id
	from #grants g
		join wf_task_assignment wfta on g.grantee_project_id = wfta.grantee_project_id
			and wfta.wf_task_id = 5

--Set reviewer for all renewal applications to Reggie Haley
update #grants
	set rev_wfta_id = wfta.wf_task_assignment_id,
		rev_person_id = 2 --Reggie Haley per Reggie's e-mail to Peter Larsen 7/23/2008
	from #grants g
		join wf_task_assignment wfta on g.grantee_project_id = wfta.grantee_project_id
			and wfta.wf_task_id = 6

--Set reviewer name per org (note - may give anomalous results if there is more than one reviewer for different submissions by an organization)
update #orgs
	set reviewer_name = p.name_first + ' ' + p.name_last
	from #orgs o 
		join #grants g on o.organization_id = g.organization_id
		join person p on g.rev_person_id = p.person_id

update #orgs
	set reviewer_name = 'Reggie Haley and Program Counsel Assigned'
	where reviewer_name = 'Reggie Haley';


--Get previous year funding figures from LSC_GRANTS table
/*update #grants
	set current_lsc_funding = la.award_amount
	from #grants g
		join grantee_project gp_curr on g.grantee_project_id = gp_curr.grantee_project_id
		join a_wf_project wfp_curr on gp_curr.wf_project_id = wfp_curr.id
		join a_competition c on wfp_curr.competition_id = c.id
		join a_wf_project wfp_prev on c.id = wfp_prev.competition_id
		join grantee_project gp_prev on wfp_prev.id = gp_prev.wf_project_id
		join lsc_award la on gp_prev.grantee_project_id = la.grantee_project_id
			and la.time_period_id = @prev_time_period_id;*/

--Update orgs table with basic field funding, ...
with bf (organization_id, funding)
as
(select organization_id,
	sum(current_lsc_funding) funding
	from #grants
	where serv_area_type_id = 1
	group by organization_id)

update #orgs
	set current_lsc_funding_bf = bf.funding
	from bf
		join #orgs o on bf.organization_id = o.organization_id;

--migrant worker funding, ...
with m (organization_id, funding)
as
(select organization_id,
	sum(current_lsc_funding) funding
	from #grants
	where serv_area_type_id = 2
	group by organization_id)

update #orgs
	set current_lsc_funding_mw = m.funding
	from m
		join #orgs o on m.organization_id = o.organization_id;

--and Native American funding.
with na (organization_id, funding)
as
(select organization_id,
	sum(current_lsc_funding) funding
	from #grants
	where serv_area_type_id = 3
	group by organization_id)

update #orgs
	set current_lsc_funding_na = na.funding
	from na
		join #orgs o on na.organization_id = o.organization_id

update #orgs
	set current_lsc_funding_total = current_lsc_funding_bf + current_lsc_funding_mw + current_lsc_funding_na

--Last year in competition
update #grants
	set last_year_comp = sa.year_curr_comp
	from #grants g
		join grantee_project gp on g.grantee_project_id = gp.grantee_project_id
		join a_wf_project wfp on gp.wf_project_id = wfp.id
		join a_competition c on wfp.competition_id = c.id
		join [lsc-sql].rindb.dbo.SERVAREA sa on c.abbr = sa.serv_area_id;

----For competitive applications, find the most recent previous grantee project for the same service area and organization.
/*with lastcomp (grantee_project_id, last_year_comp)
as
(select g.grantee_project_id,
	max(tp.sort_order) last_year_comp
	from #grants g
		join grantee_project gp_curr on g.grantee_project_id = gp_curr.grantee_project_id
		join a_wf_project wfp_curr on gp_curr.wf_project_id = wfp_curr.id
		join a_competition c on wfp_curr.competition_id = c.id
		join a_wf_project wfp_prev on c.id = wfp_prev.competition_id
			and wfp_prev.time_period_id <> 4
		join grantee_project gp_prev on wfp_prev.id = gp_prev.wf_project_id
			and gp_prev.primary_organization_id = g.organization_id
		join c_time_period tp on wfp_prev.time_period_id = tp.id
	where g.last_year_comp is null
	group by g.grantee_project_id)

update #grants
	set last_year_comp = lastcomp.last_year_comp
	from #grants g
		join lastcomp on g.grantee_project_id = lastcomp.grantee_project_id;
*/
----Group by organization and use most recent to update organizations table.
with lastcomp(organization_id, last_year_comp)
as
(select organization_id,
	max(last_year_comp)
	from #grants
	group by organization_id)

update #orgs
	set last_year_comp = lastcomp.last_year_comp
	from #orgs o
		join lastcomp on o.organization_id = lastcomp.organization_id

--Where there is more than one service area, set the score from the basic field service area
--NOTE: this query assumes only one basic field service area per organization.
update #orgs
	set score = rts.total_score
	from #orgs o
	join #grants g on o.organization_id = g.organization_id
	join dbo.vREVIEW_TOTAL_SCORE rts on g.rev_wfta_id = rts.review_wfta_id
	where g.serv_area_type_id = 1

--Set scores for organizations without basic field service areas
--NOTE: this query assumes only one non-basic field service area per organization.
update #orgs
	set score = rts.total_score
	from #orgs o
	join #grants g on o.organization_id = g.organization_id
	join dbo.vREVIEW_TOTAL_SCORE rts on g.rev_wfta_id = rts.review_wfta_id
	where g.serv_area_type_id <> 1
		and o.score is null;

--Determine most recent year for which TIG funding data exists
declare @curr_tig_year int

select @curr_tig_year = max(Year)
	from [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.TIG_FUNDING_BY_PROGRAM_BY_YEAR

--Current TIG funding by organization
if @curr_tig_year is not null
begin
	update #orgs
		set curr_tig_year = @curr_tig_year

	update #orgs
		set curr_tig_funding = tfpy.AwardAmount
		from #orgs o
			join [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.TIG_FUNDING_BY_PROGRAM_BY_YEAR tfpy ON o.recipient_id = tfpy.GranteeNo
		where tfpy.year = @curr_tig_year

	update #orgs
		set curr_tig_recipient = case when curr_tig_funding  = 0 then 'No' else 'Yes' end;

	--Total TIG funding by organization
	with tfp (GranteeNo, prior_tig_funding)
		as (select GranteeNo, sum(AwardAmount) prior_tig_funding
			from [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.TIG_FUNDING_BY_PROGRAM_BY_YEAR
				where Year <> @curr_tig_year
			group by GranteeNo)

		update #orgs
			set prior_tig_funding = tfp.prior_tig_funding
			from #orgs o
				join tfp on o.recipient_id = tfp.GranteeNo

	update #orgs
		set prior_tig_recipient = case when prior_tig_funding = 0 then 'No' else 'Yes' end

end; --if @curr_tig_year is not null

--Competitive or renewal application
----If there is at least one competitive application for this year, mark the organization as 'C'...
update #orgs
	set app_type = 'C'
	from #orgs o
		join #grants g on o.organization_id = g.organization_id
	where g.app_type = 'C'

----.... If not, mark it as 'R'.
update #orgs
	set app_type = 'R'
	where app_type is null;

--Non-LSC funding
with nlf(orgid, non_lsc_funding)
as
(select r.orgid, 
	sum(r.Title_XX_SSI +
		r.Older_Amr_Care +
		r.Violence_Women +
		r.Other_Federal +
		r.Block_Grants +
		r.State_Grants +
		r.Local_Grants +
		r.United_Way +
		r.Fndtion_Grants +
		r.Bar_Grants +
		r.IOLTA +
		r.Fee_Awards +
		r.Cry_Ovr_Funds +
		r.Publication +
		r.Ot_Funds_Amt) non_lsc_total
	from [lsc-sql].rindb.dbo.tbl_revenue r
	where r.yearid = @report_year
		and r.record_type = 'a'
	group by r.orgid)

update #orgs
	set non_lsc_funding = nlf.non_lsc_funding
	from nlf
		join #orgs o on nlf.orgid = o.recipient_id;

--Staffing ("Other" counts may differ from grantee profile because they include IT workers.)
with staff(orgid, atty_count, non_atty_count)
as 
(select orgid,
	sum(case when attorney = 'y' then 1 else 0 end) atty_count,
	sum(case when job_code = '13' then 1 else 0 end) +
		sum(case when Job_Code > '15' or (Job_Code = '15' and Attorney = 'N') or (Job_Code = '14' and Attorney = 'N') or (Job_Code < '05' and Attorney = 'N')  then 1 else 0 end) non_atty_count
	from [lsc-sql].rindb.dbo.tbl_staffdetail
	where yearid = @report_year
		and Termination is Null 
		and Annl_Salary>10000 
		and Off_Type <> 'S'
		and Pct_Work_Week > 49
	group by orgid)

update #orgs
	set atty_count = staff.atty_count,
		non_atty_count = staff.non_atty_count
	from #orgs o
		join staff on o.recipient_id = staff.orgid;

update #orgs
	set total_staff_count = atty_count + non_atty_count;

--OCE site visits
with ocev(recipient_id, visit_start)
as
	(select recipient_id,
		max(visit_start)
		from [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.oce_program_visit
		where visit_start < getdate()
		group by recipient_id)

update #orgs
	set last_oce_visit = visit_start
	from ocev
		join #orgs o on ocev.recipient_id = o.recipient_id;

update #orgs
	set last_oce_visit_type = type_of_visit
		from #orgs o
			join [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.oce_program_visit opv on o.recipient_id = opv.recipient_id
				and o.last_oce_visit = opv.visit_start

update #orgs
	set next_oce_visit = visit_start
		from [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.oce_program_visit opv
			join #orgs o on opv.recipient_id = o.recipient_id
		where opv.visit_start >= getdate();

update #orgs
	set next_oce_visit_type = type_of_visit
		from #orgs o
			join [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.oce_program_visit opv on o.recipient_id = opv.recipient_id
				and o.next_oce_visit = opv.visit_start

update #orgs
	set next_visit_description = '; OCE visit planned for ' + cast(datepart(yy, next_oce_visit) as varchar(4))
	where next_oce_visit is not null;

--OPP site visits
with oppv(recipient_id, visit_date)
as
	(select recipient_id,
		max(visit_date)
		from [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.opp_program_visit
		where visit_date < getdate()
		group by recipient_id)

update #orgs
	set last_opp_visit = visit_date
	from oppv
		join #orgs o on oppv.recipient_id = o.recipient_id;

update #orgs
	set last_opp_visit_type = opv.purpose
		from #orgs o
			join [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.opp_program_visit opv on o.recipient_id = opv.recipient_id
				and o.last_opp_visit = opv.visit_date

update #orgs
	set next_opp_visit = visit_date
		from [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.opp_program_visit opv
			join #orgs o on opv.recipient_id = o.recipient_id
		where opv.visit_date >= getdate();

update #orgs
	set next_opp_visit_type = opv.purpose
		from #orgs o
			join [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.opp_program_visit opv on o.recipient_id = opv.recipient_id
				and o.next_opp_visit = opv.visit_date

update #orgs
	set next_visit_description = 
		isnull(next_visit_description, '') + '; OPP visit planned for ' + cast(datepart(yy, next_opp_visit) as varchar(4))
	where next_opp_visit is not null;

--Office counts
with offcount(org_id, offs)
as
	(select org_id, count(*)
		from [lsc-sql].rindb.dbo.offices
		where off_type <> 'S'
			and year = @report_year
		group by org_id)

update #orgs
	set office_count = offs
	from offcount oc
		join #orgs o on oc.org_id = o.recipient_id

--LRAP participation
update #orgs
	set lrap_participant_pre_2009 = 'Yes'
	from #orgs o
		join [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.LRAP_RECIPIENT lr ON o.recipient_id = lr.recipient_id
			and lr.year is null

update #orgs
	set lrap_participant_2009 = 'Yes'
	from #orgs o
		join [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.LRAP_RECIPIENT lr ON o.recipient_id = lr.recipient_id
			and lr.year = 2009

--Participation in leadership/mentoring program
update #orgs
	set mentor_participant = 'Yes - Mentor'
	from #orgs o
		join [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.MENTOR_PARTICIPANT mp ON o.recipient_id = mp.recipient_id
			and mp.role = 'M'

update #orgs
	set mentor_participant = 'Yes - Protege'
	from #orgs o
		join [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.MENTOR_PARTICIPANT mp ON o.recipient_id = mp.recipient_id
			and mp.role = 'P'

--Service type (full/limited)
update #orgs
	set service_type = 'Limited Service Program'
	where recipient_id in (447105, 146010, 107000, 122087, 130010, 122007, 122107)

--Special grant conditions
update #orgs
	set special_grant_conditions = 'Yes'
	from #orgs o
		join [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.SPECIAL_GRANT_CONDITION sgc ON o.recipient_id = sgc.recipient_id

--Rural/urban/mixed
update #orgs
	set rural_urban_mixed = 
		case when ru.rural_urban_mixed = 'r' then 'Rural'
			when ru.rural_urban_mixed = 'u' then 'Urban'
			when ru.rural_urban_mixed = 'm' then 'Mixed' end
	from #orgs o
		join [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.RURAL_URBAN ru ON o.recipient_id = ru.recipient_id

--Executive director
/*	2007 data includes many instances of multiple staff designated with job code 01 - Executive Director
	The following two queries are an attempt to circumvent this data problem.
	Would have gotten data from RMASTER, but this table does not include years of experience and does not provide a way to join
	back to the staff table.*/

----Get executive director from main office
update #orgs
	set exec_dir_from_staffing = sd.S_Name,
		exec_dir_years = yrs_exp_curr
	from #orgs o
		join [lsc-sql].rindb.dbo.tbl_staffdetail sd on o.recipient_id = sd.orgid
	where sd.yearid = @report_year
		and sd.job_code = 01
		and sd.off_type = 'M'

----If no executive director at main office, get from branch office
update #orgs
	set exec_dir_from_staffing = sd.S_Name,
		exec_dir_years = yrs_exp_curr
	from #orgs o
		join [lsc-sql].rindb.dbo.tbl_staffdetail sd on o.recipient_id = sd.orgid
	where sd.yearid = @report_year
		and sd.job_code = 01
		and sd.off_type = 'B'
		and o.exec_dir is null

--Get executive director name from rmaster (guaranteed to be most accurate, but can't be associated with years of service)
update #orgs
	set exec_dir = r.exec_dir
	from #orgs o
		join [lsc-sql].rindb.dbo.rmaster r on o.recipient_id = r.org_id


--City and state
update #orgs
	set board_chair = r.chair,
		city = r.City_Off, 
		[state] = r.State_Off,
		service_areas = r.Service_Areas
	from #orgs o
		join [lsc-sql].rindb.dbo.rmaster r on o.recipient_id = r.org_id

--PAI board resolution
update #orgs
	set pai_resolution_passed = 'No'

update #orgs
	set pai_resolution_passed = 'Yes'
	from #orgs o
		join [LSC-EGSQL].GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.pai_board_resolution pbr ON o.organization_id = pbr.organization_id
	where pbr.date_adopted is not null

--Create table columns for review comments
declare @comment_col varchar(50)
declare @sql varchar(max)

declare comment_cols cursor for 
	select '[comment_pa' + cast(pa.sort_order as varchar(1)) + 
			'_c' + c.abbr + ']' comment_col
		from lsc_a_review_performance_area pa 
			join lsc_a_review_criterion c on pa.id = c.lsc_review_performance_area_id
		where pa.time_period_id = @curr_time_period_id

open comment_cols
fetch next from comment_cols into @comment_col
WHILE (@@FETCH_STATUS=0)
begin
	set @sql = 'alter table #orgs add ' + @comment_col + ' varchar(max) null'
	exec(@sql)
	fetch next from comment_cols into @comment_col
end

close comment_cols
deallocate comment_cols


--Gather review comments
declare @legacy_organization_id int
declare @comment varchar(max)
declare @curr_comment varchar(max)

declare comments cursor for 
	select o.legacy_organization_id,
		'[comment_pa' + cast(pa.sort_order as varchar(1)) + 
			'_c' + c.abbr + ']' comment_col,
		rai.comment
		from lsc_review_assignment_inquiry rai
			join wf_task_assignment wfta on rai.wf_task_assignment_id = wfta.wf_task_assignment_id
			join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
			join organization o on gp.primary_organization_id = o.organization_id
			join lsc_a_review_inquiry i on rai.lsc_review_inquiry_id = i.id
			join lsc_a_review_criterion c on i.lsc_review_criterion_id = c.id
			join lsc_a_review_performance_area pa on c.lsc_review_performance_area_id = pa.id
			join vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		where rtrim(ltrim(isnull(comment, ''))) <> ''
			and wcy.wfta_year = @comp_year
		order by pa.sort_order,
			c.abbr,
			i.sort_order

open comments
fetch next from comments into @legacy_organization_id, @comment_col, @comment
WHILE (@@FETCH_STATUS=0)
begin 

	set @sql = 'update #orgs set ' + @comment_col + ' = isnull(' + @comment_col + ', '''') + ''' +  replace(@comment, '''', '''''') + ''' where recipient_id = ' + cast(@legacy_organization_id as varchar(6))
	print @sql
	exec(@sql)
	fetch next from comments into @legacy_organization_id, @comment_col, @comment
end

close comments
deallocate comments


select * from #orgs
	order by organization_name