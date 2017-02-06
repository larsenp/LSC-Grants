ALTER PROCEDURE [dbo].[spLSC_CSR_ANALYSIS_BY_RECIPIENT]
	(@recipient_id varchar(6),
	 @year int,
     @ServType varchar(10) = 'BF')

--@year represents the year of the application which is being reviewed.
--The most recent reporting year for actual data = @year - 2

--New: Contested Cases Totals and Medians are included. 

AS
--Create table to be used for final output
create table #csr
	(OrgID int,
	OrgName varchar(100),
	CurrentYear int,
	OneYrAgo int,
	TwoYrsAgo int,
	CasesCurrent int,
    PAICasesCurrent int,  --new 2014 cycle
	ExtendedCases int,
    ContestedCases int,   --new
	Cases1YrAgo int,
	Cases2YrsAgo int,
	PovertyPopulation int,
	CasesPer10k decimal(10,3),
    PAICasesPer10k decimal(10,3),   --new 2014 cycle
	ExtCasesPer10k decimal(10,3),
    ContestedCasesPer10k decimal(10,3),   --new
	LscFunding int,
	OtherFunding int,
	LscFundPercent decimal(10,2),
    OtherFundPercent decimal(10,2),
	MedianCasesPer10k int,
    MedianCasesPer10k_70 int,
    MedianPAICasesPer10k int,        --new 2014 cycle
    MedianPAICasesPer10k_70 int,     --new 2014 cycle
	MedianExtCasesPer10k int,
	MedianExtCasesPer10k_70 int,
    MedianContestedCasesPer10k int,    --new
	MedianContestedCasesPer10k_70 int, --new
	AvgPctNonLsc decimal(4,2),
	AvgPctNonLsc_70 decimal(4,2),
	CSRBelow70 bit default 0,
	ExtCSRBelow70 bit default 0, 
    ContestedCSRBelow70 bit default 0,   --new
	PrecipitousDrop bit default 0,
    MW_CasesCurrent int,                 
    MW_extendedcases int,
    MW_Contestedcases int,   --new
    MW_povertypopulation int,
    MW_CasesPer10k decimal(10,3),
    MW_ExtCasesPer10k decimal(10,3),
    MW_ContestedCasesPer10k decimal(10,3), --new
    MW_MedianCasesPer10k int,
    MW_MedianCasesPer10k_70 int,
    MW_MedianExtCasesPer10k int,
    MW_MedianExtCasesPer10k_70 int,
    MW_MedianContestedCasesPer10k int,    --new
    MW_MedianContestedCasesPer10k_70 int, --new
    MW_ExtCSRBelow70 bit default 0,
    MW_ContestedCSRBelow70 bit default 0)  --new                      

--Create table to be used for calculation of case totals
create table #cases
	(orgid int,
	cases int)

--Get case totals for the current year and write them to #csr.cases_current. All case totals are for PAI and basic field only.
If @ServType = 'MW'
BEGIN
  insert #csr(orgid,
	MW_CasesCurrent)
select org_id,
	sum(total)
	from [LSC-SQL].rindb.dbo.clsdcase 
	where org_id = @recipient_id
		and year = @year - 2
		and serv_type = 'MW'
	group by org_id;
 END

If @ServType = 'BF'
 BEGIN
  insert #csr(orgid,
	casescurrent)
select org_id,
	sum(total)
	from [LSC-SQL].rindb.dbo.clsdcase 
	where org_id = @recipient_id
		and year = @year - 2
		and serv_type in ('PA', 'BF')
	group by org_id;

END

---Newly added 6/6/2013 
If @ServType = 'BF'
 BEGIN

insert #cases
	(orgid,
	cases)
select org_id,
	sum(total)
	from [LSC-SQL].rindb.dbo.clsdcase 
	where org_id = @recipient_id
		and year = @year - 2
		and serv_type = 'PA'
	group by org_id;

update #csr
	set PAICasesCurrent = c.cases
	from #csr
		join #cases c on #csr.orgid = c.orgid

truncate table #cases

END


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
IF @ServType = 'MW'
BEGIN
insert #cases
	(orgid,
	cases)
