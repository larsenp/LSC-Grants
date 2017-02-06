Imports System.Xml
Imports System.IO
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.Modules
Imports System.Text
Imports EasyGrants.Web.User
Imports Core.DataAccess.DBAccess

Namespace Core_Web.Controls.Base
    <ValidationPropertyAttribute("EntityAssocID")> Public MustInherit Class cUpload1
		Inherits EasyGrants.Web.cUploadBase

        '====================================================

        Protected upl1 As FileUpload
		Protected btnUploadNoConfirm As cCSSButton
		Protected btnUploadConfirm As cCSSButton
        Protected tdFileName As HtmlTableCell
        Protected tdFileSize As HtmlTableCell
        Protected trFileSize As HtmlTableRow
        Protected tdSubmitDate As HtmlTableCell
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
        Protected tdUploadNoConfirm As HtmlTableCell
        Protected tdUploadConfirm As HtmlTableCell
        Protected trPageLimit As HtmlTableRow
        Protected tdPageLimit As HtmlTableCell

        Private mFileTypeID As Integer
        Private mEntityAssocID As Integer
        Private mSubmittedFileDataObj As cDataObject
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

        'Private mValidation as Boolean = False
        Private mRequired As Boolean = False
        Protected trRequired As HtmlTableRow
		'Protected valUpload As CustomValidator
		Private mViewOriginalFileFormat As String = "False"
		Protected BtnView As cLink


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

        Public ReadOnly Property PageTitle() As String
            Get
                Dim aString As String = request.QueryString("ReturnURL")

                If Not aString Is Nothing Then
                    If aString.IndexOf("PageTitle") > -1 Then
                        aString = aString.Substring(aString.LastIndexOf("=") + 1)
                        Return server.UrlDecode(aString)
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

        Public Property InstructionHtml() As String
            Get
                Return tdInstructions.InnerHtml
            End Get
            Set(ByVal Value As String)
                If Value <> "" Then
                    trInstructions.Visible = True
                    tdInstructions.InnerHtml = Value + "<BR><BR>"
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

        Public Property FileExtensionList() As String
            Get
                Dim aFileExtListStr As StringBuilder = new StringBuilder()
                Dim aFileExtStr As String
                For Each aFileExtStr In mFileExtensionList
                    aFileExtListStr.Append(aFileExtStr + ",")
                Next
                Return aFileExtListStr.ToString().TrimEnd(",")
            End Get
            Set(ByVal Value As String)
                mFileExtensionList = Value.ToLower().Split(",")
            End Set
        End Property

        '-------------------------------------------------------------

        'Public Property Validation() As Boolean
        '    Get
        '        Return mValidation
        '    End Get
        '    Set(ByVal Value As Boolean)
        '        mValidation = Value
        '    End Set
        'End Property

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
		Public Property ViewOriginalFileFormat() As String
				Get
					ViewOriginalFileFormat = mViewOriginalFileFormat
				End Get
				Set(ByVal Value As String)
					mViewOriginalFileFormat = Value
				End Set
		End Property

        '-------------------------------------------------------------

        'Public Overridable ReadOnly Property CustomValidator() As CustomValidator
        'Get
        '    Return valUpload
        'End Get
        'End Property  

        '-------------------------------------------------------------  

        'Public Overridable WriteOnly Property ValidateFieldName() As String
        '	Set(ByVal Value As String)
        '		CustomValidator.ErrorMessage = Value
        '	End Set
        'End Property

        '-------------------------------------------------------------

        'Public Property RequiredField() As Boolean
        '	Get
        '		RequiredField = CustomValidator.Enabled
        '	End Get
        '	Set(ByVal Value As Boolean)
        '		CustomValidator.Enabled = Value
        '	End Set
        'End Property

        '====================================================

        Public Overrides Sub CoreCtl_Configure(ByVal aDisplayControlNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
            Dim aArgumentsList As XmlNodeList
            Dim aArgumentNode As XmlNode
            Dim aDataObjectNode As XmlNode
            Dim aFiltersNode As XmlNode
            Dim aXMLDoc As cXMLDoc
			Dim aButton As cCSSButton
			Dim aHref As String = ""
            Dim aFileTypeObject As New cDataObject
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
            Dim aFileTypeID As String
            Dim aURL As String

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

            'The following line is required in order to enable file uploads
            CorePage.CorePage_Form.Enctype = "multipart/form-data"
            btnUploadNoConfirm.Set_ServerClick(AddressOf DoUpload)
            btnUploadConfirm.Set_ServerClick(AddressOf DoUpload)

            DisplayPropertyNode = aDisplayControlNode
            aControlNode = cXMLDoc.GetControlNode(DisplayPropertyNode)
            Required = cXMLDoc.AttributeToBool(aControlNode, "Required")
            'aErrorMessage = cXMLDoc.AttributeToString(aControlNode, "ErrorMessage")

            'If aErrorMessage <> "" Then
            '	ValidateFieldName = aErrorMessage
            'End If

            'ctlStaffUpload.UploadCtl = Me

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
					Case "ViewOriginalFileFormat"
						ViewOriginalFileFormat = cXMLDoc.AttributeToString(aArgumentNode, "Value", False)

				End Select

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

                'Hide/unhide separator heading for FileTypeName
                If Not cXMLDoc.AttributeToString(aArgumentNode, "IsHiddenFileTypeName") Is Nothing Then
                    If cXMLDoc.AttributeToString(aArgumentNode, "IsHiddenFileTypeName") = "True" Then
                        tdFileTypeName.Visible = False
                    Else
                        tdFileTypeName.Visible = True
                    End If
                End If

                'Enable/disable upload button confirm message
                If Not cXMLDoc.AttributeToString(aArgumentNode, "IsConfirmUpload") Is Nothing Then
                    If cXMLDoc.AttributeToString(aArgumentNode, "IsConfirmUpload") = "True" Then
                        'Display only upload button having confirm message
                        tdUploadNoConfirm.Visible = False
                        tdUploadConfirm.Visible = True
                    Else
                        'Display only upload button not having confirm message
                        tdUploadNoConfirm.Visible = True
                        tdUploadConfirm.Visible = False
                    End If
                Else
                    'Display only upload button not having confirm message
                    tdUploadNoConfirm.Visible = True
                    tdUploadConfirm.Visible = False
                End If

            Next

            'get file type object and set properties
            aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("FileType", aDataObjectNode, aFiltersNode)
            aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "FileTypeID", FileTypeID))
            aFileTypeObject = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
			If FileExtensionList = "" Then
				FileExtensionList = aFileTypeObject.GetPropertyString("AllowedFileExtensions", "")
				mErrorMessage = aFileTypeObject.GetPropertyString("InvalidFileExtensionErrorMessage", "")
			End If
            mFileTypeName = aFileTypeObject.GetPropertyString("Description")
            mPageCount = aFileTypeObject.GetPropertyInt("PageCount", 0)
            WordCount = aFileTypeObject.GetPropertyInt("WordCount", 0)
            mCharacterCountWithSpaces = aFileTypeObject.GetPropertyInt("CharacterCountWithSpaces", 0)
            mCharacterCountWithoutSpaces = aFileTypeObject.GetPropertyInt("CharacterCountWithoutSpaces", 0)

            'get submitted file object
            aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("SubmittedFile", aDataObjectNode, aFiltersNode)
            aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "FileTypeID", FileTypeID))
            aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "EntityID", EntityAssocID))
            'if we have SubmittedFileID, then add it to the filter arguments
            If SubmittedFileID > 0 Then
                aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "SubmittedFileID", SubmittedFileID))
            End If

            'if we know, b/c SubmittedFileID = 0, that we are getting a new object...
            If SubmittedFileID = 0 Then
                mSubmittedFileDataObj = Nothing
            Else
                mSubmittedFileDataObj = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
            End If
            If Not mSubmittedFileDataObj Is Nothing Then
                'Populate file information
                mSubmittedFileID = mSubmittedFileDataObj("SubmittedFileID")
                tdLine1.InnerHtml() = "<hr />"
				'tdFileName.InnerHtml() = "<hr />"
                tdSubmitDate.InnerHtml = "<font color='green'><B>" + Format(mSubmittedFileDataObj("SubmitDate"), "M/d/yyyy") + "</B></font>"
				'tdFileName.InnerHtml = "<font color='green'><B>" + mSubmittedFileDataObj("SourceFileName").ToString + "</B></font>"
                tdLine2.InnerHtml() = "<hr />"

                If Description Then
                    trDescription.Visible = True
                    txtDescription.Value = mSubmittedFileDataObj("Description").ToString()
                    'Build Save Button to save Description
					aButton = EventController.GetNewCoreControl("cCSSButton")
                    spnSave.Controls.Add(aButton)
                    aButton.Caption = "Save"
                    aButton.ID = "btnSave"
                    aButton.Add_Attribute("SubmittedFileID", mSubmittedFileID.ToString)
                    aButton.Set_ServerClick(AddressOf Save_Description)
                End If


                'Build View and Delete buttons
                'View
				BtnView = EventController.GetNewCoreControl("cLink")
				spnView.Controls.Add(BtnView)
				BtnView.Caption = "<font color='green'><B>" + mSubmittedFileDataObj.GetPropertyString("SourceFileName", "") + "</B></font>"
				BtnView.ID = "btnView"

				'Dim aViewerNode As XmlNode
				If ViewOriginalFileFormat = "True" Then
					aHref = CorePage.GetUploadViewerControlUrl("OriginalFileViewer")
					'aViewerNode = WebAppl.ConfigDoc.DocElement.SelectSingleNode("UploadViewerControls/Control[@Type='OriginalFileViewer']")
				Else
					aHref = CorePage.GetUploadViewerControlUrl("ConvertedFileViewer")
					'aViewerNode = WebAppl.ConfigDoc.DocElement.SelectSingleNode("UploadViewerControls/Control[@Type='ConvertedFileViewer']")
				End If

				'If aViewerNode Is Nothing Then
				If aHref = "" Then
					aHref = "pgUploadReader.aspx"
				Else
					aHref = WebAppl.Build_RootURL(aHref)
				End If

				aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", mSubmittedFileID.ToString)
				BtnView.Href = aHref
				BtnView.Target = "_blank"

				'Dim aLabel As New Label
				'aLabel.Text = "&nbsp;"
				'spnView.Controls.Add(aLabel)

				'Delete
				'Do not display delete button for some HHMI uploads
				If mDisplayDeleteButton Then
					aButton = EventController.GetNewCoreControl("cCSSButton")
					spnDelete.Controls.Add(aButton)
					aButton.Caption = "Delete"
					aButton.ID = "btnDelete"
					aButton.Add_Attribute("SubmittedFileID", mSubmittedFileID.ToString)
					aButton.Add_Attribute("onclick", "return confirm('This action cannot be undone. Select OK to continue or Cancel to stop the delete action.');")
					aButton.Set_ServerClick(AddressOf Upload_Delete)
				End If
			End If

            'populate filesize instructions
            'if FileSizeDescription then
            '          trFileSize.Visible = True
            '         If aModuleHdg Then
            '        tdFileSize.InnerHtml = "<BR>"
            '       End If
            '      tdFileSize.InnerHtml += "Uploaded files must be no larger than 5 MB." + "<BR><BR>"
            '	else
            '       trFileSize.Visible = False
            '      tdFileSize.InnerHtml = ""
            '	End If		

            'hide/unhide ModuleHdg(the grey bar with the heading Uplaod )
            'If aModuleHdg Then
            'trModuleHdg.Visible = True
            'Else
            '    trModuleHdg.Visible = False
            'End If

            aInstructionNode = aDisplayControlNode.SelectSingleNode("Control/InstructionHtml")
            If Not aInstructionNode Is Nothing Then
                InstructionHtml = aInstructionNode.InnerXml
            End If
            'If Description Then
            'trDescription.Visible = True
            'End If

            'If aAdditionalInfo Then
            'trAdditionalInfo.Visible = True
            'tdAdditionalInfo.InnerHtml = "<BR><B>IMPORTANT</B>: After you have uploaded your file, click the <B>View</B> button to view the document as it has been converted. If there were any conversion errors, you will view a screen with those details."			
            'End If

            'populate page limitation
            'If mPageCount > 0 Then
            '	trPageLimit.Visible = True
            '	tdPageLimit.InnerHtml = "Uploaded file must be no more than " + mPageCount.ToString + " page(s)."
            'Else
            '	trPageLimit.Visible = False
            '	tdPageLimit.InnerHtml = ""
            'End If

        End Sub

        '----------------------------------------------------

        Private Sub UploadCtl_Notify_DataModified()
            If Not EventController Is Nothing Then
                EventController.EventController_Notify_DataModified(WebSession.DataObjectFactory, Nothing)
            End If
        End Sub

        '----------------------------------------------------

        Private Sub DoUpload(ByVal aSrc As Object, ByVal aEventArgs As EventArgs)
            Dim aFile As HttpPostedFile
            Dim aXMLDoc As cXMLDoc
            Dim aDataObjectNode As XmlNode
            Dim aDataObject As cDataObject
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
            Dim aObjList As cDataObjectList

            aFile = upl1.PostedFile
            If aFile.ContentLength = 0 Then
                CorePage.Redirect()
                Exit Sub
            End If

            'If Not mSubmittedFileDataObj Is Nothing Then
            '	DeleteExistingFileData()
            'End If

            'Save uploaded file to web server
            'aStoredPath = "C:\Inetpub\wwwroot\Easygrants_v4_HHMI_r1\EasyGrants\EGDebug\UploadedFiles\"
            'aExtension = Path.GetExtension(upl1.PostedFile.FileName)
            'aStoredFileName = mEntityAssocID.ToString + "_" + mFileTypeID.ToString + aExtension
            'upl1.PostedFile.SaveAs(aStoredPath + aStoredFileName)

            'Save uploaded file to database
            If Me.Request.QueryString("SubmittedFileID") = "0" Then
                Try
                    CType(WebSession.DataObjectFactory.GetDataProvider("EGDatabase"), cDataProviderSQL).DBConn.BeginTran()
                    Me.EventController.EventController_Save()
                    aObjList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("IDGen", _
                     "TableName", "SUBMITTED_FILE")
                    aObjList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile", _
                     "SubmittedFileID", (aObjList(0).GetPropertyInt("NextID") - 1).ToString())
                    CType(WebSession.DataObjectFactory.GetDataProvider("EGDatabase"), cDataProviderSQL).DBConn.CommitTran()
                Catch
                    CType(WebSession.DataObjectFactory.GetDataProvider("EGDatabase"), cDataProviderSQL).DBConn.RollbackTran()
                End Try
            Else
                Me.EventController.EventController_Save()
                aObjList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile", _
                 "SubmittedFileID", Me.Request.QueryString("SubmittedFileID"))
            End If
            'Create new submitted file data object
            'aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("SubmittedFile", aDataObjectNode)
            'aDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
            If aObjList Is Nothing Then Exit Sub
            If aObjList.Count = 0 Then Exit Sub
            aDataObject = aObjList(0)
            aDataObject("EntityID") = mEntityAssocID
            aDataObject("FileTypeID") = mFileTypeID
            aDataObject("SourceFileMIMEType") = aFile.ContentType
            aSourcePathName = upl1.FileName
            aSourcePath = Path.GetFullPath(aSourcePathName)
            aSourceFileName = Path.GetFileName(aSourcePathName)
            Dim aSourceExt As String = aSourceFileName.Substring(aSourceFileName.LastIndexOf(".") + 1)

            Dim aNode As XmlNode
            Dim aList As XmlNodeList = Me.WebAppl.ConfigDoc.DocElement.SelectNodes("ForbiddenFiles/FileExtension")

            For Each aNode In aList
                If aNode.Attributes("Name").Value.ToString() = aSourceExt Then
                    trMessage.Visible = True
                    tdMessage.InnerHtml = "<font color='red'><B>" + aNode.Attributes("ErrorMessage").Value.ToString() + "</B></font>"
                    Exit Sub
                End If
            Next

            'Added logic for checking file extensions
            If Not mFileExtensionList Is Nothing Then
                If mFileExtensionList.Length > 0 Then
                    'Dim aSourceExt As String
                    Dim aIndx As Integer
                    'aSourceExt = aSourceFileName.Substring(aSourceFileName.LastIndexOf(".") + 1)
                    If mFileExtensionList.IndexOf(mFileExtensionList, aSourceExt) < 0 Then
                        trMessage.Visible = True
                        tdMessage.InnerHtml = "<font color='red'><B>Invalid File Extension " + mErrorMessage + "</B></font>"
                        'Upload_Redirect(True)
                        Exit Sub
                    End If
                End If
			End If

			Page.Validate()
			If Not Page.IsValid Then
				Exit Sub
			End If

            aDataObject("SourceFileName") = aSourceFileName
            aDataObject("SourceFilePath") = aSourcePath
            aDataObject("StoredFilePath") = "BLOB"    'aStoredPath + aStoredFileName
            aDataObject("SubmitDate") = Now()
            If Description Then
                aDataObject("Description") = txtDescription.Value
            End If

            WebSession.DataObjectFactory.SaveDataObject(aDataObject)
            mSubmittedFileID = aDataObject("SubmittedFileID")

            'Create new submitted file data data object			
            aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("SubmittedFileData", aBlobDataObjectNode)
            aBlobDataObject = WebSession.DataObjectFactory.GetNewDataObject(aBlobDataObjectNode)
            aBlobDataObject("SubmittedFileID") = aDataObject("SubmittedFileID")
            aFileLen = aFile.ContentLength
            'Dim aInput(aFileLen) As Byte
            Try
                'aInput = upl1.FileBytes
                aBlobDataObject("FileData") = upl1.FileBytes
                WebSession.DataObjectFactory.SaveDataObject(aBlobDataObject)
            Catch se As SystemException
                'Delete the row in the submitted_file table as the upload is not complete.
                WebSession.DataObjectFactory.DeleteData(aDataObject)
                trMessage.Visible = True
                tdMessage.InnerHtml = "<font color='red'><B>The system encountered an error while trying to upload the file. This may be due to a network disruption or network maintenance. Please wait a few minutes and then re-try the upload. If the problem persists, please contact technical support using the information at the bottom of this page.</B></font>"
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

        Private Sub DeleteExistingFileData()
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
                'CorePage.Redirect() 
            End If
        End Sub

        '----------------------------------------------------    

        Private Sub Save_Description(ByVal aSrc As Object, ByVal aEventArgs As EventArgs)

            If Not SubmittedFileObj Is Nothing Then
                SubmittedFileObj("Description") = txtDescription.Value
                WebSession.DataObjectFactory.SaveDataObject(SubmittedFileObj)
                UploadCtl_Notify_DataModified()
                Upload_Redirect(False)
            End If

        End Sub
        '-----------------------------------------------------

        '   Public Sub ValidateUpload(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)

        '	'Dim aWFTADOList as cDataObjectList
        '	Dim aWFTADO as cDataObject
        '	Dim aSubmittedFileDOList as cDataObjectList
        '	Dim aSubmittedFileDO as cDataObject
        '	Dim aUser As cEGUser
        '	Dim aPersonID as String
        '	Dim aWfTaskAssignmentID as String
        '	Dim aEntityID as String
        '	Dim aFileTypeID as String
        '	Dim aFileTypeName as String
        '	Dim aSubmittedFileID as String = Request.QueryString("SubmittedFileID")

        '	Dim aDisplayPropertyNode As XmlNode
        '	Dim aDisplayControlNode As XmlNode
        '	Dim aControlNode As XmlNode
        '	Dim aErrorMessage As String

        '    aUser = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser)
        '    aPersonID = aUser.PersonID
        '    aWfTaskAssignmentID = aUser.WfTaskAssignmentID
        '	aSubmittedFileDOList = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile", "EntityID", aWfTaskAssignmentID)
        '	aWFTADO = Me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWfTaskAssignmentID)
        '	aEntityID = aWFTADO.GetRelatedPropertyString("SubmittedFile.EntityID")

        'If Validation = True then
        '	If aSubmittedFileDOList.Count > 0 then
        '		For each aSubmittedFileDO in aSubmittedFileDOList
        '			aFileTypeID = aSubmittedFileDO.GetPropertyString("FileTypeID")
        '			aFileTypeName = aSubmittedFileDO.GetRelatedPropertyString("FileType.Description")
        '			If aEntityID = aWfTaskAssignmentID and aFileTypeID = FileTypeID
        '				aArgs.IsValid = True
        '			Else
        '				aArgs.IsValid = False
        '				'If aEntityID = aWfTaskAssignmentID and aFileTypeID = FileTypeID then
        '					'valUpload.ErrorMessage = "Please upload your " + aFileTypeName + " file"
        '				'End If	
        '				'DisplayPropertyNode = aDisplayControlNode
        '				'aControlNode = cXMLDoc.GetControlNode(DisplayPropertyNode)
        '				'Validation = cXMLDoc.AttributeToBool(aControlNode, "Validation")
        '				''RequiredField = cXMLDoc.AttributeToBool(aControlNode, "RequiredField")
        '				'aErrorMessage = cXMLDoc.AttributeToString(aControlNode, "ErrorMessage")

        '				'If aErrorMessage <> "" Then
        '				'	ValidateFieldName = aErrorMessage

        '				'End If

        '			End If				
        '		Next			
        '	End If		
        'Else
        '	aArgs.IsValid = False
        'End If	

        ' End Sub 

        '====================================================

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
    End Class
End Namespace
