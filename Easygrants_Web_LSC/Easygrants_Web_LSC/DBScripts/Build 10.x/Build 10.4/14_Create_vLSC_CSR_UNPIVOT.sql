--Normalize CSR data for use in data cube

CREATE VIEW vLSC_CSR_UNPIVOT

AS

select organization_id,
	competition_id,
	time_period_id,
	wf_task_assignment_id, 
	lsc_case_type_id,
	lsc_attorney_pai_status_id,
	closure_type,
	case_count
	from (select cwosy.organization_id,
			cwosy.competition_id,
			cwosy.time_period_id,
			csr.wf_task_assignment_id,
			csr.lsc_case_type_id,
			csr.lsc_attorney_pai_status_id,
			csr.A,
			csr.B,
			csr.C,
			csr.D,
			csr.E,
			csr.F,
			csr.G,
			csr.H,
			csr.I,
			csr.Ia,
			csr.Ib,
			csr.Ic,
			csr.J,
			csr.K,
			csr.L
			from lsc_csr csr
				join vlsc_comp_wfta_org_servarea_year cwosy on csr.wf_task_assignment_id = cwosy.wf_task_assignment_id) csr
	unpivot
		(case_count for closure_type in
			(A, B, C, D, E, F, G, H, I, Ia, Ib, Ic, J, K, L)) as normal
