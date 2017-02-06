DECLARE @recipient_id INT
SET @recipient_id = 123456

DECLARE @org_id INT

EXEC @org_id = getid_sel @table='ORGANIZATION', @mode = 2

INSERT ORGANIZATION
    (organization_id
    ,organization_name
    ,legacy_organization_id
    ,common_organization_name
    ,available_in_selector)
    VALUES
        (@org_id
        ,'Test Grantee'
        ,@recipient_id
        ,'Test Grantee'
        ,1)

DECLARE @person_id INT

EXEC @person_id = getid_sel @table='PERSON', @mode = 2

INSERT PERSON
    (person_id
    ,name_last
    ,name_first)
    VALUES
        (@person_id
        ,'User'
        ,'Test')

DECLARE @user_id INT

EXEC @user_id = getid_sel @table='EASYGRANTS_USER', @mode = 2

INSERT EASYGRANTS_USER
	(easygrants_user_id
	,person_id
	,login_username
	,login_password
	,user_type_id) 
	VALUES
		(@user_id
		,@person_id
		,'test@test.abc'
		,'test'
		,1)

DECLARE @proj_id INT

SELECT TOP 1 @proj_id = wfp.id
    FROM a_COMPETITION c
        JOIN a_WF_PROJECT wfp ON wfp.competition_id = c.id
            AND c.program_id = 1
            AND wfp.start_date < getdate()
            AND wfp.end_date > getdate()
        LEFT JOIN GRANTEE_PROJECT gp ON wfp.id = gp.wf_project_id
            AND gp.grant_status_id = 1
    GROUP BY wfp.id

DECLARE @grantee_id INT

EXEC @grantee_id = getid_sel @table='GRANTEE', @mode = 2

INSERT GRANTEE
    (grantee_id
    ,entity_id
    ,entity_type_id)
    VALUES
        (@grantee_id
        ,@org_id
        ,2)

DECLARE @gp_id INT

EXEC @gp_id = getid_sel @table='GRANTEE_PROJECT', @mode = 2

INSERT GRANTEE_PROJECT
    (grantee_project_id
    ,grantee_id
    ,wf_project_id
    ,primary_person_id
    ,primary_organization_id
    ,grant_status_id)
    VALUES
        (@gp_id
        ,@grantee_id
        ,@proj_id
        ,@person_id
        ,@org_id
        ,1)

SELECT * FROM GRANTEE_PROJECT
    WHERE grantee_project_id = @gp_id 