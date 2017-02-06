Imports System.Xml
Imports System.Diagnostics
Imports Core.Web.Navigation
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.Modules
Imports EasyGrants.Web.User
Namespace Easygrants_Web.Modules.Application.Controls.Page
    Public Class cReferencesEditorContent
        Inherits Easygrants_Web.Controls.Base.cEGDataPresenterCtl

        Protected spnTxtEmail As HtmlGenericControl
        Protected ctlTxtEmail As cEmailTextBox
        Protected TrEmailInst As HtmlTableRow

        Public Sub valUniqueEmail(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
            Dim aPersonRelationshipDOL As cDataObjectList
            Dim aUser As cEGUser
            aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)

            ctlTxtEmail = CType(Me.FindControl("ctlTxtEmail"), cEmailTextBox)
            If ctlTxtEmail.Value <> "" And Request.QueryString("PersonRelationshipID") = 0 Then
                aPersonRelationshipDOL = WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonRelationship", "PersonID", aUser.PersonID, "TaskID", aUser.WfTaskID, "GranteeProjectID", aUser.GranteeProjectID, "RelatePersonDisplayEmail", ctlTxtEmail.Value)
                If aPersonRelationshipDOL.Count > 0 Then
                    aArgs.IsValid = False
                    Exit Sub
                End If
            End If
            aArgs.IsValid = True
        End Sub
		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			Dim aXmlDoc As cXMLDoc = New cXMLDoc()
			Dim aArgNode As XmlNode
			aXmlDoc.LoadFromXML(spnConfigXML.InnerText)
			Dim Position As Integer = 0
			Dim aDisplayPropertiesNode As XmlNode = aXmlDoc.DocElement.SelectSingleNode("DataObject[@Key='PersonRelationship']/DisplayProperties")
			Dim aRoleFiltersNode As XmlNode = aDisplayPropertiesNode.SelectSingleNode("DisplayProperty/Control[@ID='ctlRole']/Filters")
			Dim aChildProjectTaskDOL As cDataObjectList = CType(Page, cSubmissionModulePage).WfTaskAssignmentObject.GetRelatedPropertyDataObjectList("WfProjectTask.ChildProjectTasks")
			Dim aChildProjectTaskDO As cDataObject
			If aChildProjectTaskDOL.Count > 0 Then
				aRoleFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, "("))
			Else
				'When a third party task is not added the task roles dropdown should be empty
				aRoleFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskRoleID", "-1"))
			End If
			For Each aChildProjectTaskDO In aChildProjectTaskDOL
				If Position = 0 Then
					aArgNode = aRoleFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskRoleID", aChildProjectTaskDO.GetRelatedPropertyString("AssignToRoleWorkgroupStaffcontact.ID"), ""))
				Else
					aArgNode = aRoleFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskRoleID", aChildProjectTaskDO.GetRelatedPropertyString("AssignToRoleWorkgroupStaffcontact.ID"), "Or"))
				End If
				Position += 1
			Next
			If aChildProjectTaskDOL.Count > 0 Then
				aRoleFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, ")", ""))
			End If
			spnConfigXML.InnerText = aXmlDoc.DocElement.OuterXml
			MyBase.CoreCtl_Load(aSrc, aEvent)
			SavePostSubmit = True
			'If Request.QueryString("PersonRelationshipID") > 0 Then
			'    spnTxtEmail.Visible = False
			'Else
			'    spnTxtEmail.Visible = True
			'End If
		End Sub
    End Class
End Namespace

