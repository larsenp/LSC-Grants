
DELETE FROM a_WF_PROJECT_TASK_PDF 
WHERE id IN (SELECT wfptp.id 
               FROM a_WF_PROJECT_TASK_PDF wfptp
                       JOIN a_WF_PROJECT_TASK wfpt ON wfptp.wf_project_task_id = wfpt.id
               WHERE wfpt.wf_task_id = 84)