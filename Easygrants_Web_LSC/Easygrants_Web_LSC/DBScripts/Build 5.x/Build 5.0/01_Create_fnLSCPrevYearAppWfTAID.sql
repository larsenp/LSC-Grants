/****** Object:  UserDefinedFunction [dbo].[fnLSCPrevYearAppWfTAID]    Script Date: 03/12/2009 13:39:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnLSCPrevYearAppWfTAID]
	(@wf_task_assignment_id INT)

RETURNS INT

AS

/*
Given a wf_task_assignment_id, this function will return the wf_task_assignment_id
of the application (competitive or renewal) for the same grantee for the previous year
*/
BEGIN

	DECLARE @year INT
	DECLARE @grantee_project_id INT

	SELECT @year = wcy.wfta_year,
		@grantee_project_id = wfta.grantee_project_id
		FROM WF_TASK_ASSIGNMENT wfta
			JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		WHERE wfta.wf_task_assignment_id = @wf_task_assignment_id


	DECLARE @prev_wfta_id INT

	--Get previous year's application wfta ID if it is from the same grantee project
	SELECT @prev_wfta_id = wfta.wf_task_assignment_id 
		FROM WF_TASK_ASSIGNMENT wfta
			JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		WHERE wcy.wfta_year = @year -1
			AND wfta.grantee_project_id = @grantee_project_id
			AND wfta.wf_task_id in (2,4)

	IF @prev_wfta_id IS NOT NULL
		RETURN @prev_wfta_id

	--If not in the same grantee project, get wfta ID based on service area, year, and organization (and task, of course)
	DECLARE @competition_id INT, @organization_id INT

	SELECT @competition_id = wfp.competition_id,
		@organization_id = gp.primary_organization_id
		FROM WF_TASK_ASSIGNMENT wfta
			JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
			JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
			JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		WHERE wfta.wf_task_assignment_id = @wf_task_assignment_id

	SELECT @prev_wfta_id = wfta.wf_task_assignment_id
		FROM WF_TASK_ASSIGNMENT wfta
			JOIN vWFTA_COMPETITION_YEAR wcy ON wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
			JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
			JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		WHERE wcy.wfta_year = @year -1
			AND wfta.wf_task_id in (2,4)
			AND wfp.competition_id = @competition_id
			AND gp.primary_organization_id = @organization_id

	RETURN @prev_wfta_id

END