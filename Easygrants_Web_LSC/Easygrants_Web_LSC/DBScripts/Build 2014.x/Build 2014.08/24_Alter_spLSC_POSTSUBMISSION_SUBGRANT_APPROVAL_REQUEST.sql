ALTER PROCEDURE [dbo].[spLSC_POSTSUBMISSION_SUBGRANT_APPROVAL_REQUEST]
	@WfTaskAssignmentID INT  
AS

DECLARE @status_id INT, @success BIT, @status_message VARCHAR(250)

DECLARE 
	@RequestTaskID INT,
	@grantee_project_id INT,
    @OCEAAReviewTaskID INT,
    @OCEAAReviewWfTAID INT,
    @OPPStaffReviewTaskID INT,
    @OPPStaffReviewWfTAID INT,
	@grant_type INT,
	@wf_task_outcome_id INT

   SELECT @grantee_project_id = grantee_project_id
		,@RequestTaskID = wf_task_id
	FROM WF_TASK_ASSIGNMENT
	WHERE wf_task_assignment_id = @WfTaskAssignmentID

	SET @OCEAAReviewTaskID = CASE WHEN @RequestTaskID = 53 THEN 64 WHEN @RequestTaskID = 101 THEN 104 END

   SELECT @OCEAAReviewWfTAID = wf_task_assignment_id
	FROM WF_TASK_ASSIGNMENT
	WHERE grantee_project_id = @grantee_project_id and wf_task_id = @OCEAAReviewTaskID

	SET @OPPStaffReviewTaskID = CASE WHEN @RequestTaskID = 53 THEN 84 WHEN @RequestTaskID = 101 THEN 105 END

   SELECT @OPPStaffReviewWfTAID = wf_task_assignment_id
	FROM WF_TASK_ASSIGNMENT
	WHERE grantee_project_id = @grantee_project_id and wf_task_id = @OPPStaffReviewTaskID

	SELECT @grant_type = lsc_subgrant_grant_type_id
		FROM LSC_WFTA_SUBGRANT
		WHERE wf_task_assignment_id = @WfTaskAssignmentID


--Create task assignment for OCE AA review only if it does not exist
 IF @OCEAAReviewWfTAID IS NULL
	BEGIN

	SELECT @wf_task_outcome_id = id
		FROM a_WF_TASK_OUTCOME
		WHERE task_id = @OCEAAReviewTaskID
			AND description = 'In Process'

	EXEC @OCEAAReviewWfTAID = getid_sel @table='WF_TASK_ASSIGNMENT',
		@mode = 2

	INSERT WF_TASK_ASSIGNMENT
		(wf_task_assignment_id,
		wf_task_id,
		wf_task_status_id,
		wf_task_outcome_id,
		due_date,
		grantee_project_id,
		workgroup_id,
		wf_task_role_id,
		create_date)
		SELECT @OCEAAReviewWfTAID,
			@OCEAAReviewTaskID,
			1,
			@wf_task_outcome_id,
			srdd.oce_aa_review_due,
			@grantee_project_id,
			6,
			7,
			getdate()
			FROM GRANTEE_PROJECT gp
				JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
				JOIN ADDRESS a ON o.organization_id = a.entity_id
					AND a.entity_type_id = 2
					AND a.is_primary = 1
				JOIN LSC_c_STATE_PROV lsp on a.state_province_id = lsp.state_province_id
				JOIN vLSC_SUBGRANT_REVIEW_DUE_DATES srdd ON gp.grantee_project_id = srdd.grantee_project_id
			WHERE gp.grantee_project_id = @grantee_project_id

   END
 ELSE
   BEGIN

     UPDATE WF_TASK_ASSIGNMENT
		SET wf_task_status_id = 1
		WHERE wf_task_assignment_id = @OCEAAReviewWfTAID

   END


--Create task assignment for OPP Staff review only if it does not exist
 IF @OPPStaffReviewWfTAID IS NULL
	BEGIN

	SELECT @wf_task_outcome_id = id
		FROM a_WF_TASK_OUTCOME
		WHERE task_id = @OPPStaffReviewTaskID
			AND description = 'In Process'

	EXEC @OPPStaffReviewWfTAID = getid_sel @table='WF_TASK_ASSIGNMENT',
		@mode = 2

	INSERT WF_TASK_ASSIGNMENT
		(wf_task_assignment_id,
		wf_task_id,
		wf_task_status_id,
		wf_task_outcome_id,
		due_date,
		grantee_project_id,
		person_id, ---workgroup_id,
		wf_task_role_id,
		create_date)
		SELECT @OPPStaffReviewWfTAID,
			@OPPStaffReviewTaskID,
			1,
			183,
			srdd.opp_staff_review_due,
			@grantee_project_id,
			CASE WHEN @grant_type = 4 THEN lor.tig_primary_reviewer_person_id ELSE lsp.cr_reviewer_person_id END,
			7,
			getdate()
			FROM GRANTEE_PROJECT gp
				JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
				JOIN ADDRESS a ON o.organization_id = a.entity_id
					AND a.entity_type_id = 2
					AND a.is_primary = 1
				JOIN LSC_c_STATE_PROV lsp on a.state_province_id = lsp.state_province_id
				JOIN vLSC_SUBGRANT_REVIEW_DUE_DATES srdd ON gp.grantee_project_id = srdd.grantee_project_id
				JOIN LSC_c_OPP_REGION lor ON lsp.opp_region_id = lor.id
			WHERE gp.grantee_project_id = @grantee_project_id

    END
 ELSE
    BEGIN

     UPDATE WF_TASK_ASSIGNMENT
		SET wf_task_status_id = 1
		WHERE wf_task_assignment_id = @OPPStaffReviewWfTAID

    END

set @status_id = 1
set @success = 1
set @status_message = 'SUCCESS'

select @status_id As StatusID, @success as Success, @status_message As StatusMessage


