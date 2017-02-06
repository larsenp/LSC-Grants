Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports System.Net


Namespace Core_Web.Controls.Sharepoint

Public Class cpgUploadSrcReader
	Inherits Core_Web.Controls.Base.cpgUploadSrcReader
'=============================================================

'=============================================================

	Public Overrides Sub CorePage_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Dim aXMLDoc As cXMLDoc
		Dim aDataObjectNode As XmlNode
		Dim aFiltersnode As XmlNode
		Dim aViewFileDataObj As cDataObject

		Dim aSharePointDO As cDataObject
		aSharePointDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")(0)

		'Get submitted file information in data object, using query string parameters as filters
		aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode(DataObjectKey, aDataObjectNode, aFiltersnode)
		aFiltersnode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", DataObjectKey + "ID", ID))
		aViewFileDataObj = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)


		If aSharePointDO Is Nothing OrElse aViewFileDataObj Is Nothing Then
			'error here, invalid SubmittedFileID
			Dim aHref As String = WebAppl.Build_RootURL(GetUploadViewerControlUrl("SrcReaderError"))
			aHref = aHref + "?" + Request.Url.ToString.Split("?")(1)
			Response.Redirect(aHref)
		Else

			If DataObjectKey = "SubmittedFile" AndAlso aViewFileDataObj.GetRelatedPropertyInt("FileTypeID") = 25 Then
				Response.ClearHeaders()
				Response.ClearContent()
				Response.Buffer = True

				'code to dynamically retrieve MIME type
				If IsDBNull(aViewFileDataObj("SourceFileMIMEType")) Then
					Response.ContentType = "application/msword"
				Else
					'application/pdf, application/msword, application/vnd.ms-excel, image/pjpeg
					Response.ContentType = aViewFileDataObj("SourceFileMIMEType")
				End If
				If aViewFileDataObj.GetPropertyString("SourceFileName") <> "" Then
					'Note that content-disposition is set to "inline". I originally set it to "attachment", which should force the 
					'file to open in a separate application window as opposed to the browser window, but this caused a File Not Found error in 
					'IE 6. Peter Larsen 12/7/2005
					Response.AddHeader("content-disposition", "inline; filename=" + aViewFileDataObj.GetPropertyString("SourceFileName"))
				End If
				Response.BinaryWrite(aViewFileDataObj.GetRelatedPropertyValue("SubmittedFileData.FileData"))
				Exit Sub
			End If
			Select Case aViewFileDataObj.GetPropertyInt("SharepointConversionStatus", 0)
				Case -2, -3	'File not converted - -2: not valid, -3: exception caught
					Dim aHref As String = WebAppl.Build_RootURL(GetUploadViewerControlUrl("SrcReaderError"))
					aHref = aHref + "?" + Request.Url.ToString.Split("?")(1)
					Response.Redirect(aHref)
				Case -1	'File successfully converted
					Response.ClearHeaders()
					Response.ClearContent()

					Response.Buffer = True
					'code to dynamically retrieve MIME type
					If IsDBNull(aViewFileDataObj("SourceFileMIMEType")) Then
						Response.ContentType = "application/msword"
					Else
						'application/pdf, application/msword, application/vnd.ms-excel, image/pjpeg
						Response.ContentType = aViewFileDataObj("SourceFileMIMEType")
					End If
					If aViewFileDataObj.GetPropertyString("SourceFileName") <> "" Then
						'Note that content-disposition is set to "inline". I originally set it to "attachment", which should force the 
						'file to open in a separate application window as opposed to the browser window, but this caused a File Not Found error in 
						'IE 6. Peter Larsen 12/7/2005
						Response.AddHeader("content-disposition", "inline; filename=" + aViewFileDataObj.GetPropertyString("SourceFileName"))
					End If

					Dim aRemotePDFFileURL As String
					Dim aRemoteOrginalFileURL As String
					Dim aHref As String
					Select Case DataObjectKey
						Case "UploadTemplate"
							'The if case will be executed when the sharepoint is InActive this will be our normal way of opening the document and else will be executed when the sharepoint is active
							'Here checking whether the upload is successfull upload to sharepoint then if part will be executed other wise a spinny guy will be running.

									GetTemplateFileUrl(aViewFileDataObj, aSharePointDO, aRemotePDFFileURL, aRemoteOrginalFileURL)
									If aRemoteOrginalFileURL <> "" Then
										'Here checking the user Type , if staff / admin then they should get the prompt for credentials from sharepoint which is done by redirecting then to the URL.
										'Other wise we are showing the public user in our normal old way.
										GetDocument(aSharePointDO, aRemoteOrginalFileURL, aViewFileDataObj)
									Else
										aHref = WebAppl.Build_RootURL(GetUploadViewerControlUrl("SharepointPageNotFound"))
										aHref = cWebLib.AddQuerystringParameter(aHref, "ErrType", "NotFoundInDB")
										Response.Redirect(aHref)
									End If


						Case "SubmittedFile"

							'The if case will be executed when the sharepoint is InActive this will be our normal way of opening the document and else will be executed when the sharepoint is active
								'Here checking whether the upload is successfull upload to sharepoint then if part will be executed other wise a spinny guy will be running.

									GetFileUrl(aViewFileDataObj, aSharePointDO, aRemotePDFFileURL, aRemoteOrginalFileURL)
									If aRemoteOrginalFileURL <> "" Then
										'Here checking the user Type , if staff / admin then they should get the prompt for credentials from sharepoint which is done by redirecting then to the URL.
										'Other wise we are showing the public user in our normal old way.
										GetDocument(aSharePointDO, aRemoteOrginalFileURL, aViewFileDataObj)
									Else
										aHref = WebAppl.Build_RootURL(GetUploadViewerControlUrl("SharepointPageNotFound"))
										aHref = cWebLib.AddQuerystringParameter(aHref, "ErrType", "NotFoundInDB")
										Response.Redirect(aHref)
									End If
					End Select
			Case Is >= 0 'File is in conversion process or conversion attempt was unsuccessful
				Redirect_To_InQueue()
			End Select
		End If
	End Sub

	Private Sub GetDocument(ByVal aSharePointDO As cDataObject, ByVal aRemoteOrginalFileURL As String, ByVal aViewFileDataObj As cDataObject)
		Dim myCred As New System.Net.NetworkCredential(aSharePointDO("UserName"), aSharePointDO("Password"))
		Dim aWC As WebClient = New WebClient
		aWC.Credentials = myCred
		Dim aHref As String
		Try
			Dim ares As Byte() = aWC.DownloadData(aRemoteOrginalFileURL)
				If ares.Length > 0 Then
					If MyBase.WebSession.HasStaffUser Then
						If aViewFileDataObj.GetPropertyString("SourceFileMIMEType").Contains("pdf") Then
							Response.Redirect(aRemoteOrginalFileURL)
						Else
							Dim aSpHref As String = WebAppl.Build_RootURL("Core/Controls/Sharepoint/pgUploadSharepointFileReader.aspx")
							aSpHref = cWebLib.AddQuerystringParameter(aSpHref, "FileName", aRemoteOrginalFileURL, Server)
							Response.Redirect(aSpHref)
						End If
					Else
						Response.Buffer = True
						Response.ContentType = aViewFileDataObj("SourceFileMIMEType")
						Response.BinaryWrite(ares)
					End If
				End If
		Catch we As System.Net.WebException
			If we.Status = WebExceptionStatus.ConnectFailure Then
				aHref = WebAppl.Build_RootURL(GetUploadViewerControlUrl("SharepointPageNotFound"))
				aHref = cWebLib.AddQuerystringParameter(aHref, "ErrType", "SharepointDown")
				Response.Redirect(aHref)
			Else
				aHref = WebAppl.Build_RootURL(GetUploadViewerControlUrl("SharepointPageNotFound"))
				aHref = cWebLib.AddQuerystringParameter(aHref, "ErrType", "NotFound")
				Response.Redirect(aHref)
			End If
		End Try
	End Sub

	Protected Sub Redirect_To_InQueue()
		Dim aHref As String = WebAppl.Build_RootURL(GetUploadViewerControlUrl("InProcessSrcFile"))
		If Request.Url.ToString.Contains("?") Then
			aHref = aHref + "?" + Request.Url.ToString.Split("?")(1)
		End If
		'aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", ID.ToString)
		Response.Redirect(aHref)
	End Sub

	Public Sub GetTemplateFileUrl(ByVal aUploadTemplateDO As cDataObject, ByVal aSharePointDO As cDataObject, ByRef aRemotePDFURL As String, ByRef aRemoteOrginalURL As String)
		aSharePointDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")(0)

		If aSharePointDO Is Nothing Then Exit Sub

		Dim aUploadTemplateID As String = aUploadTemplateDO.GetPropertyString("UploadTemplateID")
		Dim aFileNamePrefix As String = aUploadTemplateDO.GetPropertyString("FileNamePrefix")
		Dim aSourceFileName As String = aUploadTemplateDO.GetPropertyString("SourceFileName")
		Dim aSourceExt As String = aSourceFileName.Substring(aSourceFileName.LastIndexOf(".") + 1)
		Dim aUploadFileName As String = aUploadTemplateID + "_" + aFileNamePrefix
		Dim aSiteName As String = cWebLib.GetFormattedUrl(aSharePointDO.GetPropertyString("SiteName"))

		Dim aSPUrl As String = cWebLib.GetFormattedUrl(aSharePointDO.GetPropertyString("SharePointURL"))

		aRemoteOrginalURL = aSPUrl + aSiteName + "Templates" + "/" + "Upload Manager" + "/" + aUploadFileName + "." + aSourceExt
	End Sub

	

'=============================================================
End Class

End Namespace 'Core_Web.Controls.Base