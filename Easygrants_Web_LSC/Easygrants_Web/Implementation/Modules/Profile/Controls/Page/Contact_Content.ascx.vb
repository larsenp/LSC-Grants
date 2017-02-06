Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports EasyGrants.Web


Namespace Easygrants_Web.Modules.Profile.Controls.Page
Public MustInherit Class cContact_Content
	Inherits Core_Web.Controls.Sharepoint.cSharepointLib
'=============================================================

	Protected ctlFirst As cTextBox
	Protected ctlMiddle As cTextBox
	Protected ctlLast As cTextBox

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		ctlFirst = CType(Me.FindControl("ctlFirst"), cTextBox)
		ctlLast = CType(Me.FindControl("ctlLast"), cTextBox)
		ctlMiddle = CType(Me.FindControl("ctlMiddle"), cTextBox)
	End Sub


'

	Public Overrides Sub DataPresenter_SaveDataObject(ByVal aDataObjectElement As XmlElement)
		If cXMLDoc.AttributeToString(aDataObjectElement, "Key") = "Person" Then
			'The rename to be executed when editing the name but not when creating a new one.
			Dim PersonID As String = CType(CType(Page, cModulePage).ModuleUser, cEGUser).PersonID
			If PersonID > 0 Then
				Dim aSPIntegrationDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")(0)
				If Not aSPIntegrationDO Is Nothing Then
					'Here definition key is the Table Name
					Dim aEventTypeID As Integer = 4
					Dim aDefinitionKey As String = "Person"
					Dim aUniqueID As Integer = PersonID

					Dim aPersonDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("Person", PersonID)(0)
					Dim aPersonNameOld As String = aPersonDO.GetPropertyString("FirstName") + aPersonDO.GetPropertyString("LastName") + aPersonDO.GetPropertyString("MiddleName", "")
					Dim aOldFolderName As String = PersonID & "_" & CorePage.TruncateFolderName(TruncateSpecialCharacters(aSPIntegrationDO, aPersonNameOld), "Person")

					MyBase.DataPresenter_SaveDataObject(aDataObjectElement)

					Dim aPersonNameNew As String = ctlFirst.Value & ctlLast.Value & ctlMiddle.Value
					Dim aNewFolderName As String = CorePage.TruncateFolderName(PersonID & "_" & TruncateSpecialCharacters(aSPIntegrationDO, aPersonNameNew), "Person")

					'Here we are comparing the Values before save and after save. if they both are different then we need to rename the Folder in sharepoint.
					If aOldFolderName <> aNewFolderName Then
						RenameFolder(aEventTypeID, aDefinitionKey, aUniqueID, aOldFolderName, aNewFolderName, aSPIntegrationDO, aPersonDO)
					End If
					'Here we need to exit because otherwise DataPresenter_SaveDataObject will be executed at the end again
					Exit Sub
				End If

			End If
		End If

		MyBase.DataPresenter_SaveDataObject(aDataObjectElement)
	End Sub

'-------------------------------------------------------------




'=============================================================
End Class
End Namespace