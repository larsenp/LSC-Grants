INSERT INTO a_EASYLIST_ACTION
		    (id
			,description
		    ,action_xml)
	VALUES
            (1001
		    ,'Printable View'
            ,'<Actions><Action Object=''DataPresenter'' Method=''LSC_EventController_NavigateFromModulePageKey_NewWindowOpener''><Parameters><Argument AttributeName=''PrintPageKey'' Type=''DataObject'' TypeKey=''PrintPageKey'' BaseValue=''Page='' /><Argument Value=''PageFrame=Print'' /><Argument AttributeName=''WfTaskAssignmentID'' Type=''DataObject'' TypeKey=''WfTaskAssignmentID'' BaseValue=''WfTaskAssignmentID='' /></Parameters></Action></Actions> ')


INSERT INTO a_EASYLIST_ACTION_TYPE
			(id
			,data_object_definition_key
			,easylist_action_id
			,sort_order)
	VALUES
			(1001
			,'GARTracking'
			,1001
			,1)

----Inserting Rows for 'Editable View' drop down

INSERT INTO a_EASYLIST_ACTION
		    (id
			,description
		    ,action_xml)
	VALUES
            (1002
		    ,'Editable View'
		    ,'<Actions><Action Object=''EventController'' Method=''EventController_NavigateToModulePageKey''><Parameters><Argument AttributeName=''EditablePageKey'' Type=''DataObject'' TypeKey=''EditablePageKey'' /><Argument AttributeName=''WfTaskAssignmentID'' Type=''DataObject'' TypeKey=''WfTaskAssignmentID'' BaseValue=''WfTaskAssignmentID='' /></Parameters></Action></Actions>')

INSERT INTO a_EASYLIST_ACTION_TYPE
			(id
			,data_object_definition_key
			,easylist_action_id
			,sort_order)
	VALUES
			(1002
			,'GARTracking'
			,1002
			,2)

----Inserting Rows for 'Submit/UnSubmit' drop down

INSERT INTO a_EASYLIST_ACTION
		    (id
			,description
		    ,action_xml)
	VALUES
            (1003
		    ,'Submit/UnSubmit'
		    ,'<Actions><Action Object=''EventController'' Method=''Submit_UnSubmit''><Parameters><Argument AttributeName=''WfTaskAssignmentID'' Type=''DataObject'' TypeKey=''WfTaskAssignmentID'' /></Parameters></Action></Actions> ')



INSERT INTO a_EASYLIST_ACTION_TYPE
			(id
			,data_object_definition_key
			,easylist_action_id
			,sort_order)
	VALUES
			(1003
			,'GARTracking'
			,1003
			,3)


----Inserting row for 'Login as this user'
INSERT INTO a_EASYLIST_ACTION_TYPE
			(id
			,data_object_definition_key
			,easylist_action_id
			,sort_order)
	VALUES
			(1004
			,'GARTracking'
			,11
			,4)

----Inserting row for 'Task - Edit this Task'
INSERT INTO a_EASYLIST_ACTION_TYPE
			(id
			,data_object_definition_key
			,easylist_action_id
			,sort_order)
	VALUES
			(1005
			,'GARTracking'
			,1
			,5)


--select * from a_EASYLIST_ACTION

--select * from a_EASYLIST_ACTION_TYPE




