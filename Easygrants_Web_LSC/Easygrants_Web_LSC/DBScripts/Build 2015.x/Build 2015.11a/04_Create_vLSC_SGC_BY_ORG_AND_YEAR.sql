CREATE VIEW vLSC_SGC_BY_ORG_AND_YEAR

AS

SELECT cwosy.recipient_id
	,cwosy.wfta_year
    ,SUM(CASE cwosy.wf_task_id
      WHEN 56 THEN CAST(lra.special_grant AS INT)
      WHEN 57 THEN CAST(lrr.special_conditions_YesNo AS INT) END) [SGC Sum]
	FROM vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy
		JOIN WF_TASK_ASSIGNMENT wfta ON cwosy.wf_task_assignment_id = wfta.wf_task_assignment_id
		LEFT JOIN [LSC-EGSQL].Easygrants.dbo.Lsc_Review_Application lra ON cwosy.wf_task_assignment_id = lra.wf_task_assignment_id
		LEFT JOIN [LSC-EGSQL].Easygrants.dbo.LSC_renewal_rec lrr ON cwosy.wf_task_assignment_id = lrr.wf_task_assignment_id
    WHERE ((cwosy.wf_task_id = 56 AND wfta.wf_task_outcome_id = 128)
            OR (cwosy.wf_task_id = 57 AND lrr.lsc_renewal_recommendation_id in (1,2)))
        AND cwosy.wf_task_status_id = 2
	GROUP BY cwosy.recipient_id
		,cwosy.wfta_year
