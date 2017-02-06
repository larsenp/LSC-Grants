--Get list of old grantee project IDs
SELECT gp.grantee_project_id
	INTO #gp
	FROM GRANTEE_PROJECT gp
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
	WHERE gp.grant_status_id = 1
		AND c.abbr IN ('LA-1', 'LA-12', 'MAL', 'MAR', 'MKY', 'MLA', 'MMS', 'MTN', 'MTX')
		AND c.program_id = 1

--Add grant status history
CREATE TABLE #gsh
	(ident INT IDENTITY(0,1)
	,grant_status_history_id INT
	,grantee_project_id INT
	,grant_status_id INT
	,create_date DATETIME)

INSERT #gsh
	(grantee_project_id 
	,grant_status_id 
	,create_date )
	SELECT #gp.grantee_project_id
		,1
		,getdate()
		FROM #gp

DECLARE @rowcount INT
	,@first_new_id INT

SELECT @rowcount = COUNT(*)
	FROM #gsh

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'GRANT_STATUS_HISTORY'
	,@count = @rowcount

UPDATE #gsh
	SET grant_status_history_id = ident + @first_new_id

INSERT GRANT_STATUS_HISTORY
	(grant_status_history_id
	,grantee_project_id 
	,grant_status_id 
	,create_date)
	SELECT grant_status_history_id
		,grantee_project_id 
		,grant_status_id 
		,create_date
		FROM #gsh

--Update grant status
UPDATE GRANTEE_PROJECT
	SET grant_status_id = 4
	WHERE grantee_project_id IN
		(SELECT grantee_project_id
			FROM #gp)

--Notes
CREATE TABLE #n
	(ident INT IDENTITY(0,1)
	,id INT
	,entity_id INT
	,entity_type_id INT
	,[subject] VARCHAR(250)
	,notes VARCHAR(MAX)
	,create_date DATETIME)

INSERT #n
	(entity_id
	,entity_type_id
	,[subject])
	SELECT grantee_project_id
		,3
		,'Grant closed due to service area merger'
		FROM #gp

UPDATE #n
	SET notes = 'This grant was merged into new service area LA-13.'
	FROM #n
		JOIN GRANTEE_PROJECT gp ON #n.entity_id = gp.grantee_project_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
	WHERE wfp.description LIKE '%LA%'

UPDATE #n
	SET notes = 'This grant was merged into new service area MSX-2.'
	FROM #n
		JOIN GRANTEE_PROJECT gp ON #n.entity_id = gp.grantee_project_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
	WHERE wfp.description LIKE 'M%'

SELECT @rowcount = COUNT(*)
	FROM #n

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'NOTES'
	,@count = @rowcount

UPDATE #n
	SET id = ident + @first_new_id

INSERT NOTES
	(id
	,entity_id 
	,entity_type_id 
	,[subject] 
	,notes 
	,create_date)
	SELECT id
		,entity_id 
		,entity_type_id 
		,[subject] 
		,notes 
		,create_date
		FROM #n

SELECT * FROM #gp
DROP TABLE #gsh
DROP TABLE #n
DROP TABLE #gp
