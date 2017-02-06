Imports System.IO
Imports System.Web.UI.WebControls
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Web.User
Imports Core.Web

Namespace Core_Web.Controls.Base

Public Class cLSCUpload
	Inherits Core_Web.Controls.Base.cUploadNew

	Private mEntityID As Integer
	Private mEntityType As String
	Private mLscMilestoneID As Integer
	Private mWfProjectTaskUploadID As Integer
	Private mWfProjectTaskUpload As cDataObject
	Private mFileExtensions As String
        Private mSubmittedFileDataObj As cDataObject
        Protected DivUploadTemplate As HtmlGenericControl
        Protected ctlTemplateLink As cLink



	Public Property EntityID() As Integer
		Get
			Return mEntityID
		End Get
		Set(ByVal value As Integer)
			mEntityID = value
		End Set
	End Property

	Public Property EntityType() As String 'Corresponds to EntityDataObjectKey property of SubmittedFile. Can't name code property accordingly because that name is used in a non-overridable property in the parent class.
		Get
			Return mEntityType
		End Get
		Set(ByVal value As String)
			mEntityType = value
		End Set
	End Property

	Public Property LscMilestoneID() As Integer
		Get
			Return mLscMilestoneID
		End Get
		Set(ByVal value As Integer)
			mLscMilestoneID = value
		End Set
	End Property

	Public Property WfProjectTaskUploadID() As Integer
		Get
			Return mWfProjectTaskUploadID
		End Get
		Set(ByVal value As Integer)
			mWfProjectTaskUploadID = value
		End Set
	End Property

	Public Property WfProjectTaskUpload() As cDataObject
		Get
			If mWfProjectTaskUpload Is Nothing Then
				mWfProjectTaskUpload = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTaskUpload", WfProjectTaskUploadID)
			End If
			Return mWfProjectTaskUpload
		End Get
		Set(ByVal value As cDataObject)
			mWfProjectTaskUpload = value
		End Set
	End Property

	Public Property FileExtensions() As String
		Get
			If mFileExtensions = "" Then
				mFileExtensions = WfProjectTaskUpload.GetRelatedPropertyString("Upload.AllowedFileExtensions")
			End If
			Return mFileExtensions
		End Get
		Set(ByVal value As String)
			mFileExtensions = value
		End Set
	End Property

	Public Overrides Sub CoreCtl_Configure(ByVal aDisplayControlNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
		btnUpload.Set_ServerClick(AddressOf DoUpload)
		'Set properties from argument list
		Dim aPropertiesEl As XmlElement = aDisplayControlNode.SelectSingleNode("Control/Properties")
		If Not aPropertiesEl Is Nothing Then
			SetProperties(aPropertiesEl)
            End If

            Dim WfProjectTaskUploadList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskUpload", "WfProjectTaskUploadID", WfProjectTaskUploadID)
            If WfProjectTaskUploadList.Count > 0 AndAlso WfProjectTaskUploadList(0).GetRelatedPropertyInt("Upload.UploadTemplateID", 0) > 0 Then
                Dim aHref As String
                Dim UploadTemplateID As Integer = WfProjectTaskUploadList(0).GetRelatedPropertyInt("Upload.UploadTemplateID", 0)
                DivUploadTemplate.Visible = True
                ctlTemplateLink.Caption = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("UploadTemplate", UploadTemplateID.ToString()).GetPropertyString("TemplateName")
                aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
                aHref = cWebLib.AddQuerystringParameter(aHref, "ID", UploadTemplateID.ToString())
                aHref = cWebLib.AddQuerystringParameter(aHref, "DataObject", "UploadTemplate")
                ctlTemplateLink.Href = aHref
                ctlTemplateLink.Target = "_blank"
            Else
                DivUploadTemplate.Visible = False
            End If
	End Sub

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
        End Sub

	Public Overridable Sub SetProperties(ByVal aPropertiesEl As XmlElement)
		If Not Me.EventController Is Nothing Then
			EventController.EventController_SetArgumentsInNodeList(aPropertiesEl)
		End If
		Dim aArgumentEl As XmlElement
		aArgumentEl = aPropertiesEl.SelectSingleNode("Argument[@PropertyKey='EntityID']")
		If Not aArgumentEl Is Nothing Then
			EntityID = Int32.Parse(aArgumentEl.Attributes("Value").Value)
		End If
		aArgumentEl = aPropertiesEl.SelectSingleNode("Argument[@PropertyKey='EntityType']")
		If Not aArgumentEl Is Nothing Then
			EntityType = aArgumentEl.Attributes("Value").Value
		End If
		aArgumentEl = aPropertiesEl.SelectSingleNode("Argument[@PropertyKey='LscMilestoneID']")
		If Not aArgumentEl Is Nothing Then
			LscMilestoneID = Int32.Parse(aArgumentEl.Attributes("Value").Value)
		End If
		aArgumentEl = aPropertiesEl.SelectSingleNode("Argument[@PropertyKey='WfProjectTaskUploadID']")
		If Not aArgumentEl Is Nothing Then
			WfProjectTaskUploadID = Int32.Parse(aArgumentEl.Attributes("Value").Value)
		End If
		aArgumentEl = aPropertiesEl.SelectSingleNode("Argument[@PropertyKey='DisplayErrorInValidationSummary']")
		If Not aArgumentEl Is Nothing Then
			Dim aValue As String = aArgumentEl.Attributes("Value").Value
			If aValue = "True" Then
				DisplayErrorInValidationSummary = True
			Else
				DisplayErrorInValidationSummary = False
			End If
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
		If FileExtensions <> "" Then
			If FileExtensions.Length > 0 Then
				Dim aIndex As Integer
				If FileExtensions.IndexOf(aSourceExt.ToLower()) < 0 Then
					SetCustomError(aSourceExt + " is not a valid file type. Valid file types are: " + FileExtensions)
					Exit Sub

				End If
			End If
		End If

		Dim aNode As XmlNode
		Dim aList As XmlNodeList = Me.WebAppl.ConfigDoc.DocElement.SelectNodes("ForbiddenFiles/FileExtension")

		For Each aNode In aList
			If aNode.Attributes("Name").Value.ToString() = aSourceExt Then
				If DisplayErrorInValidationSummary Then
					SetCustomError(aNode.Attributes("ErrorMessage").Value.ToString())
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
		aDataObject("EntityID") = EntityID
		aDataObject("UploadID") = WfProjectTaskUploadID
		aDataObject("SourceFileMIMEType") = aFile.ContentType
		aDataObject("EntityDataObjectKey") = EntityType

		aDataObject("SourceFileName") = SetSourceFileName(aSourceFileName)
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
		SubmittedFileID = aDataObject("SubmittedFileID")

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
			If DisplayErrorInValidationSummary Then
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

	Public Overridable Function SetSourceFileName(ByVal aSourceFileName As String) As String
		Dim i As Integer
		If Me.EntityType <> "LscMilestone" Then
			Return aSourceFileName
		End If

		Dim aMilestone As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("LscMilestone", EntityID)
		Dim aMilestoneNum As String = aMilestone.GetPropertyString("MilestoneNumber")
		Dim aPaymentNum As String = aMilestone.GetRelatedPropertyString("Payment.PaymentNumber")
		Dim aTIG As String = aMilestone.GetRelatedPropertyString("Payment.GranteeProject.LegacyGrantID")

		Return "T" + aTIG + "_P" + aPaymentNum + "_M" + aMilestoneNum + "_" + aSourceFileName
	End Function

	Protected Sub UploadCtl_Notify_DataModified()
		If Not EventController Is Nothing Then
			EventController.EventController_Notify_DataModified(WebSession.DataObjectFactory, Nothing)
		End If
	End Sub

	Protected Sub SetCustomError(ByVal aErrorMessage As String)
		If Not valUpload Is Nothing Then
			valUpload.IsValid = False
			valUpload.ErrorMessage = aErrorMessage
		End If
	End Sub

	Protected Sub DeleteExistingFileData()
		If Not SubmittedFileObj Is Nothing Then
			SubmittedFileObj.SubmittedFile_Delete()
		End If
	End Sub

	Protected Sub SetNoFileError(ByVal aDefaultErrorMsg As String, ByVal aAttributeMsg As String)
		If DisplayErrorInValidationSummary Then
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

End Class

End Namespace
