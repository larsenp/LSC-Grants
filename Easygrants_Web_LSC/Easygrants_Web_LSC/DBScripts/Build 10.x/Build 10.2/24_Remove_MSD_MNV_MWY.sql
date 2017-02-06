DELETE WF_TASK_ASSIGNMENT
	FROM WF_TASK_ASSIGNMENT wfta
		JOIN vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy ON wfta.wf_task_assignment_id = cwosy.wf_task_assignment_id
	WHERE wfta.wf_task_id in (4,67)
		AND cwosy.wfta_year = 2012
		AND cwosy.serv_area in ('MSD','MNV','MWY')

update lsc_a_service_area 
	set lsc_service_area_status_id = 2
	where competition_id in (80, 84, 184)