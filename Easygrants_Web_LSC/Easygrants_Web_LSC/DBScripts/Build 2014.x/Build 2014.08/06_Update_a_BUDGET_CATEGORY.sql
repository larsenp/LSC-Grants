----Line item 20
--Model categories
UPDATE bc3
    SET description = 'Other Grants, i.e. TIG, Disaster'
    FROM a_BUDGET_CATEGORY bc0
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE bc0.project_id = 1
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 18
        AND bc3.lsc_fund_code = 20

--Active grants
UPDATE bc3
    SET description = 'Other Grants, i.e. TIG, Disaster'
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
        AND bc2.sort_order = 18
        AND bc3.lsc_fund_code = 20

--2015 funding cycles
UPDATE bc3
    SET description = 'Other Grants, i.e. TIG, Disaster'
    FROM a_WF_PROJECT wfp
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE wfp.time_period_id = 20
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 18
        AND bc3.lsc_fund_code = 20

----Line item 28
--Model categories
UPDATE bc3
    SET description = 'Interest, Investment & Other Income'
    FROM a_BUDGET_CATEGORY bc0
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE bc0.project_id = 1
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 18
        AND bc3.lsc_fund_code = 28

--Active grants
UPDATE bc3
    SET description = 'Interest, Investment & Other Income'
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
        AND bc2.sort_order = 18
        AND bc3.lsc_fund_code = 28

--2015 funding cycles
UPDATE bc3
    SET description = 'Interest, Investment & Other Income'
    FROM a_WF_PROJECT wfp
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE wfp.time_period_id = 20
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 18
        AND bc3.lsc_fund_code = 28
