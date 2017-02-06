Imports System.Xml
Imports System.IO
Imports System.Text
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.Modules
Imports EasyGrants.Web.User


Namespace Core_Web.Controls.Base
<ValidationPropertyAttribute("ImportFileID")> Public MustInherit Class cImport
    Inherits Core.Web.cCoreCtl

'====================================================

	Protected upl1 As FileUpload
	Protected btnUploadNoConfirm As cCSSButton
	Protected tdFileName As HtmlTableCell
    Protected tdFileSize As HtmlTableCell
    Protected trFileSize As HtmlTableRow
    Protected tdSubmitDate As HtmlTableCell
    Protected trInstructions As HtmlTableRow
    Protected trModuleHdg As HtmlTableRow
    Protected tdInstructions As HtmlTableCell
    Protected spnView As HtmlGenericControl
    Protected spnDelete As HtmlGenericControl
    'Protected ctlStaffImport As cstaffImport
	Protected trMessage As HtmlTableRow
	Protected tdMessage As HtmlTableCell
	Protected trAdditionalInfo As HtmlTableRow
	Protected tdAdditionalInfo As HtmlTableCell
	Protected tdLine1 As HtmlTableCell
	Protected tdLine2 As HtmlTableCell
	Protected tdViewDelete As HtmlTableCell
	Protected tdFileTypeName As HtmlTableCell
	Protected tdUploadNoConfirm As HtmlTableCell
    Protected trPageLimit As HtmlTableRow
    Protected tdPageLimit As HtmlTableCell
    Protected spnNoFileMessage As HtmlGenericControl
    Protected trNoFileMessage As HtmlTableRow
    Protected spnSetFocus As HtmlGenericControl
    Protected valUpload As CustomValidator

	Private mImportTypeID As Integer
    Private mImportedFileDataObj As cDataObject
    Private mImportedFileID As Integer
    Private mFileTypeName As String
    Private mDisplayPropertyNode As XmlNode

    Private mFileSizeDescription As Boolean = True
	Private mFileExtensionList() As String
	Private mErrorMessage As String
	Private mAnchor As String
	Private mPageKey As String
	Private mDisplayErrorInValidationSummary As Boolean = False
	Protected btnView As cLink
    
    
	
'====================================================

    Public Property Anchor() As String
        Get
            return mAnchor
        End Get
        Set(ByVal Value As String)
            mAnchor = Value
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

'----------------------------------------------------
    Public Property NoFileMessage() As String
        Get
            NoFileMessage = spnNoFileMessage.InnerHtml
        End Get
        Set(ByVal Value As String)
            spnNoFileMessage.InnerHtml = Value
        End Set
    End Property

'----------------------------------------------------

	Public readonly Property PageTitle() As String
		Get
			dim aString as String = request.QueryString("ReturnURL")						
			
			if not aString is nothing then
				if aString.IndexOf("PageTitle") > -1 then
					aString = aString.Substring(aString.LastIndexOf("=") + 1)
					Return server.UrlDecode(aString)
				end if
			else
				return ""
			end if						
			
			return ""
		End Get
	End Property

'----------------------------------------------------

    Public Property ImportedFileID() As Integer
        Get
            ImportedFileID = mImportedFileID
        End Get
        Set(ByVal Value As Integer)
            mImportedFileID = Value
        End Set
    End Property

'----------------------------------------------------

    Public ReadOnly Property ImportedFileObj() As cImportedFile
        Get
            ImportedFileObj = mImportedFileDataObj
        End Get
    End Property


'----------------------------------------------------

    Public Property ImportTypeID() As Integer
        Get
            ImportTypeID = mImportTypeID
        End Get
        Set(ByVal Value As Integer)
            mImportTypeID = Value
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

	Public Overrides Property DisplayPropertyNode() As XmlNode
		Get
			DisplayPropertyNode = mDisplayPropertyNode
		End Get
		Set(ByVal Value As XmlNode)
			mDisplayPropertyNode = Value
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
			mFileExtensionList = Value.Split(",")
		End Set
	End Property

