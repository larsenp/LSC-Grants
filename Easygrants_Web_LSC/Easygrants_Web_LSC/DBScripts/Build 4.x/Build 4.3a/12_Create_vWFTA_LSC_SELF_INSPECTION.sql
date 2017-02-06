/****** Object:  View [dbo].[vWFTA_LSC_SELF_INSPECTION]    Script Date: 02/17/2009 16:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vWFTA_LSC_SELF_INSPECTION]
/*
This view joins the table LSC_SELF_INSPECTION to the table WF_TASK_ASSIGNMENT.
For data migrated from the RIN, there was one task assignment per (grantee + 
service area + year), not one per (organization + year) as there should have been.
For migrated data from grantees with multiple service areas, the LSC_SELF_INSPECTION
row is arbitrarily matched with a single task assignment so that the submission date can be obtained.
*/

AS

SELECT min(wfta.wf_task_assignment_id) wf_task_assignment_id,
	lsi.lsc_self_inspection_id
	FROM WF_TASK_ASSIGNMENT wfta
		join GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
		join ORGANIZATION o ON gp.primary_organization_id = o.organization_id
		join vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		join LSC_SELF_INSPECTION lsi on o.organization_id = lsi.organization_id
			and wcy.time_period_id = lsi.time_period_id
	WHERE wfta.wf_task_id = 17
	group by lsi.lsc_self_inspection_id