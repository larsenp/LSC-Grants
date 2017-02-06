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

    Public Class cTIGApplyGrantContent
        Inherits Core_Web.Controls.Base.cLSCDataPresenterCtl

        Protected ctlLOIForms As cDropDown

        Public Sub RedirectToModule()
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
            aGranteeDataObject("EntityTypeID") = 2  'Organization
            WebSession.DataObjectFactory.SaveDataObject(aGranteeDataObject)

			'Create GranteeProject data object
			Dim aNicTypesDataObject As cDataObject = DataObjectCollection("TIGLOITypes")(0)
            Dim aWfProjectID As Integer = aNicTypesDataObject.GetPropertyInt("WfProjectID")
            Dim aGranteeProjectDataObject As cDataObject
            aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("GranteeProject", aDataObjectNode, aFiltersNode)
            aGranteeProjectDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
            aGranteeProjectDataObject("GranteeID") = aGranteeDataObject("GranteeID")
            ctlLOIForms = CType(Me.FindControl("ctlLOIForms"), cDropDown)
            aGranteeProjectDataObject("WfProjectID") = aWfProjectID
            aGranteeProjectDataObject("PrimaryPersonID") = aUser.PersonID
            aGranteeProjectDataObject("PrimaryOrganizationID") = aOrgID
            aGranteeProjectDataObject("GrantStatusID") = 2
			WebSession.DataObjectFactory.SaveDataObject(aGranteeProjectDataObject)

			'Assign TIG number to grant
			aDataObjectNode = Nothing
			aFiltersNode = Nothing
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("LscAssignTIGNumber", aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "grantee_project_id", aGranteeProjectDataObject.GetPropertyString("GranteeProjectID")))
			WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)

            'Create Wfta record
            Dim aWfTaskAssgObject As cWfTaskAssignment
            aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
            aWfTaskAssgObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)

            Dim aWfProject As cWfProject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProject", aWfProjectID)
            aWfTaskAssgObject("WfTaskID") = ctlLOIForms.SelectedValue
            'aWfTaskAssgObject("WfTaskID") = 35
            aWfTaskAssgObject("WfTaskStatusID") = 1
            aWfTaskAssgObject("WfTaskRoleID") = 1 'Grantee
            aWfTaskAssgObject("PersonID") = aUser.PersonID
            aWfTaskAssgObject("GranteeProjectID") = aGranteeProjectDataObject("GranteeProjectID")
            WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssgObject)
            'Dim aWfTaskModuleDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModule", "WfTaskID", "35", "WfTaskRoleID", aWfTaskAssgObject("WfTaskRoleID"))(0)
            Dim aWfTaskModuleDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModule", "WfTaskID", ctlLOIForms.SelectedValue, "WfTaskRoleID", aWfTaskAssgObject("WfTaskRoleID"))(0)
            Dim aModuleName As String = aWfTaskModuleDO("ModuleName")
            Dim aModuleConfig As String = aWfTaskModuleDO("ModuleConfigFilename")
			Dim aWfTaskAssignmentID As String = aWfTaskAssgObject("WfTaskAssignmentID")

			'Create LscGranteeProjectTIG data object
			Dim aGPTIG As cDataObject = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("LscGranteeProjectTig")
			aGPTIG("GranteeProjectID") = aGranteeProjectDataObject("GranteeProjectID")
			aGPTIG("TigGrantTypeID") = aWfTaskAssgObject.GetRelatedPropertyInt("LscTigGrantType.TigGrantTypeID")
			aGPTIG.SaveData()

			'Redirect to module
			CType(WebSession, cEGSession).RedirectToModule(aModuleName, aModuleConfig, "", aWfTaskAssignmentID)


        End Sub

    End Class
End Namespace
