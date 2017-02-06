Imports Core.Web.Modules
Imports Core.DataAccess
Imports Core.Web
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cPublicationUploadEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

'=============================================================

	'Public Overrides Sub CoreCtl_SetValues()
	'	MyBase.CoreCtl_SetValues()

	'	If Not IsPostBack Then
	'		Dim aFileTypeID As String
	'		aFileTypeID = cWebLib.Get_QueryString(Request, "FileTypeID", "")
	'		If aFileTypeID <> "" And aFileTypeID <> "0" Then
	'			'Dim ctlUploadType As cDropDown
	'			'ctlUploadType = CType(Me.FindControl("ctlUploadType"), cDropDown)
	'			'ctlUploadType.SelectedField = aFileTypeID
	'		End If
	'	End If
	'End Sub

'=============================================================

	'Public Sub GoClick(ByVal aValue As String)
	'	Dim aURL As String
	'	aURL = Request.RawUrl.ToString()
	'	aURL = cWebLib.AddQuerystringParameter(aURL, "FileTypeID", aValue)
	'	Response.Redirect(aURL)
	'End Sub

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