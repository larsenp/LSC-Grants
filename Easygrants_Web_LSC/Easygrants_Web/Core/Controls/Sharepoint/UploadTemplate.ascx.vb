Imports Core.DataAccess.XMLAccess
Imports Core.DataAccess
Imports System.Xml
Imports System.IO
Imports Core.Web
Imports EasyGrants.Web.User
Imports Core.Web.Modules
Imports System.Threading
Imports Core_Web.Controls.Base
Imports System.Text
Imports System.Net
Imports EasyGrants.Web

Namespace Core_Web.Controls.Sharepoint

Public MustInherit Class cUploadTemplate
	Inherits Core_Web.Controls.Base.cUploadTemplate

	Protected ctlFileNamePrefix As cTextBox
	Protected trUploadControl As HtmlTableRow

	Public Overrides Sub CoreCtl_Configure(ByVal aDisplayControlNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
		UploadValidator = New cSpUploadValidator(WebSession, ctlFileNamePrefix.ID)
		MyBase.CoreCtl_Configure(aDisplayControlNode, aDataObjectList)

		Dim aHref As String
		Dim aRemoteOrginalFileURL As String = ""
		Dim aSharePointDO As cDataObject = Nothing

		'These controls are from base class 
		Dim btnDelete As cCSSButton = CType(spnDelete.FindControl("btnDelete"), cCSSButton)

		ctlFileNamePrefix.RequiredField = True
		ctlFileNamePrefix.ValidateFieldName = "File Name Prefix is required."

		If Not UploadTemplateID = "0" Then
			If Not UploadTemplateDO Is Nothing Then
				ctlFileNamePrefix.Value = UploadTemplateDO.GetPropertyString("FileNamePrefix", "")

				'Here we are checking whether the File is in the SharePoint . if it is in Sharepoint then , we need to Update the View and Button.Other wise it will work as it is in Base class.
				If UploadTemplateDO.GetPropertyString("SharepointConversionStatus") = "-1" Then

					'We are the GetFileurl method of cDataPresenterCtl class to generate the aRemoteOrginalFileURL
					CorePage.GetFileUrl(UploadTemplateDO, aSharePointDO, aRemoteOrginalFileURL)

					Dim myCred As New System.Net.NetworkCredential(aSharePointDO("UserName"), aSharePointDO("Password"))
					Dim aWC As WebClient = New WebClient
					aWC.Credentials = myCred

					If Not btnView Is Nothing Then
						Try
							Dim res As Byte() = aWC.DownloadData(aRemoteOrginalFileURL)
							If res.Length > 0 Then
								If UploadTemplateDO.GetPropertyString("SourceFileMIMEType").Contains("pdf") Then
									btnView.Href = aRemoteOrginalFileURL
									btnView.Target = "_blank"
								Else
									aRemoteOrginalFileURL = aRemoteOrginalFileURL.Replace("'", "\'")
									btnView.Href = "javascript:ViewSharepointDocument('" + Server.HtmlEncode(aRemoteOrginalFileURL) + "')"
									btnView.Target = ""
								End If
							End If
						Catch we As System.Net.WebException
							aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("SharepointPageNotFound"))
							If we.Status = WebExceptionStatus.ConnectFailure Then
								aHref = cWebLib.AddQuerystringParameter(aHref, "ErrType", "SharepointDown")
							Else
								aHref = cWebLib.AddQuerystringParameter(aHref, "ErrType", "NotFound")
							End If
							btnView.Href = aHref
							btnView.Target = "_blank"
						Catch ex As Exception
						End Try
					End If

					'Here we are hiding the Baseclass delete Button and creating a new one because already an event handler is added in the base class so that event handler is being fired when delete button is clicked instead of Child Class Event Handler
					If Not UploadTemplateDO Is Nothing Then
						btnDelete.Set_ServerClick(AddressOf Upload_DeleteSharepoint)
					End If
				End If
				'Here we are making the Upload control visible = false, because for staff the control should not be shown when staff user tries to edit the upload.
				If UploadTemplateID > 0 AndAlso WebSession.HasStaffUser Then
					trUploadControl.Visible = False
				End If
			End If
		End If
	End Sub



	Public Overrides Sub DoUpload(ByVal aSrc As Object, ByVal aEventArgs As EventArgs)
		aDataObject = DoUploadSubProcess()
		Try
			If Not aDataObject Is Nothing Then
				aDataObject("FileNamePrefix") = ctlFileNamePrefix.Value
				WebSession.DataObjectFactory.SaveDataObject(aDataObject)
				Upload_Redirect(False)
			End If
		Catch se As SystemException
			trNoFileMessage.Visible = True
			spnNoFileMessage.InnerHtml = "<font color='red'><B>The system encountered an error while trying to upload the file. This may be due to a network disruption or network maintenance. Please wait a few minutes and then re-try the upload. If the problem persists, please contact technical support using the information at the bottom of this page.</B></font>"
			Exit Sub
		End Try
	End Sub

	Public Overrides Sub Save_Description(ByVal aSrc As Object, ByVal aEventArgs As EventArgs)
		Page.Validate()
		If Not Page.IsValid Then
			Exit Sub
		End If
 
		If Not UploadTemplateDO Is Nothing Then
			mUploadTemplateDO("TemplateName") = txtTemplateName.Value
			mUploadTemplateDO("FileNamePrefix") = ctlFileNamePrefix.Value
			Try
				WebSession.DataObjectFactory.SaveDataObject(mUploadTemplateDO)
			Catch ex As System.Data.DBConcurrencyException
			End Try
			If (NotifyOnSaveDescription = True) Then
				UploadCtl_Notify_DataModified()
			End If
			Upload_Redirect(False)
		End If
	End Sub

	Protected Overrides Sub Upload_Delete(ByVal aSrc As Object, ByVal aEventArgs As EventArgs)
		Upload_DeleteSharepoint(aSrc, aEventArgs)
	End Sub

	Private Sub Upload_DeleteSharepoint(ByVal aSrc As Object, ByVal aEventArgs As EventArgs)
		Dim aRemoteOrginalFileURL As String = ""
		'Dim aRemotePDFFileURL As String = ""
		Dim aSharePointDO As cDataObject = Nothing
		'Dim aSubmittedFile As cDataObject = UploadTemplateDO()
		Dim aDeleteResult As Boolean = True

		If UploadTemplateDO.GetPropertyString("SharepointConversionStatus") = "-1" Then
			'We are the GetFileurl method of cDataPresenterCtl class to generate the aRemoteOrginalFileURL
			CorePage.GetFileUrl(UploadTemplateDO, aSharePointDO, aRemoteOrginalFileURL)
			Dim myCred As New System.Net.NetworkCredential(aSharePointDO("UserName"), aSharePointDO("Password"))
			Dim aSPUrl As String = cWebLib.GetFormattedUrl(aSharePointDO.GetPropertyString("SharePointURL"))
			'Here before deleting from sharepoint , we are checking where Delete Permanentely is check for SharePoint seetings
			If aSharePointDO.GetPropertyBool("DeleteDocumentPermanently") = True Then
				'We are the DeleteFileFromSharepoint method of cDataPresenterCtl class to delete a File from SharePoint. this function is at one place so maintenance will be easy
				aDeleteResult = CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).DeleteFileFromSharepoint(aSPUrl, aRemoteOrginalFileURL, myCred)
			End If
		End If

		DeleteExistingFileData(UploadTemplateDO)
		Upload_Redirect(True)

	End Sub

	'Public Overrides Sub DeleteExistingFileData(ByVal aTemplateDO As cDataObject)
	'	WebSession.DataObjectFactory.DeleteData(aTemplateDO)
	'	Upload_Redirect(True)
	'End Sub

End Class
End Namespace
