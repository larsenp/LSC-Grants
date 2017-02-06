Imports System.Diagnostics
Imports Core.DataAccess
Imports Core.Web
Imports EasyGrants.Web.User
Imports Core.Web.Modules

Namespace Core_Web.Controls.Base
Public MustInherit Class cStaffUploadNew
	Inherits Core.Web.cstaffCtl
'====================================================

	Protected btnView As cLink
	Protected btnReset As cCSSButton
	Protected tabStaffUpload As HtmlTable
	Protected tdConversionStatus As HtmlTableCell
	Protected tdOptions As HtmlTableCell

	Protected mUploadNewCtl As cUploadNew

'====================================================

Public Property UploadNewCtl() As cUploadNew
		Get
			UploadNewCtl = mUploadNewCtl
		End Get
		Set(ByVal Value As cUploadNew)
			mUploadNewCtl = Value
		End Set
	End Property

'----------------------------------------------------

	Public ReadOnly Property UploadType() As String
		Get
			UploadType = UploadNewCtl.UploadID.ToString()
		End Get
	End Property

'----------------------------------------------------

	Public ReadOnly Property ConversionStatus() As String
		Get
			ConversionStatus = ""
			If UploadNewCtl Is Nothing Then Exit Property
			If UploadNewCtl.SubmittedFileObj Is Nothing Then Exit Property
			If IsDBNull(UploadNewCtl.SubmittedFileObj("ConversionStatus")) Then Exit Property
				ConversionStatus = UploadNewCtl.SubmittedFileObj.GetPropertyString("ConversionResult")
		End Get
	End Property

'====================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
		If Not Visible Then Exit Sub
		If MyBase.WebSession.HasStaffUser Then
			tabStaffUpload.Visible = True
				If UploadNewCtl.SubmittedFileObj Is Nothing Then
					tdConversionStatus.Visible = False
					tdOptions.Visible = False
				Else
					btnView.Caption = UploadNewCtl.SubmittedFileObj.GetPropertyString("SourceFileName", "")
					btnView.Href = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
					btnView.Href = cWebLib.AddQuerystringParameter(btnView.Href, _
									"SubmittedFileID", UploadNewCtl.SubmittedFileID.ToString)
					btnReset.Set_ServerClick(AddressOf Me.btnReset_Click)
				End If

		End If
	End Sub

'====================================================

	Public Sub btnReset_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		If Not UploadNewCtl Is Nothing Then
			Dim aSubmittedFile As cSubmittedFile

			aSubmittedFile = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SubmittedFile", UploadNewCtl.SubmittedFileID)
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