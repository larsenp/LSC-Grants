Imports System.Diagnostics
Imports Core.DataAccess
Imports Core.Web
Imports EasyGrants.Web.User
Imports Core.Web.Modules
Imports Core_Web.Controls.Base

Imports System.Xml
Imports Core.DataAccess.XMLAccess
Imports System.Net


Namespace Core_Web.Controls.Sharepoint
Public MustInherit Class cstaffUpload
	Inherits Core_Web.Controls.Base.cstaffUpload
'====================================================

	Dim aRemotePDFFileURL As String
	Dim aRemoteOrginalFileURL As String
	Dim aSharePointDO As cDataObject = Nothing
'====================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		'MyBase.CoreCtl_Load(sender, e)
		If Not Visible Then Exit Sub
		If MyBase.WebSession.HasStaffUser Then
			tabStaffUpload.Visible = True
			If UploadCtl.SubmittedFileObj Is Nothing Then
				tdConversionStatus.Visible = False
				tdOptions.Visible = False
			Else
				GetOrginalLinkDocument(UploadCtl.SubmittedFileObj)
				btnReset.Set_ServerClick(AddressOf Me.btnResetSharepoint_Click)
			End If
		End If
	End Sub



	Public Sub GetOrginalLinkDocument(ByVal aSubmittedFileDataObj As cSubmittedFile)
		Dim aHref As String
		btnView.Caption = aSubmittedFileDataObj.GetPropertyString("SourceFileName", "")
		If aSubmittedFileDataObj.GetPropertyString("SharepointConversionStatus") = "-1" Then

			CorePage.GetFileUrl(aSubmittedFileDataObj, aSharePointDO, aRemotePDFFileURL, aRemoteOrginalFileURL)
			'Here we are getting the FolderUrl and then Truncating it to 128 characters as sharepoint supports only supports 128 character Folder Name
			'aRemotePDFFileURL = cWebLib.TruncateFolderName(aRemotePDFFileURL)
			'aRemoteOrginalFileURL = cWebLib.TruncateFolderName(aRemoteOrginalFileURL)

			Dim myCred As New System.Net.NetworkCredential(aSharePointDO("UserName"), aSharePointDO("Password"))
			Dim aWC As WebClient = New WebClient
			aWC.Credentials = myCred

			Try
				'Here checking whether the file exists in the sharepoint.if the file is available then we are passing the document URL to the button and it is not found , we are re-directing to the error page.
				Dim res As Byte() = aWC.DownloadData(aRemoteOrginalFileURL)
				If res.Length > 0 Then
					aRemoteOrginalFileURL = aRemoteOrginalFileURL.Replace("'", "\'")
					btnView.Href = "javascript:ViewSharepointDocument('" + Server.HtmlEncode(aRemoteOrginalFileURL) + "')"
					btnView.Target = ""
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
		Else
			btnView.Href = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
			btnView.Href = cWebLib.AddQuerystringParameter(btnView.Href, _
									"SubmittedFileID", UploadCtl.SubmittedFileID.ToString)
			btnView.Target = "_blank"
		End If

	End Sub

	'***********************************************************************
	'This GetFileUrl function is used for SubmittedFile DataObject. 
	'This function is used in many places so update needs to be done in all the GetFilUrl Function 
	'***********************************************************************
	'Public Sub GetFileUrl(ByVal aSubmittedFileDataObj As cDataObject, ByRef aSharePointDO As cDataObject, ByRef aRemotePDFURL As String, ByRef aRemoteOrginalURL As String)
	'	Select Case aSubmittedFileDataObj.GetPropertyString("EntityDataObjectKey")
	'		Case "WfTaskAssignment"
	'			BuildURL(aSubmittedFileDataObj, aSharePointDO, aSubmittedFileDataObj.GetPropertyString("EntityDataObjectKey"), aRemotePDFURL, aRemoteOrginalURL)
	'		Case ""
	'			'This case needs to be handeled for Granteeproject , Person , Organization , WordMerge
	'			BuildURL(aSubmittedFileDataObj, aSharePointDO, aSubmittedFileDataObj.GetRelatedPropertyString("FileType.EntityDataObjectKey"), aRemotePDFURL, aRemoteOrginalURL)
	'	End Select
	'End Sub

	'Public Sub BuildURL(ByVal aSubmittedFileDataObj As cDataObject, ByRef aSharePointDO As cDataObject, ByVal FileType As String, ByRef aRemotePDFURL As String, ByRef aRemoteOrginalURL As String)

	'		aSharePointDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")(0)

	'		If aSharePointDO Is Nothing Then Exit Sub

	'		Dim aSiteName As String = cWebLib.GetFormattedUrl(aSharePointDO.GetPropertyString("SiteName"))
	'		Dim aSPUrl As String = cWebLib.GetFormattedUrl(aSharePointDO.GetPropertyString("SharePointURL"))

	'		If FileType = "GranteeProject" Or FileType = "WfTaskAssignment" Then

	'			Dim aGPID As String
	'			Dim awftaskAssignmentID As Integer = aSubmittedFileDataObj.GetPropertyInt("EntityID")
	'			Dim aSubmittedFileID As String = aSubmittedFileDataObj.GetPropertyString("SubmittedFileID")
	'			Dim aSourceFileName As String = aSubmittedFileDataObj.GetPropertyString("SourceFileName")
	'			Dim aSourceExt As String = aSourceFileName.Substring(aSourceFileName.LastIndexOf(".") + 1)
	'			Dim aFileNamePrefix As String = aSubmittedFileDataObj.GetRelatedPropertyString("TaskUploadType.Upload.FileNamePrefix")

	'			' If the FileNamePrefix is NULL , then this is the Upload which has been Uploaded at the Grant File and this is not an TaskAssignment Upload.
	'			If aFileNamePrefix = "" Then aFileNamePrefix = aSourceFileName.Substring(0, aSourceFileName.LastIndexOf("."))

	'			If aSubmittedFileDataObj.GetPropertyString("EntityDataObjectKey") = "WfTaskAssignment" Then
	'				aGPID = aSubmittedFileDataObj.GetRelatedPropertyString("WfTaskAssignment.GranteeProject.GranteeProjectID")
	'			Else
	'				aGPID = aSubmittedFileDataObj.GetPropertyString("EntityID")
	'			End If

	'			Dim aGranteeProjectDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProject", "GranteeProjectID", aGPID)(0)
	'			Dim aFCFolderName As String = aGranteeProjectDO.GetRelatedPropertyString("WfProjectID") + "_" + aGranteeProjectDO.GetRelatedPropertyString("WfProject.WfProjectName")
	'			Dim aFOFolderName As String = aGranteeProjectDO.GetRelatedPropertyString("WfProject.CompetitionID") + "_" + aGranteeProjectDO.GetRelatedPropertyString("WfProject.WfCompetition.CompetitionDisplayName")
	'			Dim aProgramFolderName As String = aGranteeProjectDO.GetRelatedPropertyString("WfProject.WfCompetition.ProgramID") + "_" + aGranteeProjectDO.GetRelatedPropertyString("WfProject.WfCompetition.WfProgram.ProgramDisplayName")
	'			Dim aGPFolderName As String = aGPID + "_Easygrants ID"
	'			Dim aUploadFileName As String = aSubmittedFileID + "_" + aFileNamePrefix


	'			aRemoteOrginalURL = aSPUrl + aSiteName + "Grants" + "/" + aProgramFolderName + "/" + aFOFolderName + "/" + aFCFolderName + "/" + aGPFolderName + "/" + aUploadFileName + "." + aSourceExt
	'			aRemotePDFURL = aSPUrl + aSiteName + "Grants" + "/" + aProgramFolderName + "/" + aFOFolderName + "/" + aFCFolderName + "/" + aGPFolderName + "/" + aUploadFileName + ".PDF"


	'		ElseIf FileType = "Person" Then

	'			Dim aPersonID As String = aSubmittedFileDataObj.GetPropertyString("EntityID")
	'			Dim aSubmittedFileID As String = aSubmittedFileDataObj.GetPropertyString("SubmittedFileID")
	'			Dim aSourceFileName As String = aSubmittedFileDataObj.GetPropertyString("SourceFileName")
	'			Dim aFileName As String = aSourceFileName.Substring(0, aSourceFileName.LastIndexOf("."))
	'			Dim aSourceExt As String = aSourceFileName.Substring(aSourceFileName.LastIndexOf(".") + 1)
	'			Dim aPersonDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Person", "PersonID", aPersonID)(0)
	'			Dim aPersonNameFolderName As String = aPersonID + "_" + aPersonDO.GetPropertyString("LastName") + "_" + aPersonDO.GetPropertyString("FirstName")
	'			Dim aUploadFileName As String = aSubmittedFileID + "_" + aFileName


	'			aRemoteOrginalURL = aSPUrl + aSiteName + "Contacts/Persons/" + aPersonNameFolderName + "/" + aUploadFileName + "." + aSourceExt
	'			aRemotePDFURL = aSPUrl + aSiteName + "Contacts/Persons/" + aPersonNameFolderName + "/" + aUploadFileName + "." + "PDF"


	'		ElseIf FileType = "Organization" Then

	'			Dim aOrganizationID As String = aSubmittedFileDataObj.GetPropertyString("EntityID")
	'			Dim aSubmittedFileID As String = aSubmittedFileDataObj.GetPropertyString("SubmittedFileID")
	'			Dim aSourceFileName As String = aSubmittedFileDataObj.GetPropertyString("SourceFileName")
	'			Dim aFileName As String = aSourceFileName.Substring(0, aSourceFileName.LastIndexOf("."))
	'			Dim aSourceExt As String = aSourceFileName.Substring(aSourceFileName.LastIndexOf(".") + 1)
	'			Dim aOrganizationDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Organization", "OrganizationID", aOrganizationID)(0)
	'			Dim aOrgFolderName As String = aOrganizationID + "_" + aOrganizationDO.GetPropertyString("CommonOrganizationName")
	'			Dim aUploadFileName As String = aSubmittedFileID + "_" + aFileName


	'			aRemoteOrginalURL = aSPUrl + aSiteName + "Contacts/Organizations/" + aOrgFolderName + "/" + aUploadFileName + "." + aSourceExt
	'			aRemotePDFURL = aSPUrl + aSiteName + "Contacts/Organizations/" + aOrgFolderName + "/" + aUploadFileName + "." + "PDF"


	'		ElseIf FileType = "WordMerge" Then

	'			Dim aSubmittedFileID As String = aSubmittedFileDataObj.GetPropertyString("SubmittedFileID")
	'			Dim aSourceFileName As String = aSubmittedFileDataObj.GetPropertyString("SourceFileName")
	'			Dim aSourceExt As String = aSourceFileName.Substring(aSourceFileName.LastIndexOf(".") + 1)

	'			Dim aFileNamePrefix As String = aSubmittedFileDataObj.GetRelatedPropertyString("FileNamePrefix")
	'			'If the FileNamePrefix is NULL , then the upload name file name will be used for sharepoint
	'			If aFileNamePrefix = "" Then aFileNamePrefix = aSourceFileName.Substring(0, aSourceFileName.LastIndexOf("."))
	'			Dim aUploadFileName As String = aSubmittedFileID + "_" + aFileNamePrefix

	'			aRemoteOrginalURL = aSPUrl + aSiteName + "Templates/Word Merge/" + aUploadFileName + "." + aSourceExt

	'		ElseIf FileType = "WfProject" Then

	'			Dim aSubmittedFileID As String = aSubmittedFileDataObj.GetPropertyString("SubmittedFileID")
	'			Dim aSourceFileName As String = aSubmittedFileDataObj.GetPropertyString("SourceFileName")
	'			Dim aSourceExt As String = aSourceFileName.Substring(aSourceFileName.LastIndexOf(".") + 1)
	'			Dim aUploadFileName As String = aSubmittedFileID + "_" + aSourceFileName.Substring(0, aSourceFileName.IndexOf("."))
	'			Dim aWfProjectDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("WfProject", aSubmittedFileDataObj.GetPropertyString("EntityID"))
	'			Dim aFCFolderName As String = aWfProjectDOL(0).GetRelatedPropertyString("WfCompetition.CompetitionID") + "_" + aWfProjectDOL(0).GetRelatedPropertyString("WfCompetition.CompetitionDisplayName")


	'			aRemoteOrginalURL = aSPUrl + aSiteName + "Projects/" + aFCFolderName + "/" + aUploadFileName + "." + aSourceExt
	'			aRemotePDFURL = aSPUrl + aSiteName + "Projects/" + aFCFolderName + "/" + aUploadFileName + "." + "PDF"


	'		End If
	'		aRemotePDFURL = cWebLib.TruncateFolderName(aRemotePDFURL)
	'		aRemoteOrginalURL = cWebLib.TruncateFolderName(aRemoteOrginalURL)
	'	End Sub