select org_id,
	SUM(F_Ng_St_w_o_Lt)+SUM(G_Ng_St_w_Lt)+SUM(H_Agncy_Decsn)+ SUM(I_Court_Decsn)+SUM(Ia)+SUM(Ib)+SUM(Ic)+SUM(K_Other)+SUM(L)
	from [LSC-SQL].rindb.dbo.clsdcase 
	where org_id = @recipient_id
		and year = @year - 2
		and serv_type ='MW'
	group by org_id;

update #csr
	set MW_extendedcases = c.cases
	from #csr
		join #cases c on #csr.orgid = c.orgid

END

If @ServType = 'BF'
 BEGIN

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

END

--update #csr
--	set extendedcases = c.cases
--	from #csr
--		join #cases c on #csr.orgid = c.orgid

truncate table #cases


-- Newly Added: Get Contested service case totals for the current year and write them to #csr.ContestedCases
IF @ServType = 'MW'
BEGIN
insert #cases
	(orgid,
	cases)
select org_id,
	SUM(G_Ng_St_w_Lt)+SUM(H_Agncy_Decsn)+SUM(Ib)+SUM(Ic)
	from [LSC-SQL].rindb.dbo.clsdcase 
	where org_id = @recipient_id
		and year = @year - 2
		and serv_type ='MW'
	group by org_id;

update #csr
	set MW_Contestedcases = c.cases
	from #csr
		join #cases c on #csr.orgid = c.orgid

END

If @ServType = 'BF'
 BEGIN

  insert #cases
	(orgid,
	cases)
  select org_id,
	SUM(G_Ng_St_w_Lt)+SUM(H_Agncy_Decsn)+SUM(Ib)+SUM(Ic)
	from [LSC-SQL].rindb.dbo.clsdcase 
	where org_id = @recipient_id
		and year = @year - 2
		and serv_type in ('PA', 'BF')
	group by org_id;

  update #csr
	set ContestedCases = c.cases
	from #csr
		join #cases c on #csr.orgid = c.orgid

END

drop table #cases


--Organization name
update #csr
	set orgname = r.r_legalname
	from #csr
		join [LSC-SQL].rindb.dbo.rmaster r on #csr.orgid = r.org_id;

--Poverty population
create table #pov
	(org_id int,
	poor_popul int)

If @ServType = 'BF'
 BEGIN
 insert #pov
	(org_id,
	poor_popul)
	Select a.org_id, 
		sum(sa.adj_Poor_Popul)
		from [LSC-SQL].rindb.dbo.SERVAREA sa
			join [LSC-SQL].rindb.dbo.award a on sa.Serv_Area_ID = a.Serv_Area_ID 
		Where a.Year = @year - 2
		group by a.org_id

  update #csr
	set povertypopulation = p.poor_popul
	from #csr c
		join #pov p on c.orgid = p.org_id
END

If @ServType = 'MW'
 BEGIN
 insert #pov
	(org_id,
	poor_popul)
	Select a.org_id, 
		sum(sa.migr_poor_popul)
		from [LSC-SQL].rindb.dbo.SERVAREA sa
			join [LSC-SQL].rindb.dbo.award a on sa.Serv_Area_ID = a.Serv_Area_ID 
		Where a.Year = @year - 2
			and sa.serv_type = 'MW'
		group by a.org_id

  update #csr
	set MW_povertypopulation = p.poor_popul
	from #csr c
		join #pov p on c.orgid = p.org_id
END

drop table #pov

