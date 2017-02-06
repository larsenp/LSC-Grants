CREATE VIEW vLSC_PRO_BONO_SCORE_BY_LOI

AS

SELECT wfta.grantee_project_id
	,SUM(raw_score) raw_score
	,SUM(max_score) max_score
	,AVG(weighted_score) weighted_score
	FROM vLSC_PRO_BONO_SECONDARY_SCORE_BY_REVIEW_ASSIGNMENT pbssra
		JOIN WF_TASK_ASSIGNMENT wfta ON pbssra.wf_task_assignment_id = wfta.wf_task_assignment_id
	WHERE wfta.wf_task_id = 124
	GROUP BY wfta.grantee_project_id