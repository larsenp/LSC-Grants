USE [Easygrants]
GO
/****** Object:  View [dbo].[vBUDGET_CATEGORY_COUNT_BY_PROJECT]    Script Date: 02/13/2008 10:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vBUDGET_CATEGORY_COUNT_BY_PROJECT]

AS

SELECT wfp.id project_id, 
	wfp.description project,
	tp.abbr year,
	gp.budget_category_count
	FROM a_wf_project wfp
		LEFT JOIN c_time_period tp ON wfp.time_period_id = tp.id
		LEFT JOIN (SELECT wfp.id,
					CASE WHEN MAX(bc.budget_category_id) IS NULL THEN 0 ELSE COUNT(*) END AS budget_category_count
					FROM a_wf_project wfp
						LEFT JOIN a_budget_category bc ON wfp.id = bc.project_id
						GROUP BY wfp.id, wfp.description) gp ON wfp.id = gp.id



