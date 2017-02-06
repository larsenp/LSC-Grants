Imports System.Diagnostics
Imports Core.DataAccess
Imports Core.Web

Namespace Core_Web.Controls.Base
Public MustInherit Class cstaffImport
	Inherits Core.Web.cstaffCtl
'====================================================

	Protected btnView As cCSSButton
	Protected btnReset As cCSSButton
	Protected tdConversionStatus As HtmlTableCell
	Protected tdOptions As HtmlTableCell

	Protected mUploadCtl As cImport

'====================================================

	Public Property UploadCtl() As cImport
		Get
			UploadCtl = mUploadCtl
		End Get
		Set(ByVal Value As cImport)
			mUploadCtl = Value
		End Set
	End Property

'----------------------------------------------------

	Public ReadOnly Property ImportType() As String
		Get
			ImportType = UploadCtl.ImportTypeID.ToString()
		End Get
	End Property

'----------------------------------------------------

	Public ReadOnly Property ConversionStatus() As String
		Get
			ConversionStatus = ""
			If UploadCtl Is Nothing Then Exit Property
			If UploadCtl.ImportedFileObj Is Nothing Then Exit Property
			If IsDBNull(UploadCtl.ImportedFileObj("ImportStatusID")) Then Exit Property
                ConversionStatus = UploadCtl.ImportedFileObj.GetPropertyString("ImportResult")
		End Get
	End Property

'====================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
		If Not Visible Then Exit Sub

		If UploadCtl.ImportedFileObj Is Nothing Then
			tdConversionStatus.Visible = False
			tdOptions.Visible = False
		Else
			btnView.Href = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
			btnView.Href = cWebLib.AddQuerystringParameter(btnView.Href, _
							"ImportedFileID", UploadCtl.ImportedFileID.ToString)

			btnReset.Set_ServerClick(AddressOf Me.btnReset_Click)
		End If
	End Sub

'====================================================

	Public Sub btnReset_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		If Not UploadCtl Is Nothing Then
			Dim aImportedFile As cImportedFile

			aImportedFile = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("ImportedFile", UploadCtl.ImportedFileID)
			If Not aImportedFile Is Nothing Then
				aImportedFile.Save_ConversionStatus(0)
			End If
		End If

		Me.CorePage.Redirect()
	End Sub

'====================================================
End Class
End Namespace