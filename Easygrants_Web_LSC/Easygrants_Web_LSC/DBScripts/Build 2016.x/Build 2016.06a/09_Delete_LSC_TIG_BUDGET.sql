--Delete budgets and budget items created in old data model for 2014+ TIGs

create table #del
	(lsc_tig_budget_id int)

insert #del
	(lsc_tig_budget_id)
	select distinct tb.lsc_tig_budget_id
		from GRANTEE_PROJECT gp
			join LSC_TIG_BUDGET tb on gp.grantee_project_id = tb.grantee_project_id
			join LSC_TIG_BUDGET_ITEM tbi on tb.lsc_tig_budget_id = tbi.lsc_tig_budget_id
			join a_WF_PROJECT wfp on gp.wf_project_id = wfp.id
			join c_TIME_PERIOD tp on wfp.time_period_id = tp.id
		where tp.sort_order >= 2014
			and tbi.lsc_tig_budget_line_id is not null

delete LSC_TIG_BUDGET_ITEM
	where lsc_tig_budget_id in
		(select lsc_tig_budget_id from #del)

delete LSC_TIG_BUDGET
	where lsc_tig_budget_id in
		(select lsc_tig_budget_id from #del)

select * from #del
drop table #del
