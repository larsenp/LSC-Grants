UPDATE bc3
	SET description = 'Estimated Carryover Funds'
    FROM a_BUDGET_CATEGORY bc0
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE bc0.project_id = 1 --model budget categories
		and bc0.parent_id = 0
        AND bc1.category_type_id = 7 --interim
        AND bc2.sort_order = 19
		and bc3.lsc_fund_code = 54


UPDATE bc3
	SET description = 'Estimated Carryover Funds'
    FROM a_BUDGET_CATEGORY bc0
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
		join a_wf_project wfp on bc0.project_id = wfp.id
    WHERE bc0.parent_id = 0
        AND bc1.category_type_id = 7 --interim
        AND bc2.sort_order = 19 --2014 funding cycles
		and bc3.lsc_fund_code = 54
		and wfp.time_period_id = 19
