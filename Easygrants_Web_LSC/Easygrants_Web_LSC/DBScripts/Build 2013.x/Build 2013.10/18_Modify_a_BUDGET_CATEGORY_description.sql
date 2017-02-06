--Change "Title XX Social Security" to "HHS Grants"

UPDATE bc3
    SET description = 'HHS Grants'
    FROM a_BUDGET_CATEGORY bc0
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE bc0.project_id = 1
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 19
        AND bc3.lsc_fund_code = 30

UPDATE bc3
    SET description = 'HHS Grants'
    FROM GRANTEE_PROJECT gp 
        JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
        JOIN a_COMPETITION c ON wfp.competition_id = c.id
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE gp.grant_status_id = 1
        AND c.program_id = 1
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 19
        AND bc3.lsc_fund_code = 30

UPDATE bc3
    SET description = 'HHS Grants'
    FROM a_WF_PROJECT wfp
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE wfp.time_period_id = 19
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 19
        AND bc3.lsc_fund_code = 30 


--Change "Community Development Block Grants" to "HUD Grants":

UPDATE bc3
    SET description = 'HUD Grants'
    FROM a_BUDGET_CATEGORY bc0
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE bc0.project_id = 1
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 19
        AND bc3.lsc_fund_code = 36

UPDATE bc3
    SET description = 'HUD Grants'
    FROM GRANTEE_PROJECT gp 
        JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
        JOIN a_COMPETITION c ON wfp.competition_id = c.id
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE gp.grant_status_id = 1
        AND c.program_id = 1
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 19
        AND bc3.lsc_fund_code = 36

UPDATE bc3
    SET description = 'HUD Grants'
    FROM a_WF_PROJECT wfp
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE wfp.time_period_id = 19
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 19
        AND bc3.lsc_fund_code = 36

--Change "State Grants" to "General State Grants":

UPDATE bc3
    SET description = 'General State Grants'
    FROM a_BUDGET_CATEGORY bc0
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE bc0.project_id = 1
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 19
        AND bc3.lsc_fund_code = 40

UPDATE bc3
    SET description = 'General State Grants'
    FROM GRANTEE_PROJECT gp 
        JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
        JOIN a_COMPETITION c ON wfp.competition_id = c.id
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE gp.grant_status_id = 1
        AND c.program_id = 1
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 19
        AND bc3.lsc_fund_code = 40

UPDATE bc3
    SET description = 'General State Grants'
    FROM a_WF_PROJECT wfp
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE wfp.time_period_id = 19
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 19
        AND bc3.lsc_fund_code = 40 
        
--Change "Filing Fees" to "Filing and Other Fees"
UPDATE bc3
    SET description = 'Filing and Other Fees'
    FROM a_BUDGET_CATEGORY bc0
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE bc0.project_id = 1
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 19
        AND bc3.lsc_fund_code = 41

UPDATE bc3
    SET description = 'Filing and Other Fees'
    FROM GRANTEE_PROJECT gp 
        JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
        JOIN a_COMPETITION c ON wfp.competition_id = c.id
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE gp.grant_status_id = 1
        AND c.program_id = 1
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 19
        AND bc3.lsc_fund_code = 41

UPDATE bc3
    SET description = 'Filing and Other Fees'
    FROM a_WF_PROJECT wfp
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE wfp.time_period_id = 19
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 19
        AND bc3.lsc_fund_code = 41


--Change "Foundation Grants" to "Private Foundation Grants"
UPDATE bc3
    SET description = 'Private Foundation Grants'
    FROM a_BUDGET_CATEGORY bc0
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE bc0.project_id = 1
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 19
        AND bc3.lsc_fund_code = 46

UPDATE bc3
    SET description = 'Private Foundation Grants'
    FROM GRANTEE_PROJECT gp 
        JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
        JOIN a_COMPETITION c ON wfp.competition_id = c.id
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE gp.grant_status_id = 1
        AND c.program_id = 1
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 19
        AND bc3.lsc_fund_code = 46

UPDATE bc3
    SET description = 'Private Foundation Grants'
    FROM a_WF_PROJECT wfp
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE wfp.time_period_id = 19
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 19
        AND bc3.lsc_fund_code = 46

