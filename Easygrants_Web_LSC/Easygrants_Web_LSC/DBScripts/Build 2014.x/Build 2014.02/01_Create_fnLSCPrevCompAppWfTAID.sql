/****** Object:  UserDefinedFunction [dbo].[fnLSCPrevYearAppWfTAID]    Script Date: 03/07/2014 10:03:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnLSCPrevCompAppWfTAID]
	(@wf_task_assignment_id INT)

RETURNS INT

AS

/*
Given a wf_task_assignment_id, this function will return the wf_task_assignment_id
of the previous competitive application for the same grantee
*/
BEGIN

	DECLARE @year INT

	SELECT @year = wcy.wfta_year
		FROM WF_TASK_ASSIGNMENT wfta
			JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		WHERE wfta.wf_task_assignment_id = @wf_task_assignment_id

	DECLARE @prev_wfta_id INT

	--If not in the same grantee project, get wfta ID based on service area, year, and organization (and task, of course)
	DECLARE @competition_id INT, @organization_id INT

	SELECT @competition_id = wfp.competition_id,
		@organization_id = gp.primary_organization_id
		FROM WF_TASK_ASSIGNMENT wfta
			JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
			JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		WHERE wfta.wf_task_assignment_id = @wf_task_assignment_id

	SELECT TOP 1 @prev_wfta_id = wfta.wf_task_assignment_id
		FROM WF_TASK_ASSIGNMENT wfta
			JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
			JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
			JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		WHERE wcy.wfta_year < @year
			AND wfta.wf_task_id in (2,66)
			AND wfta.wf_task_status_id = 2
			AND wfp.competition_id = @competition_id
			AND gp.primary_organization_id = @organization_id
		ORDER BY wcy.wfta_year DESC

	RETURN @prev_wfta_id

END