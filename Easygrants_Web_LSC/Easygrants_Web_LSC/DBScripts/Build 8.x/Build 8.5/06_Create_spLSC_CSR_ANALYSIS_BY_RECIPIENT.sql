SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLSC_CSR_ANALYSIS_BY_RECIPIENT]
	(@recipient_id varchar(6),
	@year int)

--@year represents the year of the application which is being reviewed.
--The most recent reporting year for actual data = @year - 2

AS

--Create table to be used for final output
create table #csr
	(OrgID int,
	OrgName varchar(100),
	OrgIDName varchar(110),
	CurrentYear int,
	OneYrAgo int,
	TwoYrsAgo int,
	CasesCurrent int,
	ExtendedCases int,
	Cases1YrAgo int,
	Cases2YrsAgo int,
	PovertyPopulation int,
	CasesPer10k decimal(10,3),
	ExtCasesPer10k decimal(10,3),
	LscFunding int,
	OtherFunding int,
	LscFundPercent decimal(10,2),
    OtherFundPercent decimal(10,2),
	CompRenew varchar(1))

--Create table to be used for calculation of case totals
create table #cases
	(orgid int,
	cases int)

--Get case totals for the current year and write them to #csr.cases_current. All case totals are for PAI and basic field only.
insert #csr(orgid,
	casescurrent)
select org_id,
	sum(total)
	from [LSC-SQL].rindb.dbo.clsdcase 
	where org_id = @recipient_id
		and year = @year - 2
		and serv_type in ('PA', 'BF')
	group by org_id;

--Populate year columns
update #csr
	set CurrentYear = @year - 2,
		OneYrAgo = @year - 3,
		TwoYrsAgo = @year - 4

--Get case totals for the previous year and write them to #csr.cases_1_yr_ago
insert #cases
	(orgid,
	cases)
select org_id,
	sum(total)
	from [LSC-SQL].rindb.dbo.clsdcase 
	where org_id = @recipient_id
		and year = @year - 3
		and serv_type in ('PA', 'BF')
	group by org_id;

update #csr
	set cases1yrago = c.cases
	from #csr
		join #cases c on #csr.orgid = c.orgid

truncate table #cases

--Get case totals for two years prior and write them to #csr.cases_2_yrs_ago
insert #cases
	(orgid,
	cases)
select org_id,
	sum(total)
	from [LSC-SQL].rindb.dbo.clsdcase 
	where org_id = @recipient_id
		and year = @year - 4
		and serv_type in ('PA', 'BF')
	group by org_id;

update #csr
	set cases2yrsago = c.cases
	from #csr
		join #cases c on #csr.orgid = c.orgid

truncate table #cases

--Get extended service case totals for the current year and write them to #csr.extended_cases
insert #cases
	(orgid,
	cases)
select org_id,
	SUM(F_Ng_St_w_o_Lt)+SUM(G_Ng_St_w_Lt)+SUM(H_Agncy_Decsn)+ SUM(I_Court_Decsn)+SUM(Ia)+SUM(Ib)+SUM(Ic)+SUM(K_Other)+SUM(L)
	from [LSC-SQL].rindb.dbo.clsdcase 
	where org_id = @recipient_id
		and year = @year - 2
		and serv_type in ('PA', 'BF')
	group by org_id;

update #csr
	set extendedcases = c.cases
	from #csr
		join #cases c on #csr.orgid = c.orgid

drop table #cases

--Organization name
update #csr
	set orgname = r.r_legalname,
		orgidname = cast(orgid as varchar(6)) + ' - ' + r.r_legalname
	from #csr
		join [LSC-SQL].rindb.dbo.rmaster r on #csr.orgid = r.org_id;

--Poverty population
create table #pov
	(org_id int,
	poor_popul int)

insert #pov
	(org_id,
	poor_popul)
	Select a.org_id, 
		sum(sa.adj_Poor_Popul)
		from [LSC-SQL].rindb.dbo.SERVAREA sa
			join [LSC-SQL].rindb.dbo.award a on sa.Serv_Area_ID = a.Serv_Area_ID 
		Where a.Year = @year
		group by a.org_id

update #csr
	set povertypopulation = p.poor_popul
	from #csr c
		join #pov p on c.orgid = p.org_id

drop table #pov

--Cases per 10,000 poverty population
update #csr
	set casesper10k = case when povertypopulation = 0 then -1
			when povertypopulation is null then -1
			else 10000*cast(casescurrent as decimal(10,3))/povertypopulation end,
		extcasesper10k = case when povertypopulation = 0 then -1
			when povertypopulation is null then -1
			else 10000*cast(extendedcases as decimal(10,3))/povertypopulation end
	
--Revenues. Revenues are collected for basic field only.
declare @amount int

----LSC Revenues - LSC grant award
	select @amount = sum(amount)
		from [LSC-SQL].rindb.dbo.award
		where org_id = @recipient_id
			and year = @year - 2
			and serv_type = 'BF'

update #csr
	set lscfunding = @amount

----LSC Revenues - other revenues
select @amount = sum(Intr_or_Invest+Fee_Awd_LSC_Cs+Publ_LSC+Cr_Ovr_Fnd_LSC+ Ot_Fnd_LSC_Amt)
		from [LSC-SQL].rindb.dbo.revenue
		where org_id = @recipient_id
			and year = @year - 2
			and serv_type = 'BF'
			and Record_type='A'

update #csr
	set lscfunding = lscfunding + @amount

----Non-LSC revenues
	select @amount = sum(Title_XX_SSI + Older_Amr_Care + Violence_Women + 
			Other_Federal + Block_Grants + State_Grants + 
			Local_Grants + United_Way + Fndtion_Grants + 
			Bar_Grants + IOLTA + Fee_Awards + 
			Cry_Ovr_Funds + Publication + Ot_Funds_Amt)
		from [LSC-SQL].rindb.dbo.revenue
		where org_id = @recipient_id
			and year = @year - 2
			and serv_type = 'BF'
			and Record_Type='A'

update #csr
	set otherfunding = @amount

update #csr
	set lscfundpercent = 100.0*cast(lscfunding as decimal(15,3)) /(lscfunding + otherfunding )

update #csr
	set otherfundpercent = 100.0*cast(otherfunding as decimal(15,3)) /(lscfunding + otherfunding )

update #csr
	set comprenew = 'C'
	from wf_task_assignment wfta
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		join organization o on gp.primary_organization_id = o.organization_id
		join #csr c on o.legacy_organization_id = c.orgid
	where o.legacy_organization_id = @recipient_id
		and wfta.wf_task_id = 2
		and wcy.wfta_year = @year

update #csr
	set comprenew = 'R'
	from wf_task_assignment wfta
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		join organization o on gp.primary_organization_id = o.organization_id
		join #csr c on o.legacy_organization_id = c.orgid
	where o.legacy_organization_id = @recipient_id
		and wfta.wf_task_id = 4
		and wcy.wfta_year = @year

select * from #csr

drop table #csr

