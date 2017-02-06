INSERT a_WF_TASK
    (id
    ,abbr
    ,description
    ,wf_task_type_id
    ,is_copy_allowed
    ,is_external_help_url)
    VALUES
        (91
        ,'Review 1607 Compliance Report - OPP Staff'
        ,'Review 1607 Compliance Report - OPP Staff'
        ,4
        ,0
        ,0)

UPDATE s_ID_GEN
    SET next_id = 92
    WHERE table_name = 'a_WF_TASK' 