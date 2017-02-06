CREATE VIEW vLSC_CURRENT_STAFF_COUNT

AS

WITH staff_curr (recipient_id , wfta_year )
	AS (SELECT cwosy.recipient_id
			,MAX(cwosy.wfta_year)
			FROM vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy
			WHERE wf_task_id = 25
				AND wf_task_status_id = 2
			GROUP BY cwosy.recipient_id
		)
	SELECT sc.recipient_id
		,o.organization_id
		,sc.wfta_year
		,tp.id time_period_id
		,jcoy.total
		FROM staff_curr sc
			JOIN ORGANIZATION o ON sc.recipient_id = o.legacy_organization_id
			JOIN [LSC-SQL].RINDB.dbo.vStaff_Job_Classifications_Org_Year jcoy ON sc.recipient_id = jcoy.orgid
				AND sc.wfta_year = jcoy.yearid
			JOIN c_TIME_PERIOD tp ON sc.wfta_year = tp.sort_order
