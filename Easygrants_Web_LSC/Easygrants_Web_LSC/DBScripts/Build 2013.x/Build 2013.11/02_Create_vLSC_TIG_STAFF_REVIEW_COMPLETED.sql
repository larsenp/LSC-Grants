CREATE VIEW vLSC_TIG_STAFF_REVIEW_COMPLETED

AS

SELECT gp.grantee_project_id
	,gp.legacy_grant_id tig
	,CASE WHEN SUM(CASE WHEN wfta.review_assignment_type_id = 1 THEN 1 ELSE 0 END)  > 0
			AND COUNT(wfta.wf_task_assignment_id) > 1 THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END staff_review_completed
	FROM GRANTEE_PROJECT gp
		LEFT JOIN WF_TASK_ASSIGNMENT wfta ON gp.grantee_project_id = wfta.grantee_project_id
			AND wfta.wf_task_id = 43
			AND wfta.wf_task_status_id = 2
	GROUP BY gp.grantee_project_id
	,gp.legacy_grant_id
