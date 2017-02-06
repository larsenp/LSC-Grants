Imports System.Xml
Imports System.IO
Imports System.Text
Imports System.Threading
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.Modules
Imports EasyGrants.Web.User

Namespace Core_Web.Controls.Base
<ValidationPropertyAttribute("EntityAssocID")> Public MustInherit Class cUpload
	Inherits EasyGrants.Web.cUploadBase

'====================================================

	Protected upl1 As FileUpload
    Protected btnUpload As cCSSButton
	Protected tdFileName As HtmlTableCell
	Protected tdFileSize As HtmlTableCell
	Protected trFileSize As HtmlTableRow
	Protected tdSubmitDate As HtmlTableCell
	Protected tdUploadedName As HtmlTableCell
	Protected trInstructions As HtmlTableRow
	Protected trModuleHdg As HtmlTableRow
	Protected tdInstructions As HtmlTableCell
	Protected trDescription As HtmlTableRow
	Protected txtDescription As cTextBox
	Protected spnView As HtmlGenericControl
	Protected spnDelete As HtmlGenericControl
	Protected spnSave As HtmlGenericControl
	Protected ctlStaffUpload As cstaffUpload
	Protected trMessage As HtmlTableRow
	Protected tdMessage As HtmlTableCell
	Protected trAdditionalInfo As HtmlTableRow
	Protected tdAdditionalInfo As HtmlTableCell
	Protected tdLine1 As HtmlTableCell
	Protected tdLine2 As HtmlTableCell
	Protected tdViewDelete As HtmlTableCell
	Protected tdFileTypeName As HtmlTableCell
	Protected tdUpload As HtmlTableCell
	Protected trPageLimit As HtmlTableRow
	Protected tdPageLimit As HtmlTableCell
	Protected trNoFileMessage As HtmlTableRow
	Protected spnNoFileMessage As HtmlGenericControl

	Private mFileTypeID As Integer
	Private mEntityAssocID As Integer
	Protected mSubmittedFileDataObj As cDataObject
	Private mSubmittedFileID As Integer

	Private mFileTypeName As String
	Private mDisplayPropertyNode As XmlNode

	Private mPageCount As Integer
	Private mWordCount As Integer
	Private mApproximatePageCount As String
	Private mPlural As String
	Private mCharacterCountWithSpaces As Integer
	Private mCharacterCountWithoutSpaces As Integer
	Private mDescription As Boolean
	Private mFileSizeDescription As Boolean = True
	Private mFileExtensionList() As String
	Private mErrorMessage As String
	Private mAnchor As String
	Private mDisplayDeleteButton As Boolean = True

	Private mRequired As Boolean = False
	Protected trRequired As HtmlTableRow
    Private mSaveBeforeUpload As Boolean

    Private Const aDefaultSaveRetryAttempts As Integer = 3
    Private Const aDefaultSaveRetryInterval As Integer = 1000
	Protected mSaveRetryAttempts As Integer = aDefaultSaveRetryAttempts
	Protected mSaveRetryInterval As Integer = aDefaultSaveRetryInterval
    Protected spnSetFocus As HtmlGenericControl
        Protected valUpload As CustomValidator
        Private mDisplayErrorInValidationSummary As Boolean = False
        Private mNotifyOnSaveDescription As Boolean = True

	Private UploadedName As String
	Private mViewOriginalFileFormat As String = "False"

	Private mFileNameTooLong As String

	Public aButton As cCSSButton
	Public mFileNameSizeLimit As Integer = 120
	Protected btnView As cLink
'====================================================

	Public Property Anchor() As String
		Get
			Return mAnchor
		End Get
		Set(ByVal Value As String)
			mAnchor = Value
		End Set
	End Property

'----------------------------------------------------

    Public Property SaveRetryAttempts() As Integer
        Get
            Return mSaveRetryAttempts
        End Get
        Set(ByVal Value As Integer)
            mSaveRetryAttempts = Value
        End Set
    End Property

'----------------------------------------------------

    Public Property SaveRetryInterval() As Integer
        Get
            Return mSaveRetryInterval
        End Get
        Set(ByVal Value As Integer)
            mSaveRetryInterval = Value
        End Set
    End Property

