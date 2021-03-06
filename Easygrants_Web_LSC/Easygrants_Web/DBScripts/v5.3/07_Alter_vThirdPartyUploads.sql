ALTER VIEW [dbo].[vThirdPartyUploads]
AS
SELECT     sf.submitted_file_id, sf.entity_id, gp.grantee_project_id, ft.file_type_id, sf.entity_dataobject_key, sf.upload_id, sf.sharepoint_conversion_status, 
                      sf.source_filename, sf.file_name_prefix
FROM         SUBMITTED_FILE AS sf INNER JOIN
                      WF_TASK_ASSIGNMENT AS wfta ON wfta.wf_task_assignment_id = sf.entity_id INNER JOIN
                      GRANTEE_PROJECT AS gp ON gp.grantee_project_id = wfta.grantee_project_id INNER JOIN
                      a_WF_TASK AS wt ON wfta.wf_task_id = wt.id LEFT OUTER JOIN
                      a_WF_TASK_TYPE AS tt ON wt.wf_task_type_id = tt.id LEFT OUTER JOIN
                      FILE_TYPE AS ft ON sf.file_type_id = ft.file_type_id
WHERE     (tt.id = 6) AND (sf.conversion_status = - 1) AND (sf.entity_dataobject_key = 'WfTaskAssignment')

GO