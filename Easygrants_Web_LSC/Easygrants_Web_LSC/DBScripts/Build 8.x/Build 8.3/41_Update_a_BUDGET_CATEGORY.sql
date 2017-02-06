--Change "Current Expenses (Form D-2)" to "Current Year Expenses (Form D-2)"
--and "Current Revenue (Form D-4)" to "Current Year Revenue (Form D-4)"

update bc_c
	set description = replace(bc_c.description, 'Current', 'Current Year')
	from a_budget_category bc
		join a_budget_category bc_c on bc.budget_category_id = bc_c.parent_id
		join a_wf_project wfp on bc.project_id = wfp.id
		join c_time_period tp on wfp.time_period_id = tp.id
		left join grantee_project gp on wfp.id = gp.wf_project_id
			and gp.grant_status_id = 1
		join a_competition c on wfp.competition_id = c.id
	where bc.parent_id = 0
		and (tp.sort_order = 2011
			or gp.grant_status_id = 1)
		and tp.sort_order > 2008
		and bc_c.category_type_id in (3,4)
		and c.program_id = 1