'----------------------------------------------------

    Public ReadOnly Property PageTitle() As String
        Get
            Dim aString As String = Request.QueryString("ReturnURL")

            If Not aString Is Nothing Then
                If aString.IndexOf("PageTitle") > -1 Then
                    aString = aString.Substring(aString.LastIndexOf("=") + 1)
                    Return Server.UrlDecode(aString)
                End If
            Else
                Return ""
            End If

            Return ""
        End Get
    End Property

'-------------------------------------------------------------

    Public Property EntityAssocID() As Integer
        Get
            EntityAssocID = mEntityAssocID
        End Get
        Set(ByVal Value As Integer)
            mEntityAssocID = Value
        End Set
    End Property

'----------------------------------------------------

    'Public ReadOnly Property SubmittedFileID() As Integer
    Public Property SubmittedFileID() As Integer
        Get
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


'----------------------------------------------------

    Public Property FileTypeID() As Integer
        Get
            FileTypeID = mFileTypeID
        End Get
        Set(ByVal Value As Integer)
            mFileTypeID = Value
        End Set
    End Property

'----------------------------------------------------

    Public ReadOnly Property FileTypeName() As String
        Get
            FileTypeName = mFileTypeName
        End Get
    End Property
'----------------------------------------------------
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

   Public Property InstructionHtml() As String
    Get
        Return tdInstructions.InnerHtml
    End Get
    Set(ByVal Value As String)
        If Value <> "" Then
            trInstructions.Visible = True
            tdInstructions.InnerHtml = "<BR>" + Value + "<BR>"
        Else
            trInstructions.Visible = False
        End If
    End Set
    End Property

'----------------------------------------------------

    Public ReadOnly Property PageCount() As Integer
        Get
            PageCount = mPageCount
        End Get
    End Property

'----------------------------------------------------

    Public Property WordCount() As Integer
        Get
            WordCount = mWordCount
        End Get
        Set(ByVal Value As Integer)
            mWordCount = Value
            Select Case mWordCount
                Case 250
                    mApproximatePageCount = "one third"
                Case 300
                    mApproximatePageCount = "one half"
                Case 350
                    mApproximatePageCount = "one half"
                Case 700
                    mApproximatePageCount = "one"
                Case 1000
                    mApproximatePageCount = "one and one-half"
                Case 1400
                    mApproximatePageCount = "two"
                Case 2100
                    mApproximatePageCount = "three"
                Case Else
                    mApproximatePageCount = (Int(mWordCount / 700) + 1).ToString()
            End Select

            If mWordCount > 700 Then
                mPlural = "s"
            Else
                mPlural = ""
            End If

        End Set
    End Property

'----------------------------------------------------

    Public ReadOnly Property CharacterCountWithSpaces() As Integer
        Get
            CharacterCountWithSpaces = mCharacterCountWithSpaces
        End Get
    End Property

'----------------------------------------------------

    Public ReadOnly Property CharacterCountWithoutSpaces() As Integer
        Get
            CharacterCountWithoutSpaces = mCharacterCountWithoutSpaces
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

'----------------------------------------------------

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

