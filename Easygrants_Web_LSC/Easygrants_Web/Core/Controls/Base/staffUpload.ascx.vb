Imports System.Diagnostics
Imports Core.DataAccess
Imports Core.Web
Imports EasyGrants.Web.User
Imports Core.Web.Modules

Namespace Core_Web.Controls.Base
Public MustInherit Class cstaffUpload
	Inherits Core.Web.cstaffCtl
'====================================================

	Protected btnView As cLink
	Protected btnReset As cCSSButton
	Protected tabStaffUpload As HtmlTable
	Protected tdConversionStatus As HtmlTableCell
	Protected tdOptions As HtmlTableCell
	Protected mUploadCtl As cUpload

'====================================================

	Public Property UploadCtl() As cUpload
		Get
			UploadCtl = mUploadCtl
		End Get
		Set(ByVal Value As cUpload)
			mUploadCtl = Value
		End Set
	End Property

'----------------------------------------------------

	Public ReadOnly Property FileType() As String
		Get
			FileType = UploadCtl.FileTypeID.ToString()
		End Get
	End Property

'----------------------------------------------------

	Public ReadOnly Property ConversionStatus() As String
		Get
			ConversionStatus = ""
			If UploadCtl Is Nothing Then Exit Property
			If UploadCtl.SubmittedFileObj Is Nothing Then Exit Property
			If IsDBNull(UploadCtl.SubmittedFileObj("ConversionStatus")) Then Exit Property
                ConversionStatus = UploadCtl.SubmittedFileObj.GetPropertyString("ConversionResult")
		End Get
	End Property

'====================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
		If Not Visible Then Exit Sub
		If MyBase.WebSession.HasStaffUser Then
			tabStaffUpload.Visible = True
			If UploadCtl.SubmittedFileObj Is Nothing Then
				tdConversionStatus.Visible = False
				tdOptions.Visible = False
			Else
				btnView.Caption = UploadCtl.SubmittedFileObj.GetPropertyString("SourceFileName", "")
				btnView.Href = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
				btnView.Href = cWebLib.AddQuerystringParameter(btnView.Href, _
								"SubmittedFileID", UploadCtl.SubmittedFileID.ToString)
				btnReset.Set_ServerClick(AddressOf Me.btnReset_Click)
				btnView.CausesValidation = False
				btnReset.CausesValidation = False
			End If
		End If
	End Sub

'====================================================

	Public Sub btnReset_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		If Not UploadCtl Is Nothing Then
			Dim aSubmittedFile As cSubmittedFile

			aSubmittedFile = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SubmittedFile", UploadCtl.SubmittedFileID)
			If Not aSubmittedFile Is Nothing Then
				'aSubmittedFile.Save_ConversionStatus(0)
				aSubmittedFile("ConversionStatus") = 0
				aSubmittedFile("ConversionResult") = System.DBNull.Value
				aSubmittedFile.SaveData()
			End If
		End If

		Me.CorePage.Redirect()
	End Sub

'====================================================
End Class
End Namespace