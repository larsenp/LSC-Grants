/****** Object:  StoredProcedure [dbo].[spTIG_LOI_TYPES]    Script Date: 02/19/2013 16:33:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Allow for case where @org_id is null

ALTER PROCEDURE [dbo].[spTIG_LOI_TYPES]
	(@org_id int = NULL)

AS

--Create table to populate drop-down
CREATE TABLE #tasks
	(WfTaskID int,
	Description varchar(100),
	WfProjectID int,
	StartDate datetime,
	CloseDate datetime,
	EndDate datetime)

IF @org_id IS NOT NULL
BEGIN
	--Insert one row for each LOI task currently available
	INSERT #tasks
		(WfTaskID,
		Description,
		WfProjectID,
		StartDate,
		CloseDate,
		EndDate)
		SELECT 
			wft.id,
			wfpt.description,
			wfpt.wf_project_id,
			wfpt.start_date,
			wfpt.close_date,
			wfpt.end_date
		FROM a_wf_task wft
			 join a_wf_project_task wfpt on wfpt.wf_task_id = wft.id 
			 join a_wf_project wfp on wfpt.wf_project_id = wfp.id
			join LSC_c_TIG_GRANT_TYPE tgt on wft.id = tgt.loi_wf_task_id
		WHERE wfp.competition_id = 456

	--Find any current web grant requests for the requesting organization
	DECLARE @web_grants int

	SELECT @web_grants = COUNT(*)
		FROM GRANTEE_PROJECT gp
			JOIN WF_TASK_ASSIGNMENT wfta ON gp.grantee_project_id = wfta.grantee_project_id
				AND wfta.wf_task_id in (33,34)
			JOIN #tasks t ON gp.wf_project_id = t.WfProjectID
		WHERE gp.primary_organization_id = @org_id

	--If the requesting organization has started a web grant request, remove both web types from the list 
	--of available options.
	IF @web_grants > 0
		DELETE #tasks
			WHERE WfTaskID in (33,34)
END --IF @org_id IS NOT NULL

SELECT * FROM #tasks
	WHERE StartDate < GETDATE()
		AND CloseDate > GETDATE()
	ORDER BY Description
