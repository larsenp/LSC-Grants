CREATE VIEW [dbo].[vLSC_FIELD_GRANT_AWARD_MONTHS]

AS

SELECT cwosy.wf_task_assignment_id
	,cwosy.recipient_id
	,cwosy.wfta_year
	,cwosy.serv_area
	,CASE cwosy.wf_task_id
		WHEN 56 THEN ft.months
		WHEN 57 THEN 12 END total_months
	,CASE cwosy.wf_task_id
		WHEN 56 THEN 
			CASE WHEN ft.months > 12 THEN 12
				ELSE ft.months END
		WHEN 57 THEN 12 END months_for_award
	FROM [LSC-EGSQL].Easygrants.dbo.vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy
		JOIN [LSC-EGSQL].Easygrants.dbo.WF_TASK_ASSIGNMENT wfta ON cwosy.wf_task_assignment_id = wfta.wf_task_assignment_id
		LEFT JOIN [LSC-EGSQL].Easygrants.dbo.Lsc_Review_Application lra ON cwosy.wf_task_assignment_id = lra.wf_task_assignment_id
		LEFT JOIN [LSC-EGSQL].Easygrants.dbo.LSC_renewal_rec lrr ON cwosy.wf_task_assignment_id = lrr.wf_task_assignment_id
		LEFT JOIN [LSC-EGSQL].Easygrants.dbo.LSC_c_FUNDING_TERM ft ON lra.lsc_funding_term_id = ft.id
    WHERE ((cwosy.wf_task_id = 56 AND wfta.wf_task_outcome_id = 128)
            OR (cwosy.wf_task_id = 57 AND lrr.lsc_renewal_recommendation_id in (1,2)))
        AND cwosy.wf_task_status_id = 2
