DECLARE @wfp_id INT
	,@grantee_id INT
	,@person_id INT
	,@org_id INT
	,@gp_id INT
	,@gpi_id INT
	,@note_id INT

--LA-13
SELECT @wfp_id = id
	FROM a_WF_PROJECT
	WHERE description = 'LA-13 2014'

SELECT @grantee_id = grantee_id
	,@person_id = primary_person_id
	,@org_id = primary_organization_id
	FROM GRANTEE_PROJECT gp
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
	WHERE wfp.description = 'LA-1 2014'

EXEC @gp_id = getid_sel @table = 'GRANTEE_PROJECT'
	,@mode = 2

INSERT GRANTEE_PROJECT
	(grantee_project_id
	,grantee_id
	,wf_project_id
	,primary_person_id
	,primary_organization_id
	,grant_status_id
	,grant_award_date
	,create_date)
	VALUES
		(@gp_id
		,@grantee_id
		,@wfp_id
		,@person_id
		,@org_id
		,1
		,'2014-1-1'
		,GETDATE())

EXEC @gpi_id = getid_sel @table = 'GRANTEE_PROJECT_INFO'
	,@mode = 2

INSERT GRANTEE_PROJECT_INFO
	(grantee_project_info_id
	,grantee_project_id
	,award_amount
	,duration_start
	,duration_end
	,create_date)
	SELECT @gpi_id
		,@gp_id
		,f.fund_amount
		,'2014-1-1'
		,'2016-12-31'
		,GETDATE()
		FROM a_WF_PROJECT wfp
			JOIN a_FUND f ON wfp.fund_id = f.fund_id
		WHERE wfp.id = @wfp_id

EXEC @note_id = getid_sel @table = 'NOTES'
	,@mode = 2

INSERT NOTES
	(id
	,entity_id 
	,entity_type_id 
	,[subject] 
	,notes 
	,create_date)
	VALUES
		(@note_id
		,@gp_id
		,3
		,'Grant created due to service area merger'
		,'This grant was created as a result of the merger of service areas LA-1 and LA-12 into LA-13.'
		,GETDATE())

--MSX-2
SELECT @wfp_id = id
	FROM a_WF_PROJECT
	WHERE description = 'MSX-2 2014'

SELECT @grantee_id = grantee_id
	,@person_id = primary_person_id
	,@org_id = primary_organization_id
	FROM GRANTEE_PROJECT gp
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
	WHERE wfp.description = 'MTX 2014'

EXEC @gp_id = getid_sel @table = 'GRANTEE_PROJECT'
	,@mode = 2

INSERT GRANTEE_PROJECT
	(grantee_project_id
	,grantee_id
	,wf_project_id
	,primary_person_id
	,primary_organization_id
	,grant_status_id
	,grant_award_date
	,create_date)
	VALUES
		(@gp_id
		,@grantee_id
		,@wfp_id
		,@person_id
		,@org_id
		,1
		,'2014-1-1'
		,GETDATE())

EXEC @gpi_id = getid_sel @table = 'GRANTEE_PROJECT_INFO'
	,@mode = 2

INSERT GRANTEE_PROJECT_INFO
	(grantee_project_info_id
	,grantee_project_id
	,award_amount
	,duration_start
	,duration_end
	,create_date)
	SELECT @gpi_id
		,@gp_id
		,f.fund_amount
		,'2014-1-1'
		,'2014-12-31'
		,GETDATE()
		FROM a_WF_PROJECT wfp
			JOIN a_FUND f ON wfp.fund_id = f.fund_id
		WHERE wfp.id = @wfp_id

EXEC @note_id = getid_sel @table = 'NOTES'
	,@mode = 2

INSERT NOTES
	(id
	,entity_id 
	,entity_type_id 
	,[subject] 
	,notes 
	,create_date)
	VALUES
		(@note_id
		,@gp_id
		,3
		,'Grant created due to service area merger'
		,'This grant was created as a result of the merger of service areas MAL, MAR, MKY, MLA, MMS, MTN, and MTX into MSX-2.'
		,GETDATE())

