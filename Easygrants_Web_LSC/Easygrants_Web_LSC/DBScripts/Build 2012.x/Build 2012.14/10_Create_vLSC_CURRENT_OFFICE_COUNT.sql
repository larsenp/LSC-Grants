CREATE VIEW vLSC_CURRENT_OFFICE_COUNT

AS

WITH off_curr (organization_id , wfta_year )
	AS (SELECT cwosy.organization_id
			,MAX(cwosy.wfta_year)
			FROM vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy
			WHERE wf_task_id = 24
				AND wf_task_status_id = 2
			GROUP BY cwosy.organization_id
		)
	SELECT oc.organization_id
		,o.time_period_id
		,SUM(CASE WHEN o.off_Type_id = 1 THEN 1 ELSE 0 END) main
		,SUM(CASE WHEN o.off_Type_id = 2 THEN 1 ELSE 0 END) branch
		,SUM(CASE WHEN o.off_Type_id = 3 THEN 1 ELSE 0 END) subgrantee
		,COUNT(*) total
		FROM off_curr oc
			JOIN c_TIME_PERIOD tp ON oc.wfta_year = tp.sort_order
			JOIN LSC_OFFICE o ON oc.organization_id = o.organization_id
				AND tp.id = o.time_period_id
		GROUP BY oc.organization_id
			,o.time_period_id
