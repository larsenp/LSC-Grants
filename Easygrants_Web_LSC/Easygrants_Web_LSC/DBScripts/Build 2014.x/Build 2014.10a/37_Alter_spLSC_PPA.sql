ALTER PROCEDURE [dbo].[spLSC_PPA]
	(@comp_year int,	--most recent application and review submission
	@report_year int,	--most recent GAR submission
	@award_year int)	--year for which awards were most recently made

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
	app_type varchar(2),
	rev_wfta_id int,
	rev_person_id int,
	current_lsc_funding money,
	serv_area varchar(6),
	serv_area_description varchar(20),
	serv_type varchar(2),
	last_year_comp int,
    next_year_comp_renew int,
	poor_popul int)

--Initial insert of grants information
insert #grants
	(grantee_project_id,
	organization_id,
	app_wfta_id,
	app_wf_task_id,
	app_type,
	current_lsc_funding,
	serv_area,
	serv_area_description,
	serv_type,
	poor_popul)
	select gp.grantee_project_id,
		o.organization_id,
		wfta_app.wf_task_assignment_id,
		wfta_app.wf_task_id,
		case wfta_app.wf_task_id when 2 then 'C' when 66 then 'PC' when 4 then 'R' when 67 then 'PR' end,
		a.amount,
		c.abbr,
		c.abbr,
		sa.serv_type,
		sa.poor_popul
		from wf_task_assignment wfta_app 
			JOIN grantee_project gp ON wfta_app.grantee_project_id = gp.grantee_project_id
			JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
			JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
			JOIN a_COMPETITION c ON wfp.competition_id = c.id
			left join vWFTA_COMPETITION_YEAR wcy on wfta_app.wf_task_assignment_id = wcy.wf_task_assignment_id
			left join [lsc-sql].rindb.dbo.SERVAREA sa on c.abbr = sa.serv_area_id
			left join [lsc-sql].rindb.dbo.AWARD a on c.abbr = a.serv_area_id
				and o.legacy_organization_id = a.org_id
				and a.year = @award_year
		WHERE wfta_app.wf_task_id in (2,4, 66, 67)
			and wfta_app.wf_task_status_id = 2
			and wcy.wfta_year = @comp_year


--Initial insert of org information
--TRUNCATE TABLE GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
DELETE GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE

insert GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	(organization_id,
	poor_popul,
	comp_year,
	report_year,
	award_year)
	select organization_id,
		sum(poor_popul),
		@comp_year,
		@report_year,
		@award_year
		from #grants
		group by organization_id

--Set additional org information based on ID
update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set recipient_id = o.legacy_organization_id
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
		join organization o on pp.organization_id = o.organization_id


update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set organization_name = r.r_legalname,
		common_organization_name = r.r_shortname
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join [lsc-sql].rindb.dbo.rmaster r on o.recipient_id = r.org_id

--For new orgs not yet in RINDB, populate organization_name from ORGANIZATION
update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set organization_name = org.organization_name
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join organization org on o.organization_id = org.organization_id
	where o.organization_name is null


--Determine competitive application reviewers
update #grants
	set rev_wfta_id = wfta.wf_task_assignment_id,
		rev_person_id = wfta.person_id
	from #grants g
		join wf_task_assignment wfta on g.grantee_project_id = wfta.grantee_project_id and wfta.wf_task_id in (5, 68)
        join vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy on wfta.wf_task_assignment_id = cwosy.wf_task_assignment_id
	where cwosy.wfta_year = @comp_year

--Set reviewer for all renewal applications to Reggie Haley
update #grants
	set rev_wfta_id = wfta.wf_task_assignment_id,
		rev_person_id = 2 --Reggie Haley per Reggie's e-mail to Peter Larsen 7/23/2008
	from #grants g
		join wf_task_assignment wfta on g.grantee_project_id = wfta.grantee_project_id and wfta.wf_task_id in (6, 69)
        join vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy on wfta.wf_task_assignment_id = cwosy.wf_task_assignment_id
    where cwosy.wfta_year = @comp_year

--Set reviewer name per org (note - may give anomalous results if there is more than one reviewer for different submissions by an organization)
update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set reviewer_name = p.name_last
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o 
		join #grants g on o.organization_id = g.organization_id
		join person p on g.rev_person_id = p.person_id

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set reviewer_name = 'Haley and Counsel Assigned'
	where reviewer_name = 'Haley';


--Update orgs table with basic field funding, ...
with bf (organization_id, funding)
as
(select organization_id,
	sum(current_lsc_funding) funding
	from #grants
	where serv_type = 'BF'
	group by organization_id)

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set current_lsc_funding_bf = bf.funding
	from bf
		join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o on bf.organization_id = o.organization_id;

--migrant worker funding, ...
with m (organization_id, funding)
as
(select organization_id,
	sum(current_lsc_funding) funding
	from #grants
	where serv_type = 'MW'
	group by organization_id)

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set current_lsc_funding_mw = m.funding
	from m
		join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o on m.organization_id = o.organization_id;

