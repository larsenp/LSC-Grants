CREATE PROCEDURE spLSC_ASSIGN_RECIPIENT_ID
	(@wf_task_assignment_id int)

AS

DECLARE @organization_id INT,
	@state_code INT,
	@recipient_id INT

BEGIN TRAN
	SET @recipient_id = -1

	SELECT @organization_id = o.organization_id,
		@state_code = 100000*CAST(lsp.region_code AS INT) + 1000*CAST(lsp.state_code AS INT)
		FROM WF_TASK_ASSIGNMENT wfta
			JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
			JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
			JOIN PERSON p ON gp.primary_person_id = p.person_id
			JOIN ADDRESS a ON p.person_id = a.entity_id
				AND a.entity_type_id = 1
				AND a.is_primary = 1
			JOIN LSC_c_STATE_PROV lsp ON a.state_province_id = lsp.state_province_id
		WHERE wfta.wf_task_assignment_id = @wf_task_assignment_id

	SELECT @recipient_id = legacy_organization_id
		FROM ORGANIZATION
		WHERE organization_id = @organization_id

	IF @recipient_id <> -1
		RETURN @recipient_id

	SELECT @recipient_id = max(legacy_organization_id) + 1
		FROM ORGANIZATION
		WHERE legacy_organization_id >= @state_code
			and legacy_organization_id < @state_code + 1000

	IF @recipient_id <> -1
		UPDATE ORGANIZATION
			SET legacy_organization_id = @recipient_id
			WHERE organization_id = @organization_id

COMMIT TRAN

RETURN @recipient_id

