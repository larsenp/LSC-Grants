CREATE TABLE #wfta 
	(ident int identity(0,1),
	[wf_task_assignment_id] [int],
	[wf_task_id] [int],
	[wf_task_status_id] [int] ,
	[wf_task_outcome_id] [int],
	[grantee_project_id] [int],
	[person_id] [int],
	[wf_task_role_id] [int],
	[create_date] [datetime])

INSERT #wfta
	(wf_task_id
	,wf_task_status_id
	,wf_task_outcome_id
	,grantee_project_id
	,person_id
	,wf_task_role_id
	,create_date)
	SELECT 102
		,1
		,236
		,MIN(cwosy.grantee_project_id)
		,MIN(wfta.person_id)
		,1
		,GETDATE()
		FROM vLSC_COMP_WFTA_ORG_SERVAREA_YEAR cwosy
			JOIN WF_TASK_ASSIGNMENT wfta ON cwosy.wf_task_assignment_id = wfta.wf_task_assignment_id
		WHERE cwosy.wfta_year = 2015
			AND cwosy.wf_task_id IN (2,66)
		GROUP BY cwosy.recipient_id

DECLARE @rowcount INT, @new_id INT

SELECT @rowcount = COUNT(*) 
	FROM #wfta

EXEC @new_id = spGETID_RANGE_SEL
	@table = 'WF_TASK_ASSIGNMENT'
	,@mode = 2

UPDATE #wfta
	SET wf_task_assignment_id = ident + @new_id

INSERT WF_TASK_ASSIGNMENT
	([wf_task_assignment_id],
	[wf_task_id],
	[wf_task_status_id],
	[wf_task_outcome_id],
	[grantee_project_id],
	[person_id],
	[wf_task_role_id],
	[create_date])
	SELECT [wf_task_assignment_id],
		[wf_task_id],
		[wf_task_status_id],
		[wf_task_outcome_id],
		[grantee_project_id],
		[person_id],
		[wf_task_role_id],
		[create_date]
		FROM #wfta

SELECT * FROM #wfta

DROP TABLE #wfta