--and Native American funding.
with na (organization_id, funding)
as
(select organization_id,
	sum(current_lsc_funding) funding
	from #grants
	where serv_type = 'NA'
	group by organization_id)

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set current_lsc_funding_na = na.funding
	from na
		join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o on na.organization_id = o.organization_id

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set current_lsc_funding_total = current_lsc_funding_bf + current_lsc_funding_mw + current_lsc_funding_na

--Last year in competition
update #grants
	set last_year_comp = sa.year_curr_comp
	from #grants g
		join grantee_project gp on g.grantee_project_id = gp.grantee_project_id
		join a_wf_project wfp on gp.wf_project_id = wfp.id
		join a_competition c on wfp.competition_id = c.id
		join [lsc-sql].rindb.dbo.SERVAREA sa on c.abbr = sa.serv_area_id;


----Group by organization and use most recent to update organizations table.
with lastcomp(organization_id, last_year_comp)
as
(select organization_id,
	max(last_year_comp)
	from #grants
	group by organization_id)

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set last_year_comp = lastcomp.last_year_comp
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join lastcomp on o.organization_id = lastcomp.organization_id


--Where there is more than one service area, set the score from the basic field service area
--NOTE: this query assumes only one basic field service area per organization.
update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set score = v.total_score
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
	join #grants g on o.organization_id = g.organization_id
	--join dbo.vREVIEW_TOTAL_SCORE rts on g.rev_wfta_id = rts.review_wfta_id
    join vLSC_REVIEW_TOTAL_SCORE_TRADnPQV v ON g.rev_wfta_id = v.wf_task_assignment_id
	where g.serv_type = 'BF'


--Set scores for organizations without basic field service areas
--NOTE: this query assumes only one non-basic field service area per organization.
update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set score = v.total_score
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
	join #grants g on o.organization_id = g.organization_id
	--join dbo.vREVIEW_TOTAL_SCORE rts on g.rev_wfta_id = rts.review_wfta_id
    join vLSC_REVIEW_TOTAL_SCORE_TRADnPQV v ON g.rev_wfta_id = v.wf_task_assignment_id
	where g.serv_type <> 'BF'
		and o.score is null;

--Determine most recent year for which TIG funding data exists
declare @curr_tig_year int

select @curr_tig_year = max(Year)
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.TIG_FUNDING_BY_PROGRAM_BY_YEAR

--Current TIG funding by organization
if @curr_tig_year is not null
begin
	update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
		set curr_tig_year = @curr_tig_year

	update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
		set curr_tig_funding = tfpy.AwardAmount
		from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
			join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.TIG_FUNDING_BY_PROGRAM_BY_YEAR tfpy ON o.recipient_id = tfpy.GranteeNo
		where tfpy.year = @curr_tig_year

	update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
		set curr_tig_recipient = case when curr_tig_funding  = 0 then 'No' else 'Yes' end;

	--Total TIG funding by organization
	with tfp (GranteeNo, prior_tig_funding)
		as (select GranteeNo, sum(AwardAmount) prior_tig_funding
			from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.TIG_FUNDING_BY_PROGRAM_BY_YEAR
				where Year <> @curr_tig_year
			group by GranteeNo)

		update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
			set prior_tig_funding = tfp.prior_tig_funding
			from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
				join tfp on o.recipient_id = tfp.GranteeNo

	update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
		set prior_tig_recipient = case when prior_tig_funding = 0 then 'No' else 'Yes' end

end; --if @curr_tig_year is not null



Update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
Set Tig_grantee_status =
         Case When t.Tig_grantee_status = 'CG' then 'Current Grantee'
              When t.Tig_grantee_status = 'FG' then 'Former Grantee'   
              Else 'Never TIG Grantee' end
 from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o 
 JOIN GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.TIG_Data_2009 t ON o.recipient_id = t.Applicant_no


Update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
Set good_standing =
        Case when (t.In_Good_Standing = '1' and t.Has_Issues is null)     then 'Yes' 
            When  (t.In_Good_Standing = '1' and t.Has_Issues is not null) then 'No'
			When  (o.Tig_grantee_status = 'Never TIG Grantee') then 'N/A'
            Else 'No' end
from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o 
 JOIN GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.TIG_Data_2009 t ON o.recipient_id = t.Applicant_no

----Active TIG With Yes or NO: edited on 10/07/09

Update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
Set Active_TIG = tg.Active_TIG
From GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE p
   LEFT JOIN GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.TIG_Grantees tg ON tg.Applicant_No = p.recipient_id

--Competitive or renewal application
----If there is at least one competitive application for this year, mark the organization as 'C'...
update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set app_type = 'Competition'
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join #grants g on o.organization_id = g.organization_id
	where g.app_type = 'C'

--Mark as PPQV Competition  
update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set app_type = 'Post-PQV competition'
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join #grants g on o.organization_id = g.organization_id
	where g.app_type = 'PC'

----Mark as Renewal 
update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set app_type = 'Renewal'
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join #grants g on o.organization_id = g.organization_id
	where g.app_type = 'R'

