/****** Object:  View [dbo].[vLSC_TIG_MASTER_QUERY]    Script Date: 02/14/2013 16:18:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vLSC_TIG_MASTER_QUERY]

AS

SELECT gp.grantee_project_id [Project ID]
	,gp.legacy_grant_id [TIG #]
	,tm_p.sort_order [Award Year]
	,tgt.description [TIG Grant Category]
	,gs.abbr [Status]
	,gp.primary_person_id [Contact ID]
	,p_p.name_first + ' ' + p_p.name_last [Grantee Contact]
	,ph_p.phone_number [Contact Phone]
	,e_p.email_addr [Contact Email]
	,o.legacy_organization_id [Grantee #]
	,o.organization_name [Grantee]
	,a.address_1 [Address 1]
	,a.address_2 [Address 2]
	,a.city [City]
	,sp.abbr [ST]
	,sp.description [State]
	,a.zip_postal_code [ZIP]
	,ph_op.phone_number [Phone]
	,ph_of.phone_number [Fax]
	,lor.abbr [OPP Team]
	,gp.grant_description [Grantee Grant Description]
	,gpt.purpose [Purpose]
	,gp.request_amount [Requested Amount]
	,wfta.submitted_date [Submission Date]
	,gp.grant_award_date [Award Date]
	,gpt.date_notified [Date Notified]
	,gpt.date_contr_recd [Grant Acceptance Received]
	,gpi.award_amount [Grant Amount]
	,tp.payment_amount [Paid] 
	,tp.payments_remaining_balance [Balance]
	,gpt.comments_updated [Staff Grant Description]
	,gpt.status_next_steps [Next Steps]
    ,gpi.duration_start [Start Date]
    ,gpi.duration_end [End date]
    ,go.abbr [Outcome]
	,p_s.name_first + ' ' + p_s.name_last [Primary Staff Contact]
	FROM GRANTEE_PROJECT gp
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		LEFT JOIN LSC_GRANTEE_PROJECT_TIG gpt ON gp.grantee_project_id = gpt.grantee_project_id
		LEFT JOIN LSC_c_TIG_GRANT_TYPE tgt ON gpt.tig_grant_type_id = tgt.id
		JOIN c_GRANT_STATUS gs ON gp.grant_status_id = gs.id
		JOIN PERSON p_p ON gp.primary_person_id = p_p.person_id
		LEFT JOIN PHONE ph_p ON p_p.person_id = ph_p.entity_id
			AND ph_p.entity_type_id = 1
			AND ph_p.is_primary = 1
		LEFT JOIN EMAIL e_p ON p_p.person_id = e_p.entity_id
			AND e_p.entity_type_id = 1
			AND e_p.is_primary = 1
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
		LEFT JOIN [ADDRESS] a ON o.organization_id = a.entity_id
			AND a.entity_type_id = 2
			AND a.is_primary = 1
		LEFT JOIN c_STATE_PROV sp ON a.state_province_id = sp.id
		LEFT JOIN PHONE ph_op ON o.organization_id = ph_op.entity_id
			AND ph_op.entity_type_id = 2
			AND ph_op.is_primary = 1
		LEFT JOIN PHONE ph_of ON o.organization_id = ph_of.entity_id
			AND ph_of.entity_type_id = 2
			AND ph_of.[type_id] = 4
		LEFT JOIN LSC_c_STATE_PROV lsp ON sp.id = lsp.state_province_id
		LEFT JOIN LSC_c_OPP_REGION lor ON lsp.opp_region_id = lor.id
		LEFT JOIN WF_TASK_ASSIGNMENT wfta ON gp.grantee_project_id = wfta.grantee_project_id
			AND wfta.wf_task_id in (41, 42)
			AND wfta.wf_task_status_id <> 3
		LEFT JOIN GRANTEE_PROJECT_INFO gpi ON gp.grantee_project_id = gpi.grantee_project_id
		LEFT JOIN vTOTAL_PAYMENT tp ON gp.grantee_project_id = tp.grantee_project_id
        LEFT JOIN c_GRANT_OUTCOME go ON gp.wf_project_outcome_id = go.id 
		LEFT JOIN GRANTEE_PROJECT_STAFF_AFFILIATION gpsa ON gp.grantee_project_id = gpsa.grantee_project_id
			AND gpsa.is_primary = 1
		LEFT JOIN PERSON p_s ON gpsa.person_id = p_s.person_id
		JOIN c_TIME_PERIOD tm_p ON wfp.time_period_id = tm_p.id
	WHERE c.program_id = 2


