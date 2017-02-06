CREATE TABLE #wfta
	(ident int identity(0,1)
	,wf_task_assignment_id int
	,wf_task_id int
	,wf_task_status_id int
	,wf_task_outcome_id int
	,grantee_project_id int
	,person_id int
	,wf_task_role_id int
	,create_date datetime)

INSERT #wfta
	(wf_task_id
	,wf_task_status_id
	,wf_task_outcome_id
	,grantee_project_id
	,person_id
	,wf_task_role_id
	,create_date)
	SELECT 115
		,1
		,276
		,gp.grantee_project_id
		,gp.primary_person_id
		,1
		,GETDATE()
	FROM GRANTEE_PROJECT gp
		JOIN a_WF_PROJECT wfp on gp.wf_project_id = wfp.id
	WHERE wfp.competition_id = 460
		AND wfp.time_period_id = 19
		AND gp.grant_status_id = 6
	
DECLARE @rowcount INT
	,@first_id INT

SELECT @rowcount = COUNT(*)
	FROM #wfta

EXEC @first_id = spGETID_RANGE_SEL
   @table = 'WF_TASK_ASSIGNMENT'
  ,@count = @rowcount
  ,@mode = 2

UPDATE #wfta
	SET wf_task_assignment_id = ident + @first_id

INSERT WF_TASK_ASSIGNMENT
	(wf_task_assignment_id
	,wf_task_id
	,wf_task_status_id
	,wf_task_outcome_id
	,grantee_project_id
	,person_id
	,wf_task_role_id
	,create_date)
	SELECT wf_task_assignment_id
		,wf_task_id
		,wf_task_status_id
		,wf_task_outcome_id
		,grantee_project_id
		,person_id
		,wf_task_role_id
		,create_date
		FROM #wfta

SELECT * FROM #wfta
DROP TABLE #wfta