---Mark as PPQV Renewal  
update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set app_type = 'Post-PQV Renewal'
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o

		join #grants g on o.organization_id = g.organization_id
	where g.app_type = 'PR' 

--Non-LSC funding
;with nlf(orgid, non_lsc_funding)
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
		--r.Cry_Ovr_Funds +   'Excluded as per 2014 PPA requests Email on 6/19/2013
		r.Publication +
		r.Ot_Funds_Amt +
		r.Filing_Fees +
        r.Spec_State_Grants_Contracts +
        r.Corp_Indiv_Contributions +
        r.Cy_Pres_Awards) non_lsc_total
	from [lsc-sql].rindb.dbo.tbl_revenue r
	where r.yearid = @report_year
		and r.record_type = 'a'
	group by r.orgid)

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set non_lsc_funding = nlf.non_lsc_funding
	from nlf
		join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o on nlf.orgid = o.recipient_id;


--Client Service Income --added on 11/3/2010

with csi(orgid, client_service)
as
(select r.orgid, 
		sum(r.Client_Fees +
            r.For_Profit_Inc) Client_Serv_Income
	from [lsc-sql].rindb.dbo.tbl_revenue r
	where r.yearid = @report_year
		and r.record_type = 'a'
	group by r.orgid)

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set client_service_income = csi.client_service
    from csi
		join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o on csi.orgid = o.recipient_id;

--NonLSC_ClientService [Non-LSC funding + Client Service Income( B+C )] --added on 11/3/2010

Update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
  set NonLSC_ClientService = non_lsc_funding + client_service_income;

--Staffing ("Other" counts may differ from grantee profile because they include IT workers.)

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set atty_count = j.attorneys,
		non_atty_count = j.paralegals + j.other,
		total_staff_count = j.total
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join [LSC-SQL].RINDB.dbo.vStaff_Job_Classifications_Org_Year j on o.recipient_id = j.orgid
	where j.yearid = @report_year;

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set atty_fte = f.attorney_fte,
		non_atty_fte = f.paralegal_fte + f.other_fte,
		total_staff_fte = f.fte
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join [LSC-SQL].RINDB.dbo.vStaff_Job_Classifications_fte_Org_Year f on o.recipient_id = f.orgid
	where f.yearid = @report_year;

--OCE site visits
with ocev(recipient_id, visit_start)
as
	(select recipient_id,
		max(visit_start)
		from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.oce_program_visit
		where visit_start < getdate()
		group by recipient_id)

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set last_oce_visit = visit_start
	from ocev
		join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o on ocev.recipient_id = o.recipient_id;

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set last_oce_visit_type = type_of_visit
		from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
			join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.oce_program_visit opv on o.recipient_id = opv.recipient_id
				and o.last_oce_visit = opv.visit_start

;with ocev(recipient_id, visit_start)
as
	(select recipient_id,
		max(visit_start)
		from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.oce_program_visit
		where visit_start < getdate()
			and type_of_visit like '%CSR/CMS%'
		group by recipient_id)

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set last_cms_csr_visit = visit_start
	from ocev
		join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o on ocev.recipient_id = o.recipient_id;

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set next_oce_visit = visit_start
		from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.oce_program_visit opv
			join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o on opv.recipient_id = o.recipient_id
		where opv.visit_start >= getdate();

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set next_oce_visit_type = type_of_visit
		from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
			join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.oce_program_visit opv on o.recipient_id = opv.recipient_id
				and o.next_oce_visit = opv.visit_start

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set next_visit_description = '; OCE visit planned for ' + cast(datepart(yy, next_oce_visit) as varchar(4))
	where next_oce_visit is not null;

--OPP site visits
with oppv(recipient_id, visit_date)
as
	(select recipient_id,
		max(visit_date)
		from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.opp_program_visit
		where visit_date < getdate()
		group by recipient_id)

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set last_opp_visit = visit_date
	from oppv
		join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o on oppv.recipient_id = o.recipient_id;

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set last_opp_visit_type = 
     (Case when opv.notes is not null then opv.purpose +' (' + opv.notes + ')' else opv.purpose end )
		from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
			join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.opp_program_visit opv on o.recipient_id = opv.recipient_id
				and o.last_opp_visit = opv.visit_date

;with oppv(recipient_id, visit_date)
as
	(select recipient_id,
		max(visit_date)
		from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.opp_program_visit
		where visit_date < getdate()
			and purpose = 'Program Quality'
		group by recipient_id)

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set last_quality_visit = visit_date
	from oppv
		join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o on oppv.recipient_id = o.recipient_id;

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set next_opp_visit = visit_date
		from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.opp_program_visit opv
			join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o on opv.recipient_id = o.recipient_id
		where opv.visit_date >= getdate();

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set next_opp_visit_type = opv.purpose
		from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
			join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.opp_program_visit opv on o.recipient_id = opv.recipient_id
				and o.next_opp_visit = opv.visit_date

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
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
			and close_date is null
		group by org_id)

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set office_count = offs
	from offcount oc
		join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o on oc.org_id = o.recipient_id



