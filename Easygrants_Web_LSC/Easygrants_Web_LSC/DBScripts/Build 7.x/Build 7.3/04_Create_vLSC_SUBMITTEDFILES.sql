/****** Object:  View [dbo].[vSUBMITTEDFILES]    Script Date: 12/22/2009 17:59:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_SUBMITTEDFILES]
AS
SELECT DISTINCT sf.submitted_file_id, sf.entity_id, gp.grantee_project_id, ft.file_type_id, sf.entity_dataobject_key, dbo.a_UPLOAD.upload_name
FROM         dbo.SUBMITTED_FILE AS sf INNER JOIN
dbo.WF_TASK_ASSIGNMENT AS wfta ON wfta.wf_task_assignment_id = sf.entity_id INNER JOIN
dbo.GRANTEE_PROJECT AS gp ON gp.grantee_project_id = wfta.grantee_project_id LEFT OUTER JOIN
dbo.FILE_TYPE AS ft ON sf.file_type_id = ft.file_type_id INNER JOIN
dbo.a_WF_PROJECT_TASK_UPLOAD ON dbo.a_WF_PROJECT_TASK_UPLOAD.wf_project_task_upload_id = sf.upload_id INNER JOIN
dbo.a_UPLOAD ON dbo.a_WF_PROJECT_TASK_UPLOAD.upload_id = dbo.a_UPLOAD.upload_id
WHERE     (sf.conversion_status = - 1) AND (sf.entity_dataobject_key = 'WfTaskAssignment')
UNION
SELECT DISTINCT sf.submitted_file_id, sf.entity_id, gp.grantee_project_id, ft.file_type_id, sf.entity_dataobject_key, ft.descript AS upload_name
FROM         dbo.SUBMITTED_FILE AS sf INNER JOIN
dbo.GRANTEE_PROJECT AS gp ON gp.grantee_project_id = sf.entity_id LEFT OUTER JOIN
dbo.FILE_TYPE AS ft ON sf.file_type_id = ft.file_type_id
WHERE     (sf.conversion_status = - 1) AND (ft.entity_dataobject_key = 'GranteeProject')
UNION
SELECT DISTINCT sf.submitted_file_id, sf.entity_id, gp.grantee_project_id, ft.file_type_id, sf.entity_dataobject_key, ft.descript AS upload_name
FROM         dbo.SUBMITTED_FILE AS sf INNER JOIN
dbo.LSC_MILESTONE m ON sf.entity_id = m.lsc_milestone_id INNER JOIN
dbo.PAYMENT_CONTINGENCY_TASKS pct ON m.payment_id = pct.payment_id INNER JOIN
dbo.WF_TASK_ASSIGNMENT wfta ON pct.contingency_task_assignment_id = wfta.wf_task_assignment_id INNER JOIN
dbo.GRANTEE_PROJECT AS gp ON gp.grantee_project_id = wfta.grantee_project_id LEFT OUTER JOIN
dbo.FILE_TYPE AS ft ON sf.file_type_id = ft.file_type_id
WHERE     (sf.entity_dataobject_key = 'LscMilestone')
