--Adjust the sort orders to make room for the new budget categories:

--1. Bump up everything by three after the new Cy Pres awards category

--1.1 Model project
UPDATE bc3
    SET sort_order = bc3.sort_order + 3
    FROM a_BUDGET_CATEGORY bc0
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE bc0.project_id = 1
        AND bc0.parent_id = 0
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.sort_order > 39)
			OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.sort_order > 13))

--1.2: Active projects up for renewal
UPDATE bc3
    SET sort_order = bc3.sort_order + 3
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
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.sort_order > 39)
			OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.sort_order > 13))
		  AND wfp15.id IS NULL

--1.3: 2015 projects
UPDATE bc3
    SET sort_order = bc3.sort_order + 3
    FROM a_WF_PROJECT wfp
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE wfp.time_period_id = 20
        AND bc0.parent_id = 0
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.sort_order > 39)
			OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.sort_order > 13))

--2. Bump up everything by two between Corporate and Individual Contributions and Cy Pres

--2.1. Model project
UPDATE bc3
    SET sort_order = bc3.sort_order + 2
    FROM a_BUDGET_CATEGORY bc0
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE bc0.project_id = 1
        AND bc0.parent_id = 0
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.sort_order > 35 AND bc3.sort_order < 40)
			OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.sort_order > 9 AND bc3.sort_order < 14))

--2.2. Active projects up for renewal
UPDATE bc3
    SET sort_order = bc3.sort_order + 2
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
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.sort_order > 35 AND bc3.sort_order < 40)
			OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.sort_order > 9 AND bc3.sort_order < 14))
		  AND wfp15.id IS NULL

--2.3. 2015 projects
UPDATE bc3
    SET sort_order = bc3.sort_order + 2
    FROM a_WF_PROJECT wfp
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE wfp.time_period_id = 20
        AND bc0.parent_id = 0
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.sort_order > 35 AND bc3.sort_order < 40)
			OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.sort_order > 9 AND bc3.sort_order < 14))

--3. Bump up everything by one between State Grants and Contracts and Corporate and Individual Contributions.

--3.1. Model project
UPDATE bc3
    SET sort_order = bc3.sort_order + 1
    FROM a_BUDGET_CATEGORY bc0
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE bc0.project_id = 1
        AND bc0.parent_id = 0
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.sort_order = 35)
			OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.sort_order = 9))

--3.2. Current projects up for renewal
UPDATE bc3
    SET sort_order = bc3.sort_order + 1
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
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.sort_order = 35)
			OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.sort_order = 9))
		  AND wfp15.id IS NULL

--3.3. 2015 projects
UPDATE bc3
    SET sort_order = bc3.sort_order + 1
    FROM a_WF_PROJECT wfp
        JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
        JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
        JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id
        JOIN a_BUDGET_CATEGORY bc3 ON bc2.budget_category_id = bc3.parent_id
    WHERE wfp.time_period_id = 20
        AND bc0.parent_id = 0
        AND ((bc1.category_type_id = 2 AND bc2.sort_order = 19 AND bc3.sort_order = 35)
			OR (bc1.category_type_id = 4 AND bc2.sort_order = 1 AND bc3.sort_order = 9))

