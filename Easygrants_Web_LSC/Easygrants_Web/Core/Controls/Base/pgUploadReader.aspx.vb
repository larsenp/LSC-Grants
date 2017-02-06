Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Web.User
Imports Core.Web
Imports System.Net

Namespace Core_Web.Controls.Base

Public Class cpgUploadReader
	Inherits Core.Web.cCorePage
	
	Protected Dim errMsg As String
'=============================================================

	Public ReadOnly Property SubmittedFileID() As String
		Get
			SubmittedFileID = Request.QueryString("SubmittedFileID")
		End Get
	End Property

'=============================================================

	Public ReadOnly Property ThirdPartyAccess() As String
		Get
			ThirdPartyAccess = Request.QueryString("ThirdPartyAccess")
			if ThirdPartyAccess is Nothing then
				ThirdPartyAccess = false
			End If			
		End Get
	End Property

'=============================================================

	Protected Sub Redirect_To_InQueue()
		Dim aHref As String = WebAppl.Build_RootURL(GetUploadViewerControlUrl("InProcess"))
		aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", SubmittedFileID.ToString)
		Response.Redirect(aHref)
	End Sub


'-------------------------------------------------------------

	Protected Overrides Sub SetCache() 
		Response.Cache.SetCacheability(HttpCacheability.Private)
	End Sub

'-----------------------------------------------------

	Protected Function Has_ThirdPartyAccess(ByVal aSubmittedDataObject as cDataObject) As Boolean
		Dim aEntityID As Integer
		Dim aGPID As Integer
		Dim aDataObjList as cDataObjectList
		Dim aWFTA as cDataObject
		Dim aUserFlag As Boolean = False
		Dim aEntry As DictionaryEntry	
		Dim aUser As cEGUser
		
		aEntityID = aSubmittedDataObject.GetPropertyInt("EntityID")
		aDataObjList = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("WfTaskAssignment", aEntityID)
		aGPID = aDataObjList(0).GetPropertyInt("GranteeProjectID")
		aDataObjList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "GranteeProjectID", aGPID)
		for each aWFTA in aDataObjList
			for each aEntry in WebSession.Users						
				aUser = CType(aEntry.Value, cEGUser)
				If aUser.PersonID = aWFTA.GetPropertyInt("PersonID", -1) Then
					aUserFlag = True
					Exit For
				End If
			Next					
		Next
		
		return aUserFlag
		
	End Function	
	
'-----------------------------------------------------

	Protected Overridable Function Has_Access(ByVal aSubmittedDataObject As cDataObject) As Boolean
		Dim aEntityID As Integer
		Dim aFileTypeID As Integer
		Dim aActualUser As Integer
		Dim aUserFlag As Boolean
		Dim aEntry As DictionaryEntry
		Dim aUser As cEGUser
		Dim aFileTypeList As cDataObjectList
			Dim aDataObjList As cDataObjectList


		If MyBase.WebSession.HasStaffUser Then
			Return True
		End If

		If ThirdPartyAccess Then
			If Has_ThirdPartyAccess(aSubmittedDataObject) Then
				Return True
			End If
		End If

		aUserFlag = False
		aEntityID = aSubmittedDataObject.GetPropertyInt("EntityID")
		Dim aPersonID As Integer = aSubmittedDataObject.GetPropertyInt("UploadedByID", 0)
		aFileTypeID = aSubmittedDataObject.GetPropertyInt("FileTypeID", 0)
		Dim aDataObjType As String
		If aFileTypeID = 0 Then
			aDataObjType = aSubmittedDataObject.GetPropertyString("EntityDataObjectKey") 'assuming the file is uploaded using the new upload control. With the new upload control the uploadId is saved in the UploadID column of the submitted_file table
		Else
			aFileTypeList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("FileType", "FileTypeID", aFileTypeID)
			aDataObjType = aFileTypeList(0).GetPropertyString("EntityDataObjectKey")
		End If

			Select Case aDataObjType
				Case "WfTaskAssignment"
					aDataObjList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "WfTaskAssignmentID", aEntityID)
					aPersonID = aDataObjList(0).GetPropertyInt("PersonID")
				Case "BudgetPeriod"
					aDataObjList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("BudgetPeriod", "BudgetPeriodID", aEntityID)
					aPersonID = aDataObjList(0).GetRelatedPropertyInt("Budget.GranteeProject.PrimaryPersonID")
				Case "GranteeProjectOtherSupport"
					aDataObjList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectOtherSupport", "GranteeProjectOtherSupportID", aEntityID)
					aPersonID = aDataObjList(0).GetRelatedPropertyInt("GranteeProject.PrimaryPersonID")
				Case "GranteeProject"
					aDataObjList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "GranteeProjectID", aEntityID)
					For Each aWFTA As cDataObject In aDataObjList
						For Each aEntry In WebSession.Users
							aUser = CType(aEntry.Value, cEGUser)
							If aUser.PersonID = aWFTA.GetPropertyInt("PersonID", -1) Then
								Return True
							End If
						Next
					Next
			End Select

			Try
				For Each aEntry In WebSession.Users
					aUser = CType(aEntry.Value, cEGUser)
					If aUser.PersonID = aPersonID Then
						aUserFlag = True
						Exit For
					End If
				Next
				Return aUserFlag
			Catch se As SystemException
				Response.Redirect(WebAppl.LogoutURL)
			End Try

	End Function
