ALTER VIEW [dbo].[vLSC_GRANTS_TIG_SUBGRANTEE_NAME]

As 

SELECT gp.grantee_project_id,
       CASE WHEN c.program_id in (2,6) THEN gp.legacy_grant_id 
            WHEN c.program_id = 3 THEN wftas.subgrantee_name ELSE NULL END TIG_SubgranteeName,
       wfta.wf_task_assignment_id
   FROM GRANTEE_PROJECT gp
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN c_TIME_PERIOD tp ON wfp.time_period_id = tp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		LEFT JOIN LSC_GRANTEE_PROJECT_TIG gpt ON gp.grantee_project_id = gpt.grantee_project_id
        LEFT JOIN wf_task_assignment wfta ON wfta.grantee_project_id = gp.grantee_project_id and wfta.wf_task_id = 53
        LEFT JOIN LSC_WFTA_SUBGRANT wftas ON wftas.wf_task_assignment_id = wfta.wf_task_assignment_id
WHERE c.program_id in (1, 2, 3, 6)

