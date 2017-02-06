CREATE TABLE #m
    (description varchar(100)
    ,sort_order int
    ,lsc_fund_code int)

INSERT #m
    (description
    ,sort_order
    ,lsc_fund_code)
    VALUES
        ('Specific State Grants and Contracts'
        ,35
        ,43)

INSERT #m
    (description
    ,sort_order
    ,lsc_fund_code)
    VALUES
        ('Corporate and Individual Contributions'
        ,37
        ,45)

INSERT #m
    (description
    ,sort_order
    ,lsc_fund_code)
    VALUES
        ('Cy Pres Awards'
        ,42
        ,53)


CREATE TABLE #bc
    (ident int identity(0,1),
    [budget_category_id] [int] NULL,
    [project_id] [int] NULL,
    [parent_id] [int] NULL,
    [description] [varchar](100) NULL,
    [sort_order] [int] NULL,
    [lsc_fund_code] [int] NULL)

INSERT #bc
    (project_id
    ,parent_id
    ,description
    ,sort_order
    ,lsc_fund_code)
    SELECT bc2.project_id
        ,bc2.budget_category_id
        ,#m.description
        ,#m.sort_order
        ,#m.lsc_fund_code
        FROM #m
            CROSS JOIN (
                a_BUDGET_CATEGORY bc0
                    JOIN a_BUDGET_CATEGORY bc1 on bc0.budget_category_id = bc1.parent_id
                    JOIN a_BUDGET_CATEGORY bc2 on bc1.budget_category_id = bc2.parent_id)
        WHERE bc0.project_id = 1
            AND bc0.parent_id = 0
            AND bc1.category_type_id = 7
            AND bc2.sort_order = 19


INSERT #bc
    (project_id
    ,parent_id
    ,description
    ,sort_order
    ,lsc_fund_code)
    SELECT bc2.project_id
        ,bc2.budget_category_id
        ,#m.description
        ,#m.sort_order
        ,#m.lsc_fund_code
    FROM #m
            CROSS JOIN (
                GRANTEE_PROJECT gp 
                    JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
                    JOIN a_COMPETITION c ON wfp.competition_id = c.id
                    JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
                    JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
                    JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id)
    WHERE gp.grant_status_id = 1
        AND c.program_id = 1
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 19


INSERT #bc
    (project_id
    ,parent_id
    ,description
    ,sort_order
    ,lsc_fund_code)
    SELECT bc2.project_id
        ,bc2.budget_category_id
        ,#m.description
        ,#m.sort_order
        ,#m.lsc_fund_code
    FROM #m
            CROSS JOIN (
                a_WF_PROJECT wfp
                    JOIN a_BUDGET_CATEGORY bc0 ON wfp.id = bc0.project_id
                    JOIN a_BUDGET_CATEGORY bc1 ON bc0.budget_category_id = bc1.parent_id
                    JOIN a_BUDGET_CATEGORY bc2 ON bc1.budget_category_id = bc2.parent_id)
    WHERE wfp.time_period_id = 19
        AND bc0.parent_id = 0
        AND bc1.category_type_id = 7
        AND bc2.sort_order = 19

DECLARE @rowcount int, @first_id int

SELECT @rowcount = COUNT(*)
    FROM #bc

EXEC @first_id = spGETID_RANGE_SEL @table = 'a_BUDGET_CATEGORY', @count = @rowcount

UPDATE #bc
    SET budget_category_id = ident + @first_id

INSERT a_BUDGET_CATEGORY
    (budget_category_id
    ,project_id
    ,parent_id
    ,description
    ,has_child
    ,has_notes
    ,sort_order
    ,category_type_id
    ,lsc_fund_code
    ,is_external_help_url)
    SELECT budget_category_id
        ,project_id
        ,parent_id
        ,description
        ,0
        ,0
        ,sort_order
        ,9
        ,lsc_fund_code
        ,0
        FROM #bc

SELECT * FROM #m
SELECT * FROM #bc

DROP TABLE #m
DROP TABLE #bc

