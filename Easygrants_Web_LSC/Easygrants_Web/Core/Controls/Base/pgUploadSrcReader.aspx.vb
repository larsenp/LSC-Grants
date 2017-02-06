Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports System.Net


Namespace Core_Web.Controls.Base

Public Class cpgUploadSrcReader
	Inherits Core.Web.cCorePage
'=============================================================

	Public ReadOnly Property SubmittedFileID() As String
		Get
			SubmittedFileID = Request.QueryString("SubmittedFileID")
		End Get
	End Property

	Public ReadOnly Property DataObjectKey() As String
		Get
			If Not Request.QueryString("DataObject") = "" Then
				DataObjectKey = Request.QueryString("DataObject")
			Else
				DataObjectKey = "SubmittedFile"
			End If
		End Get
	End Property


	Public ReadOnly Property ID() As String
		Get
			If Not Request.QueryString("SubmittedFileID") = "" Then
				ID = Request.QueryString("SubmittedFileID")
			Else
				ID = Request.QueryString("ID")
			End If
		End Get
	End Property


'=============================================================

	Public Overrides Sub CorePage_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Dim aXMLDoc As cXMLDoc
		Dim aDataObjectNode As XmlNode
		Dim aFiltersnode As XmlNode
		Dim aViewFileDataObj As cDataObject

		'Dim aSharePointDO As cDataObject
		'aSharePointDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")(0)

		'Get submitted file information in data object, using query string parameters as filters
		aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode(DataObjectKey, aDataObjectNode, aFiltersnode)
		aFiltersnode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", DataObjectKey + "ID", ID))
		aViewFileDataObj = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)

		If Not aViewFileDataObj Is Nothing Then
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
		Else
			Redirect_To_Error()
		End If


		Select Case DataObjectKey
			Case "UploadTemplate"
				Response.BinaryWrite(aViewFileDataObj.GetPropertyValue("Template"))
			Case "SubmittedFile"
				If aViewFileDataObj.GetRelatedPropertyString("WordmergeTemplateSubmittedFileId") <> "" AndAlso aViewFileDataObj.GetRelatedPropertyString("SubmittedFileData.SubmittedFileDataID") = "" Then
					If aViewFileDataObj.GetPropertyInt("ConversionStatus", 0) = -2 Or aViewFileDataObj.GetPropertyInt("ConversionStatus", 0) = -3 Then
						Redirect_To_Error()
					Else
						Redirect_To_InQueue()
					End If
				Else
					Response.BinaryWrite(aViewFileDataObj.GetRelatedPropertyValue("SubmittedFileData.FileData"))
				End If
		End Select
		
	End Sub

	Protected Sub Redirect_To_InQueue()
		Dim aHref As String = WebAppl.Build_RootURL(GetUploadViewerControlUrl("InProcessSrcFile"))
		If Request.Url.ToString.Contains("?") Then
			aHref = aHref + "?" + Request.Url.ToString.Split("?")(1)
		End If
		'aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", ID.ToString)
		Response.Redirect(aHref)
	End Sub


	Protected Sub Redirect_To_Error()
		Dim aHref As String = WebAppl.Build_RootURL(GetUploadViewerControlUrl("SrcReaderError"))
		aHref = aHref + "?" + Request.Url.ToString.Split("?")(1)
		Response.Redirect(aHref)
	End Sub

	'Public Sub GetTemplateFileUrl(ByVal aUploadTemplateDO As cDataObject, ByVal aSharePointDO As cDataObject, ByRef aRemotePDFURL As String, ByRef aRemoteOrginalURL As String)
	'	aSharePointDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")(0)

	'	If aSharePointDO Is Nothing Then Exit Sub

	'	Dim aUploadTemplateID As String = aUploadTemplateDO.GetPropertyString("UploadTemplateID")
	'	Dim aFileNamePrefix As String = aUploadTemplateDO.GetPropertyString("FileNamePrefix")
	'	Dim aSourceFileName As String = aUploadTemplateDO.GetPropertyString("SourceFileName")
	'	Dim aSourceExt As String = aSourceFileName.Substring(aSourceFileName.LastIndexOf(".") + 1)
	'	Dim aUploadFileName As String = aUploadTemplateID + "_" + aFileNamePrefix
	'	Dim aSiteName As String = cWebLib.GetFormattedUrl(aSharePointDO.GetPropertyString("SiteName"))

	'	Dim aSPUrl As String = cWebLib.GetFormattedUrl(aSharePointDO.GetPropertyString("SharePointURL"))

	'	aRemoteOrginalURL = aSPUrl + aSiteName + "Templates" + "/" + "Upload Manager" + "/" + aUploadFileName + "." + aSourceExt
	'End Sub

	Private Sub ViewSourceFile()
		Dim aXMLDoc As cXMLDoc
		Dim aDataObjectNode As XmlNode
		Dim aFiltersnode As XmlNode
		Dim aViewFileDataObj As cDataObject
		aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode(DataObjectKey, aDataObjectNode, aFiltersnode)
		aFiltersnode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", DataObjectKey + "ID", ID))
		aViewFileDataObj = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
		If (DataObjectKey = "SubmittedFile" AndAlso aViewFileDataObj.GetRelatedPropertyString("SubmittedFileData.SubmittedFileDataID") = "") _
				OrElse (DataObjectKey = "UploadTemplate" AndAlso aViewFileDataObj Is Nothing) Then
			'error here, invalid SubmittedFileID
			Redirect_To_InQueue()
		Else
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
			Select Case DataObjectKey
				Case "UploadTemplate"
					Response.BinaryWrite(aViewFileDataObj.GetPropertyValue("Template"))

			End Select
		End If

End Sub
'=============================================================
End Class

End Namespace 'Core_Web.Controls.Base