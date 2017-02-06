Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports System.Text
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports Core.Web
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User

Namespace Implementation.Modules.Application.Controls.PageSection

Public MustInherit Class cAdditionalUploadsEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
	Protected trUploadPubs As HtmlTableRow
	Protected ctlUpload As cUpload
'=============================================================

	Public ReadOnly Property SubmittedFileID() As String
		Get
			If Not Request.QueryString("SubmittedFileID") Is Nothing Then
				Return Request.QueryString("SubmittedFileID")
			Else
				Return ""
			End If
		End Get
	End Property

'-------------------------------------------------------------

	Protected ReadOnly Property SubmittedFile() As cDataObject
		Get
			If Request.QueryString("SubmittedFileID") Is Nothing Then Return Nothing

			Return WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SubmittedFile", _
				Request.QueryString("SubmittedFileID"))
		End Get
	End Property

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Dim ft As String = Request.QueryString("FileTypeID").ToString()
		Dim aDataObjectList As cDataObjectList
		Dim btnSave_and_Continue As cCSSButton
		Dim btnContinue As cCSSButton
		btnSave_and_Continue = CType(Me.FindControl("btnSave_and_Continue"), cCSSButton)
		btnContinue = CType(Me.FindControl("btnContinue"), cCSSButton)

		If ((ft.Equals("0")) Or (ft.Equals(""))) Then
			trUploadPubs.Visible = False
		End If
		If SubmittedFileID = "0" Or SubmittedFileID = "" Then
			btnSave_and_Continue.Visible = False
			btnContinue.Visible = True
		Else
			Update_Submitted_File()
			btnSave_and_Continue.Visible = True
			btnContinue.Visible = False
			Dim aDataObject As cDataObject
			aDataObject = CType(DataObjectCollection("SubmittedFile"), cDataObjectList)(0)
			If aDataObject Is Nothing Then
				trUploadPubs.Visible = False
			End If
		End If

	End Sub

'=============================================================

	Public Sub GoClick(ByVal aValue1 As String)
		Dim aURL As String
		If aValue1 = "" Then
			trUploadPubs.Visible = False
		End If

		aURL = Request.RawUrl.ToString()
		aURL = cWebLib.RemoveQuerystringParameter(aURL, "SubmittedFileID")
		aURL = cWebLib.AddQuerystringParameter(aURL, "FileTypeID", aValue1)
		'trUploadPubs.Visible = True
		Response.Redirect(aURL)
	End Sub

'=============================================================
	Public Sub Update_Submitted_File()
		If SubmittedFileID > 0 Then
			Dim aDataObject As cDataObject
			aDataObject = CType(DataObjectCollection("SubmittedFile"), cDataObjectList)(0)
			If Not aDataObject Is Nothing Then
				aDataObject("IsAdditional") = True
				WebSession.DataObjectFactory.SaveDataObject(aDataObject)
			End If
		End If
	End Sub
'=============================================================
	Public Overrides Sub DataPresenter_SaveDataObjects()
		Update_Submitted_File()
	End Sub

'=============================================================

End Class
End Namespace