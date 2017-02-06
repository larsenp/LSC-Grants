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
Imports System.Net
Imports Core_Web.Controls.Base
Imports Core_Web.Controls.Sharepoint
Imports EasyGrants.Web

Namespace Core_Web.Controls.Sharepoint

<ValidationPropertyAttribute("EntityAssocID")> Public MustInherit Class cUploadNew
	Inherits Core_Web.Controls.Base.cUploadNew

	Protected trUploadControl As HtmlTableRow
	Dim aSPLibObj As cSharepointLib

	Public Overrides Sub CoreCtl_Configure(ByVal aDisplayControlNode As XmlNode, ByVal aDataObjectList As cDataObjectList)
		UploadValidator = New cSpUploadValidator(WebSession, upl.ID)
		MyBase.CoreCtl_Configure(aDisplayControlNode, aDataObjectList)

		'This attribute is set to 120 because the sharepoint has a limit of 120 characters length FileName
		mFileNameSizeLimit = 120
		Dim btnDelete As cCSSButton = CType(spnDelete.FindControl("btnDelete"), cCSSButton)
		Dim aHref As String
		Dim aRemoteOrginalFileURL As String = ""
		Dim aRemotePDFFileURL As String = ""
		Dim aSharePointDO As cDataObject = Nothing
		If WebSession.HasStaffUser Then
			If Not SubmittedFileObj Is Nothing Then
				If SubmittedFileObj.GetPropertyString("SharepointConversionStatus") = "-1" Then
					'We are the GetFileurl method of cDataPresenterCtl class to generate the aRemotePDFFileurl and aRemoteOrginalFileURL
					CorePage.GetFileUrl(SubmittedFileObj, aSharePointDO, aRemotePDFFileURL, aRemoteOrginalFileURL)
					Dim myCred As New System.Net.NetworkCredential(aSharePointDO("UserName"), aSharePointDO("Password"))
					Dim aWC As WebClient = New WebClient
					aWC.Credentials = myCred
					Try
						'Here checking whether the file exists in the sharepoint.if the file is available then we are passing the document URL to the button and it is not found , we are re-directing to the error page.
						Dim res As Byte() = aWC.DownloadData(aRemotePDFFileURL)
						If res.Length > 0 Then
							btnView.Href = aRemotePDFFileURL
							btnView.Target = "_blank"
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
				'This only for staff member only
				'Here we are making the Upload control visible = false, because for staff the control should not be shown when staff user tries to edit the upload.
				If SubmittedFileID > 0 Then
					trUploadControl.Visible = False
				End If
			End If
		Else
			If Not btnView Is Nothing Then
				aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("ConvertedFileViewer"))
				aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", SubmittedFileID)
				btnView.Href = aHref
				btnView.Target = "_blank"
			End If
		End If

		'This coding is for configuring the delete button and this is for SharePoint specific.
		If Not SubmittedFileObj Is Nothing Then
			btnDelete.Set_ServerClick(AddressOf Upload_DeleteSharepoint)
		End If
	End Sub

	Protected Overrides Sub Upload_Delete(ByVal aSrc As Object, ByVal aEventArgs As EventArgs)
		Upload_DeleteSharepoint(aSrc, aEventArgs)
	End Sub

	Private Sub Upload_DeleteSharepoint(ByVal aSrc As Object, ByVal aEventArgs As EventArgs)
		Dim aRemoteOrginalFileURL As String = ""
		Dim aRemotePDFFileURL As String = ""
		Dim aSharePointDO As cDataObject = Nothing
		Dim aDeleteResult As Boolean = True

		'We are the GetFileurl method of cDataPresenterCtl class to generate the aRemotePDFFileurl and aRemoteOrginalFileURL
		CorePage.GetFileUrl(SubmittedFileObj, aSharePointDO, aRemotePDFFileURL, aRemoteOrginalFileURL)
		Dim myCred As New System.Net.NetworkCredential(aSharePointDO("UserName"), aSharePointDO("Password"))
		Dim aSPUrl As String = cWebLib.GetFormattedUrl(aSharePointDO.GetPropertyString("SharePointURL"))
		'Here before deleting from sharepoint , we are checking where Delete Permanentely is check for SharePoint seetings
		If aSharePointDO.GetPropertyBool("DeleteDocumentPermanently") = True Then
			'We are the DeleteFileFromSharepoint method of cDataPresenterCtl class to delete a File from SharePoint. this function is at one place so maintenance will be easy
			aDeleteResult = CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).DeleteFileFromSharepoint(aSPUrl, aRemoteOrginalFileURL, myCred)
			aDeleteResult = CType(CType(Me.Page, cModulePage).PageContentCtl, cDataPresenterCtl).DeleteFileFromSharepoint(aSPUrl, aRemotePDFFileURL, myCred)
		End If
		DeleteExistingFileData()
		Upload_Redirect(True)

	End Sub

	Private Sub DeleteExistingFileData()
		If Not SubmittedFileObj Is Nothing Then
			SubmittedFileObj.SubmittedFile_Delete()
		End If
	End Sub

End Class

End Namespace