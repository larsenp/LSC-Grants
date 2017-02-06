Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.Web.Modules
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports Core.Web
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.DataAccess

Namespace Easygrants_Web.Controls.PageSection
	Public Class cGrant_Notes_View_LSC
		Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'==================================================================================

	Protected Overloads Overrides Sub RenderControls(ByRef aDisplayPropertyNodeList As XmlNodeList, ByVal aDataObjectList As cDataObjectList, ByVal aIndex As Integer)

		If aDataObjectList.DefinitionKey = "Notes" AndAlso (Not aDataObjectList(aIndex) Is Nothing) Then
			If aDataObjectList(aIndex).GetPropertyString("Notes").Length > 255 Then
				aDataObjectList(aIndex)("Notes") = aDataObjectList(aIndex).GetPropertyString("Notes").Substring(0, 255) + "..."
			End If
		End If

		MyBase.RenderControls(aDisplayPropertyNodeList, aDataObjectList, aIndex)

	End Sub

	Public Sub DelMethod(ByVal NotesID As String)
		MyBase.EventController_Delete("Notes", NotesID)
		CorePage.Redirect()
	End Sub


	End Class
End Namespace