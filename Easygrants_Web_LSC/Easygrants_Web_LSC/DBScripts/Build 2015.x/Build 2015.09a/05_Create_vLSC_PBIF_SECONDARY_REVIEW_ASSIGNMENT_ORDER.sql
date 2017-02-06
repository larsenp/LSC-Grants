CREATE VIEW vLSC_PBIF_SECONDARY_REVIEW_ASSIGNMENT_ORDER

AS

SELECT wfta.wf_task_assignment_id
	,wfta.grantee_project_id
	,ROW_NUMBER() OVER(PARTITION BY wfta.grantee_project_id ORDER BY p.name_last, p.name_first) AS Row
	,p.name_last
	,p.name_first
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN PERSON p ON wfta.person_id = p.person_id
	WHERE wfta.wf_task_id = 107