'-----------------------------------------------------

	Public Overrides Sub CorePage_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Dim aXMLDoc As cXMLDoc
		Dim aDataObjectNode As XmlNode
		Dim aFiltersnode As XmlNode
		Dim aSubmittedFileDataObj As cDataObject

		Dim aUserTypeID As Integer
		Dim aUserID As String = WebSession.DataObjectFactory.User.UserID
		Dim aEasygrantsUserDo As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("User", "UserID", aUserID)(0)
		If Not aEasygrantsUserDo Is Nothing Then
			aUserTypeID = aEasygrantsUserDo.GetPropertyInt("UserTypeID", 1)
		End If
		Dim aSharePointDO As cDataObject
		aSharePointDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")(0)

		'Get submitted file information in data object, using query string parameters as filters
		aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("SubmittedFile", aDataObjectNode, aFiltersnode)
		aFiltersnode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "SubmittedFileID", SubmittedFileID))
		aSubmittedFileDataObj = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)

		If aSubmittedFileDataObj Is Nothing Then
			errMsg = "The file you are trying to access has been deleted or removed."
			Exit Sub
		End If

		If Not Has_Access(aSubmittedFileDataObj) Then
			errMsg = "You are not authorized to view this file."
			Exit Sub
		End If

		If aSubmittedFileDataObj Is Nothing Then
			'error here, invalid SubmittedFileID
			Dim aHref As String = WebAppl.Build_RootURL(GetUploadViewerControlUrl("InProcess"))
			Response.Redirect(aHref)
		End If
		If IsDBNull(aSubmittedFileDataObj("ConversionStatus")) Then
			Redirect_To_InQueue()
		End If
		Select Case aSubmittedFileDataObj("ConversionStatus")
			Case -2, -3	'File not converted - -2: not valid, -3: exception caught
				Dim aHref As String = WebAppl.Build_RootURL(GetUploadViewerControlUrl("Error"))
				aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", SubmittedFileID.ToString)
				Response.Redirect(aHref)
			Case -1	'File successfully converted
				Response.Buffer = True
				Response.ContentType = "application/pdf"
				'application/pdf, application/msword, application/vnd.ms-excel, image/pjpeg

				Dim aRemotePDFFileURL As String
				Dim aRemoteOrginalFileURL As String
				Dim aHref As String
				If aSubmittedFileDataObj.GetRelatedPropertyInt("FileTypeID") = 25 OrElse aSubmittedFileDataObj.GetRelatedPropertyInt("WordmergeTemplateSubmittedFileId", 0) > 0 Then

					'The if case will be executed when the sharepoint is InActive this will be our normal way of opening the document and else will be executed when the sharepoint is active
					If aSharePointDO Is Nothing Then
						Response.BinaryWrite(aSubmittedFileDataObj.GetRelatedPropertyValue("ConvertedFileData.FileData"))
					Else
						'Here checking whether the upload is successfull upload to sharepoint then if part will be executed other wise a spinny guy will be running.
						If aSubmittedFileDataObj.GetRelatedPropertyInt("SharepointConversionStatus") = -1 Then

							GetFileUrl(aSubmittedFileDataObj, aSharePointDO, aRemotePDFFileURL, aRemoteOrginalFileURL)

							If aRemoteOrginalFileURL <> "" Then
								'Here checking the user Type , if staff / admin then they should get the prompt for credentials from sharepoint which is done by redirecting then to the URL.
								'Other wise we are showing the public user in our normal old way.
								Dim myCred As New System.Net.NetworkCredential(aSharePointDO("UserName"), aSharePointDO("Password"))
								Dim aWC As WebClient = New WebClient
								aWC.Credentials = myCred

								Try

									If MyBase.WebSession.HasStaffUser Then
										If aSubmittedFileDataObj.GetRelatedPropertyInt("WordmergeTemplateSubmittedFileId", 0) > 0 Then
											Dim aSpHref As String = WebAppl.Build_RootURL("Core/Controls/Sharepoint/pgUploadSharepointFileReader.aspx")
											aSpHref = cWebLib.AddQuerystringParameter(aSpHref, "FileName", aRemoteOrginalFileURL, Server)
											Response.Redirect(aSpHref)
										Else
											Response.Redirect(aRemoteOrginalFileURL)
										End If
									Else
										Dim ares As Byte() = aWC.DownloadData(aRemoteOrginalFileURL)
										Response.Buffer = True
										Response.ContentType = "application/msword"
										Response.BinaryWrite(ares)
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
							Else
								aHref = WebAppl.Build_RootURL(GetUploadViewerControlUrl("SharepointPageNotFound"))
								aHref = cWebLib.AddQuerystringParameter(aHref, "ErrType", "NotFoundInDB")
								Response.Redirect(aHref)
							End If
						Else
							'If the sharepoint conversion status is still in process or unsuccessfully the spinny guy will be in place
							Redirect_To_InQueue()
						End If
					End If
				Else
					'The if case will be executed when the sharepoint is InActive this will be our normal way of opening the document and else will be executed when the sharepoint is active
					If aSharePointDO Is Nothing Then
						Response.BinaryWrite(aSubmittedFileDataObj.GetRelatedPropertyValue("ConvertedFileData.FileData"))
					Else
						'Here checking whether the upload is successfull upload to sharepoint then if part will be executed other wise a spinny guy will be running.
						If aSubmittedFileDataObj.GetRelatedPropertyInt("SharepointConversionStatus") = -1 Then

							GetFileUrl(aSubmittedFileDataObj, aSharePointDO, aRemotePDFFileURL, aRemoteOrginalFileURL)

							If aRemotePDFFileURL <> "" Then
								'Here checking the user Type , if staff / admin then they should get the prompt for credentials from sharepoint which is done by redirecting then to the URL.
								'Other wise we are showing the public user in our normal old way.

								Dim myCred As New System.Net.NetworkCredential(aSharePointDO("UserName"), aSharePointDO("Password"))
								Dim aWC As WebClient = New WebClient
								aWC.Credentials = myCred

								Try
									Dim ares As Byte() = aWC.DownloadData(aRemotePDFFileURL)
									If MyBase.WebSession.HasStaffUser Then
										Response.Redirect(aRemotePDFFileURL)
									Else
										Response.Buffer = True
										Response.ContentType = "application/pdf"
										Response.BinaryWrite(ares)
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
							Else
								aHref = WebAppl.Build_RootURL(GetUploadViewerControlUrl("SharepointPageNotFound"))
								aHref = cWebLib.AddQuerystringParameter(aHref, "ErrType", "NotFoundInDB")
								Response.Redirect(aHref)
							End If
						Else
							'If the sharepoint conversion status is still in process or unsuccessfully the spinny guy will be in place
							Redirect_To_InQueue()
						End If
					End If
				End If
			Case Is >= 0 'File is in conversion process or conversion attempt was unsuccessful
				Redirect_To_InQueue()
		End Select
	End Sub

'=============================================================
End Class

End Namespace 'Core_Web.Controls.Base