
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vLSC_WFTA_RINDB_SERVAREA]

AS


select 
wfta.wf_task_assignment_id
,o.legacy_organization_id recipient_id
,wft.abbr
,sa.serv_area_id
,sa.Serv_type
,sa.state
,sa.Year_Curr_Comp
,sa.Funding_Term
,sa.Years_Remain
,sa.Year_Next_Comp
,sa.Decision 
from [lsc-sql].rindb.dbo.SERVAREA sa
		join a_competition c on sa.serv_area_id = c.abbr
        JOIN a_WF_PROJECT wfp on wfp.competition_id = c.id
        JOIN GRANTEE_PROJECT gp ON gp.wf_project_id = wfp.id
       JOIN WF_TASK_ASSIGNMENT wfta ON wfta.grantee_project_id = gp.grantee_project_id
       JOIN a_WF_TASK wft ON wfta.wf_task_id = wft.id
       JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
	where  wft.wf_task_type_id IN (1,4)
		AND c.program_id = 1 

