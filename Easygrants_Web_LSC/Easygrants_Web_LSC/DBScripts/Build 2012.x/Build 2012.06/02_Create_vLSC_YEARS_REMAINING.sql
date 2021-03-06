USE [Easygrants]
GO
/****** Object:  View [dbo].[vLSC_YEARS_REMAINING]    Script Date: 05/08/2012 16:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vLSC_YEARS_REMAINING]
AS

SELECT cwosy.organization_id, cwosy.serv_area, cwosy.time_period_id,
    min(year(gpi.duration_end)- cwosy.wfta_year +1) years_remain
FROM grantee_project_info gpi 
		JOIN GRANTEE_PROJECT gp ON gpi.grantee_project_id = gp.grantee_project_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
        LEFT JOIN wf_task_assignment wfta ON gp.grantee_project_id = wfta.grantee_project_id
        LEFT JOIN dbo.vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON cwosy.wf_task_assignment_id = wfta.wf_task_assignment_id
GROUP BY cwosy.organization_id, cwosy.serv_area, cwosy.time_period_id   

