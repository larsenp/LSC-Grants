set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go



ALTER PROCEDURE [dbo].[spPRIORITIES_GOALS_STRATEGIES_PDF]

(
		@WfTaskAssignmentID INT
)
AS

CREATE TABLE #temp
 (abbr char(50),
  description varchar(max),
  p_sort decimal(18,1),
  g_sort decimal(18,1),
  s_sort decimal(18,1),
  outcome varchar(max))


INSERT #temp (abbr, description, p_sort)
  SELECT 'Priority:',
         priority_description, 
         lsc_program_priorities_id
      FROM LSC_PROGRAM_PRIORITIES
      WHERE wf_task_assignment_id = @WfTaskAssignmentID

--inserting empty rows inbetween each priority
INSERT #temp (p_sort)
  SELECT  lsc_program_priorities_id - 0.5
      FROM LSC_PROGRAM_PRIORITIES
      WHERE wf_task_assignment_id = @WfTaskAssignmentID




INSERT #temp (abbr, description, g_sort, p_sort)
   SELECT '  ' + 'Goal:',
          '  ' + g.goal_description, 
          g.lsc_goal_id, 
          p.lsc_program_priorities_id
     FROM LSC_GOAL g
          JOIN LSC_PROGRAM_PRIORITIES p ON g.program_priorities_id = lsc_program_priorities_id
     WHERE p.wf_task_assignment_id = @WfTaskAssignmentID

--inserting empty rows inbetween each Goal
INSERT #temp (g_sort, p_sort)
   SELECT g.lsc_goal_id - 0.5, 
          p.lsc_program_priorities_id
     FROM LSC_GOAL g
          JOIN LSC_PROGRAM_PRIORITIES p ON g.program_priorities_id = lsc_program_priorities_id
     WHERE p.wf_task_assignment_id = @WfTaskAssignmentID




INSERT #temp (abbr, description, s_sort, outcome, g_sort, p_sort)
   SELECT '   ' + 'Strategy ('+ st.description +'):',
          '   ' + s.strategy_description, 
          s.lsc_strategies_id, 
          s.desired_outcomes,
          g.lsc_goal_id, 
          p.lsc_program_priorities_id
      FROM LSC_GOAL g
              JOIN LSC_PROGRAM_PRIORITIES p ON g.program_priorities_id = lsc_program_priorities_id
              JOIN LSC_STRATEGIES s ON g.lsc_goal_id = s.goal_id
              JOIN LSC_c_STRATEGY_TYPE st ON st.id = s.strategy_type_id
      WHERE p.wf_task_assignment_id = @WfTaskAssignmentID


-- Deleting empty row before first Goal in each Priority
Delete from #temp 
   where g_sort in (select min(g_sort)
					from #temp
					where g_sort is not null
					group by p_sort)


-- Deleting empty row before first Priority 
Delete from #temp where p_sort = (select min(p_sort) from #temp)


--Select list which appears in PDF
SELECT abbr,
       description, 
       ISNULL(outcome, ' ' ) desiredoutcome
FROM #temp
ORDER BY p_sort, g_sort, s_sort

--select * from  #temp
--

DROP TABLE #temp








