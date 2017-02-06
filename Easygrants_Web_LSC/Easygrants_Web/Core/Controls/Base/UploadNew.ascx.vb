Imports System.Xml
Imports System.IO
Imports System.Text
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports System.Threading
Imports System.IO.Compression

Namespace Core_Web.Controls.Base

<ValidationPropertyAttribute("EntityAssocID")> Public MustInherit Class cUploadNew
	Inherits EasyGrants.Web.cUploadBase

	Protected upl As FileUpload
	Protected btnUpload As cCSSButton
	Protected tdUploadType As HtmlTableCell
	Protected tdFileExt As HtmlTableCell
	Protected tdMaxFileSize As HtmlTableCell
	Protected tdMaxPages As HtmlTableCell
	Protected tdMaxWords As HtmlTableCell
	Protected tdMaxCharacters As HtmlTableCell
	Protected spnView As HtmlGenericControl
	Protected spnDelete As HtmlGenericControl
	Protected tdLine1 As HtmlTableCell
	Protected tdLine2 As HtmlTableCell
	Protected trTemplate As HtmlTableRow
	Protected trNoTemplate As HtmlTableRow
	Protected tdFileName As HtmlTableCell
	Protected tdUploadedName As HtmlTableCell
	Protected tdSubmitDate As HtmlTableCell
	Protected trNoFileMessage As HtmlTableRow
	Protected trMessage As HtmlTableRow
	Protected tdMessage As HtmlTableCell
	Protected trDescription As HtmlTableRow
	Protected txtDescription As cTextBox
	Protected spnNoFileMessage As HtmlGenericControl
	Protected ctlTemplateLink As cLink
	Protected spnSave As HtmlGenericControl
	Protected ctlStaffUpload As cStaffUploadNew

	Private mEntityAssocID As Integer
	Private mSubmittedFileDataObj As cDataObject
	Private mSubmittedFileID As Integer
	Public mDisplayPropertyNode As XmlNode


	Private Const aDefaultSaveRetryAttempts As Integer = 3
	Private Const aDefaultSaveRetryInterval As Integer = 1000
	Private mSaveRetryAttempts As Integer = aDefaultSaveRetryAttempts
	Private mSaveRetryInterval As Integer = aDefaultSaveRetryInterval


	Private mCharacterCountWithSpaces As Integer
	Private mCharacterCountWithoutSpaces As Integer
	Private mDescription As Boolean

	Private mDisplayErrorInValidationSummary As Boolean = False

	Private mSaveBeforeUpload As Boolean
	Protected valUpload As CustomValidator

	Protected aDataObject As cDataObject
	Public aSourceExt As String
	Public aButton As cCSSButton
	Protected btnView As cLink

	Private mFileNameTooLong As String
	Public mFileNameSizeLimit As Integer = 255
	Protected TblInstructions As HtmlTable

	Public Property EntityAssocID() As Integer
		Get
			EntityAssocID = mEntityAssocID
		End Get
		Set(ByVal Value As Integer)
			mEntityAssocID = Value
		End Set
	End Property

	Public ReadOnly Property URL() As String
		Get
			Dim aURL As String = WebAppl.Build_RootURL("Core/Controls/Base/UploadFormattingRequirements.htm")
			Return aURL
		End Get
	End Property

'----------------------------------------------------

	Public Property SubmittedFileID() As Integer
		Get
			If Not Request.QueryString("SubmittedFileID") Is Nothing Then
				mSubmittedFileID = convert.ToInt32(Request.QueryString("SubmittedFileID"))
			End If
			SubmittedFileID = mSubmittedFileID
		End Get
		Set(ByVal Value As Integer)
			mSubmittedFileID = Value
		End Set
	End Property

'----------------------------------------------------

	Public ReadOnly Property SubmittedFileObj() As cSubmittedFile
		Get
			SubmittedFileObj = mSubmittedFileDataObj
		End Get
	End Property



	Public ReadOnly Property UploadDataObject() As cDataObject
		Get
			If Request.QueryString("EntityDataObjectKey") = "WfTaskAssignment" Then
				UploadDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskUpload", "WfProjectTaskUploadID", Request.QueryString("WfProjectTaskUploadID"))(0)
			Else
				UploadDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Upload", "UploadID", Request.QueryString("UploadID"))(0)
			End If
		End Get
	End Property

	Public ReadOnly Property UploadID() As Integer
		Get
			If Request.QueryString("EntityDataObjectKey") = "WfTaskAssignment" Then
				UploadID = Request.QueryString("WfProjectTaskUploadID")
			Else
				UploadID = Request.QueryString("UploadID")
			End If
		End Get
	End Property
