SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vYears_Remaining_GrantTerm]
AS
SELECT wfta_app.wf_task_assignment_id,
		wfta_app.wf_task_id,
	    sa.Years_remain
FROM wf_task_assignment wfta_app 
			JOIN grantee_project gp ON wfta_app.grantee_project_id = gp.grantee_project_id
			JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
			JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
			JOIN a_COMPETITION c ON wfp.competition_id = c.id
			left join vWFTA_COMPETITION_YEAR wcy ON wfta_app.wf_task_assignment_id = wcy.wf_task_assignment_id
            join [lsc-sql].rindb.dbo.SERVAREA sa ON c.abbr = sa.serv_area_id
		WHERE wfta_app.wf_task_id in (2,4)