'====================================================


	Public Sub btnResetSharepoint_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)

		Dim aSubmittedFileDataObj As cSubmittedFile = UploadCtl.SubmittedFileObj
		Dim aDataObjectNode As XmlNode
		Dim aFiltersNode As XmlNode
		Dim aDataObject As cDataObject

		CorePage.GetFileUrl(aSubmittedFileDataObj, aSharePointDO, aRemotePDFFileURL, aRemoteOrginalFileURL)
		'Here we are getting the FolderUrl and then Truncating it to 128 characters as sharepoint supports only supports 128 character Folder Name
		'aRemotePDFFileURL = cWebLib.TruncateFolderName(aRemotePDFFileURL)
		'aRemoteOrginalFileURL = cWebLib.TruncateFolderName(aRemoteOrginalFileURL)

		Dim myCred As New System.Net.NetworkCredential(aSharePointDO("UserName"), aSharePointDO("Password"))
		Dim aWC As WebClient = New WebClient
		aWC.Credentials = myCred

		Try
			'When the staff members View the Document and modify the document by checkingOut from sharepoint and after modifications are checkedin , the staff member Clicks on the Reset Button , so that the Modified document is uploaded back to the Database.
			Dim res As Byte() = aWC.DownloadData(aRemoteOrginalFileURL)
			If res.Length > 0 Then
				aDataObject = aSubmittedFileDataObj.GetRelatedPropertyDataObject("SubmittedFileData")
				'Here Checking whether SubmittedFilaData Dataobject exists or not, if it doesn't exists then we are creating a new record
				If aDataObject Is Nothing Then
					WebSession.DataObjectFactory.CreateDataObjectNode("SubmittedFileData", aDataObjectNode, aFiltersNode)
					aDataObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
				End If
				aDataObject("SubmittedFileID") = UploadCtl.SubmittedFileID
				aDataObject("FileData") = CType(res, Byte())
				Dim a As System.Type = res.GetType
				WebSession.DataObjectFactory.SaveDataObject(aDataObject)

				Dim aSubmittedFile As cSubmittedFile
				aSubmittedFile = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SubmittedFile", UploadCtl.SubmittedFileID)
				If Not aSubmittedFile Is Nothing Then
					aSubmittedFile("ConversionStatus") = 0
					aSubmittedFile("ConversionResult") = System.DBNull.Value
					aSubmittedFile("SharepointConversionStatus") = 0
					aSubmittedFile.SaveData()
				End If
			End If
		Catch ex As Exception

		End Try

		Me.CorePage.Redirect()
	End Sub

'====================================================
End Class
End Namespace