update bc
	set category_type_id = 7
	from a_budget_category bc
		join a_budget_category bcp on bc.parent_id = bcp.budget_category_id
	where bc.lsc_fund_code in (43, 45, 53)
		and bcp.category_type_id = 7