'----------------------------------------------------

    Public Property FileSizeDescription() As Boolean
        Get
            Return mFileSizeDescription
        End Get
        Set(ByVal Value As Boolean)
            mFileSizeDescription = Value
        End Set
    End Property

        '----------------------------------------------------

        Public Property NotifyOnSaveDescription() As Boolean
            Get
                Return mNotifyOnSaveDescription
            End Get
            Set(ByVal Value As Boolean)
                mNotifyOnSaveDescription = Value
            End Set
        End Property

        '----------------------------------------------------


        Public Property FileExtensionList() As String
            Get
                Dim aFileExtListStr As StringBuilder = new StringBuilder()
                Dim aFileExtStr As String
                If Not mFileExtensionList Is Nothing Then
					For Each aFileExtStr In mFileExtensionList
						aFileExtListStr.Append(aFileExtStr + ",")
					Next
                End If
                Return aFileExtListStr.ToString().TrimEnd(",")
            End Get
            Set(ByVal Value As String)
                mFileExtensionList = Value.ToLower().Split(",")
            End Set
        End Property

        '-------------------------------------------------------------

        Public Property Required() As Boolean
            Get
                Return mRequired
            End Get
            Set(ByVal Value As Boolean)
                mRequired = Value
            End Set
        End Property
        '-------------------------------------------------------------

        Public Property ErrorMessage() As String
            Get
                Return mErrorMessage
            End Get
            Set(ByVal Value As String)
                mErrorMessage = Value
            End Set
        End Property
        '-------------------------------------------------------------

        Public Property SaveBeforeUpload() As Boolean
            Get
                Return mSaveBeforeUpload
            End Get
            Set(ByVal Value As Boolean)
                mSaveBeforeUpload = Value
            End Set
        End Property

        '-------------------------------------------------------------

        Public Property DisplayErrorInValidationSummary() As Boolean
            Get
                Return mDisplayErrorInValidationSummary
            End Get
            Set(ByVal Value As Boolean)
                mDisplayErrorInValidationSummary = Value
            End Set
		End Property

		Public Property ViewOriginalFileFormat() As String
			Get
				ViewOriginalFileFormat = mViewOriginalFileFormat
			End Get
			Set(ByVal Value As String)
				mViewOriginalFileFormat = Value
			End Set
		End Property


        '====================================================

        Public Overrides Sub CoreCtl_Configure(ByVal aDisplayControlNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
            Dim aArgumentsList As XmlNodeList
            Dim aArgumentNode As XmlNode
            Dim aDataObjectNode As XmlNode
            Dim aFiltersNode As XmlNode
            Dim aXMLDoc As cXMLDoc

			Dim aHref As String = ""
            Dim aFileTypeObject As New cDataObject()
            Dim aInstructionNode As XmlNode
            Dim aAdditionalInfo As Boolean
            Dim aModuleHdg As Boolean = True
            Dim aDisplayPropertyNode As XmlNode
            Dim aControlNode As XmlNode
            Dim aErrorMessage As String
            Dim aSubmittedFileDOList As cDataObjectList
            Dim aSubmittedFileDO As cDataObject
            Dim aConversionStatus As String
            Dim aUser As cEGUser
            Dim aWfTaskAssignmentID As String
            Dim aFileTypeID As Integer
			Dim aURL As String
			Dim aUploadedID As Integer
			Dim aPersonDO As cDataObject

            If Request.QueryString("Anchor") <> "" Then
                aURL = Request.RawUrl
                aURL = cWebLib.RemoveQuerystringParameter(aURL, "Anchor")
                aURL += "#" + Request.QueryString("Anchor")
                Response.Redirect(aURL)
            End If

            aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
            aWfTaskAssignmentID = aUser.WfTaskAssignmentID

            MyBase.CoreCtl_Configure(aDisplayControlNode, aDataObjectList)

            If Not Visible Then Exit Sub

            If PageTitle <> "" Then CType(Page, cModulePage).PageTitle = PageTitle

			trNoFileMessage.Visible = False
			trMessage.Visible = False
            spnSetFocus.Visible = False

            'The following line is required in order to enable file uploads
            CorePage.CorePage_Form.Enctype = "multipart/form-data"
			btnUpload.Set_ServerClick(AddressOf DoUpload)
			btnUpload.CausesValidation = False

            DisplayPropertyNode = aDisplayControlNode
            aControlNode = cXMLDoc.GetControlNode(DisplayPropertyNode)
            Required = cXMLDoc.AttributeToBool(aControlNode, "Required")

            ctlStaffUpload.UploadCtl = Me

            SubmittedFileID = -1
            aArgumentsList = aDisplayControlNode.SelectNodes("Control/Parameters/Argument")
            EventController.EventController_SetArgumentsInNodeList(aArgumentsList)
            For Each aArgumentNode In aArgumentsList
                Select Case cXMLDoc.AttributeToString(aArgumentNode, "PropertyKey")
                    Case "FileTypeID"
                        FileTypeID = cXMLDoc.AttributeToInt(aArgumentNode, "Value")
                        aAdditionalInfo = cXMLDoc.AttributeToBool(aArgumentNode, "AdditionalInfo", True)
                        Anchor = cXMLDoc.AttributeToString(aArgumentNode, "Anchor", "")
                        mDisplayDeleteButton = cXMLDoc.AttributeToBool(aArgumentNode, "DisplayDeleteButton", True)
                    Case "EntityAssocID"
						EntityAssocID = cXMLDoc.AttributeToInt(aArgumentNode, "Value")
                    Case "SubmittedFileID"
                        '-1 means SubmittedFileID not included
                        SubmittedFileID = cXMLDoc.AttributeToInt(aArgumentNode, "Value", -1)
                        'add "SubmittedFileID" and retrieve from Arguments if available
                        '	* use existing SubmittedFileID property
                    Case "Description"
                        Description = cXMLDoc.AttributeToString(aArgumentNode, "Value", "False")
                    Case "FileSizeDescription"
                        FileSizeDescription = cXMLDoc.AttributeToString(aArgumentNode, "Value", "True")
                    Case "ModuleHdg"
                        aModuleHdg = cXMLDoc.AttributeToBool(aArgumentNode, "Value", True)
                    Case "FileExtensionList"
                        FileExtensionList = cXMLDoc.AttributeToString(aArgumentNode, "Value", "False")
                        mErrorMessage = cXMLDoc.AttributeToString(aArgumentNode, "ErrorMessage", "False")
                    Case "SaveBeforeUpload"
                        SaveBeforeUpload = cXMLDoc.AttributeToBool(aArgumentNode, "Value", False)
                    Case "SaveRetryAttempts"
                        SaveRetryAttempts = cXMLDoc.AttributeToInt(aArgumentNode, "Value", aDefaultSaveRetryAttempts)
                    Case "SaveRetryInterval"
                        SaveRetryInterval = cXMLDoc.AttributeToInt(aArgumentNode, "Value", aDefaultSaveRetryInterval)
                    Case "DisplayErrorInValidationSummary"
						DisplayErrorInValidationSummary = cXMLDoc.AttributeToBool(aArgumentNode, "Value", False)
					Case "ViewOriginalFileFormat"
						ViewOriginalFileFormat = cXMLDoc.AttributeToString(aArgumentNode, "Value", False)

				End Select

                'Hide/unhide separator heading for FileTypeName
                If Not cXMLDoc.AttributeToString(aArgumentNode, "IsHiddenFileTypeName") Is Nothing Then
                    If cXMLDoc.AttributeToString(aArgumentNode, "IsHiddenFileTypeName").ToLower = "true" Then
                        tdFileTypeName.Visible = False
                    ElseIf cXMLDoc.AttributeToString(aArgumentNode, "IsHiddenFileTypeName").ToLower = "false" Then
                        tdFileTypeName.Visible = True
                    End If
                End If

                ''Enable/disable upload button confirm message
                'If Not cXMLDoc.AttributeToString(aArgumentNode, "IsConfirmUpload") Is Nothing Then
                '	If cXMLDoc.AttributeToString(aArgumentNode, "IsConfirmUpload") = "True" Then
                '		'Display only upload button having confirm message
                '		tdUpload.Visible = False
                '	Else
                '		'Display only upload button not having confirm message
                '		tdUpload.Visible = True
                '	End If
                'Else
                '	'Display only upload button not having confirm message
                '	tdUpload.Visible = True
                'End If

			Next

			If Not trRequired Is Nothing Then
				If Required = True Then
					trRequired.Visible = True
				Else
					trRequired.Visible = False
				End If
				aSubmittedFileDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile", "EntityID", EntityAssocID)
				If aSubmittedFileDOList.Count > 0 Then
					For Each aSubmittedFileDO In aSubmittedFileDOList
						aConversionStatus = aSubmittedFileDO.GetPropertyString("ConversionStatus")
						aFileTypeID = aSubmittedFileDO.GetPropertyInt("FileTypeID", 0)
						If aConversionStatus <> "" And aFileTypeID = FileTypeID Then
							trRequired.Visible = False
						End If
					Next
				End If
			End If

            'get file type object and set properties
            aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("FileType", aDataObjectNode, aFiltersNode)
            aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "FileTypeID", FileTypeID))
            aFileTypeObject = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
            If FileExtensionList Is Nothing OrElse FileExtensionList = "" Then
				FileExtensionList = aFileTypeObject.GetPropertyString("AllowedFileExtensions", "")
				mErrorMessage = aFileTypeObject.GetPropertyString("InvalidFileExtensionErrorMessage", "")
			End If

            mFileTypeName = aFileTypeObject.GetPropertyString("Description")
			NoFileMessage = cXMLDoc.AttributeToString(aControlNode, "NoFileMessage")
			FileNameTooLong = cXMLDoc.AttributeToString(aControlNode, "FileNameTooLong")
            mPageCount = aFileTypeObject.GetPropertyInt("PageCount", 0)
            WordCount = aFileTypeObject.GetPropertyInt("WordCount", 0)
            mCharacterCountWithSpaces = aFileTypeObject.GetPropertyInt("CharacterCountWithSpaces", 0)
            mCharacterCountWithoutSpaces = aFileTypeObject.GetPropertyInt("CharacterCountWithoutSpaces", 0)

            'get submitted file object
            aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("SubmittedFile", aDataObjectNode, aFiltersNode)
            'if we have SubmittedFileID, then add it to the filter arguments
            If SubmittedFileID > 0 Then
                aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "SubmittedFileID", SubmittedFileID))
            Else
                aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "FileTypeID", FileTypeID))
                aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "EntityID", EntityAssocID))
            End If

            'if we know, b/c SubmittedFileID = 0, that we are getting a new object...
            If SubmittedFileID = 0 Then
                mSubmittedFileDataObj = Nothing
            Else
				mSubmittedFileDataObj = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
			End If
			If Not mSubmittedFileDataObj Is Nothing AndAlso mSubmittedFileDataObj.GetPropertyString("SourceFileName", "") <> "" Then
				'Populate file information
				mSubmittedFileID = mSubmittedFileDataObj("SubmittedFileID")

				'*************** This is the section Added to get PersonName ************

				If Not mSubmittedFileDataObj("UploadedByID") Is DBNull.Value Then
					aUploadedID = mSubmittedFileDataObj("UploadedByID")

					aPersonDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", aUploadedID)

				End If
				'*************** Section Ends to get PersonName **************************

				tdLine1.InnerHtml() = "<hr />"
				If Not mSubmittedFileDataObj("SubmitDate") Is DBNull.Value Then
					tdSubmitDate.InnerHtml = "<font color='green'><B>" + Format(mSubmittedFileDataObj("SubmitDate"), "M/d/yyyy") + "</B></font>"
				End If
				'tdFileName.InnerHtml = "<font color='green'><B>" + mSubmittedFileDataObj("SourceFileName").ToString + "</B></font>"
				btnView = EventController.GetNewCoreControl("cLink")
				spnView.Controls.Add(btnView)
				btnView.Caption = "<font color='green'><B>" + mSubmittedFileDataObj.GetPropertyString("SourceFileName", "") + "</B></font>"
				btnView.ID = "btnView"
				'Dim aViewerNode As XmlNode
				If ViewOriginalFileFormat = "True" Then
					aHref = CorePage.GetUploadViewerControlUrl("OriginalFileViewer")
					'aViewerNode = WebAppl.ConfigDoc.DocElement.SelectSingleNode("UploadViewerControls/Control[@Type='OriginalFileViewer']")
				Else
					aHref = CorePage.GetUploadViewerControlUrl("ConvertedFileViewer")
					'aViewerNode = WebAppl.ConfigDoc.DocElement.SelectSingleNode("UploadViewerControls/Control[@Type='ConvertedFileViewer']")
				End If
				If aHref = "" Then
					aHref = "pgUploadReader.aspx"
				Else
					aHref = WebAppl.Build_RootURL(aHref)
				End If
				aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", mSubmittedFileID.ToString)
				btnView.Href = aHref
				btnView.Target = "_blank"
				If Not aPersonDO Is Nothing Then
					tdUploadedName.InnerHtml = "<font color='green'><B>" + aPersonDO("LastNameFirstName").ToString + "</B></font>"
				End If
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

				'Build View and Delete buttons
				'View
				'aButton = EventController.GetNewCoreControl("cButton")
				'spnView.Controls.Add(aButton)
				'aButton.Caption = "View"
				'aButton.ID = "btnView"
				'aButton.CausesValidation = False

				''Dim aViewerNode As XmlNode
				'If ViewOriginalFileFormat = "True" Then
				'	aHref = CorePage.GetUploadViewerControlUrl("OriginalFileViewer")
				'Else
				'	aHref = CorePage.GetUploadViewerControlUrl("ConvertedFileViewer")
				'End If

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

				'Delete
				'Do not display delete button for some HHMI uploads
				If mDisplayDeleteButton Then
					aButton = EventController.GetNewCoreControl("cButton")
					spnDelete.Controls.Add(aButton)
					aButton.CausesValidation = False
					aButton.Caption = "Delete"
					aButton.ID = "btnDelete"
					aButton.Add_Attribute("SubmittedFileID", mSubmittedFileID.ToString)
					aButton.Add_Attribute("onclick", "return confirm('Are you sure you want to delete this file?');")
					aButton.Set_ServerClick(AddressOf Upload_Delete)
				End If
			Else
				tdLine1.InnerHtml() = ""
				tdFileName.InnerHtml() = ""
				tdSubmitDate.InnerHtml = ""
				tdFileName.InnerHtml = ""
				tdUploadedName.InnerHtml = ""
				tdLine2.InnerHtml() = ""
				ctlStaffUpload.Visible = False
			End If

			aInstructionNode = aDisplayControlNode.SelectSingleNode("Control/InstructionHtml")
			If Not aInstructionNode Is Nothing Then
				InstructionHtml = aInstructionNode.InnerXml
			End If

			Dim Confirmation As String
			Dim aPopupMessageNode As XmlNode
			aPopupMessageNode = aDisplayControlNode.SelectSingleNode("Control/PopupMessage")
			If Not aPopupMessageNode Is Nothing Then
				Confirmation = cXMLDoc.AttributeToString(aPopupMessageNode, "Confirmation", "").Trim()
				If Confirmation.Length > 0 Then
					Confirmation = Confirmation & "\r\n"
				End If
				If Not mSubmittedFileDataObj Is Nothing Then
					Confirmation = Confirmation & cXMLDoc.AttributeToString(aPopupMessageNode, "UpdateConfirmation", "").Trim()
				End If
				If Confirmation.Length > 0 Then
					btnUpload.Confirmation = Confirmation.ToString()
				End If
			End If
		End Sub

        '----------------------------------------------------

		Protected Sub UploadCtl_Notify_DataModified()
			If Not EventController Is Nothing Then
				EventController.EventController_Notify_DataModified(WebSession.DataObjectFactory, Nothing)
			End If
		End Sub

        '----------------------------------------------------

		Private Sub DoUpload(ByVal aSrc As Object, ByVal aEventArgs As EventArgs)
			Dim aFile As HttpPostedFile
			Dim aXMLDoc As cXMLDoc
			Dim aDataObjectNode As XmlNode
			'Dim aDataObject As cDataObject
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

			If Not upl1.HasFile Then 'No file selected.
				SetNoFileError("Please click the Browse button and select a file to upload.", NoFileMessage)
				Exit Sub
			End If

			aFile = upl1.PostedFile

			If aFile.ContentLength = 0 Then	 'No file selected.
				SetNoFileError("Please click the Browse button and select a file to upload.", NoFileMessage)
				Exit Sub
			End If

			aSourcePathName = upl1.FileName
			If aSourcePathName.Length > mFileNameSizeLimit Then
				SetNoFileError("Limit File Name to " & mFileNameSizeLimit & " characters.", FileNameTooLong)
				Exit Sub
			End If
			aSourcePath = Path.GetFullPath(aSourcePathName)
			aSourceFileName = Path.GetFileName(aSourcePathName)
			Dim aSourceExt As String = aSourceFileName.Substring(aSourceFileName.LastIndexOf(".") + 1)

			'Added logic for checking file extensions
			If Not mFileExtensionList Is Nothing AndAlso Not mFileExtensionList(0) = "" Then
				If mFileExtensionList.Length > 0 Then
					'Dim aSourceExt As String
					Dim aIndex As Integer
					If mFileExtensionList.IndexOf(mFileExtensionList, aSourceExt.ToLower()) < 0 Then
						If mDisplayErrorInValidationSummary Then
							SetCustomError(FileTypeName + " - Invalid File Extension " + mErrorMessage)
						Else
							trMessage.Visible = True
							tdMessage.InnerHtml = "<font color='red'><B>Invalid File Extension " + mErrorMessage + "</B></font>"
							If Not spnSetFocus Is Nothing Then
								spnSetFocus.Visible = True
							End If
							'Upload_Redirect(True)
						End If
						Exit Sub

					End If
				End If
			End If

			Page.Validate()
			If Not Page.IsValid Then
				Exit Sub
			End If

			Dim aNode As XmlNode
			Dim aList As XmlNodeList = Me.WebAppl.ConfigDoc.DocElement.SelectNodes("ForbiddenFiles/FileExtension")

			For Each aNode In aList
				If aNode.Attributes("Name").Value.ToString() = aSourceExt Then
					If mDisplayErrorInValidationSummary Then
						SetCustomError(FileTypeName + " - " + aNode.Attributes("ErrorMessage").Value.ToString())
					Else
						trMessage.Visible = True
						tdMessage.InnerHtml = "<font color='red'><B>" + aNode.Attributes("ErrorMessage").Value.ToString() + "</B></font>"
						If Not spnSetFocus Is Nothing Then
							spnSetFocus.Visible = True
						End If
					End If
					Exit Sub
				End If
			Next

			'moved "DeleteExistingFileData()" below the Save, as when page validation fails, system was deleting current upload
			'  when user tries to overwrite the current upload with a new file.            
			If SaveBeforeUpload Then
				If Not CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).EventController_Save() Then
					Exit Sub
				End If
			End If

			'If Not mSubmittedFileDataObj Is Nothing Then
			'	DeleteExistingFileData()
			'End If

		   'Create new submitted file data object
			'aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("SubmittedFile", aDataObjectNode)
			'aDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
			If mSubmittedFileDataObj Is Nothing Then
				mSubmittedFileDataObj = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("SubmittedFile")
			End If
			mSubmittedFileDataObj("EntityID") = mEntityAssocID
			mSubmittedFileDataObj("FileTypeID") = mFileTypeID
			mSubmittedFileDataObj("SourceFileMIMEType") = aFile.ContentType
			mSubmittedFileDataObj("SourceFileName") = aSourceFileName
			mSubmittedFileDataObj("SourceFilePath") = aSourcePath
			mSubmittedFileDataObj("StoredFilePath") = "BLOB" 'aStoredPath + aStoredFileName
			mSubmittedFileDataObj("SubmitDate") = Now()
			mSubmittedFileDataObj("ConversionStatus") = System.DBNull.Value
			mSubmittedFileDataObj("ConversionResult") = System.DBNull.Value
			If Description Then
				mSubmittedFileDataObj("Description") = txtDescription.Value
			End If

			Dim aEGUser As cEGUser
			aEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			If Not aEGUser Is Nothing Then
				mSubmittedFileDataObj("UploadedByID") = aEGUser.PersonID
			End If

			WebSession.DataObjectFactory.SaveDataObject(mSubmittedFileDataObj)
			mSubmittedFileID = mSubmittedFileDataObj("SubmittedFileID")

			'Create new submitted file data data object
			aBlobDataObject = mSubmittedFileDataObj.GetRelatedPropertyDataObject("SubmittedFileData")
			If aBlobDataObject Is Nothing Then
				aBlobDataObject = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("SubmittedFileData")
			End If
			'aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("SubmittedFileData", aBlobDataObjectNode)
			'aBlobDataObject = WebSession.DataObjectFactory.GetNewDataObject(aBlobDataObjectNode)
			aBlobDataObject("SubmittedFileID") = mSubmittedFileDataObj("SubmittedFileID")
			aFileLen = aFile.ContentLength
			'Dim aInput(aFileLen) As Byte
			Try
				'aStream = aFile.InputStream
				'aStream.Read(aInput, 0, aFileLen)
				'aInput = upl1.FileBytes
				aBlobDataObject("FileData") = upl1.FileBytes
				WebSession.DataObjectFactory.SaveDataObject(aBlobDataObject)
				'WebSession.DataObjectFactory.SaveDataObject(mSubmittedFileDataObj)
			Catch se As SystemException
				'Delete the row in the submitted_file table as the upload is not complete.
				'WebSession.DataObjectFactory.DeleteData(aBlobDataObject)
				If mDisplayErrorInValidationSummary Then
					SetCustomError(FileTypeName + " - The system encountered an error while trying to upload the file. This may be due to a network disruption or network maintenance. Please wait a few minutes and then re-try the upload. If the problem persists, please contact technical support using the information at the bottom of this page.")
				Else
					trMessage.Visible = True
					tdMessage.InnerHtml = "<font color='red'><B>The system encountered an error while trying to upload the file. This may be due to a network disruption or network maintenance. Please wait a few minutes and then re-try the upload. If the problem persists, please contact technical support using the information at the bottom of this page.</B></font>"
					If Not spnSetFocus Is Nothing Then
						spnSetFocus.Visible = True
					End If
				End If
				Exit Sub
			End Try
			UploadCtl_Notify_DataModified()

			'CorePage.Redirect()
			Upload_Redirect(False)

		End Sub
        '----------------------------------------------------

        Private Sub Upload_Delete(ByVal aSrc As Object, ByVal aEventArgs As EventArgs)
            DeleteExistingFileData()
            UploadCtl_Notify_DataModified()

            'CorePage.Redirect()
            Upload_Redirect(True)
        End Sub

        '----------------------------------------------------

		Public Overridable Sub DeleteExistingFileData()
			If Not SubmittedFileObj Is Nothing Then
				SubmittedFileObj.SubmittedFile_Delete()
			End If
		End Sub

		'----------------------------------------------------

		Protected Overridable Sub Upload_Redirect(ByVal aDelete As Boolean)
			Dim aValue As String = mSubmittedFileID
			Dim reset As Integer = 0

			Dim aURL = Request.Url.PathAndQuery()

			If aDelete = True Then
				aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "SubmittedFileID", reset)

				If Anchor <> "" Then
					aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "Anchor", Anchor)
				End If

				Response.Redirect(aURL)
			Else
				aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "SubmittedFileID", aValue)

				If Anchor <> "" Then
					aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "Anchor", Anchor)
				End If

				Response.Redirect(aURL)
			End If
		End Sub

		'----------------------------------------------------    

		'Private Sub Save_Description(ByVal aSrc As Object, ByVal aEventArgs As EventArgs)
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
				If (NotifyOnSaveDescription = True) Then
					UploadCtl_Notify_DataModified()
				End If
				Upload_Redirect(False)
			End If

		End Sub
		'----------------------------------------------------

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
			FileTypeControlID = upl1.ID
			MyBase.CoreCtl_Load(aSrc, aEvent)
			Dim aURL As String

			If Request.QueryString("Anchor") <> "" Then
				aURL = Request.RawUrl
				aURL = cWebLib.AddQuerystringParameter(aURL, "Anchor", "")
				aURL += "#" + Request.QueryString("Anchor")
				Response.Redirect(aURL)
			End If
		End Sub

		'----------------------------------------------------

		Private Sub InitializeComponent()

		End Sub

		'----------------------------------------------------

		Private Sub SetCustomError(ByVal aErrorMessage As String)
			If Not valUpload Is Nothing Then
				valUpload.IsValid = False
				valUpload.ErrorMessage = aErrorMessage
			End If
		End Sub

		'----------------------------------------------------

		Private Sub SetNoFileError(ByVal aDefaultErrorMsg As String, ByVal aAttributeMsg As String)
			If mDisplayErrorInValidationSummary Then
				If aAttributeMsg.Length = 0 Then
					SetCustomError(FileTypeName + " - " + aDefaultErrorMsg)
				Else
					SetCustomError(FileTypeName + " - " + aAttributeMsg)
				End If
			Else
				If aAttributeMsg.Length = 0 Then
					NoFileMessage = aDefaultErrorMsg  'Default no file message.
				Else
					NoFileMessage = aAttributeMsg
				End If
				trNoFileMessage.Visible = True
				If Not spnSetFocus Is Nothing Then
					spnSetFocus.Visible = True
				End If
			End If
		End Sub

		'====================================================		
End Class
End Namespace
