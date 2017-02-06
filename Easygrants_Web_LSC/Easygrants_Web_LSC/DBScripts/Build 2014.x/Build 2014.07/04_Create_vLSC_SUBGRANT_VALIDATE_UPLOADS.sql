CREATE VIEW vLSC_SUBGRANT_VALIDATE_UPLOADS

AS

select ws.lsc_wfta_subgrant_id
	,ws.is_renewal
	,sf_a.submitted_file_id submitted_file_id_a
	,sf_b.submitted_file_id submitted_file_id_b
	,sf_c.submitted_file_id submitted_file_id_c
	from lsc_wfta_subgrant ws
		left join (
			submitted_file sf_a 
				join a_wf_project_task_upload wfptu_a on sf_a.upload_id = wfptu_a.wf_project_task_upload_id
		) on ws.wf_task_assignment_id = sf_a.entity_id
			and sf_a.entity_dataobject_key = 'WfTaskAssignment'
			and wfptu_a.upload_id = 68
		left join (
			submitted_file sf_b
				join a_wf_project_task_upload wfptu_b on sf_b.upload_id = wfptu_b.wf_project_task_upload_id
		) on ws.wf_task_assignment_id = sf_b.entity_id
			and sf_b.entity_dataobject_key = 'WfTaskAssignment'
			and wfptu_b.upload_id = 66
		left join (
			submitted_file sf_c
				join a_wf_project_task_upload wfptu_c on sf_c.upload_id = wfptu_c.wf_project_task_upload_id
		) on ws.wf_task_assignment_id = sf_c.entity_id
			and sf_c.entity_dataobject_key = 'WfTaskAssignment'
			and wfptu_c.upload_id = 67
