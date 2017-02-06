CREATE TABLE [dbo].[LSC_a_WF_TASK_UPLOAD](
	[id] [int] NOT NULL,
	[wf_task_id] [int] NULL,
	[upload_id] [int] NULL,
	[is_required] [bit] NULL,
	[general_upload] [bit] NULL,
 CONSTRAINT [PK_LSC_a_WF_TASK_UPLOAD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE #u
	(id INT IDENTITY(1,1)
	,wf_task_id INT
	,upload_id INT
	,is_required bit NULL
	,general_upload bit NULL)

INSERT #u
	(wf_task_id
	,upload_id
	,is_required 
	,general_upload)
	SELECT DISTINCT wfpt.wf_task_id
		,wfptu.upload_id
		,wfptu.is_required 
		,wfptu.general_upload
		FROM a_WF_PROJECT_TASK_UPLOAD wfptu
			JOIN a_WF_PROJECT_TASK wfpt on wfptu.wf_project_task_id = wfpt.id
			JOIN a_WF_PROJECT wfp on wfpt.wf_project_id = wfp.id
			JOIN a_COMPETITION c on wfp.competition_id = c.id
		WHERE wfp.time_period_id = 18
			AND c.program_id = 1
		ORDER BY wfpt.wf_task_id
			,wfptu.upload_id


INSERT LSC_a_WF_TASK_UPLOAD
	(id
	,wf_task_id
	,upload_id
	,is_required 
	,general_upload)
	SELECT 	id
		,wf_task_id
		,upload_id
		,is_required 
		,general_upload
		FROM #u

DROP TABLE #u

INSERT s_ID_GEN
	(table_name
	,next_id
	,is_code_table
	,lookup_table_type_id)
	SELECT 'LSC_a_WF_TASK_UPLOAD'
		,MAX(id) + 1
		,0
		,1
		FROM LSC_a_WF_TASK_UPLOAD