--Cases per 10,000 poverty population
update #csr
	set casesper10k = case when povertypopulation = 0 then -1
			when povertypopulation is null then -1
			else 10000*cast(casescurrent as decimal(10,3))/povertypopulation end,
		extcasesper10k = case when povertypopulation = 0 then -1
			when povertypopulation is null then -1
			else 10000*cast(extendedcases as decimal(10,3))/povertypopulation end,
        MW_casesper10k = case when MW_povertypopulation = 0 then -1
             when MW_povertypopulation is null then -1
             else 10000*cast(MW_CasesCurrent as decimal(10,3))/MW_povertypopulation end,
        MW_extcasesper10k = case when MW_povertypopulation = 0 then -1
			when MW_povertypopulation is null then -1
			else 10000*cast(MW_extendedcases as decimal(10,3))/MW_povertypopulation end,

        ---Newly Added   
        ContestedCasesPer10k = case when povertypopulation = 0 then -1
			when povertypopulation is null then -1
			else 10000*cast(ContestedCases as decimal(10,3))/povertypopulation end,
        MW_ContestedCasesPer10k = case when MW_povertypopulation = 0 then -1
			when MW_povertypopulation is null then -1
			else 10000*cast(MW_Contestedcases as decimal(10,3))/MW_povertypopulation end, 
	
         ---Newly added 6/6/2013 
         paicasesper10k = case when povertypopulation = 0 then -1
			when povertypopulation is null then -1
			else 10000*cast(paicasescurrent as decimal(10,3))/povertypopulation end
		

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
select @amount = sum(Intr_or_Invest+Fee_Awd_LSC_Cs+Publ_LSC+ Ot_Fnd_LSC_Amt)
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
			Publication + Ot_Funds_Amt + Filing_Fees +
			Spec_State_Grants_Contracts + Corp_Indiv_Contributions + Cy_Pres_Awards)
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
	set MedianCasesPer10k = m_cc_poor,
		MedianCasesPer10k_70 = 0.7*m_cc_poor,
		MedianExtCasesPer10k = m_cc_poor_ext,
		MedianExtCasesPer10k_70 = 0.7*m_cc_poor_ext,
        MedianContestedCasesPer10k = m_cc_poor_contested,  -- newly added
        MedianContestedCasesPer10k_70 = 0.7*m_cc_poor_contested,  -- newly added
        MedianPAICasesPer10k = m_pai_poor,  --new 2014 cycle
		MedianPAICasesPer10k_70 = 0.7*m_pai_poor  --new 2014 cycle
	from [LSC-SQL].[test Sonny].dbo.csrnational
	where year = @year - 2
		and serv_type = 'bf'

update #csr
	set MW_MedianCasesPer10k = m_cc_poor,
		MW_MedianCasesPer10k_70 = 0.7*m_cc_poor,
        MW_MedianExtCasesPer10k = m_cc_poor_ext,
		MW_MedianExtCasesPer10k_70 = 0.7*m_cc_poor_ext,
        MW_MedianContestedCasesPer10k = m_cc_poor_contested,  -- newly added
        MW_MedianContestedCasesPer10k_70 = 0.7*m_cc_poor_contested -- newly added
	from [LSC-SQL].[test Sonny].dbo.csrnational
	where year = @year - 2
		and serv_type = 'MW'



update #csr
	set CSRBelow70 = 1
	where CasesPer10k < MedianCasesPer10k_70

update #csr
	set ExtCSRBelow70 = 1
	where ExtCasesPer10k < MedianExtCasesPer10k_70

update #csr
	set MW_ExtCSRBelow70 = 1
	where MW_ExtCasesPer10k < MW_MedianExtCasesPer10k_70


update #csr
	set ContestedCSRBelow70 = 1
	where ContestedCasesPer10k < MedianContestedCasesPer10k_70

update #csr
	set MW_ContestedCSRBelow70 = 1
	where MW_ContestedCasesPer10k < MW_MedianContestedCasesPer10k_70


update #csr
	set PrecipitousDrop = 1
	where CasesCurrent < 0.8*Cases2YrsAgo

declare @AvgPctNonLsc decimal(4,2)

select @AvgPctNonLsc = avg(pct_non_lsc)
	from (
		select Org_ID,
			100*sum(cast(tt_nlsc - Cry_Ovr_Funds as decimal(10,2)))/sum(Total - Cr_Ovr_Fnd_LSC - Cry_Ovr_Funds - tt_c) pct_non_lsc
			from [lsc-sql].rindb.dbo.revenue
			where year = @year - 2
				and record_type = 'a'
				and serv_type = 'bf'
				and total > 0
			group by Org_ID
	) a

update #csr
	set AvgPctNonLsc = @AvgPctNonLsc

update #csr
	set AvgPctNonLsc_70 = 0.7*@AvgPctNonLsc





SELECT * FROM #csr

DROP TABLE #csr

