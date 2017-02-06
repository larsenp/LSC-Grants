Imports System.Diagnostics
Imports System.Web.UI
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web
Imports EasyGrants.Web.User

Namespace Implementation.Modules.Home.Controls.Page
Public MustInherit Class cApplyGrantContent
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

	'Protected ctlWfProject As cRadioButtonList
    Protected ctlGrantTitle As cTextBox
    Protected ctlShortTitle As cTextBox
    Protected ctlExemptOrga As cPopUpSelectorLauncher
    Protected ctlNotInList as cCheckBox
    Protected ctlEIN as cTextBox
    Protected ctlOrganizationName as cTextBox
    
    Protected valExemptOrgName As CustomValidator
	Protected ValidatePrimaryOrgName As CustomValidator
	Protected ctlWfProjectDataList As cDataListCtl
	Protected aRadioHash As Hashtable

'=============================================================
	

'=============================================================
	

		Public Sub RedirectToModule(ByVal aUserDataObject As cDataObject, ByVal aModuleName As String, ByVal aModuleConfig As String, ByVal aPageKey As String, ByVal aWfTaskAssignmentID As String)

			Dim aUser As cEGUser
			Dim aRadio As cRadioButton
			Dim aSelectedProjectID As Integer
			Dim myEnumerator As IDictionaryEnumerator
			aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)

			ctlWfProjectDataList = FindControl("ctlWfProjectDataList")
			aRadioHash = ctlWfProjectDataList.DataListCtl_GetControlCollection("ctlWfProject")

			myEnumerator = aRadioHash.GetEnumerator()
				While myEnumerator.MoveNext()
					aRadio = CType(myEnumerator.Value, cRadioButton)
					If (Not aRadio Is Nothing) And (aRadio.BaseRadioButton.Checked) Then
						aSelectedProjectID = aRadio.Value
						Exit While
					End If
				End While

			If aSelectedProjectID = 0 Then
				Exit Sub
			End If

			'Construct Grantee data object node
			Dim aXmlDoc As cXMLDoc
			Dim aDataObjectNode As XmlNode
			Dim aFiltersNode As XmlNode
			Dim aRoleDataObject As cDataObject

			'Create Grantee object for User
			Dim aGranteeDataObject As cDataObject
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Grantee", aDataObjectNode, aFiltersNode)
			aGranteeDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
			aGranteeDataObject("EntityID") = aUser.PersonID
			aGranteeDataObject("EntityTypeID") = 1 'Person
			WebSession.DataObjectFactory.SaveDataObject(aGranteeDataObject)

			Dim aGranteeProjectDataObject As cDataObject
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("GranteeProject", aDataObjectNode, aFiltersNode)
			aGranteeProjectDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
			aGranteeProjectDataObject("GranteeID") = aGranteeDataObject("GranteeID")
			'ctlWfProject = CType(Me.FindControl("ctlWfProject"), cRadioButtonList)
			aGranteeProjectDataObject("WfProjectID") = aSelectedProjectID
			aGranteeProjectDataObject("PrimaryPersonID") = aUser.PersonID
			aGranteeProjectDataObject("GrantStatusID") = 2
			aGranteeProjectDataObject("CreateUser") = WebSession.DataObjectFactory.User.UserID
			aGranteeProjectDataObject("CreateDate") = System.DateTime.Now
			WebSession.DataObjectFactory.SaveDataObject(aGranteeProjectDataObject)

			'Commented by Rajani Nandella on 10/12/2007 - not used
			'Create Budget record
			'Dim aBudgetDO As cDataObject
			'aBudgetDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Budget")
			'aBudgetDO("GranteeProjectID") = aGranteeProjectDataObject("GranteeProjectID")
			'aBudgetDO("BudgetTypeID") = 1 'Submitted
			'aBudgetDO("Description") = "Budget"
			'aBudgetDO("CreateDate") = System.DateTime.Now
			'WebSession.DataObjectFactory.SaveDataObject(aBudgetDO)

			Dim aGranteeProjectPIDataObject As cDataObject
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("GranteeProjectPI", aDataObjectNode, aFiltersNode)
			aGranteeProjectPIDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
			aGranteeProjectPIDataObject("PITypeID") = 1
			aGranteeProjectPIDataObject("EntityTypeID") = 1
			aGranteeProjectPIDataObject("IsPrimary") = 1
			aGranteeProjectPIDataObject("GranteeProjectID") = aGranteeProjectDataObject("GranteeProjectID")
			aGranteeProjectPIDataObject("PersonID") = aUser.PersonID
			WebSession.DataObjectFactory.SaveDataObject(aGranteeProjectPIDataObject)


			'Create Wfta record
			Dim aWfTaskAssgObject As cWfTaskAssignment
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
			aWfTaskAssgObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)

			Dim aWfProject As cWfProject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProject", aSelectedProjectID)
			If aWfProject.GetInitialTask() = 0 Then
				Exit Sub
			End If
			aWfTaskAssgObject("WfTaskID") = aWfProject.GetInitialTask()
			Dim aWfProjectTaskDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", aSelectedProjectID, "WfTaskID", aWfProject.GetInitialTask().ToString())(0)
			aWfTaskAssgObject("WfTaskStatusID") = 1
			aWfTaskAssgObject("WfTaskRoleID") = aWfProjectTaskDO.GetRelatedPropertyInt("AssignToRoleWorkgroupStaffcontact.ID")
			'If aWfTaskAssgObject.GetRelatedPropertyInt("WfTask.WfTaskTypeID") = 5 Then
			'	aWfTaskAssgObject("WfTaskRoleID") = 11 'Eligibility
			'Else
			'	aWfTaskAssgObject("WfTaskRoleID") = 1 'Grantee
			'End If
			aWfTaskAssgObject("PersonID") = aUser.PersonID
			aWfTaskAssgObject("GranteeProjectID") = aGranteeProjectDataObject("GranteeProjectID")
			aWfTaskAssgObject("CreateDate") = System.DateTime.Now
			aWfTaskAssgObject("CreateUser") = WebSession.DataObjectFactory.User.UserID
			WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssgObject)

			Dim aWfTaskModuleDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModule", "WfTaskID", aWfProject.GetInitialTask.ToString, "WfTaskRoleID", aWfTaskAssgObject("WfTaskRoleID"))(0)
			If Not aWfTaskModuleDO Is Nothing Then
				aModuleName = aWfTaskModuleDO.GetPropertyString("ModuleName", "")
				aModuleConfig = aWfTaskModuleDO.GetPropertyString("ModuleConfigFilename", "")
			End If
			aWfTaskAssignmentID = aWfTaskAssgObject("WfTaskAssignmentID")
			'EventController_NavigateToModulePageKey(aPageKey)
			CType(WebSession, cEGSession).RedirectToModule(aModuleName, aModuleConfig, aPageKey, aWfTaskAssignmentID)

		End Sub

		Public Sub ValidateRequiredField(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
			Dim aRadio As cRadioButton
			Dim myEnumerator As IDictionaryEnumerator

			ctlWfProjectDataList = FindControl("ctlWfProjectDataList")
			aRadioHash = ctlWfProjectDataList.DataListCtl_GetControlCollection("ctlWfProject")

			myEnumerator = aRadioHash.GetEnumerator()
				While myEnumerator.MoveNext()
					aRadio = CType(myEnumerator.Value, cRadioButton)
					If (Not aRadio Is Nothing) And (aRadio.BaseRadioButton.Checked) Then
						aArgs.IsValid = True
						Exit Sub
					End If
				End While

				aArgs.IsValid = False

		End Sub

        '=============================================================
    End Class
End Namespace