Imports Core.Web.Modules
Imports Core.DataAccess
Imports Core.Web
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.ProgressReport.PageContent
Public MustInherit Class cPublicationUploadEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

'=============================================================

	Public Overrides Function EventController_Save() As Boolean
		MyBase.EventController_Save()
		
		Dim aPublicationUpload As cUploadSaveAll = FindControl("ctlUpload")
		
		Dim aGPPublicationDO As cDataObject
		aGPPublicationDO = CType(DataObjectCollection("GranteeProjectPublications"), cDataObjectList)(0)
		aGPPublicationDO("PublicationUploadID") = aPublicationUpload.SubmittedFileID
		aGPPublicationDO.SaveData()
	End Function

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Dim aSubmittedFileID, aPublicationID As String
		If Not IsPostBack Then
			aSubmittedFileID = Request.QueryString("SubmittedFileID")
			aPublicationID = Request.QueryString("GranteeProjectPublicationsID")
			If aSubmittedFileID = "0" Then
				Dim aGPPublicationDO As cDataObject
				aGPPublicationDO = CType(DataObjectCollection("GranteeProjectPublications"), cDataObjectList)(0)
				If aGPPublicationDO.GetPropertyInt("PublicationUploadID", 0) <> 0 Then
					aGPPublicationDO("PublicationUploadID") = 0
					aGPPublicationDO.SaveData()
				End If
			End If
		End If

	End Sub


End Class
End Namespace