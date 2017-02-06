CREATE FUNCTION fnLSC_SUBGRANT_REQUEST_OPP_REVIEWER (@wf_task_assignment_id INT)
	RETURNS INT
	AS
	BEGIN
		DECLARE @state_prov_id INT, @grant_type_id INT, @reviewer_person_id INT

		SELECT @state_prov_id = a.state_province_id
			FROM WF_TASK_ASSIGNMENT wfta
				JOIN GRANTEE_PROJECT gp ON wfta.grantee_project_id = gp.grantee_project_id
				JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
				JOIN ADDRESS a ON o.organization_id = a.entity_id
					AND a.entity_type_id = 2
					AND a.is_primary = 1
			WHERE wfta.wf_task_assignment_id = @wf_task_assignment_id

		IF @state_prov_id IS NULL RETURN NULL

		SELECT @grant_type_id = lsc_subgrant_grant_type_id
			FROM LSC_WFTA_SUBGRANT
			WHERE wf_task_assignment_id = @wf_task_assignment_id

		IF @grant_type_id IN (1, 2, 3) --field grants
			SELECT @reviewer_person_id = cr_reviewer_person_id
				FROM LSC_c_STATE_PROV
				WHERE state_province_id = @state_prov_id

		IF @grant_type_id = 4 --TIG
			SELECT @reviewer_person_id = r.tig_primary_reviewer_person_id
				FROM LSC_c_OPP_REGION r
					JOIN LSC_c_STATE_PROV sp ON r.id = sp.opp_region_id
				WHERE sp.state_province_id = @state_prov_id

		IF @grant_type_id = 5 --PBIF
			SELECT @reviewer_person_id = r.pbif_reviewer_person_id
				FROM LSC_c_OPP_REGION r
					JOIN LSC_c_STATE_PROV sp ON r.id = sp.opp_region_id
				WHERE sp.state_province_id = @state_prov_id

		RETURN @reviewer_person_id
	END
