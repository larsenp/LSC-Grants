Imports System.Xml
Imports System.IO
Imports System.Text
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports Core.DataAccess

Namespace Easygrants_Web.Controls.PageSection
Public Class cTaskUploadsButtonList
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	Protected spnNoUploadTypeMsg As HtmlGenericControl
	Protected ctlNewWindowOpener As cNewWindowOpener
	Private mSubmittedFileID As Integer
	Protected TblInstructions As HtmlTable
	Private mIsHideInstructions As Boolean = True
	Private mGeneralUpload As Boolean = False

	Public WriteOnly Property HideInstructions() As Boolean
		Set(ByVal value As Boolean)
			mIsHideInstructions = value
		End Set
	End Property

	Public ReadOnly Property URL() As String
		Get
			Dim aURL As String = WebAppl.Build_RootURL("Core/Controls/Base/UploadFormattingRequirements.htm")
			Return aURL
		End Get
	End Property


	Public Property GeneralUpload() As Boolean
		Get
			Return mGeneralUpload
		End Get
		Set(ByVal Value As Boolean)
			mGeneralUpload = Value
		End Set
	End Property

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		Dim aGranteeProjectDO As cDataObject = CType(Me.DataObjectCollection("GranteeProject"), cDataObjectList)(0)
		Dim aWfProjectTaskDO As cDataObject = CType(Me.DataObjectCollection("WfProjectTask"), cDataObjectList)(0)

		Dim aWfProjectTaskID As String = aWfProjectTaskDO("WfProjectTaskID")
		Dim aWfProjectTaskUploadDOList As cDataObjectList = CType(Me.DataObjectCollection("WfProjectTaskUpload"), cDataObjectList)

	End Sub

	Public Sub ViewTemplate(ByVal aPrimaryKeyValue As String)

		Dim aHref As String

		aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
		Dim aUploadDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Upload", aPrimaryKeyValue)
		Dim aUploadTemplateID As String
		If Not aUploadDO Is Nothing Then
			aUploadTemplateID = aUploadDO.GetPropertyString("UploadTemplateID")
		End If
		aHref = cWebLib.AddQuerystringParameter(aHref, "DataObject", "UploadTemplate")
		aHref = cWebLib.AddQuerystringParameter(aHref, "ID", aUploadTemplateID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
		'Response.Redirect(aHref)

End Sub
'----------------------------------------------------

	Public Sub DocumentList_Delete(ByVal aPrimaryKeyValue As String)

		''get aSubmittedFile and call SubmittedFileDelete
		'Dim aSubmittedFile As cSubmittedFile
		'Dim aURL = Request.Url.PathAndQuery()
		'Dim aValue As String = mSubmittedFileID
		'aSubmittedFile = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SubmittedFile", aPrimaryKeyValue)
		'aSubmittedFile.SubmittedFile_Delete()

		'The above code is commented out because , we moved this code section to cDataPresenterCtl as if there is Sharepoint Integration , then we need to delete the File from sharepoint.
		'So the delete Functionality is placed at once place in cDataPresenterCtl Class.
		SubmittedFile_Delete(aPrimaryKeyValue)

		CorePage.Redirect()

	End Sub
End Class

End Namespace
