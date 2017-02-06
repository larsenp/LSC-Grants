DECLARE @new_id INT

EXEC @new_id = getid_sel
    @table = 'a_WF_TASK_MODULE'
    ,@mode = 2

INSERT a_WF_TASK_MODULE
    (wf_task_module_id
    ,wf_task_id
    ,wf_task_role_id
    ,module_name
    ,module_config_filename
    ,outcome_config_filename)
    VALUES
        (@new_id
        ,91
        ,7
        ,'1607Review_OPPStaff'
        ,'1607Review_OPPStaffModuleConfig'
        ,'1607Review_OPPStaffOutcomeConfig')