--Participation in leadership/mentoring program
update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set mentor_participant = 'Yes - Mentor'
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.MENTOR_PARTICIPANT mp ON o.recipient_id = mp.recipient_id
			and mp.role = 'M'

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set mentor_participant = 'Yes - Protege'
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.MENTOR_PARTICIPANT mp ON o.recipient_id = mp.recipient_id
			and mp.role = 'P'

--Service type (full/limited)
update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set service_type = 'Limited Service Program'
	where recipient_id in (146010, 107000, 122087, 130010, 122107)

--Special grant conditions 

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set special_grant_conditions = 
       (Case when sgc.notes is not null then 'Yes(' + sgc.notes + ')' else 'Yes' end )
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.SPECIAL_GRANT_CONDITION sgc ON o.recipient_id = sgc.recipient_id
	where sgc.year = @comp_year - 1



--Rural/urban/mixed
update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set rural_urban_mixed = 
		case when ru.rural_urban_mixed = 'r' then 'Rural'
			when ru.rural_urban_mixed = 'u' then 'Urban'
			when ru.rural_urban_mixed = 'm' then 'Mixed' end
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.RURAL_URBAN ru ON o.recipient_id = ru.recipient_id

--Executive director
/*	2007 data includes many instances of multiple staff designated with job code 01 - Executive Director
	The following two queries are an attempt to circumvent this data problem.
	Would have gotten data from RMASTER, but this table does not include years of experience and does not provide a way to join
	back to the staff table.*/

----Get executive director from main office
update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set exec_dir_from_staffing = sd.S_Name,
		exec_dir_years = yrs_exp_curr
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join [lsc-sql].rindb.dbo.tbl_staffdetail sd on o.recipient_id = sd.orgid
	where sd.yearid = @report_year
		and sd.job_code = 01
		and sd.off_type = 'M'

----If no executive director at main office, get from branch office
update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set exec_dir_from_staffing = sd.S_Name,
		exec_dir_years = yrs_exp_curr
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join [lsc-sql].rindb.dbo.tbl_staffdetail sd on o.recipient_id = sd.orgid
	where sd.yearid = @report_year
		and sd.job_code = 01
		and sd.off_type = 'B'
		and o.exec_dir_from_staffing is null

