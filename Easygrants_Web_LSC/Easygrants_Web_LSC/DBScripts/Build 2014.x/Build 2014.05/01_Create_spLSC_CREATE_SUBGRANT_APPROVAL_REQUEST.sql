/****** Object:  StoredProcedure [dbo].[spLSC_CREATE_SUBGRANT_APPROVAL_REQUEST]    Script Date: 05/07/2014 18:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spLSC_CREATE_SUBGRANT_APPROVAL_REQUEST]
	@person_id int,
	@start_date datetime,
	@end_date datetime,
	@subgrantee varchar(100),
	@subgrant_amount int,
	@wf_project_id int = 2810, --final subgrant approval request if not otherwise specified
	@wf_task_id int = 53
AS
BEGIN
	--Get primary organization corresponding to person
	DECLARE @organization_id int
	SELECT @organization_id = organization_id
		FROM PERSON_ORGANIZATION_AFFILIATION
		WHERE person_id = @person_id
			AND is_primary_organization_contact = 1
	
	IF @organization_id IS NULL
	BEGIN
		SELECT 0 AS wf_task_assignment_id

		RETURN
	END

	
	--Create grantee record
	DECLARE @grantee_id int
	EXEC @grantee_id = getid_sel @table='GRANTEE', @mode = 2
	INSERT [GRANTEE]
           ([grantee_id]
           ,[entity_id]
           ,[entity_type_id])
     VALUES
           (@grantee_id
           ,@organization_id
           ,2)

	--Create grantee_project record
	DECLARE @grantee_project_id int
	EXEC @grantee_project_id = getid_sel @table='GRANTEE_PROJECT', @mode = 2
	INSERT GRANTEE_PROJECT
		(grantee_project_id,
		grantee_id,
		wf_project_id,
		primary_person_id,
		primary_organization_id,
		grant_status_id)
		VALUES(@grantee_project_id,
			@grantee_id,
			@wf_project_id,
			@person_id,
			@organization_id,
			2)

	--Create wf_task_assignment record
	DECLARE @wfta_id int
	EXEC @wfta_id = getid_sel @table='WF_TASK_ASSIGNMENT', @mode = 2
	INSERT WF_TASK_ASSIGNMENT
		(wf_task_assignment_id,
		wf_task_id,
		person_id,
		grantee_project_id,
		wf_task_status_id,
		wf_task_outcome_id,
		wf_task_role_id)
		VALUES(@wfta_id,
			@wf_task_id,
			@person_id,
			@grantee_project_id,
			1,
			114,
			1)

	IF @wf_task_id = 53
		UPDATE WF_TASK_ASSIGNMENT
			SET start_date = getdate(),
				open_date = getdate(),
				due_date = dateadd(d, -45, @start_date),
				close_date = dateadd(d, -41, @start_date),
				end_date = @end_date
			WHERE wf_task_assignment_id = @wfta_id

	--Create lsc_wfta_subgrant record
	DECLARE @lsc_wfta_subgrant_id int
	EXEC @lsc_wfta_subgrant_id = getid_sel @table='LSC_WFTA_SUBGRANT', @mode = 2
	INSERT LSC_WFTA_SUBGRANT
		(lsc_wfta_subgrant_id,
		wf_task_assignment_id,
		start_date,
		end_date,
		subgrantee_name,
		subgrant_amount)
		VALUES(@lsc_wfta_subgrant_id,
			@wfta_id,
			@start_date,
			@end_date,
			@subgrantee,
			@subgrant_amount)

	SELECT @wfta_id AS wf_task_assignment_id

END
