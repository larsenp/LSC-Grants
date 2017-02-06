Imports System.Xml
Imports System.Diagnostics
Imports Core_Web.Controls.Base
Imports System.Reflection
Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User

Namespace Core_Web.Controls.PageSection

Public MustInherit Class cDocumentList
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'=================================================

	Protected spnDelete As HtmlGenericControl
	Protected spnView As HtmlGenericControl
	Protected tdSubmitDate As HtmlTableCell
	Protected tdFileName As HtmlTableCell
	Protected btnUpload As cCSSButton
	Protected ctlNewWindowOpener As cNewWindowOpener	
	Protected tabTitle As HtmlTable

	Private mSubmittedFileID As Integer
	Private mFileTypeID As String
	Private mTitle As String
	Private mEntityAssocID As Integer
	Private mSubmittedFileDataObj As cDataObject
	Private mFileTypeName As String
	Private mDisplayPropertyNode As XmlNode
		Protected WithEvents spnReportOutputOpen As System.Web.UI.HtmlControls.HtmlGenericControl
		Protected WithEvents spnAdd As System.Web.UI.HtmlControls.HtmlGenericControl
		Protected WithEvents spnDocumentList As System.Web.UI.HtmlControls.HtmlGenericControl

	Private mDescription As Boolean

'=================================================

	Public Property FileTypeID() As String
		Get
			Return mFileTypeID
		End Get
		Set(ByVal Value As String)
			mFileTypeID = Value
		End Set
	End Property
'-------------------------------------------------------------

	Public Property Title() As String
		Get
			Return mTitle
		End Get
		Set(ByVal Value As String)
			mTitle = Value
		End Set
	End Property

'-------------------------------------------------------------

	Public Property Description() As String
		Get
			Return mDescription.ToString()
		End Get
		Set(ByVal Value As String)
			If Value = "True" Then
				mDescription = True
			Else
				mDescription = False
			End If
		End Set
	End Property

'==============================================================

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)

		if Title = "Word Templates" and request.QueryString("PageTitle") is nothing then
			dim aURL as String = cWebLib.AddQuerystringParameter(request.RawUrl(), "PageTitle", "Word Template Record Editor")
			response.Redirect(aURL)
		end if
		If Title = "" Then
			tabTitle.Visible = False
		End If
    End Sub

'==============================================================

	Public Sub DocumentList_ViewConvertedUploadedFile(ByVal aPrimaryKeyValue As String)

		Dim aHref As String

		aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("ConvertedFileViewer"))
		aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aPrimaryKeyValue)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
		'Response.Redirect(aHref)

	End Sub

'----------------------------------------------------

	Public Sub DocumentList_Delete(ByVal aPrimaryKeyValue As String)

		'get aSubmittedFile and call SubmittedFileDelete
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

'----------------------------------------------------

	Public Sub DocumentList_DumpInfo(ByVal aSubmittedFileID As String)

		Dim aSubmittedFile As cDataObject
		Dim aSourceFileName As String
		Dim aSourceFilePath As String

		Dim aPerson As cDataObject
		Dim aFirstName As String
		Dim aLastName As String

		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aArgNode As XmlNode
		Dim aXmlDoc As cXMLDoc

		Dim aAddressList As cDataObjectList
		Dim aAddressObject As cDataObject

		'Dump SubmittedFile
		Debug.WriteLine("cDocument_List: DocumentList_DumpInfo: aSubmittedFileID = " & aSubmittedFileID.ToString())
		aSubmittedFile = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SubmittedFile", aSubmittedFileID.ToString())

		aSourceFileName = aSubmittedFile.GetPropertyString("SourceFileName")
		aSourceFilePath = aSubmittedFile.GetPropertyString("SourceFilePath")
		Debug.WriteLine("cDocument_List: DocumentList_DumpInfo: SourceFileName = " & (aSourceFileName))
		Debug.WriteLine("cDocument_List: DocumentList_DumpInfo: SourceFileName = " & (aSourceFilePath))

		'Dump Person
		aPerson = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", _
				CType(CType(Page, cModulePage).ModuleUser, cEGUser).PersonID)
		aFirstName = aPerson.GetPropertyString("FirstName")
		Debug.WriteLine("cDocument_List: DocumentList_DumpInfo: FirstName = " & _
							(aFirstName))
		aLastName = aPerson.GetPropertyString("LastName")
		Debug.WriteLine("cDocument_List: DocumentList_DumpInfo: LastName = " & _
							(aLastName))

		'Dump Each Person Address

		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("Address", _
						aDataObjectNode, aFiltersNode)
		aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode _
			(aXmlDoc, "Integer", "PersonID", CType(CType(Page, cModulePage).ModuleUser, _
			cEGUser).PersonID, "AND"))

		aAddressList = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)

		'aAddressList = aPerson.GetRelatedPropertyDataObjectList("Address")

		If aAddressList.Count > 0 Then
			For Each aAddressObject In aAddressList
				Debug.WriteLine("cDocument_List: DocumentList_DumpInfo: Address1 = " & _
				(aAddressObject.GetPropertyString("Address1")))
			Next
		End If

	End Sub

'=================================================

		Private Sub InitializeComponent()

		End Sub
End Class

End Namespace