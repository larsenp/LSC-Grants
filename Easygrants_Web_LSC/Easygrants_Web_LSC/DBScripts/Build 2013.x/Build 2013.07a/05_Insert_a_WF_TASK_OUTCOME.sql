INSERT a_WF_TASK_OUTCOME
    (id
    ,task_id
    ,role_id
    ,abbr
    ,description)
    VALUES
        (208
        ,91
        ,7
        ,'IN PROC'
        ,'In Process')

INSERT a_WF_TASK_OUTCOME
    (id
    ,task_id
    ,role_id
    ,abbr
    ,description)
    VALUES
        (209
        ,91
        ,7
        ,'SUBMITTED'
        ,'Submitted')

UPDATE s_ID_GEN
    SET next_id = 210
    WHERE table_name = 'a_WF_TASK_OUTCOME'