'----------------------------------------------------

	Public ReadOnly Property PageCount() As Integer
		Get
			If Request.QueryString("EntityDataObjectKey") = "WfTaskAssignment" Then
				PageCount = UploadDataObject.GetRelatedPropertyInt("Upload.PageCount", 0)
			Else
				PageCount = UploadDataObject.GetPropertyInt("PageCount", 0)
			End If
		End Get
	End Property
'----------------------------------------------------


	Public ReadOnly Property WordCount() As Integer
		Get
			If Request.QueryString("EntityDataObjectKey") = "WfTaskAssignment" Then
				WordCount = UploadDataObject.GetRelatedPropertyInt("Upload.WordCount", 0)
			Else
				WordCount = UploadDataObject.GetPropertyInt("WordCount", 0)
			End If
		End Get
	End Property

'----------------------------------------------------

	Public ReadOnly Property CharacterCountWithSpaces() As Integer
		Get
			If Request.QueryString("EntityDataObjectKey") = "WfTaskAssignment" Then
				CharacterCountWithSpaces = UploadDataObject.GetRelatedPropertyInt("Upload.CharacterCountWithSpaces", 0)
			Else
				CharacterCountWithSpaces = UploadDataObject.GetPropertyInt("CharacterCountWithSpaces", 0)
			End If
		End Get
	End Property

	Public ReadOnly Property FileExtensions() As String
		Get
			If Request.QueryString("EntityDataObjectKey") = "WfTaskAssignment" Then
				FileExtensions = UploadDataObject.GetRelatedPropertyString("Upload.AllowedFileExtensions")
			Else
				FileExtensions = UploadDataObject.GetPropertyString("AllowedFileExtensions", "")
			End If
		End Get
	End Property
'----------------------------------------------------

	Public ReadOnly Property CharacterCountWithoutSpaces() As Integer
		Get
			CharacterCountWithoutSpaces = mCharacterCountWithoutSpaces
		End Get
	End Property

	Public ReadOnly Property UploadName() As String
		Get
			If Request.QueryString("EntityDataObjectKey") = "WfTaskAssignment" Then
				UploadName = UploadDataObject.GetRelatedPropertyString("Upload.UploadName")
			Else
				UploadName = UploadDataObject.GetPropertyString("UploadName", "")
			End If
		End Get
	End Property

	Public ReadOnly Property UploadTemplateID() As Integer
		Get
			If Request.QueryString("EntityDataObjectKey") = "WfTaskAssignment" Then
				UploadTemplateID = UploadDataObject.GetRelatedPropertyInt("Upload.UploadTemplateID", 0)
			Else
				UploadTemplateID = UploadDataObject.GetPropertyInt("UploadTemplateID", 0)
			End If
		End Get
	End Property

	Public ReadOnly Property UploadTemplateName() As String
		Get
			If UploadTemplateID <> 0 Then
				UploadTemplateName = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("UploadTemplate", UploadTemplateID.ToString()).GetPropertyString("TemplateName")
			End If
		End Get
	End Property

	Public ReadOnly Property MaxFileSize() As Integer
		Get
			If Request.QueryString("EntityDataObjectKey") = "WfTaskAssignment" Then
				MaxFileSize = UploadDataObject.GetRelatedPropertyInt("Upload.MaxFileSize", 0)
			Else
				MaxFileSize = UploadDataObject.GetPropertyInt("MaxFileSize", 0)
			End If
		End Get
	End Property

	Public ReadOnly Property EntityDataObjectKey() As String
		Get
				Return Request.QueryString("EntityDataObjectKey")
		End Get
	End Property

