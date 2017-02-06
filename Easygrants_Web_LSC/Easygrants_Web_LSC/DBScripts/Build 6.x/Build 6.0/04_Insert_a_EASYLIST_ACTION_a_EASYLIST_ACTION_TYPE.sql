INSERT a_EASYLIST_ACTION
	(id, description, action_xml)
	VALUES(50, 'View Review Summary',
		'<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument Value=''ReviewSummaryRedirect''/><Argument Type=''Attribute'' AttributeName=''WfTaskAssignmentID'' PropertyKey=''WfTaskAssignmentID'' BaseValue=''WfTaskAssignmentID='' Value='''' /></Parameters></Action></Actions>')

UPDATE s_ID_GEN
	SET next_id = 51
	WHERE table_name = 'a_EASYLIST_ACTION'

INSERT a_EASYLIST_ACTION_TYPE
	(id, data_object_definition_key, easylist_action_id, sort_order)
	VALUES(98, 'Reviews', 50, 7)

UPDATE s_ID_GEN
	SET next_id = 99
	WHERE table_name = 'a_EASYLIST_ACTION_TYPE'
