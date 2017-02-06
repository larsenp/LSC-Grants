create view vFORM_NAME

as

select wfta.wf_task_assignment_id,
	lwft.form_number + 
		case when lwft.use_service_area_type = 0 then ''
			when sa.service_area_type_id = 1 then '(a)'
			when sa.service_area_type_id = 2 then '(b)'
			when sa.service_area_type_id = 3 then '(c)' end as full_form_number,
		lwft.form_name,
		case when lwft.use_service_area_type = 0 then ''
			else '- ' + sat.description end as serv_area_type_description,
		wcy.wfta_year
	from wf_task_assignment wfta
		join a_wf_task wft on wfta.wf_task_id = wft.id
		join LSC_a_WF_TASK lwft on wfta.wf_task_id = lwft.wf_task_id
		join vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join a_wf_project wfp on gp.wf_project_id = wfp.id
		join LSC_a_SERVICE_AREA sa on wfp.competition_id = sa.competition_id
		join LSC_c_SERVICE_AREA_TYPE sat on sa.service_area_type_id = sat.id
