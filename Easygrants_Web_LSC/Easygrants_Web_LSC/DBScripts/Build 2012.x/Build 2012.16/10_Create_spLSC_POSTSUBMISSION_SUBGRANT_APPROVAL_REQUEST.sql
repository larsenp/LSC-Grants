CREATE PROCEDURE [dbo].[spLSC_POSTSUBMISSION_SUBGRANT_APPROVAL_REQUEST]
	@WfTaskAssignmentID INT  
AS

DECLARE @status_id INT, @success BIT, @status_message VARCHAR(250)

DECLARE 
	@grantee_project_id INT,
    @new_id INT

   SELECT @grantee_project_id = grantee_project_id
	FROM WF_TASK_ASSIGNMENT
	WHERE wf_task_assignment_id = @WfTaskAssignmentID

	--Create task assignment for OCE AA review
	EXEC @new_id = getid_sel @table='WF_TASK_ASSIGNMENT',
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
		SELECT @new_id,
			64,
			1,
			141,
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


	--Create task assignment for OPP Staff review
	EXEC @new_id = getid_sel @table='WF_TASK_ASSIGNMENT',
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
		SELECT @new_id,
			84,
			1,
			183,
			srdd.opp_staff_review_due,
			@grantee_project_id,
			lsp.cr_reviewer_person_id,
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

set @status_id = 1
set @success = 1
set @status_message = 'SUCCESS'

select @status_id As StatusID, @success as Success, @status_message As StatusMessage
