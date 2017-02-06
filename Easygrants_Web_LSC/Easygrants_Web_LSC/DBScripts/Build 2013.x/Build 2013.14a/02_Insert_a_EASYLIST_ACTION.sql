DECLARE @action_id int, @action_type_id int

EXEC @action_id = getid_sel @table = 'a_EASYLIST_ACTION'

INSERT a_EASYLIST_ACTION
	(id
	,description
	,action_xml)
	VALUES
		(@action_id
		,'Grant Info'
		,'<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''GrantsEditor''/><Argument Type=''AttributeRelatedProperty'' AttributeName=''WfTaskAssignmentID'' DataObjectDefinitionKey=''WfTaskAssignment'' PropertyKey=''GranteeProject.GranteeProjectID'' BaseValue=''GranteeProjectID='' Value='''' /></Parameters></Action></Actions>')


EXEC @action_type_id = getid_sel @table = 'a_EASYLIST_ACTION_TYPE'

INSERT a_EASYLIST_ACTION_TYPE
    (id
    ,data_object_definition_key
    ,easylist_action_id
    ,sort_order)
    VALUES
        (@action_type_id
        ,'Reviews'
        ,@action_id
        ,8)

