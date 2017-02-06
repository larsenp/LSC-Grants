

CREATE VIEW [dbo].[vREVIEW_TOTAL_SCORE_OCE]

AS

SELECT lrai.wf_task_assignment_id review_wfta_id,
	avg(lris.value*20) score
   FROM WF_TASK_ASSIGNMENT wfta  
	    JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		JOIN lsc_review_assignment_inquiry lrai ON wfta.wf_task_assignment_id = lrai.wf_task_assignment_id
		JOIN LSC_c_REVIEW_INQUIRY_SCORE lris ON lrai.lsc_review_inquiry_score_id = lris.id
	WHERE wfta.wf_task_id = 83
    GROUP BY lrai.wf_task_assignment_id