'----------------------------------------------------

	Public Overrides Property DisplayPropertyNode() As XmlNode
		Get
			DisplayPropertyNode = mDisplayPropertyNode
		End Get
		Set(ByVal Value As XmlNode)
			mDisplayPropertyNode = Value
		End Set
	End Property

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

	Public ReadOnly Property ErrorMessage() As String
		Get
			If Request.QueryString("EntityDataObjectKey") = "WfTaskAssignment" Then
				ErrorMessage = UploadDataObject.GetRelatedPropertyString("Upload.InvalidFileExtensionErrorMessage")
			Else
				ErrorMessage = UploadDataObject.GetPropertyString("InvalidFileExtensionErrorMessage", "")
			End If
		End Get
	End Property

	Public Property SaveBeforeUpload() As Boolean
		Get
			Return mSaveBeforeUpload
		End Get
		Set(ByVal Value As Boolean)
			mSaveBeforeUpload = Value
		End Set
	End Property

	Public Property DisplayErrorInValidationSummary() As Boolean
		Get
			Return mDisplayErrorInValidationSummary
		End Get
		Set(ByVal Value As Boolean)
			mDisplayErrorInValidationSummary = Value
		End Set
	End Property
	
	Public ReadOnly Property ReturnAfterDelete() As Boolean
		Get
			If Not Request.QueryString("ReturnAfterDelete") Is Nothing Then
				ReturnAfterDelete = Request.QueryString("ReturnAfterDelete")
			Else
				ReturnAfterDelete = True
			End If
		End Get
	End Property

	Public Property HideInstructions() As Boolean
		Get
			Return TblInstructions.Visible
		End Get
		Set(ByVal Value As Boolean)
			TblInstructions.Visible = Value
		End Set
	End Property

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		FileTypeControlID = upl.ID
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Dim aURL As String
		Dim aUploadDataObject As cDataObject
		Dim atdTemplate As String
		Dim aHref As String

		tdUploadType.InnerHtml = UploadName
		
		If UploadTemplateID <> 0 Then
			trNoTemplate.Visible = False
			trTemplate.Visible = True
			ctlTemplateLink.Caption = UploadTemplateName
			aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
			aHref = cWebLib.AddQuerystringParameter(aHref, "ID", UploadTemplateID)
			aHref = cWebLib.AddQuerystringParameter(aHref, "DataObject", "UploadTemplate")
			ctlTemplateLink.Href = aHref
			ctlTemplateLink.Target = "_blank"
		Else
			trNoTemplate.Visible = True
			trTemplate.Visible = False
		End If

		tdFileExt.InnerHtml = FileExtensions

		If MaxFileSize <> 0 Then
			tdMaxFileSize.InnerHtml = MaxFileSize.ToString() + " MB"
		Else
			tdMaxFileSize.InnerHtml = "N/A"
		End If


		If PageCount <> 0 Then
			tdMaxPages.InnerHtml = PageCount
		Else
			tdMaxPages.InnerHtml = "N/A"
		End If

		If WordCount <> 0 Then
			tdMaxWords.InnerHtml = WordCount
		Else
			tdMaxWords.InnerHtml = "N/A"
		End If

		If CharacterCountWithSpaces <> 0 Then
			tdMaxCharacters.InnerHtml = CharacterCountWithSpaces
		Else
			tdMaxCharacters.InnerHtml = "N/A"
		End If

		If Request.QueryString("Anchor") <> "" Then
			aURL = Request.RawUrl
			aURL = cWebLib.AddQuerystringParameter(aURL, "Anchor", "")
			aURL += "#" + Request.QueryString("Anchor")
			Response.Redirect(aURL)
		End If
		
	End Sub

	Public Overrides Sub CoreCtl_Configure(ByVal aDisplayControlNode As XmlNode, ByVal aDataObjectList As cDataObjectList)

		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aXMLDoc As cXMLDoc

		Dim aHref As String = ""
		Dim aControlNode As XmlNode
		Dim aUser As cEGUser
		Dim aWfTaskAssignmentID As String
		Dim aUploadedID As Integer
		Dim aPersonDO As cDataObject
		Dim aArgumentsList As XmlNodeList
		Dim aArgumentNode As XmlNode
		
		
		MyBase.CoreCtl_Configure(aDisplayControlNode, aDataObjectList)

		aArgumentsList = aDisplayControlNode.SelectNodes("Control/Parameters/Argument")
		EventController.EventController_SetArgumentsInNodeList(aArgumentsList)
		For Each aArgumentNode In aArgumentsList
			Select Case cXMLDoc.AttributeToString(aArgumentNode, "PropertyKey")
				Case "HideInstructions"
					HideInstructions = cXMLDoc.AttributeToBool(aArgumentNode, "Value", True)
			End Select
		Next

		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		If Not Request.QueryString("WfTaskAssignmentID") Is Nothing Then
				aWfTaskAssignmentID = Request.QueryString("WfTaskAssignmentID")
		Else
			aWfTaskAssignmentID = aUser.WfTaskAssignmentID
		End If

		If Not Visible Then Exit Sub

		trNoFileMessage.Visible = False
		trMessage.Visible = False

		CorePage.CorePage_Form.Enctype = "multipart/form-data"
		btnUpload.Set_ServerClick(AddressOf DoUpload)

		DisplayPropertyNode = aDisplayControlNode
		aControlNode = cXMLDoc.GetControlNode(DisplayPropertyNode)

		FileNameTooLong = cXMLDoc.AttributeToString(aControlNode, "FileNameTooLong")

		Select Case EntityDataObjectKey
		Case "WfTaskAssignment"
			mEntityAssocID = aWfTaskAssignmentID
		Case "GranteeProject"
			mEntityAssocID = aUser.GranteeProjectID
		End Select

		aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("SubmittedFile", aDataObjectNode, aFiltersNode)
		'if we have SubmittedFileID, then add it to the filter arguments
		If SubmittedFileID > 0 Then
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "SubmittedFileID", SubmittedFileID))
		Else
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "UploadID", UploadID))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "EntityID", EntityAssocID))
		End If
		ctlStaffUpload.UploadNewCtl = Me
		'if we know, b/c SubmittedFileID = 0, that we are getting a new object...
		If SubmittedFileID = 0 Then
			mSubmittedFileDataObj = Nothing
		Else
			mSubmittedFileDataObj = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
		End If

		If Not mSubmittedFileDataObj Is Nothing Then
			'Populate file information
			mSubmittedFileID = mSubmittedFileDataObj("SubmittedFileID")

			'*************** This is the section Added to get PersonName ************

			If Not mSubmittedFileDataObj("UploadedByID") Is DBNull.Value Then
				aUploadedID = mSubmittedFileDataObj("UploadedByID")

				aPersonDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", aUploadedID)

			End If
			'*************** Section Ends to get PersonName **************************

			tdLine1.InnerHtml() = "<hr />"
			'tdFileName.InnerHtml() = "<hr />"
			tdSubmitDate.InnerHtml = Format(mSubmittedFileDataObj("SubmitDate"), "M/d/yyyy")
			'tdFileName.InnerHtml = mSubmittedFileDataObj("SourceFileName").ToString
			btnView = EventController.GetNewCoreControl("cLink")
			spnView.Controls.Add(btnView)
			btnView.Caption = mSubmittedFileDataObj("SourceFileName").ToString
			btnView.ID = "btnView"
			aHref = CorePage.GetUploadViewerControlUrl("ConvertedFileViewer")
			If aHref = "" Then
				aHref = "pgUploadReader.aspx"
			Else
				aHref = WebAppl.Build_RootURL(aHref)
			End If
			aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", mSubmittedFileID.ToString)
			btnView.Href = aHref
			btnView.Target = "_blank"

			tdUploadedName.InnerHtml = aPersonDO("LastNameFirstName").ToString
			tdLine2.InnerHtml() = "<hr />"

			If Description Then
				trDescription.Visible = True
				txtDescription.Value = mSubmittedFileDataObj("Description").ToString()
				'Build Save Button to save Description
				aButton = EventController.GetNewCoreControl("cButton")
				spnSave.Controls.Add(aButton)
				aButton.Caption = "Save"
				aButton.ID = "btnSave"
				aButton.Add_Attribute("SubmittedFileID", mSubmittedFileID.ToString)
				aButton.Set_ServerClick(AddressOf Save_Description)
			End If

			'aButton = EventController.GetNewCoreControl("cButton")
			'spnView.Controls.Add(aButton)
			'aButton.Caption = "View"
			'aButton.ID = "btnView"
			'Dim aViewerNode As XmlNode = WebAppl.ConfigDoc.DocElement.SelectSingleNode("UploadViewerControls/Control[@Type='Viewer']")
			'aHref = CorePage.GetUploadViewerControlUrl("ConvertedFileViewer")
			'If aHref = "" Then
			'	aHref = "pgUploadReader.aspx"
			'Else
			'	aHref = WebAppl.Build_RootURL(aHref)
			'End If
			'aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", mSubmittedFileID.ToString)
			'aButton.Href = aHref
			'aButton.Target = "_blank"

			'Dim aLabel As New Label()
			'aLabel.Text = "&nbsp;"
			'spnView.Controls.Add(aLabel)

			aButton = EventController.GetNewCoreControl("cButton")
			spnDelete.Controls.Add(aButton)
			aButton.Caption = "Delete"
			aButton.ID = "btnDelete"
			aButton.Add_Attribute("onclick", "return confirm('Are you sure you want to delete this item?');")
			aButton.Set_ServerClick(AddressOf Upload_Delete)
		End If

	End Sub

	Protected Overridable Sub Upload_Delete(ByVal aSrc As Object, ByVal aEventArgs As EventArgs)
		DeleteExistingFileData()
		Upload_Redirect(True)
	End Sub

	Public Overridable Sub Save_Description(ByVal aSrc As Object, ByVal aEventArgs As EventArgs)
			
		Dim aConcurrencyExceptionOccurred As Boolean
		Dim aSubmittedFileID As Integer
		Dim aRetryAttempts As Integer
		Dim aLastException As System.Data.DBConcurrencyException
		aConcurrencyExceptionOccurred = False
		If Not SubmittedFileObj Is Nothing Then
			SubmittedFileObj("Description") = txtDescription.Value
			Try
				WebSession.DataObjectFactory.SaveDataObject(SubmittedFileObj)
			Catch ex As System.Data.DBConcurrencyException
				aLastException = ex
				aConcurrencyExceptionOccurred = True
			End Try
			If (aConcurrencyExceptionOccurred = True) Then
				aRetryAttempts = 0
				''Retry the save till a maximum # of times, as specified by SaveRetryAttempts attribute
				While ((aConcurrencyExceptionOccurred = True) And (aRetryAttempts < mSaveRetryAttempts))
					aSubmittedFileID = SubmittedFileObj.GetPropertyInt("SubmittedFileID")
					mSubmittedFileDataObj = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SubmittedFile", aSubmittedFileID)
					SubmittedFileObj("Description") = txtDescription.Value
					Try
						aRetryAttempts = aRetryAttempts + 1
						''Suspend thread execution before retrying the Save
						Thread.Sleep(mSaveRetryInterval)
						WebSession.DataObjectFactory.SaveDataObject(SubmittedFileObj)
						aConcurrencyExceptionOccurred = False
					Catch ex As System.Data.DBConcurrencyException
						aLastException = ex
						aConcurrencyExceptionOccurred = True
					End Try
				End While
			End If
			''If aConcurrencyExceptionOccurred is still true, then the last concurrency exception needs to be re-thrown so that
			''it is handled by the system in it's default way.
			If (aConcurrencyExceptionOccurred = True) Then
				If ((aLastException Is Nothing) = False) Then
					Throw aLastException
				End If
			End If
			'If (NotifyOnSaveDescription = True) Then
			'	UploadCtl_Notify_DataModified()
			'End If
			'Upload_Redirect(False)
		End If

	End Sub

	Public Overridable Sub DoUpload(ByVal aSrc As Object, ByVal aEventArgs As EventArgs)

		Dim aFile As HttpPostedFile
		Dim aXMLDoc As cXMLDoc
		Dim aDataObjectNode As XmlNode
		Dim aBlobDataObjectNode As XmlNode
		Dim aBlobDataObject As cDataObject
		Dim aSourcePathName As String
		Dim aSourcePath As String
		Dim aSourceFileName As String
		Dim aStoredPath As String
		Dim aStoredFileName As String
		Dim aExtension As String
		Dim aFileLen As Integer
		Dim aStream As Stream
		Dim i As Integer

		If Not upl.HasFile Then	'No file selected.
			'SetNoFileError()
			SetNoFileError("File is required. Click <b>Browse</b> to select a file to upload.", NoFileMessage)
			Exit Sub
		End If

		aFile = upl.PostedFile

		If aFile.ContentLength = 0 Then	 'No file selected.
			'SetNoFileError()
			SetNoFileError("File is required. Click <b>Browse</b> to select a file to upload.", NoFileMessage)
			Exit Sub
		End If

		aSourcePathName = upl.FileName
		If aSourcePathName.Length > mFileNameSizeLimit Then
			SetNoFileError("Limit File Name to " & mFileNameSizeLimit & " characters.", FileNameTooLong)
			Exit Sub
		End If
		aSourcePath = Path.GetFullPath(aSourcePathName)
		aSourceFileName = Path.GetFileName(aSourcePathName)
		aSourceExt = aSourceFileName.Substring(aSourceFileName.LastIndexOf(".") + 1)

		'Added logic for checking file extensions
		If Not FileExtensions Is Nothing Then
			If FileExtensions.Length > 0 Then
				'Dim aSourceExt As String
				Dim aIndex As Integer
				If FileExtensions.IndexOf(aSourceExt.ToLower()) < 0 Then
					If mDisplayErrorInValidationSummary Then
						SetCustomError(" Invalid File Extension Error: " + ErrorMessage)
					Else
						trMessage.Visible = True
						tdMessage.InnerHtml = "<font color='red'><B>Invalid File Extension Error: " + ErrorMessage + "</B></font>"
						'If Not spnSetFocus Is Nothing Then
						'	spnSetFocus.Visible = True
						'End If
						''Upload_Redirect(True)
					End If
					Exit Sub

				End If
			End If
		End If

		Dim aNode As XmlNode
		Dim aList As XmlNodeList = Me.WebAppl.ConfigDoc.DocElement.SelectNodes("ForbiddenFiles/FileExtension")

		For Each aNode In aList
			If aNode.Attributes("Name").Value.ToString() = aSourceExt Then
				If mDisplayErrorInValidationSummary Then
					SetCustomError(UploadName + " - " + aNode.Attributes("ErrorMessage").Value.ToString())
				Else
					trMessage.Visible = True
					tdMessage.InnerHtml = "<font color='red'><B>" + aNode.Attributes("ErrorMessage").Value.ToString() + "</B></font>"
					'If Not spnSetFocus Is Nothing Then
					'	spnSetFocus.Visible = True
					'End If
				End If
				Exit Sub
			End If
		Next

		Page.Validate()
		If Not Page.IsValid Then
			Exit Sub
		End If

		'moved "DeleteExistingFileData()" below the Save, as when page validation fails, system was deleting current upload
		'  when user tries to overwrite the current upload with a new file.            
		If SaveBeforeUpload Then
			If Not CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).EventController_Save() Then
				Exit Sub
			End If
		End If

		If Not mSubmittedFileDataObj Is Nothing Then
			DeleteExistingFileData()
		End If

	   'Create new submitted file data object
		aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("SubmittedFile", aDataObjectNode)
		aDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
		aDataObject("EntityID") = EntityAssocID
		aDataObject("UploadID") = UploadID
		aDataObject("SourceFileMIMEType") = aFile.ContentType
		aDataObject("EntityDataObjectKey") = EntityDataObjectKey

		aDataObject("SourceFileName") = aSourceFileName
		aDataObject("SourceFilePath") = aSourcePath
		aDataObject("StoredFilePath") = "BLOB" 'aStoredPath + aStoredFileName
		aDataObject("SubmitDate") = Now()
		If Description Then
			aDataObject("Description") = txtDescription.Value
		End If

		Dim aEGUser As cEGUser
		aEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		If Not aEGUser Is Nothing Then
			aDataObject("UploadedByID") = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("User", WebSession.DataObjectFactory.User.UserID)(0).GetPropertyString("PersonID")

		End If

		WebSession.DataObjectFactory.SaveDataObject(aDataObject)
		mSubmittedFileID = aDataObject("SubmittedFileID")

		'Create new submitted file data data object			
		aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("SubmittedFileData", aBlobDataObjectNode)
		aBlobDataObject = WebSession.DataObjectFactory.GetNewDataObject(aBlobDataObjectNode)
		aBlobDataObject("SubmittedFileID") = aDataObject("SubmittedFileID")
		aFileLen = aFile.ContentLength

		Try
			aBlobDataObject("FileData") = upl.FileBytes
			aBlobDataObject("CompressedFileData") = CompressByte(upl.FileBytes)
			WebSession.DataObjectFactory.SaveDataObject(aBlobDataObject)
		Catch se As SystemException
			'Delete the row in the submitted_file table as the upload is not complete.
			WebSession.DataObjectFactory.DeleteData(aDataObject)
			If mDisplayErrorInValidationSummary Then
				SetCustomError(UploadName + " - The system encountered an error while trying to upload the file. This may be due to a network disruption or network maintenance. Please wait a few minutes and then re-try the upload. If the problem persists, please contact technical support using the information at the bottom of this page.")
			Else
				trMessage.Visible = True
				tdMessage.InnerHtml = "<font color='red'><B>The system encountered an error while trying to upload the file. This may be due to a network disruption or network maintenance. Please wait a few minutes and then re-try the upload. If the problem persists, please contact technical support using the information at the bottom of this page.</B></font>"
				'If Not spnSetFocus Is Nothing Then
				'	spnSetFocus.Visible = True
				'End If
			End If
			Exit Sub
		End Try
		UploadCtl_Notify_DataModified()


		'CorePage.Redirect()
		'Commented
		Upload_Redirect(False)

	End Sub

	Public Function CompressByte(ByVal byteSource() As Byte) As Byte()

		' Create a GZipStream object and memory stream object to store compressed stream
		Dim objMemStream As New MemoryStream()
		Dim objGZipStream As New GZipStream(objMemStream, CompressionMode.Compress, True)
		objGZipStream.Write(byteSource, 0, byteSource.Length)
		objGZipStream.Dispose()
		objMemStream.Position = 0
		' Write compressed memory stream into byte array
		Dim buffer(objMemStream.Length) As Byte
		objMemStream.Read(buffer, 0, buffer.Length)
		objMemStream.Dispose()
		Return buffer

	End Function

	Public Property NoFileMessage() As String
		Get
			NoFileMessage = spnNoFileMessage.InnerHtml
		End Get
		Set(ByVal Value As String)
			spnNoFileMessage.InnerHtml = Value
		End Set
	End Property

	Public Property FileNameTooLong() As String
		Get
			FileNameTooLong = mFileNameTooLong
		End Get
		Set(ByVal Value As String)
			mFileNameTooLong = Value
		End Set
	End Property

	Private Sub SetNoFileError()
		If mDisplayErrorInValidationSummary Then
			If NoFileMessage.Length = 0 Then
				SetCustomError(UploadName + " - File is required. Click <b>Browse</b> to select a file to upload.")
			Else
				SetCustomError(UploadName + " - " + NoFileMessage)
			End If
		Else
			If NoFileMessage.Length = 0 Then
				NoFileMessage = "File is required. Click <b>Browse</b> to select a file to upload."	 'Default no file message.
			End If
			trNoFileMessage.Visible = True
			'If Not spnSetFocus Is Nothing Then
			'	spnSetFocus.Visible = True
			'End If
		End If
	End Sub

	Private Sub SetNoFileError(ByVal aDefaultErrorMsg As String, ByVal aAttributeMsg As String)
		If mDisplayErrorInValidationSummary Then
			If aAttributeMsg.Length = 0 Then
				SetCustomError(UploadName + " - " + aDefaultErrorMsg)
			Else
				SetCustomError(UploadName + " - " + aAttributeMsg)
			End If
		Else
			If aAttributeMsg.Length = 0 Then
				NoFileMessage = aDefaultErrorMsg  'Default no file message.
			Else
				NoFileMessage = aAttributeMsg
			End If
			trNoFileMessage.Visible = True
		End If
	End Sub



	Private Sub SetCustomError(ByVal aErrorMessage As String)
		If Not valUpload Is Nothing Then
			valUpload.IsValid = False
			valUpload.ErrorMessage = aErrorMessage
		End If
	End Sub

	Private Sub DeleteExistingFileData()
		If Not SubmittedFileObj Is Nothing Then
			SubmittedFileObj.SubmittedFile_Delete()
		End If
	End Sub

	Protected Overridable Sub Upload_Redirect(ByVal aDelete As Boolean)
		Dim aValue As String = mSubmittedFileID
		Dim reset As Integer = 0

		Dim aURL As String = Request.Url.PathAndQuery()
		Dim ReturnURL As String = Request.QueryString("ReturnURL")

		If aDelete = True Then
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "SubmittedFileID", reset)

			'If Anchor <> "" Then
			'	aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "Anchor", Anchor)
			'End If
			If Not ReturnURL Is Nothing AndAlso ReturnAfterDelete Then
				Response.Redirect(ReturnURL)
			Else
				Response.Redirect(aURL)
			End If
		Else
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "SubmittedFileID", aValue)

			'If Anchor <> "" Then
			'	aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "Anchor", Anchor)
			'End If

			Response.Redirect(aURL)
		End If
	End Sub

	Private Sub UploadCtl_Notify_DataModified()
		If Not EventController Is Nothing Then
			EventController.EventController_Notify_DataModified(WebSession.DataObjectFactory, Nothing)
		End If
	End Sub

End Class

End Namespace