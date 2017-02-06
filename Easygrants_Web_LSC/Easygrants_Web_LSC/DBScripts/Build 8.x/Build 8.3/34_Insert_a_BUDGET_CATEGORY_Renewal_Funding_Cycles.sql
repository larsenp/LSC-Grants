declare @wfp_id int

declare renewal cursor for
	select wfp.id
		from grantee_project gp
			join a_wf_project wfp on gp.wf_project_id = wfp.id
			join a_competition c on wfp.competition_id = c.id
			left join a_wf_project wfpf on wfp.competition_id = wfpf.competition_id
				and wfpf.time_period_id = 16
		where c.program_id = 1
			and gp.grant_status_id = 1
				and wfpf.id is null --no funding cycle for current time period

OPEN renewal
FETCH NEXT FROM renewal INTO @wfp_id

WHILE (@@FETCH_STATUS=0)
BEGIN
	EXEC spLSC_INSERT_NEW_BUDGET_CATEGORY_2011 
		@project_id = @wfp_id
	FETCH NEXT FROM renewal INTO @wfp_id
END

CLOSE renewal
DEALLOCATE renewal

