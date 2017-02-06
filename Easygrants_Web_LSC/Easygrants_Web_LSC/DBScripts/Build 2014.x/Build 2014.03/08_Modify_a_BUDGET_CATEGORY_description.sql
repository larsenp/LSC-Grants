--Change  "Other Funds" to "Other Grants, i.e. TIG, Disaster" (Projected Revenues only)
--Model project
UPDATE bc3
    SET description = 'Other Grants, i.e. TIG, Disaster'
    FROM a_BUDGET_CATEGORY bc0
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE bc0.project_id = 1
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 2 
		  AND bc2.sort_order = 18 
		  AND bc3.lsc_fund_code = 20

--Active projects up for renewal
UPDATE bc3
    SET description = 'Other Grants, i.e. TIG, Disaster'
    FROM GRANTEE_PROJECT gp 
        JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		  LEFT JOIN a_WF_PROJECT wfp15 ON wfp.competition_id = wfp15.competition_id
		  		AND wfp15.time_period_id = 20
        JOIN a_COMPETITION c ON wfp.competition_id = c.id
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE gp.grant_status_id = 1
        AND c.program_id = 1
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 2 
		  AND bc2.sort_order = 18 
		  AND bc3.lsc_fund_code = 20
		  AND wfp15.id IS NULL

--2015 projects
UPDATE bc3
    SET description = 'Other Grants, i.e. TIG, Disaster'
    FROM a_WF_PROJECT wfp
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE wfp.time_period_id = 20
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 2 
		  AND bc2.sort_order = 18 
		  AND bc3.lsc_fund_code = 20


--Change "Community Development Block Grants" to "HUD Grants":
--Model project
UPDATE bc3
    SET description = 'HUD Grants'
    FROM a_BUDGET_CATEGORY bc0
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE bc0.project_id = 1
        AND bc0.parent_id = 0
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.lsc_fund_code = 36)
		  	OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.lsc_fund_code = 36))

--Active projects up for renewal
UPDATE bc3
    SET description = 'HUD Grants'
    FROM GRANTEE_PROJECT gp 
        JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		  LEFT JOIN a_WF_PROJECT wfp15 ON wfp.competition_id = wfp15.competition_id
		  		AND wfp15.time_period_id = 20
        JOIN a_COMPETITION c ON wfp.competition_id = c.id
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE gp.grant_status_id = 1
        AND c.program_id = 1
        AND bc0.parent_id = 0
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.lsc_fund_code = 36)
		  	OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.lsc_fund_code = 36))
		  AND wfp15.id IS NULL

--2015 projects
UPDATE bc3
    SET description = 'HUD Grants'
    FROM a_WF_PROJECT wfp
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE wfp.time_period_id = 20
        AND bc0.parent_id = 0
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.lsc_fund_code = 36)
		  	OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.lsc_fund_code = 36))

--Change "State Grants" to "General State Grants":
--Model project
UPDATE bc3
    SET description = 'General State Grants'
    FROM a_BUDGET_CATEGORY bc0
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE bc0.project_id = 1
        AND bc0.parent_id = 0
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.lsc_fund_code = 40)
		  	OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.lsc_fund_code = 40))

--Active projects up for renewal
UPDATE bc3
    SET description = 'General State Grants'
    FROM GRANTEE_PROJECT gp 
        JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		  LEFT JOIN a_WF_PROJECT wfp15 ON wfp.competition_id = wfp15.competition_id
		  		AND wfp15.time_period_id = 20
        JOIN a_COMPETITION c ON wfp.competition_id = c.id
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE gp.grant_status_id = 1
        AND c.program_id = 1
        AND bc0.parent_id = 0
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.lsc_fund_code = 40)
		  	OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.lsc_fund_code = 40))
		  AND wfp15.id IS NULL

--2015 projects
UPDATE bc3
    SET description = 'General State Grants'
    FROM a_WF_PROJECT wfp
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE wfp.time_period_id = 20
        AND bc0.parent_id = 0
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.lsc_fund_code = 40)
		  	OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.lsc_fund_code = 40))

--Change "Filing Fees" to "Filing and Other Fees"
--Model project
UPDATE bc3
    SET description = 'Filing and Other Fees'
    FROM a_BUDGET_CATEGORY bc0
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE bc0.project_id = 1
        AND bc0.parent_id = 0
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.lsc_fund_code = 41)
		  	OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.lsc_fund_code = 41))

--Active projects up for renewal
UPDATE bc3
    SET description = 'Filing and Other Fees'
    FROM GRANTEE_PROJECT gp 
        JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		  LEFT JOIN a_WF_PROJECT wfp15 ON wfp.competition_id = wfp15.competition_id
		  		AND wfp15.time_period_id = 20
        JOIN a_COMPETITION c ON wfp.competition_id = c.id
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE gp.grant_status_id = 1
        AND c.program_id = 1
        AND bc0.parent_id = 0
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.lsc_fund_code = 41)
		  	OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.lsc_fund_code = 41))
		  AND wfp15.id IS NULL

--2015 projects
UPDATE bc3
    SET description = 'Filing and Other Fees'
    FROM a_WF_PROJECT wfp
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE wfp.time_period_id = 20
        AND bc0.parent_id = 0
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.lsc_fund_code = 41)
		  	OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.lsc_fund_code = 41))


--Change "Foundation Grants" to "Private Foundation Grants"
--Model project
UPDATE bc3
    SET description = 'Private Foundation Grants'
    FROM a_BUDGET_CATEGORY bc0
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE bc0.project_id = 1
        AND bc0.parent_id = 0
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.lsc_fund_code = 46)
		  	OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.lsc_fund_code = 46))

--Active projects up for renewal
UPDATE bc3
    SET description = 'Private Foundation Grants'
    FROM GRANTEE_PROJECT gp 
        JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		  LEFT JOIN a_WF_PROJECT wfp15 ON wfp.competition_id = wfp15.competition_id
		  		AND wfp15.time_period_id = 20
        JOIN a_COMPETITION c ON wfp.competition_id = c.id
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE gp.grant_status_id = 1
        AND c.program_id = 1
        AND bc0.parent_id = 0
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.lsc_fund_code = 46)
		  	OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.lsc_fund_code = 46))
		  AND wfp15.id IS NULL

--2015 projects
UPDATE bc3
    SET description = 'Private Foundation Grants'
    FROM a_WF_PROJECT wfp
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE wfp.time_period_id = 20
        AND bc0.parent_id = 0
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.lsc_fund_code = 46)
		  	OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.lsc_fund_code = 46))

