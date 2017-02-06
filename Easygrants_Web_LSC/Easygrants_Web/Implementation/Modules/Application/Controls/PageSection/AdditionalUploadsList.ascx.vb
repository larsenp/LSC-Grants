Imports System.Xml
Imports System.Diagnostics
Imports Core_Web.Controls.Base
Imports System.Reflection
Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User

Namespace Implementation.Modules.Application.Controls.PageSection
	Public MustInherit Class cAdditionalUploadsList
		Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
	   '=================================================

		Protected spnDelete As HtmlGenericControl
		Protected spnView As HtmlGenericControl
		Protected tdSubmitDate As HtmlTableCell
		Protected tdFileName As HtmlTableCell
		Protected btnUpload As cCSSButton
		Protected ctlNewWindowOpener As cNewWindowOpener

		Private mSubmittedFileID As Integer
		Private mTitle As String
		Private mEntityAssocID As Integer
		Private mSubmittedFileDataObj As cDataObject
		Private mFileTypeName As String
		Private mDisplayPropertyNode As XmlNode
		Private mDescription As Boolean

		'=================================================

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

		End Sub

		'==============================================================

		Public Sub DocumentList_ViewConvertedUploadedFile(ByVal aPrimaryKeyValue As String)

			Dim aHref As String

			aHref = WebAppl.Build_RootURL("Core/Controls/Base/pgUploadReader.aspx")
			aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aPrimaryKeyValue)
			ctlNewWindowOpener.NewWindowURL = aHref
			ctlNewWindowOpener.Open()

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

		'=================================================
	End Class

End Namespace