--Get executive director name from rmaster (guaranteed to be most accurate, but can't be associated with years of service)
update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set exec_dir = r.exec_dir
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join [lsc-sql].rindb.dbo.rmaster r on o.recipient_id = r.org_id


--City and state
update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set board_chair = r.chair,
		city = r.City_Off, 
		[state] = r.State_Off
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join [lsc-sql].rindb.dbo.rmaster r on o.recipient_id = r.org_id

--PAI board resolution
update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set pai_resolution_passed = 'No'

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set pai_resolution_passed = 'Yes'
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.pai_board_resolution pbr ON o.organization_id = pbr.organization_id
	where pbr.date_adopted is not null

--PAI Advisory Committee
update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set pai_advisory_committee = 'No'

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set pai_advisory_committee = 'Yes'
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PAI_ADVISORY_COMMITTEE pac ON o.organization_id = pac.organization_id

--Fiscal Advisory Group
update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set fiscal_advisory_group = 'No'

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set fiscal_advisory_group = 'Yes'
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.FISCAL_ADVISORY_GROUP fa ON o.organization_id = fa.organization_id

--Justice Gap Advisory Committee
update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set justice_gap_advisory_committee = 'No'

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set justice_gap_advisory_committee = 'Yes'
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.JUSTICE_GAP_ADVISORY_GROUP jgag ON o.recipient_id = jgag.org_id

--Update #grants.service_area with statewide indicator
update #grants
	set serv_area_description = g.serv_area + ' (Statewide)'
	from #grants g 
		join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.SERV_AREA_STATEWIDE sas on g.serv_area = sas.serv_area

--Populate service areas column
declare @organization_id int, @serv_area varchar(20)
declare servareas cursor for 
	select organization_id, serv_area_description
		from #grants
open servareas
fetch next from servareas into @organization_id, @serv_area
WHILE (@@FETCH_STATUS=0)
begin
	update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
		set service_areas = case
			when service_areas = '' then @serv_area
			else service_areas + ', ' + @serv_area end
		where organization_id = @organization_id

	fetch next from servareas into @organization_id, @serv_area
end
close servareas
deallocate servareas

--Create table for review comments
CREATE TABLE #comments
	(organization_id int,
	pa_num int,
	comments varchar(max))

insert #comments
	(organization_id,
	pa_num)
	select o.organization_id,
		pa.sort_order
	from lsc_a_review_performance_area pa
		cross join GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
	where pa.time_period_id = @curr_time_period_id

--Gather review comments
declare @pa_num int
declare @comment varchar(max)
declare @curr_comment varchar(max)
declare @inquiry_sort int
declare @c_sort varchar(10)

declare comments cursor for 
	--use SELECT DISTINCT because multiple-service-area applicants often have identical comments for each service area
	select distinct o.organization_id,
		pa.sort_order,
		rai.comment,
        c.abbr,
		i.sort_order
		from lsc_review_assignment_inquiry rai
			join wf_task_assignment wfta on rai.wf_task_assignment_id = wfta.wf_task_assignment_id
			join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
			join organization o on gp.primary_organization_id = o.organization_id
			join lsc_a_review_inquiry i on rai.lsc_review_inquiry_id = i.id
			join lsc_a_review_criterion c on i.lsc_review_criterion_id = c.id
            join lsc_a_review_category cat ON cat.id = c.lsc_review_category_id
			join lsc_a_review_performance_area pa on cat.lsc_review_performance_area_id = pa.id
			join vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		where rtrim(ltrim(isnull(rai.comment, ''))) <> ''
			and wcy.wfta_year = @comp_year
		order by pa.sort_order, c.abbr, i.sort_order
	
open comments
fetch next from comments into @organization_id, @pa_num, @comment, @c_sort, @inquiry_sort
WHILE (@@FETCH_STATUS=0)
begin
	select @curr_comment = isnull(rtrim(ltrim(comments)), '')
		from #comments
		where organization_id = @organization_id
			and pa_num = @pa_num

	if @curr_comment <> '' 
		set @comment = char(10) + char(13) + @comment

	update #comments 
		set comments = isnull(comments, '') + @comment
		where organization_id = @organization_id
			and pa_num = @pa_num

	fetch next from comments into @organization_id, @pa_num, @comment, @c_sort, @inquiry_sort
end

close comments
deallocate comments

--Create table columns for review comments
declare @comment_col varchar(50)
declare @sql varchar(max)

declare comment_cols cursor for 
	select '[comment_pa' + cast(sort_order as varchar(1)) + ']' comment_col,
			sort_order pa_num
		from lsc_a_review_performance_area
		where time_period_id = @curr_time_period_id

open comment_cols
fetch next from comment_cols into @comment_col, @pa_num
WHILE (@@FETCH_STATUS=0)
begin
	--set @sql = 'alter table GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE add ' + @comment_col + ' varchar(max) null'
	--exec(@sql)

	set @sql = 'update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE set ' + @comment_col + ' = c.comments ' +
		'from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o join #comments c on o.organization_id = c.organization_id ' +
		'where c.pa_num = ' + cast(@pa_num as varchar(3))

	print @sql
	exec(@sql)
	fetch next from comment_cols into @comment_col, @pa_num
end

close comment_cols
deallocate comment_cols

--PPA Run Date

UPDATE GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	SET PPA_run_date = getdate()

--Renewal Funding
  UPDATE GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
     SET Renewal_funding_period = 'N/A'
     WHERE app_type in ('Renewal', 'Post-PQV Renewal')

--Grant_term_awarded column
  UPDATE GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
   SET Grant_term_awarded = 
                  Case When sa.Funding_Term = 1 then '1-Year'
                       When sa.Funding_Term = 2 then '2-Years'    
					Else '3-Years' End
	FROM GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp 
         join [lsc-sql].rindb.dbo.award a on pp.recipient_id = a.org_id
         join [lsc-sql].rindb.dbo.servarea sa on a.serv_area_id = sa.Serv_Area_ID
    where a.year = @award_year

--Score N/A for renewals
UPDATE GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
SET score = 'N/A'
WHERE app_type in ('Renewal', 'Post-PQV Renewal')

--Opp_state_assignments_person_name
Update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
set opp_state_assignments_person_name = p.name_first + ' ' + p.name_last
         from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
                    JOIN Easygrants.dbo.c_state_prov sp on pp.state = sp.abbr
                    JOIN Easygrants.dbo.LSC_c_STATE_PROV lsp on lsp.state_province_id = sp.id
                    JOIN Easygrants.dbo.person p on p.person_id = lsp.cr_reviewer_person_id


-- Exception: Update Assignment for 'California Indian Legal Services, Inc' (705158) to Tim Watson 

Update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
set opp_state_assignments_person_name = 'Tim Watson' 
where recipient_id = 705158

--next_year_comp_pres, funding_term_recom_pres,special_grant_conditions_pres (President's review for Competition)
  
;With X (recipient_id, funding_term, funding_term_recom_pres, special_grant_pres)
 as (select distinct cwosy.recipient_id, 
            Case When ft.abbr = '1-year' then 1 
                 when ft.abbr = '2-year' then 2 
                 when ft.abbr = '3-year' then 3 
                 Else Null End ,
              ft.abbr, 
              Case when special_grant = 1 then 'Yes' Else 'No' End
          from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
                  JOIN Easygrants.dbo.vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON cwosy.recipient_id = pp.recipient_id
                  left JOIN Easygrants.dbo.Lsc_Review_Application lra ON lra.wf_task_assignment_id = cwosy.wf_task_assignment_id
                  JOIN Easygrants.dbo.Lsc_c_funding_term ft ON lra.lsc_funding_term_id = ft.id
where cwosy.wfta_year = @comp_year  
              and cwosy.wf_task_id = 56   -- president's review task_id
               and pp.app_type in ('competition' , 'Post-PQV competition'))      


Update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
set next_year_comp_pres =  (pp.comp_year + X.funding_term),
    funding_term_recom_pres =  X.funding_term_recom_pres,
    special_grant_conditions_pres = X.special_grant_pres
          from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
               JOIN X ON X.recipient_id = pp.recipient_id
               WHERE pp.app_type in ('competition' , 'Post-PQV competition')   


---PPQV Competition only (Total Recommendations, ...)
;with x(organization_id, recipient_id, total_recom) 
as
(select o.organization_id, min(o.legacy_organization_id),  count(lsc_pqv_recommendation_id)
        from #grants g
             join a_competition c on c.abbr = g.serv_area
             join LSC_PQV_RECOMMENDATION_SERVAREA  pra on c.id = pra.competition_id
             join organization o on g.organization_id = o.organization_id
        where pra.time_period_id = @curr_time_period_id
        group by  o.organization_id)

Update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set total_no_tier1_recom = x.total_recom
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
               JOIN x ON X.recipient_id = pp.recipient_id
     WHERE pp.app_type in ('Post-PQV competition', 'Post-PQV Renewal')


 
--- Number of recommendations implemented (applicant) 
; with x(recipient_id, organization_id, recom_implemented) 
as
(select min(o.legacy_organization_id), o.organization_id,  count(lsc_pqv_recommendation_id)
        from #grants g
             join a_competition c on c.abbr = g.serv_area
             join LSC_PQV_RECOMMENDATION_SERVAREA  pra on c.id = pra.competition_id
             join organization o on g.organization_id = o.organization_id
        where pra.time_period_id = @curr_time_period_id and pra.lsc_pqv_recommendation_status_id = 1
        group by  o.organization_id)

Update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
set recom_implemented = x.recom_implemented
 from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
               JOIN X ON X.recipient_id = pp.recipient_id
             WHERE pp.app_type in ('Post-PQV competition', 'Post-PQV Renewal') 

--- Number of recommendations implemented (reviewer) 
; with x(recipient_id, organization_id, recom_implemented) 
as
(select min(o.legacy_organization_id), o.organization_id,  count(lsc_pqv_recommendation_id)
        from #grants g
             join a_competition c on c.abbr = g.serv_area
             join LSC_PQV_RECOMMENDATION_SERVAREA  pra on c.id = pra.competition_id
             join organization o on g.organization_id = o.organization_id
        where pra.time_period_id = @curr_time_period_id and pra.lsc_pqv_recommendation_status_id_reviewer = 1
        group by  o.organization_id)

Update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
set recom_implemented_reviewer = x.recom_implemented
 from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
               JOIN X ON X.recipient_id = pp.recipient_id
             WHERE pp.app_type in ('Post-PQV competition', 'Post-PQV Renewal') 

--- Number of recommendations being implemented (applicant)
; with x(recipient_id, organization_id, recom_being_implemented) 
as
(select min(o.legacy_organization_id), o.organization_id,  count(lsc_pqv_recommendation_id)
        from #grants g
             join a_competition c on c.abbr = g.serv_area
             join LSC_PQV_RECOMMENDATION_SERVAREA  pra on c.id = pra.competition_id
             join organization o on g.organization_id = o.organization_id
        where pra.time_period_id = @curr_time_period_id and pra.lsc_pqv_recommendation_status_id = 2
        group by o.organization_id)

Update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
set recom_being_implemented = x.recom_being_implemented
 from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
               JOIN X ON X.recipient_id = pp.recipient_id
             WHERE pp.app_type in ('Post-PQV competition', 'Post-PQV Renewal')

--- Number of recommendations being implemented (reviewer)
; with x(recipient_id, organization_id, recom_being_implemented) 
as
(select min(o.legacy_organization_id), o.organization_id,  count(lsc_pqv_recommendation_id)
        from #grants g
             join a_competition c on c.abbr = g.serv_area
             join LSC_PQV_RECOMMENDATION_SERVAREA  pra on c.id = pra.competition_id
             join organization o on g.organization_id = o.organization_id
        where pra.time_period_id = @curr_time_period_id and pra.lsc_pqv_recommendation_status_id_reviewer = 2
        group by o.organization_id)

Update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
set recom_being_implemented_reviewer = x.recom_being_implemented
 from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
               JOIN X ON X.recipient_id = pp.recipient_id
             WHERE pp.app_type in ('Post-PQV competition', 'Post-PQV Renewal')

--- Number of recommendations being implemented in part or with certain modifications (applicant)
; with x(recipient_id, organization_id, recom_implemented_certain_modifications) 
as
(select min(o.legacy_organization_id), o.organization_id,  count(lsc_pqv_recommendation_id)
        from #grants g
             join a_competition c on c.abbr = g.serv_area
             join LSC_PQV_RECOMMENDATION_SERVAREA  pra on c.id = pra.competition_id
             join organization o on g.organization_id = o.organization_id
        where pra.time_period_id = @curr_time_period_id and pra.lsc_pqv_recommendation_status_id = 3
        group by o.organization_id)

Update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
set recom_implemented_certain_modifications = x.recom_implemented_certain_modifications
 from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
               JOIN X ON X.recipient_id = pp.recipient_id
             WHERE pp.app_type in ('Post-PQV competition', 'Post-PQV Renewal')

--- Number of recommendations being implemented in part or with certain modifications (reviewer)
; with x(recipient_id, organization_id, recom_implemented_certain_modifications) 
as
(select min(o.legacy_organization_id), o.organization_id,  count(lsc_pqv_recommendation_id)
        from #grants g
             join a_competition c on c.abbr = g.serv_area
             join LSC_PQV_RECOMMENDATION_SERVAREA  pra on c.id = pra.competition_id
             join organization o on g.organization_id = o.organization_id
        where pra.time_period_id = @curr_time_period_id and pra.lsc_pqv_recommendation_status_id_reviewer = 3
        group by o.organization_id)

Update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
set recom_implemented_certain_modifications_reviewer = x.recom_implemented_certain_modifications
 from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
               JOIN X ON X.recipient_id = pp.recipient_id
             WHERE pp.app_type in ('Post-PQV competition', 'Post-PQV Renewal')

--- Number of recommendations being considered (applicant)
; with x(recipient_id, organization_id, recom_being_considered) 
as
(select min(o.legacy_organization_id), o.organization_id,  count(lsc_pqv_recommendation_id)
        from #grants g
             join a_competition c on c.abbr = g.serv_area
             join LSC_PQV_RECOMMENDATION_SERVAREA  pra on c.id = pra.competition_id
             join organization o on g.organization_id = o.organization_id
        where pra.time_period_id = @curr_time_period_id and pra.lsc_pqv_recommendation_status_id = 4
        group by  o.organization_id)

Update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
set recom_being_considered = x.recom_being_considered
 from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
               JOIN X ON X.recipient_id = pp.recipient_id
             WHERE pp.app_type in ('Post-PQV competition', 'Post-PQV Renewal')   

--- Number of recommendations being considered (reviewer)
; with x(recipient_id, organization_id, recom_being_considered) 
as
(select min(o.legacy_organization_id), o.organization_id,  count(lsc_pqv_recommendation_id)
        from #grants g
             join a_competition c on c.abbr = g.serv_area
             join LSC_PQV_RECOMMENDATION_SERVAREA  pra on c.id = pra.competition_id
             join organization o on g.organization_id = o.organization_id
        where pra.time_period_id = @curr_time_period_id and pra.lsc_pqv_recommendation_status_id_reviewer = 4
        group by  o.organization_id)

Update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
set recom_being_considered_reviewer = x.recom_being_considered
 from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
               JOIN X ON X.recipient_id = pp.recipient_id
             WHERE pp.app_type in ('Post-PQV competition', 'Post-PQV Renewal')   
  
--- Number of recommendations not being implemented (applicant)
; with x(recipient_id, organization_id, recom_not_being_implemented) 
as
(select min(o.legacy_organization_id), o.organization_id,  count(lsc_pqv_recommendation_id)
        from #grants g
             join a_competition c on c.abbr = g.serv_area
             join LSC_PQV_RECOMMENDATION_SERVAREA  pra on c.id = pra.competition_id
             join organization o on g.organization_id = o.organization_id
        where pra.time_period_id = @curr_time_period_id and pra.lsc_pqv_recommendation_status_id = 5
        group by o.organization_id)

Update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
set recom_not_being_implemented = x.recom_not_being_implemented
 from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
               JOIN X ON X.recipient_id = pp.recipient_id
             WHERE pp.app_type in ('Post-PQV competition', 'Post-PQV Renewal')

--- Number of recommendations not being implemented (reviewer)
; with x(recipient_id, organization_id, recom_not_being_implemented) 
as
(select min(o.legacy_organization_id), o.organization_id,  count(lsc_pqv_recommendation_id)
        from #grants g
             join a_competition c on c.abbr = g.serv_area
             join LSC_PQV_RECOMMENDATION_SERVAREA  pra on c.id = pra.competition_id
             join organization o on g.organization_id = o.organization_id
        where pra.time_period_id = @curr_time_period_id and pra.lsc_pqv_recommendation_status_id_reviewer = 5
        group by o.organization_id)

Update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
set recom_not_being_implemented_reviewer = x.recom_not_being_implemented
 from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
               JOIN X ON X.recipient_id = pp.recipient_id
             WHERE pp.app_type in ('Post-PQV competition', 'Post-PQV Renewal')


-- Not in Compliance with 45CFR part 1607

--UPDATE GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
--    SET  out_of_compliance_1607 = Case when v.overall_compliant = 0 then 'Based on the governing body data provided in the 2013 grant application, the program was determined to be out of compliance with 45 C.F.R. § 1607.3.  The program provided a plan with its application for coming into compliance with 45 C.F.R. § 1607.3.  LSC staff will be in contact with the program during the month of March of the grant year if the board continues to be out of compliance.' Else NULL End 
--	FROM GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
--        join organization o ON pp.recipient_id = o.legacy_organization_id 
--		join vLsc_Board_Compliance v ON o.organization_id = v.organization_id 
--        join c_time_period tp ON v.time_period_id = tp.id
--    WHERE tp.abbr = @comp_year and is_nic_data = 0


---Compliance and audit issues from oce director's review - Competition 

UPDATE GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
    SET  compliance_issues_ocedir = Case when lra.compliance_issues = 1 then 'Yes' Else 'No' End,
         audit_issues_ocedir = Case when lra.audit_issues = 1 then 'Yes' Else 'No' End 
    FROM GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
          JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON cwosy.recipient_id = pp.recipient_id
          JOIN Lsc_Review_Application lra ON lra.wf_task_assignment_id = cwosy.wf_task_assignment_id
    WHERE cwosy.wfta_year = @comp_year  
              and cwosy.wf_task_id = 74   -- OCE Director's review task_id
               and pp.app_type in ('competition' , 'Post-PQV competition')


---Compliance and audit issues from oce director's review - Renewal 

UPDATE GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
    SET  compliance_issues_renew_ocedir = Case when lrr.compliance_issues = 1 then 'Yes' Else 'No' End ,
         audit_issues_renew_ocedir = Case when lrr.audit_issues = 1 then 'Yes' Else 'No' End
    FROM GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
          JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON cwosy.recipient_id = pp.recipient_id
          JOIN LSC_RENEWAL_REC lrr ON lrr.wf_task_assignment_id = cwosy.wf_task_assignment_id
    WHERE cwosy.wfta_year = @comp_year 
              and cwosy.wf_task_id = 75  -- OCE Director's review task_id
               and pp.app_type in ('Renewal' , 'Post-PQV Renewal')


-- funding_rec_pres, special_grant_renew_pres (President's review for Renewals)
  
;With X (recipient_id, funding_rec_pres, special_grant_renew_pres)
 as (select Distinct cwosy.recipient_id, 
                     lcrr.description, 
                     Case when lrr.special_conditions_YesNo = 1 then 'Yes' Else 'No' End
			from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
                  JOIN Easygrants.dbo.vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON cwosy.recipient_id = pp.recipient_id
                  left JOIN Easygrants.dbo.LSC_RENEWAL_REC lrr ON lrr.wf_task_assignment_id = cwosy.wf_task_assignment_id
                  join LSC_c_RENEWAL_RECOMMENDATION lcrr ON lrr.lsc_renewal_recommendation_id = lcrr.id
			where cwosy.wfta_year = @comp_year  
              and cwosy.wf_task_id = 57   -- renewal president's review task_id
              and pp.app_type in ('Renewal', 'Post-PQV Renewal'))      


Update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
set special_grant_renew_pres = X.special_grant_renew_pres,
    funding_rec_pres = X.funding_rec_pres
          from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
               JOIN X ON X.recipient_id = pp.recipient_id
               WHERE pp.app_type in ('Renewal', 'Post-PQV Renewal')

-- Staff review - Form L
;With X (recipient_id, form_l)
 as (select distinct cwosy.recipient_id, 
                     Case when lre.form_l = 1 then 'Yes' Else 'No' End 
			from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
                  JOIN Easygrants.dbo.vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON cwosy.recipient_id = pp.recipient_id
                  left JOIN Easygrants.dbo.LSC_RENEWAL_EVAL lre ON lre.wf_task_assignment_id = cwosy.wf_task_assignment_id
			where cwosy.wfta_year = @comp_year  
              and cwosy.wf_task_id in (6, 69)  -- renewal staff reviews
              and pp.app_type in ('Renewal', 'Post-PQV Renewal'))
      


    Update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
		set form_l = X.form_l
			   from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
								JOIN X ON X.recipient_id = pp.recipient_id
               where pp.app_type in ('Renewal', 'Post-PQV Renewal')



--Next year in competition - Renewals
update #grants
	set next_year_comp_renew = Year(gpi.duration_end) + 1
	from #grants g
		join grantee_project_info gpi on g.grantee_project_id = gpi.grantee_project_id


----Group by organization and use most recent to update organizations table.
;with nextcomp(organization_id, next_year_comp)
as
(select organization_id,
	max(next_year_comp_renew)
	from #grants
	group by organization_id)

update GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	set next_year_comp = nextcomp.next_year_comp
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE o
		join nextcomp on o.organization_id = nextcomp.organization_id

--Fiscal score
UPDATE GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	SET fiscal_score = cafst.total_score
	FROM GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE pp
		JOIN vLSC_COMP_APPL_FISCAL_SCORE_TOTAL cafst ON pp.organization_id = cafst.organization_id
		JOIN c_TIME_PERIOD tp ON cafst.time_period_id = tp.id
	WHERE tp.sort_order = @comp_year


select * --organization_id, organization_name, datalength(comment_pa1) pa1, datalength(comment_pa2) pa2, datalength(comment_pa3) pa3, datalength(comment_pa4) pa4
	from GRANTEE_PROFILE_STAFF_OVERVIEW.dbo.PROGRAM_PROFILE
	order by organization_name

