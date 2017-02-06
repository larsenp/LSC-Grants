Imports Core_Web.Controls.Base
Imports Core.Web
Imports Core.Web.Modules
Imports Core.DataAccess

Namespace Easygrants_Web.Modules.ProgressReport.PageContent
Public MustInherit Class cPublicationsEditor
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub
   
'=============================================================
	
	Public Function ValidateURL(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim ctlUrl As cTextBox
		
		ctlUrl = CType(Me.FindControl("ctlUrl"), cTextBox)
		If ctlUrl.Value.Length >= 8 Then
			If ctlUrl.Value.Substring(0,7) = "http://" Or ctlUrl.Value.Substring(0,8) = "https://" Then
				ValidateURL = True
			Else
				ValidateURL = False
			End If
		Else
			ValidateURL = False
		End If
	End Function

	'ValidateYear
	Public Function ValidateYear(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim ctlYear As cTextBox

		ctlYear = CType(Me.FindControl("ctlPublicationYear"), cTextBox)
		If ctlYear.Value.Length >= 4 Then
			If IsNumeric(ctlYear.Value) Then
				ValidateYear = True
			Else
				ValidateYear = False
			End If
		Else
			ValidateYear = False
		End If
	End Function
	
	Public Sub NavigateToPublicationsUploadEditor(ByVal aPageKey As String, ByVal FileTypeID As String, ByVal GranteeProjectID As String, ByVal aReturnURL As String)

		Dim aNewURL As String
		Dim aGPPublicationDO As cDataObject
		aNewURL = CType(CorePage, cModulePage).PageURL
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "Page", aPageKey)
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, FileTypeID)
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, GranteeProjectID)
		aGPPublicationDO = CType(DataObjectCollection("GranteeProjectPublications"), cDataObjectList)(0)
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "GranteeProjectPublicationsID", aGPPublicationDO("GranteeProjectPublicationsID"))
		Dim aSubmittedFileID As String = aGPPublicationDO.GetPropertyString("PublicationUploadID", "0")
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "SubmittedFileID", aSubmittedFileID)
		aReturnURL = cWebLib.AddQuerystringParameter(aReturnURL, "GranteeProjectPublicationsID", aGPPublicationDO("GranteeProjectPublicationsID"))
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, aReturnURL, Server)
		Response.Redirect(aNewURL)
	End Sub
   
'=============================================================

End Class
End Namespace