'====================================================

	Public Overrides Sub CoreCtl_Configure(ByVal aDisplayControlNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
		Dim aArgumentsList As XmlNodeList
		Dim aArgumentNode As XmlNode
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aXMLDoc As cXMLDoc
		Dim aButton As cCSSButton
		Dim aHref As String
		'Dim aFileTypeObject As New cDataObject()
		Dim aInstructionNode As XmlNode
		Dim aAdditionalInfo As Boolean
		Dim aModuleHdg As Boolean = True

		MyBase.CoreCtl_Configure(aDisplayControlNode, aDataObjectList)
		If Not Visible Then Exit Sub

		If PageTitle <> "" Then CType(Page, cModulePage).PageTitle = PageTitle

		'The following line is required in order to enable file uploads
		CorePage.CorePage_Form.Enctype = "multipart/form-data"
		btnUploadNoConfirm.Set_ServerClick(AddressOf DoUpload)

		DisplayPropertyNode = aDisplayControlNode
		'ctlStaffImport.UploadCtl = Me

        trNoFileMessage.Visible = False
        trMessage.Visible = False
        spnSetFocus.Visible = False

		ImportedFileID = -1
		aArgumentsList = aDisplayControlNode.SelectNodes("Control/Parameters/Argument")
		EventController.EventController_SetArgumentsInNodeList(aArgumentsList)
		For Each aArgumentNode In aArgumentsList
			Select Case cXMLDoc.AttributeToString(aArgumentNode, "PropertyKey")
				Case "ImportTypeID"
					ImportTypeID = cXMLDoc.AttributeToInt(aArgumentNode, "Value")
					aAdditionalInfo = cXMLDoc.AttributeToBool(aArgumentNode, "AdditionalInfo", True)
					Anchor = cXMLDoc.AttributeToString(aArgumentNode, "Anchor", "")
				Case "ImportedFileID"
					'-1 means ImportedFileID not included
					ImportedFileID = cXMLDoc.AttributeToInt(aArgumentNode, "Value", -1)
				Case "FileSizeDescription"
					FileSizeDescription = cXMLDoc.AttributeToString(aArgumentNode, "Value", "True")
				Case "ModuleHdg"
					aModuleHdg = cXMLDoc.AttributeToBool(aArgumentNode, "Value", True)
				Case "FileExtensionList"
					FileExtensionList = cXMLDoc.AttributeToString(aArgumentNode, "Value", "False")
					mErrorMessage = cXMLDoc.AttributeToString(aArgumentNode, "ErrorMessage", "False")
                Case "DisplayErrorInValidationSummary"
						DisplayErrorInValidationSummary = cXMLDoc.AttributeToBool(aArgumentNode, "Value", False)
			End Select
		Next

		'get submitted file object
		aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("ImportedFile", aDataObjectNode, aFiltersNode)
		'if we have ImportedFileID, then add it to the filter arguments
		If ImportedFileID > 0 Then
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "ImportedFileID", ImportedFileID))
		End If

		'if we know, b/c ImportedFileID = 0, that we are getting a new object...
		If ImportedFileID <= 0 Then
			mImportedFileDataObj = Nothing
		Else
			mImportedFileDataObj = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
		End If
		If Not mImportedFileDataObj Is Nothing Then
			'Populate file information
			mImportedFileID = mImportedFileDataObj("ImportedFileID")
			tdLine1.InnerHtml() = "<hr />"
			'tdFileName.InnerHtml() = "<hr />"
			tdSubmitDate.InnerHtml = "<font color='green'><B>" + Format(mImportedFileDataObj("SubmitDate"), "M/d/yyyy") + "</B></font>"
			'tdFileName.InnerHtml = "<font color='green'><B>" + mImportedFileDataObj("SourceFileName").ToString + "</B></font>"
			tdLine2.InnerHtml() = "<hr />"

			'Build View and Delete buttons
			'View
			btnView = EventController.GetNewCoreControl("cLink")
			spnView.Controls.Add(btnView)
			btnView.Caption = "<font color='green'><B>" + mImportedFileDataObj("SourceFileName").ToString + "</B></font>"
			btnView.ID = "btnView"
			aHref = "pgUploadReader.aspx"
			aHref = cWebLib.AddQuerystringParameter(aHref, "ImportedFileID", mImportedFileID.ToString)
			btnView.Href = aHref
			btnView.Target = "_blank"

			'Dim aLabel As New Label()
			'aLabel.Text = "&nbsp;"
			'spnView.Controls.Add(aLabel)

			'Delete
			aButton = EventController.GetNewCoreControl("cCSSButton")
			spnDelete.Controls.Add(aButton)
			aButton.Caption = "Delete"
			aButton.ID = "btnDelete"
			aButton.Add_Attribute("ImportedFileID", mImportedFileID.ToString)
			aButton.Set_ServerClick(AddressOf Upload_Delete)
		End If

        aInstructionNode = aDisplayControlNode.SelectSingleNode("Control/InstructionHtml")
        If Not aInstructionNode Is Nothing Then
            InstructionHtml = aInstructionNode.InnerXml
        End If
        
        Dim aControlNode As XmlNode
        aControlNode = aDisplayControlNode.SelectSingleNode("Control")
        mPageKey = ""
        If Not aControlNode Is Nothing Then
            mPageKey = cXMLDoc.AttributeToString(aControlNode, "PageKey", "")
            NoFileMessage = cXMLDoc.AttributeToString(aControlNode, "NoFileMessage")
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

			'If mImportTypeID <= 0 Then
			'	CorePage.Redirect()
			'	Exit Sub
			'End If

			Dim aUser As cEGUser
	        aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)

			If Not upl1.HasFile Then	 'No file selected.
				SetNoFileError()
				Exit Sub
			End If

            aFile = upl1.PostedFile

            If aFile.ContentLength = 0 Then  'No file selected.
                SetNoFileError()
                Exit Sub
            End If

            'aFile = upl1.PostedFile
			'If aFile.ContentLength = 0 Then
			'	CorePage.Redirect()
			'	Exit Sub
			'End If

			If Not mImportedFileDataObj Is Nothing Then
				DeleteExistingFileData()
			End If

			'Save uploaded file to web server
			'aStoredPath = "C:\Inetpub\wwwroot\Easygrants_v4_HHMI_r1\EasyGrants\EGDebug\UploadedFiles\"
			'aExtension = Path.GetExtension(upl1.PostedFile.FileName)
			'aStoredFileName = mEntityAssocID.ToString + "_" + mFileTypeID.ToString + aExtension
			'upl1.PostedFile.SaveAs(aStoredPath + aStoredFileName)

			'Save uploaded file to database

			'Create new submitted file data object
			aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("ImportedFile", aDataObjectNode)
			aDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
			aDataObject("ImportTypeID") = mImportTypeID
			aDataObject("SourceFileMIMEType") = aFile.ContentType
			aSourcePathName = upl1.FileName
			aSourcePath = Path.GetFullPath(aSourcePathName)
			aSourceFileName = Path.GetFileName(aSourcePathName)

			'Added logic for checking file extensions
			If Not mFileExtensionList Is Nothing Then
				If mFileExtensionList.Length > 0 Then
					Dim aSourceExt As String
					Dim aIndx As Integer
					aSourceExt = aSourceFileName.Substring(aSourceFileName.LastIndexOf(".") + 1)
					If mFileExtensionList.IndexOf(mFileExtensionList, aSourceExt.ToLower()) < 0 Then
						trMessage.Visible = True
						tdMessage.InnerHtml = "<font color='red'><B>Invalid File Extension " + mErrorMessage + "</B></font>"
						'Upload_Redirect(True)
						Exit Sub
					End If
				End If
			End If
			aDataObject("SourceFileName") = aSourceFileName
			aDataObject("SourceFilePath") = aSourcePath
			aDataObject("SubmitDate") = Now()
			aDataObject("UploadedByID") = aUser.PersonID

			WebSession.DataObjectFactory.SaveDataObject(aDataObject)
			mImportedFileID = aDataObject("ImportedFileID")

			'Create new submitted file data data object
			aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("ImportedFileData", aBlobDataObjectNode)
			aBlobDataObject = WebSession.DataObjectFactory.GetNewDataObject(aBlobDataObjectNode)
			aBlobDataObject("ImportedFileID") = aDataObject("ImportedFileID")
			aFileLen = aFile.ContentLength
			'Dim aInput(aFileLen) As Byte
			'aStream = aFile.InputStream
			'aStream.Read(aInput, 0, aFileLen)
			'aBlobDataObject("FileData") = aInput
			'WebSession.DataObjectFactory.SaveDataObject(aBlobDataObject)

			Try
				aBlobDataObject("FileData") = upl1.FileBytes
				WebSession.DataObjectFactory.SaveDataObject(aBlobDataObject)
			Catch se As SystemException
				'Delete the row in the submitted_file table as the upload is not complete.
				WebSession.DataObjectFactory.DeleteData(aDataObject)
				If mDisplayErrorInValidationSummary Then
					SetCustomError(aSourceFileName + " - The system encountered an error while trying to upload the file. This may be due to a network disruption or network maintenance. Please wait a few minutes and then re-try the upload. If the problem persists, please contact technical support using the information at the bottom of this page.")
				Else
					trMessage.Visible = True
					tdMessage.InnerHtml = "<font color='red'><B>The system encountered an error while trying to upload the file. This may be due to a network disruption or network maintenance. Please wait a few minutes and then re-try the upload. If the problem persists, please contact technical support using the information at the bottom of this page.</B></font>"
				End If
				Exit Sub
			End Try

			Upload_Redirect(False)
		End Sub

		'----------------------------------------------------

		Private Sub Upload_Delete(ByVal aSrc As Object, ByVal aEventArgs As EventArgs)
			DeleteExistingFileData()
			Upload_Redirect(True)
		End Sub

		'----------------------------------------------------

		Private Sub DeleteExistingFileData()
			If Not ImportedFileObj Is Nothing Then
				ImportedFileObj.ImportedFile_Delete()
			End If
		End Sub

		'----------------------------------------------------

		Protected Overridable Sub Upload_Redirect(ByVal aDelete As Boolean)
			Dim aValue As String = mImportedFileID
			Dim reset As Integer = 0

			Dim aURL = Request.Url.PathAndQuery()
			
			If aDelete = True Then
				aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "ImportedFileID", reset)
				if Anchor <> "" then
					aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "Anchor", Anchor)
				end if
			Else
				aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "ImportedFileID", aValue)
				if Anchor <> "" then
					aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "Anchor", Anchor)
				end if
			End If
			If mPageKey = "" Then	
				Response.Redirect(aURL)
			Else
				Me.EventController.EventController_NavigateToModulePageKey(mPageKey)
			End If
		End Sub

        '----------------------------------------------------

        Private Sub SetNoFileError()
            If mDisplayErrorInValidationSummary Then
                If NoFileMessage.Length = 0 Then
                    SetCustomError(FileTypeName + " - Please click the Browse button and select a file to upload.")
                Else
                    SetCustomError(FileTypeName + " - " + NoFileMessage)
                End If
            Else
                If NoFileMessage.Length = 0 Then
                    NoFileMessage = "Please click the Browse button and select a file to upload."  'Default no file message.
                End If
                trNoFileMessage.Visible = True
                If Not spnSetFocus Is Nothing Then
                    spnSetFocus.Visible = True
                End If
            End If
        End Sub

        '----------------------------------------------------

        Private Sub SetCustomError(ByVal aErrorMessage As String)
            If Not valUpload Is Nothing Then
                valUpload.IsValid = False
                valUpload.ErrorMessage = aErrorMessage
            End If
        End Sub


		'====================================================
End Class
End Namespace
