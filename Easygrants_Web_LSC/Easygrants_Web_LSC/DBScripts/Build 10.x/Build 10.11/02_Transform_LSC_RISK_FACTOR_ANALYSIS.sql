UPDATE LSC_RISK_FACTOR_ANALYSIS
	SET organization_id = cwosy.organization_id,
		time_period_id = cwosy.time_period_id
	FROM LSC_RISK_FACTOR_ANALYSIS rfa
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy on rfa.wf_task_assignment_id = cwosy.wf_task_assignment_id
