/****** Object:  StoredProcedure [dbo].[spLSC_CREATE_SANDY_GRANT_APPL]    Script Date: 11/15/2013 09:17:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spLSC_CREATE_SANDY_GRANT_APPL]
	(@person_id int
	,@wf_task_id int
	,@program_id int)

AS

DECLARE @organization_id int
	,@wf_project_id int
	,@new_grantee_id int
	,@new_gp_id int
    ,@new_wfta_id int

SELECT @organization_id = organization_id
	FROM PERSON_ORGANIZATION_AFFILIATION
	WHERE person_id = @person_id
		AND is_primary = 1

SELECT @wf_project_id = wfp.id
	FROM a_WF_PROJECT wfp
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
	WHERE c.program_id = @program_id

EXEC @new_grantee_id = GETID_SEL @table = 'GRANTEE', @mode = 2

INSERT GRANTEE
	(grantee_id
	,entity_id
	,entity_type_id)
	VALUES 
		(@new_grantee_id
		,@organization_id
		,2)

EXEC @new_gp_id = GETID_SEL @table = 'GRANTEE_PROJECT', @mode = 2

INSERT INTO [GRANTEE_PROJECT]
           ([grantee_project_id]
           ,[grantee_id]
           ,[wf_project_id]
           ,[primary_person_id]
           ,[primary_organization_id]
           ,[grant_status_id]
)
     VALUES
           (@new_gp_id
           ,@new_grantee_id
           ,@wf_project_id
           ,@person_id
           ,@organization_id
           ,2)

EXEC @new_wfta_id = getid_sel @table = 'WF_TASK_ASSIGNMENT', @mode = 2

INSERT INTO [WF_TASK_ASSIGNMENT]
           ([wf_task_assignment_id]
           ,[wf_task_id]
           ,[wf_task_status_id]
           ,[wf_task_outcome_id]
           ,[grantee_project_id]
           ,[person_id]
           ,[wf_task_role_id]
           ,[create_date]
           ,[due_date]
           ,[close_date])
     VALUES
           (@new_wfta_id
           ,@wf_task_id
           ,1
           ,206
           ,@new_gp_id
           ,@person_id
           ,1
           ,GETDATE()
           ,DATEADD(d, 60, GETDATE())
           ,DATEADD(d, 75, GETDATE()))

SELECT 	@new_gp_id NewGPID
    ,@new_wfta_id NewWfTAID
