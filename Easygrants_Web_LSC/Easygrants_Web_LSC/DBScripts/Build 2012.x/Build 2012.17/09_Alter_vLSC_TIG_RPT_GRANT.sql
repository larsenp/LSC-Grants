/****** Object:  View [dbo].[vLSC_TIG_RPT_GRANT]    Script Date: 12/18/2012 11:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vLSC_TIG_RPT_GRANT]

AS

WITH latestpayment
	(grantee_project_id ,
	payment_date )
AS
	(SELECT grantee_project_id,
		MAX(payment_date)
		FROM payment
		WHERE payment_date IS NOT NULL
		GROUP BY grantee_project_id)

SELECT gp.grantee_project_id [Project ID]
	,gp.legacy_grant_id [TIG #]
	,tgt.description [TIG Grant Category]
	,gs.abbr [Status]
	,o.legacy_organization_id [Grantee #]
	,o.organization_name [Grantee]
	,sp.abbr [ST]
	,sp.description [State]
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
	,tbtsp.budget_total
	,tbtsp.grant_request
	,tbtsp.grant_request_pct
	,tbtsp.program_contribution
	,tbtsp.program_contribution_pct
	,tbtsp.lsc_partners
	,tbtsp.lsc_partners_pct
	,tbtsp.non_lsc
	,tbtsp.non_lsc_pct
	,lp.payment_date latest_payment_date
	FROM GRANTEE_PROJECT gp
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		LEFT JOIN LSC_GRANTEE_PROJECT_TIG gpt ON gp.grantee_project_id = gpt.grantee_project_id
		LEFT JOIN LSC_c_TIG_GRANT_TYPE tgt ON gpt.tig_grant_type_id = tgt.id
		JOIN c_GRANT_STATUS gs ON gp.grant_status_id = gs.id
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
		LEFT JOIN [ADDRESS] a ON o.organization_id = a.entity_id
			AND a.entity_type_id = 2
			AND a.is_primary = 1
		LEFT JOIN c_STATE_PROV sp ON a.state_province_id = sp.id
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
		LEFT JOIN LSC_TIG_BUDGET tb ON gp.grantee_project_id = tb.grantee_project_id
			AND tb.lsc_tig_budget_type_id = 1
		LEFT JOIN vLSC_TIG_BUDGET_TOTAL_SUBTOTAL_PCT tbtsp ON tb.lsc_tig_budget_id = tbtsp.lsc_tig_budget_id
		LEFT JOIN latestpayment lp ON gp.grantee_project_id = lp.grantee_project_id
	WHERE c.program_id = 2



