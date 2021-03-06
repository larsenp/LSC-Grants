CREATE VIEW [dbo].[vReviewCycleHasActiveWfta]
AS
SELECT	dbo.a_REVIEW_CYCLE.id AS ReviewCycleID, 
		(CASE WHEN
			(SELECT COUNT(*) FROM WF_TASK_ASSIGNMENT INNER JOIN
			REVIEW_CYCLE_STAGE ON WF_TASK_ASSIGNMENT.review_cycle_stage_id = REVIEW_CYCLE_STAGE.review_cycle_stage_id
			WHERE REVIEW_CYCLE_STAGE.review_cycle_id = a_REVIEW_CYCLE.id AND WF_TASK_ASSIGNMENT.wf_task_status_id <> 3) > 0 
		THEN 1 
		ELSE 0 
		END) AS HasActiveTasks

FROM dbo.a_REVIEW_CYCLE

GO