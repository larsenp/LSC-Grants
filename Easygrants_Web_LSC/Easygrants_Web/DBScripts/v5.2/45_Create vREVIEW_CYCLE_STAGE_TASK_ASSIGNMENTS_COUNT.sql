CREATE VIEW [dbo].[vREVIEW_CYCLE_STAGE_TASK_ASSIGNMENTS_COUNT]
AS
SELECT     COUNT(dbo.WF_TASK_ASSIGNMENT.wf_task_assignment_id) AS task_assignments_count, dbo.REVIEW_CYCLE_STAGE.review_cycle_stage_id
FROM         dbo.WF_TASK_ASSIGNMENT INNER JOIN
                      dbo.REVIEW_CYCLE_STAGE ON dbo.WF_TASK_ASSIGNMENT.review_cycle_stage_id = dbo.REVIEW_CYCLE_STAGE.review_cycle_stage_id
GROUP BY dbo.REVIEW_CYCLE_STAGE.review_cycle_stage_id