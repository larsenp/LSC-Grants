Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Web.User
Imports Core.Web
Imports System.Net

Namespace Core_Web.Controls.Sharepoint

Public Class cpgUploadReader
	Inherits Core_Web.Controls.Base.cpgUploadReader
	
'=============================================================
	
	Public Overrides Sub CorePage_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Dim aGPID As String
		Dim aXMLDoc As cXMLDoc
		Dim aDataObjectNode As XmlNode
		Dim aFiltersnode As XmlNode
		Dim aSubmittedFileDataObj As cDataObject

		'Get submitted file information in data object, using query string parameters as filters
		aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("SubmittedFile", aDataObjectNode, aFiltersnode)
		aFiltersnode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "SubmittedFileID", SubmittedFileID))
		aSubmittedFileDataObj = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)

		If Not aSubmittedFileDataObj Is Nothing Then
			'Here when the Public Request for a PDF , first it will check in the Sharepoint server (when SharepointConversionStatus = -1), if SharepointConversionStatus <> -1 then it will check the local database, for this we are using the base class , where the file will be pulled from the database as old method.
			If aSubmittedFileDataObj.GetPropertyString("SharepointConversionStatus") = "-1" Then
				Dim aSharePointDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")(0)
				Dim aRemotePDFFileURL As String
				Dim aRemoteOrginalFileURL As String
				Dim aHref As String
				GetFileUrl(aSubmittedFileDataObj, aSharePointDO, aRemotePDFFileURL, aRemoteOrginalFileURL)
				Dim myCred As New System.Net.NetworkCredential(aSharePointDO("UserName"), aSharePointDO("Password"))
				Dim aWC As WebClient = New WebClient
				aWC.Credentials = myCred

				Try
					Dim res As Byte() = aWC.DownloadData(aRemotePDFFileURL)
					Response.Buffer = True
					Response.ContentType = "application/pdf"
					Response.BinaryWrite(res)
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
			Else
				'The else part will be executed when the document is not uploaded in the sharepoint and still in the Database.
				MyBase.CorePage_Load(sender, e)
			End If

		End If
	End Sub

'=============================================================
End Class

End Namespace 'Core_Web.Controls.Base