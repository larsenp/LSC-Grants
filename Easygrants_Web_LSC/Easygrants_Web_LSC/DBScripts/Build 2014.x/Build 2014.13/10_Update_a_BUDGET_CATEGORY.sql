--Generic case script

DECLARE @sort_order INT,
        @lsc_fund_code INT

SET @lsc_fund_code = 43
SET @sort_order = 33


--Model Categories
UPDATE bc3
SET sort_order = @sort_order
    --select bc3.*
    FROM a_BUDGET_CATEGORY bc0
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE bc0.project_id = 1
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 9
        AND bc2.sort_order = 19
        AND bc3.lsc_fund_code = @lsc_fund_code

--Active C&R Grants
UPDATE bc3
SET sort_order = @sort_order
      --SELECT bc3.*
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
        AND bc1.category_type_id = 9
        AND bc2.sort_order = 19
        AND bc3.lsc_fund_code = @lsc_fund_code


--2015 Funding cycles
UPDATE bc3
 SET sort_order = @sort_order
    --SELECT bc3.*
    FROM a_WF_PROJECT wfp
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE wfp.time_period_id = 20
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 9
        AND bc2.sort_order = 19
        AND bc3.lsc_fund_code = @lsc_fund_code 











--HUD Grants (36) - sort_order 30
--Other federal Grants (34) - sort_order 31
--Specific State Grants and Contracts (43) - sort_order 33
--Filing and Other Fees (41) - sort_order 34
--IOLTA Grants (50) - sort_order 35
--LOcal Grants (42) - sort_order 36
--United Way Grants (44) - sort_order 37
--Corporate and Individual Contributions(45) - sort_order 38
--Private Foundation Grants (46) - sort_order 39
--Bar Association Grants (48) - sort_order 41
--Attorney Fee Awards (52) - sort_order 42
--Cy Pres Awards (53) - sort_order 43
--Carryover Funds (54) - sort_order 44
--Publication Income (55) - sort_order 45
--Other Funds (99) - sort_order 46

-- For each run, 1, 193 and 63 rows are updated.