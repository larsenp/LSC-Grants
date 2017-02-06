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
Imports System.Web.UI.WebControls

Namespace Implementation.Modules.Home.Controls.Page
	Public MustInherit Class cApplyGrantContent_lsc
		Inherits Core_Web.Controls.Base.cDataPresenterCtl
		'=============================================================

		Protected ctlWfProject As cDropDown
		Protected ctlGrantTitle As cTextBox
		Protected ctlShortTitle As cTextBox
		Protected ctlExemptOrga As cPopUpSelectorLauncher
		Protected ctlNotInList As cCheckBox
		Protected ctlEIN As cTextBox
		Protected ctlOrganizationName As cTextBox

		Protected valExemptOrgName As CustomValidator
		Protected ValidatePrimaryOrgName As CustomValidator

		'=============================================================


		'=============================================================


		Public Sub RedirectToModule(ByVal aUserDataObject As cDataObject, ByVal aModuleName As String, ByVal aModuleConfig As String, ByVal aPageKey As String, ByVal aWfTaskAssignmentID As String)
			Dim aUser As cEGUser
			aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)

			'Construct Grantee data object node
			Dim aXmlDoc As cXMLDoc
			Dim aDataObjectNode As XmlNode
			Dim aFiltersNode As XmlNode
			Dim aRoleDataObject As cDataObject

			'Create Grantee object for User
			'LSC grantees are organizations, not persons.
			Dim aPerson As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", aUser.PersonID.ToString)
			Dim aOrgID As Integer = aPerson.GetRelatedPropertyInt("PersonPrimaryAffiliation.OrganizationID")

			Dim aGranteeDataObject As cDataObject
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Grantee", aDataObjectNode, aFiltersNode)
			aGranteeDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
			aGranteeDataObject("EntityID") = aOrgID
			aGranteeDataObject("EntityTypeID") = 2	'Organization
			WebSession.DataObjectFactory.SaveDataObject(aGranteeDataObject)

			Dim aGranteeProjectDataObject As cDataObject
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("GranteeProject", aDataObjectNode, aFiltersNode)
			aGranteeProjectDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
			aGranteeProjectDataObject("GranteeID") = aGranteeDataObject("GranteeID")
			ctlWfProject = CType(Me.FindControl("ctlWfProject"), cDropDown)
			aGranteeProjectDataObject("WfProjectID") = ctlWfProject.SelectedValue
			aGranteeProjectDataObject("PrimaryPersonID") = aUser.PersonID
			aGranteeProjectDataObject("PrimaryOrganizationID") = aOrgID
			aGranteeProjectDataObject("GrantStatusID") = 2
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

			'Create Wfta record
			Dim aWfTaskAssgObject As cWfTaskAssignment
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
			aWfTaskAssgObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)

			Dim aWfProject As cWfProject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProject", ctlWfProject.SelectedValue)
			aWfTaskAssgObject("WfTaskID") = aWfProject.GetInitialTask()
			aWfTaskAssgObject("WfTaskStatusID") = 1
			If aWfTaskAssgObject.GetRelatedPropertyInt("WfTask.WfTaskTypeID") = 5 Then
				aWfTaskAssgObject("WfTaskRoleID") = 11 'Eligibility
			Else
				aWfTaskAssgObject("WfTaskRoleID") = 1 'Grantee
			End If
			aWfTaskAssgObject("PersonID") = aUser.PersonID
			aWfTaskAssgObject("GranteeProjectID") = aGranteeProjectDataObject("GranteeProjectID")
			WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssgObject)
			Dim aWfTaskModuleDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModule", "WfTaskID", aWfProject.GetInitialTask.ToString, "WfTaskRoleID", aWfTaskAssgObject("WfTaskRoleID"))(0)
			aModuleName = aWfTaskModuleDO("ModuleName")
			aModuleConfig = aWfTaskModuleDO("ModuleConfigFilename")
			aWfTaskAssignmentID = aWfTaskAssgObject("WfTaskAssignmentID")
			'EventController_NavigateToModulePageKey(aPageKey)
			CType(WebSession, cEGSession).RedirectToModule(aModuleName, aModuleConfig, aPageKey, aWfTaskAssignmentID)

		End Sub

		'=============================================================
	End Class
End Namespace