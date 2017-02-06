Imports Core.Web
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cCreateAgreementUploadsEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

'=============================================================

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()

		If Not IsPostBack Then
			Dim aFileTypeID As String
			aFileTypeID = cWebLib.Get_QueryString(Request, "FileTypeID", "")
			If aFileTypeID <> "" And aFileTypeID <> "0" Then
				'Dim ctlUploadType As cDropDown
				'ctlUploadType = CType(Me.FindControl("ctlUploadType"), cDropDown)
				'ctlUploadType.SelectedField = aFileTypeID
			End If
		End If
	End Sub

'=============================================================

	Public Sub GoClick(ByVal aValue As String)
		Dim aURL As String
		aURL = Request.RawUrl.ToString()
		aURL = cWebLib.AddQuerystringParameter(aURL, "FileTypeID", aValue)
		Response.Redirect(aURL)
	End Sub

'=============================================================

End Class
End Namespace