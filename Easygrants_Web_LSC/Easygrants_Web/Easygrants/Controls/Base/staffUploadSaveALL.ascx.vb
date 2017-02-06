Imports System.Diagnostics
Imports Core.DataAccess
Imports Core.Web
Imports EasyGrants.Web.User
Imports Core.Web.Modules

Namespace Core_Web.Controls.Base
Public MustInherit Class cstaffUploadSaveALL
	Inherits Core.Web.cstaffCtl
'====================================================

	Protected btnView As cLink
	Protected btnReset As cCSSButton
	Protected tabStaffUpload As HtmlTable
	Protected tdConversionStatus As HtmlTableCell
	Protected tdOptions As HtmlTableCell
	Protected mUploadCtl As cUploadSaveAll

'====================================================

	Public Property UploadCtlSaveAll() As cUploadSaveAll
		Get
			UploadCtlSaveAll = mUploadCtl
		End Get
		Set(ByVal Value As cUploadSaveAll)
			mUploadCtl = Value
		End Set
	End Property

'----------------------------------------------------

	Public ReadOnly Property FileType() As String
		Get
			FileType = UploadCtlSaveAll.FileTypeID.ToString()
		End Get
	End Property

'----------------------------------------------------

	Public ReadOnly Property ConversionStatus() As String
		Get
			ConversionStatus = ""
			If UploadCtlSaveAll Is Nothing Then Exit Property
			If UploadCtlSaveAll.SubmittedFileObj Is Nothing Then Exit Property
			If IsDBNull(UploadCtlSaveAll.SubmittedFileObj("ConversionStatus")) Then Exit Property
				ConversionStatus = UploadCtlSaveAll.SubmittedFileObj.GetPropertyString("ConversionResult")
		End Get
	End Property

'====================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
		If Not Visible Then Exit Sub
		If MyBase.WebSession.HasStaffUser Then
			tabStaffUpload.Visible = True
			If UploadCtlSaveAll.SubmittedFileObj Is Nothing Then
				tdConversionStatus.Visible = False
				tdOptions.Visible = False
			Else
				btnView.Caption = UploadCtlSaveAll.SubmittedFileObj.GetPropertyString("SourceFileName", "")
				btnView.Href = cWebLib.AddQuerystringParameter(btnView.Href, _
								"SubmittedFileID", UploadCtlSaveAll.SubmittedFileID.ToString)
				btnReset.Set_ServerClick(AddressOf Me.btnReset_Click)
			End If
		End If
	End Sub

'====================================================

	Public Sub btnReset_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		If Not UploadCtlSaveAll Is Nothing Then
			Dim aSubmittedFile As cSubmittedFile

			aSubmittedFile = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SubmittedFile", UploadCtlSaveAll.SubmittedFileID)
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