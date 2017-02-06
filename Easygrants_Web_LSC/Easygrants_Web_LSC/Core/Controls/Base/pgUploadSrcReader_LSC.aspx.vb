Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports System.Net

Namespace Core_Web.Controls.Base

Public Class cpgUploadSrcReader_LSC
	Inherits Core_Web.Controls.Base.cpgUploadSrcReader

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
					'LSC - Additional code for handling NRLs
					Dim aFileName As String = aViewFileDataObj.GetPropertyString("SourceFileName")
					If aFileName.Substring(aFileName.Length - 4) = ".nrl" Then
						aFileName = aFileName.Replace(" ", "_")	'Firefox requires file names without spaces.
						Response.AddHeader("Content-Disposition", "attachment; filename=" + aFileName)
					End If
					'End LSC additional code
					Response.BinaryWrite(aViewFileDataObj.GetRelatedPropertyValue("SubmittedFileData.FileData"))
				End If
		End Select

	End Sub

End Class
End Namespace