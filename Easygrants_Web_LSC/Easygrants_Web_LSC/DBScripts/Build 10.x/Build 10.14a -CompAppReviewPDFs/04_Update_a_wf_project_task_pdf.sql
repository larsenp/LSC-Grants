

update a_wf_project_task_pdf
set final_pdf_report_key = 'CompAppStaffReviewCSR',
     description = 'Competition App Staff Review with CSR'
FROM a_wf_project_task wfpt
			join a_wf_task wft on wfpt.wf_task_id = wft.id
            join a_wf_project awfp on wfpt.wf_project_id = awfp.id
            join lsc_a_service_area sa on sa.competition_id = awfp.competition_id
            join lsc_c_service_area_type csa on csa.id = sa.service_area_type_id
            Left JOIN a_wf_project_task_pdf wfptp on wfpt.id = wfptp.wf_project_task_id
Where wft.id = 5 and
            awfp.time_period_id = 17 and csa.id = 1


update a_wf_project_task_pdf
set final_pdf_report_key = 'CompAppStaffReview',
     description = 'Competition App Staff Review without CSR'
FROM a_wf_project_task wfpt
			join a_wf_task wft on wfpt.wf_task_id = wft.id
            join a_wf_project awfp on wfpt.wf_project_id = awfp.id
            join lsc_a_service_area sa on sa.competition_id = awfp.competition_id
            join lsc_c_service_area_type csa on csa.id = sa.service_area_type_id
            Left JOIN a_wf_project_task_pdf wfptp on wfpt.id = wfptp.wf_project_task_id
Where wft.id = 5 and
            awfp.time_period_id = 17 and csa.id in (2,3)