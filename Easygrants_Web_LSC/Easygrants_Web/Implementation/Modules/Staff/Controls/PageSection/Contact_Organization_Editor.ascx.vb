Imports System.Diagnostics
Imports System.Web.UI
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cContact_Organization_Editor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'=============================================================

    Protected ctlWfProject As cRadioButtonList
    Protected ctlGrantTitle As cTextBox
    Protected ctlShortTitle As cTextBox
    
'=============================================================

  Public Sub Submit(ByVal aUserDataObject As cDataObject, ByVal aModuleName As String, ByVal aModuleConfig As String, ByVal aPageKey As String)
        Dim aUser As cEGUser
        aUser = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser)
        
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
        ctlWfProject = Ctype(Me.FindControl("ctlWfProject"), cRadioButtonList)
        aGranteeProjectDataObject("WfProjectID") = ctlWfProject.SelectedValue
        aGranteeProjectDataObject("PrimaryPersonID") = aUser.PersonID
        ctlGrantTitle = Ctype(Me.FindControl("ctlGrantTitle"), cTextBox)
        aGranteeProjectDataObject("GrantTitle") = ctlGrantTitle.Value
        ctlShortTitle = Ctype(Me.FindControl("ctlShortTitle"), cTextBox)
        aGranteeProjectDataObject("ShortTitle") = ctlShortTitle.Value
        WebSession.DataObjectFactory.SaveDataObject(aGranteeProjectDataObject)

        Dim aWfTaskAssgObject As cWfTaskAssignment
        aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
        aWfTaskAssgObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
        
        Select Case ctlWfProject.SelectedValue
			Case "1"
				aWfTaskAssgObject("WfTaskID") = 1
			Case "2"
			    aWfTaskAssgObject("WfTaskID") = 3
			Case Else
				aWfTaskAssgObject("WfTaskID") = 4
		End Select
		
		aWfTaskAssgObject("WfTaskStatusID") = 1
        aWfTaskAssgObject("WfTaskRoleID") = 1 'Grantee
        aWfTaskAssgObject("PersonID") = aUser.PersonID
        aWfTaskAssgObject("GranteeProjectID") = aGranteeProjectDataObject("GranteeProjectID")
        WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssgObject)

        EventController_NavigateToModulePageKey(aPageKey)
        
  End Sub

'=============================================================
End Class
End Namespace