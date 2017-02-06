CREATE PROCEDURE spLSC_CREATE_SANDY_GRANT_APPL
	(@person_id int)

AS

DECLARE @organization_id int
	,@new_grantee_id int
	,@new_gp_id int
    ,@new_wfta_id int

SELECT @organization_id = organization_id
	FROM PERSON_ORGANIZATION po
	WHERE person_id = @person_id
		AND is_primary = 1

EXEC @new_grantee_id = GETID_SEL @table = 'GRANTEE'

INSERT GRANTEE
	(grantee_id
	,entity_id
	,entity_type_id)
	VALUES 
		(@new_grantee_id
		,@organization_id
		,2)

EXEC @new_gp_id = GETID_SEL @table = 'GRANTEE_PROJECT'

INSERT INTO [EasygrantsDev].[dbo].[GRANTEE_PROJECT]
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
           ,3047
           ,@person_id
           ,@organization_id
           ,2)

EXEC @new_wfta_id = getid_sel @table = 'WF_TASK_ASSIGNMENT'

INSERT INTO [EasygrantsDev].[dbo].[WF_TASK_ASSIGNMENT]
           ([wf_task_assignment_id]
           ,[wf_task_id]
           ,[wf_task_status_id]
           ,[wf_task_outcome_id]
           ,[grantee_project_id]
           ,[person_id]
           ,[wf_task_role_id])
     VALUES
           (@new_wfta_id
           ,90
           ,1
           ,206
           ,@new_gp_id
           ,@person_id
           ,1)