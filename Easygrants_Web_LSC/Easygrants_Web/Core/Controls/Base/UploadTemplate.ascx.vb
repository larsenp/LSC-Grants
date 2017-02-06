Imports Core.DataAccess.XMLAccess
Imports Core.DataAccess
Imports System.Xml
Imports System.IO
Imports Core.Web
Imports EasyGrants.Web.User
Imports Core.Web.Modules
Imports System.Threading

Namespace Core_Web.Controls.Base

Public MustInherit Class cUploadTemplate
	Inherits EasyGrants.Web.cUploadBase

	Protected upl As FileUpload
	Protected btnUpload As cCSSButton
	'Protected valUpload As CustomValidator
	Protected txtTemplateName As cTextBox
	Protected trNoFileMessage As HtmlTableRow
	Protected spnNoFileMessage As HtmlGenericControl
	Private mUploadTemplateID As String = ""
	Protected tdLine1 As HtmlTableCell
	Protected tdLine2 As HtmlTableCell
	Protected tdFileName As HtmlTableCell
	Protected tdUploadedBy As HtmlTableCell
	Protected tdUploadedDate As HtmlTableCell
	Protected spnView As HtmlGenericControl
	Protected spnDelete As HtmlGenericControl
	Protected trDescription As HtmlTableRow
	Protected spnSave As HtmlGenericControl

	Private mDescription As Boolean
	Public mUploadTemplateDO As cDataObject
	Private Const aDefaultSaveRetryAttempts As Integer = 3
	Private Const aDefaultSaveRetryInterval As Integer = 1000
	Private mSaveRetryAttempts As Integer = aDefaultSaveRetryAttempts
	Private mSaveRetryInterval As Integer = aDefaultSaveRetryInterval
	Private mNotifyOnSaveDescription As Boolean = True
	Private mDisplayPropertyNode As XmlNode

	Protected aDataObject As cDataObject
	Protected btnView As cLink

	Public Sub SetNoFileError()
		ErrorMessage = "Click the Browse button and select a file to upload."
		trNoFileMessage.Visible = True
	End Sub

	Private Sub SetNoTemplateNameError()
		ErrorMessage = "Template Name is required."
		trNoFileMessage.Visible = True
	End Sub

	Public Property ErrorMessage() As String
		Get
			ErrorMessage = spnNoFileMessage.InnerHtml
		End Get
		Set(ByVal Value As String)
			spnNoFileMessage.InnerHtml = Value
		End Set
	End Property

	Public Property UploadTemplateID() As String
		Get
			UploadTemplateID = mUploadTemplateID
		End Get
		Set(ByVal value As String)
			 mUploadTemplateID = value
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

	Public Property UploadTemplateDO() As cDataObject
		Get
			If Not UploadTemplateID Is Nothing Then
				mUploadTemplateDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("UploadTemplate", "UploadTemplateID", UploadTemplateID)(0)
				Return mUploadTemplateDO
			Else
				UploadTemplateDO = Nothing
			End If
		End Get
		Set(ByVal value As cDataObject)
			mUploadTemplateDO = value
		End Set
	End Property

   Public Property NotifyOnSaveDescription() As Boolean
		Get
			Return mNotifyOnSaveDescription
		End Get
		Set(ByVal Value As Boolean)
			mNotifyOnSaveDescription = Value
		End Set
	End Property

	Public Overrides Property DisplayPropertyNode() As XmlNode
		Get
			DisplayPropertyNode = mDisplayPropertyNode
		End Get
		Set(ByVal Value As XmlNode)
			mDisplayPropertyNode = Value
		End Set
	End Property

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
			FileTypeControlID = upl.ID
			MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub

	Public Overrides Sub CoreCtl_Configure(ByVal aDisplayControlNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
		MyBase.CoreCtl_Configure(aDisplayControlNode, aDataObjectList)
		Dim aButton As cCSSButton
		Dim aHref As String = ""
		Dim aControlNode As XmlNode
		Dim aArgumentsList As XmlNodeList
		Dim aArgumentNode As XmlNode
		'Dim aXMLDoc As cXMLDoc
		'Dim aFiltersNode As XmlNode
		'Dim aDataObjectNode As XmlNode

		trNoFileMessage.Visible = False

		mUploadTemplateID = Request.QueryString("UploadTemplateID").ToString()
		CorePage.CorePage_Form.Enctype = "multipart/form-data"
		btnUpload.Set_ServerClick(AddressOf DoUpload)

		DisplayPropertyNode = aDisplayControlNode
		aControlNode = cXMLDoc.GetControlNode(DisplayPropertyNode)
		aArgumentsList = aDisplayControlNode.SelectNodes("Control/Parameters/Argument")
		EventController.EventController_SetArgumentsInNodeList(aArgumentsList)
		For Each aArgumentNode In aArgumentsList
			Select Case cXMLDoc.AttributeToString(aArgumentNode, "PropertyKey")
				Case "Description"
					Description = cXMLDoc.AttributeToString(aArgumentNode, "Value", "False")
			End Select
		Next

		txtTemplateName.RequiredField = True
		txtTemplateName.ValidateFieldName = "Template Name is required."

		If Not UploadTemplateID = "0" Then
			If Not UploadTemplateDO Is Nothing Then
				If Description Then
					trDescription.Visible = True
					txtTemplateName.Value = UploadTemplateDO("TemplateName").ToString()
					aButton = EventController.GetNewCoreControl("cButton")
					spnSave.Controls.Add(aButton)
					aButton.Caption = "Save"
					aButton.ID = "btnSave"
					aButton.CausesValidation = False
					aButton.Add_Attribute("UploadTemplateID", UploadTemplateID)
					aButton.Set_ServerClick(AddressOf Save_Description)
				End If

				tdLine1.InnerHtml() = "<hr />"
				'tdFileName.InnerHtml() = "<hr />"
					tdUploadedBy.InnerHtml = "<font color='green'><B>" + UploadTemplateDO.GetRelatedPropertyString("CreatedByUser.Person.LastNameFirstName") + "</B></font>"
				'tdFileName.InnerHtml = "<font color='green'><B>" + UploadTemplateDO("SourceFileName").ToString + "</B></font>"
				If Not UploadTemplateDO Is Nothing AndAlso Not UploadTemplateDO.GetPropertyValue("CreateDate") Is System.DBNull.Value Then
					tdUploadedDate.InnerHtml = "<font color='green'><B>" + Format(UploadTemplateDO("CreateDate"), "M/d/yyyy") + "</B></font>"
				End If
				tdLine2.InnerHtml() = "<hr />"
				If Not UploadTemplateDO.GetPropertyValue("Template") Is System.DBNull.Value Then
					btnView = EventController.GetNewCoreControl("cLink")
					spnView.Controls.Add(btnView)
					btnView.Caption = "<font color='green'><B>" + UploadTemplateDO("SourceFileName").ToString + "</B></font>"
					btnView.ID = "btnView"

					'Dim aViewerNode As XmlNode
					aHref = CorePage.GetUploadViewerControlUrl("OriginalFileViewer")
					If aHref = "" Then
						aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
					End If
					'aViewerNode = WebAppl.ConfigDoc.DocElement.SelectSingleNode("UploadViewerControls/Control[@Type='OriginalFileViewer']")
					aHref = WebAppl.Build_RootURL(aHref)
					aHref = cWebLib.AddQuerystringParameter(aHref, "DataObject", "UploadTemplate")
					aHref = cWebLib.AddQuerystringParameter(aHref, "ID", UploadTemplateID)
					btnView.Href = aHref
					btnView.Target = "_blank"

					'Dim aLabel As New Label()
					'aLabel.Text = "&nbsp;"
					'spnView.Controls.Add(aLabel)

					aButton = EventController.GetNewCoreControl("cButton")
					spnDelete.Controls.Add(aButton)
					aButton.Caption = "Delete"
					aButton.ID = "btnDelete"
					aButton.Add_Attribute("UploadTemplateID", UploadTemplateID)
					aButton.Add_Attribute("onclick", "return confirm('Are you sure you want to delete this file?');")
					aButton.Set_ServerClick(AddressOf Upload_Delete)
				End If
			End If

			If request.QueryString("TemplateName") = "None" Then
				SetNoTemplateNameError()
				Exit Sub
			End If
		End If

	End Sub


	Public Overridable Sub Save_Description(ByVal aSrc As Object, ByVal aEventArgs As EventArgs)
		Dim aConcurrencyExceptionOccurred As Boolean
		Dim aUploadTemplateID As Integer
		Dim aRetryAttempts As Integer
		Dim aLastException As System.Data.DBConcurrencyException
		aConcurrencyExceptionOccurred = False

		Page.Validate()
		If Not Page.IsValid Then
			Exit Sub
		End If
  '      If txtTemplateName.Value = "" Then
		'	SetNoTemplateNameError()
		'	Exit Sub
		'End If

		If Not UploadTemplateDO Is Nothing Then
			mUploadTemplateDO("TemplateName") = txtTemplateName.Value
			Try
				WebSession.DataObjectFactory.SaveDataObject(mUploadTemplateDO)
			Catch ex As System.Data.DBConcurrencyException
				aLastException = ex
				aConcurrencyExceptionOccurred = True
			End Try
			If (aConcurrencyExceptionOccurred = True) Then
				aRetryAttempts = 0
				''Retry the save till a maximum # of times, as specified by SaveRetryAttempts attribute
				While ((aConcurrencyExceptionOccurred = True) And (aRetryAttempts < mSaveRetryAttempts))
					aUploadTemplateID = UploadTemplateDO.GetPropertyInt("UploadTemplateID")
					mUploadTemplateDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("UploadTemplate", aUploadTemplateID)
					mUploadTemplateDO("TemplateName") = txtTemplateName.Value
					Try
						aRetryAttempts = aRetryAttempts + 1
						''Suspend thread execution before retrying the Save
						Thread.Sleep(mSaveRetryInterval)
						WebSession.DataObjectFactory.SaveDataObject(mUploadTemplateDO)
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

	Protected Overridable Sub Upload_Delete(ByVal aSrc As Object, ByVal aEventArgs As EventArgs)
		DeleteExistingFileData(UploadTemplateDO)
		spnView.Visible = False
		spnDelete.Visible = False
		UploadCtl_Notify_DataModified()

		'CorePage.Redirect()
		Upload_Redirect(False)
	End Sub

	Protected Overridable Sub UploadCtl_Notify_DataModified()
		If Not EventController Is Nothing Then
			EventController.EventController_Notify_DataModified(WebSession.DataObjectFactory, Nothing)
		End If
	End Sub

	Public Overridable Sub DeleteExistingFileData(ByVal aTemplateDO As cDataObject)
		'If UploadTemplateID > 0 Then
		'	Dim aTemplateDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("UploadTemplate", UploadTemplateID)
			mUploadTemplateDO("Template") = System.DBNull.Value
			mUploadTemplateDO("SourceFileName") = System.DBNull.Value
			mUploadTemplateDO("SourceFileMIMEType") = System.DBNull.Value
			mUploadTemplateDO("CreateUser") = System.DBNull.Value
			mUploadTemplateDO("CreateDate") = System.DBNull.Value
			'The below 2 column are used for Sharepoint Integration . when a user switch from share point active to inactive then we need to update these 2 column values to null.
			mUploadTemplateDO("FileNamePrefix") = System.DBNull.Value
			mUploadTemplateDO("SharepointConversionStatus") = System.DBNull.Value
			WebSession.DataObjectFactory.SaveDataObject(mUploadTemplateDO)
		'End If
	End Sub

	Public Overridable Sub DoUpload(ByVal aSrc As Object, ByVal aEventArgs As EventArgs)

		Dim aDO As cDataObject
		aDO = DoUploadSubProcess()
		If Not aDO Is Nothing Then
			Upload_Redirect(False)
		End If

	End Sub

	Protected Overridable Function DoUploadSubProcess() As cDataObject
		Dim aFile As HttpPostedFile
		Dim aXMLDoc As cXMLDoc
		Dim aDataObjectNode As XmlNode
		'Dim aDataObject As cDataObject
		Dim aSourcePathName As String
		Dim aFileLen As Integer

		If Not upl.HasFile Then	'No file selected.
			SetNoFileError()
			Exit Function
		End If

		aFile = upl.PostedFile

		If aFile.ContentLength = 0 Then	 'No file selected.
			SetNoFileError()
			Exit Function
		End If

		Page.Validate()
		If Not Page.IsValid Then
			Exit Function
		End If
		'If txtTemplateName.Value = "" Then
		'	SetNoTemplateNameError()
		'	Exit Sub
		'End If

		If UploadTemplateID > 0 Then
			'UploadTemplateDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("UploadTemplate", UploadTemplateID)
		Else
			aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("UploadTemplate", aDataObjectNode)
			mUploadTemplateDO = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
		End If

		If Not mUploadTemplateDO Is Nothing AndAlso Not mUploadTemplateDO.IsNewDataObject Then
			DeleteExistingFileData(mUploadTemplateDO)
		End If

		If Description AndAlso txtTemplateName.Value <> "" Then
			mUploadTemplateDO("TemplateName") = txtTemplateName.Value
		End If
			aFileLen = aFile.ContentLength
		Try
			mUploadTemplateDO("Template") = upl.FileBytes
			mUploadTemplateDO("SourceFileMIMEType") = aFile.ContentType
			aSourcePathName = upl.FileName
			mUploadTemplateDO("SourceFileName") = Path.GetFileName(aSourcePathName)
			Dim aEGUser As cEGUser
			aEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			If Not aEGUser Is Nothing Then
				mUploadTemplateDO("CreateUser") = aEGUser.UserID
				mUploadTemplateDO("CreateDate") = System.DateTime.Now
			End If
			WebSession.DataObjectFactory.SaveDataObject(mUploadTemplateDO)
		Catch se As SystemException
			trNoFileMessage.Visible = True
			spnNoFileMessage.InnerHtml = "<font color='red'><B>The system encountered an error while trying to upload the file. This may be due to a network disruption or network maintenance. Please wait a few minutes and then re-try the upload. If the problem persists, please contact technical support using the information at the bottom of this page.</B></font>"
			Exit Function
		End Try

		mUploadTemplateID = mUploadTemplateDO.GetPropertyString("UploadTemplateID")

		Return mUploadTemplateDO
	End Function

	Protected Overridable Sub Upload_Redirect(ByVal aDelete As Boolean)

		Dim reset As Integer = 0
		Dim aURL As String = Request.Url.PathAndQuery()
		 If aDelete = True Then
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "UploadTemplateID", reset)
		 Else
			aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "UploadTemplateID", UploadTemplateID)
			If txtTemplateName.Value = "" And UploadTemplateDO.GetPropertyString("TemplateName") = "" Then
				aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "TemplateName", "None")
			Else
				aURL = Core.Web.cWebLib.RemoveQuerystringParameter(aURL, "TemplateName")
			End If
		 End If
		  Response.Redirect(aURL)
	End Sub

End Class
End Namespace
