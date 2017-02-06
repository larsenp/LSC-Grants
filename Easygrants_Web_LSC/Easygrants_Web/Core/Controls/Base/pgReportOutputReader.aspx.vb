Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports EasyGrants.DataAccess.Report
Imports EasyGrants.Web.User
Imports System.Net

Namespace Core_Web.Controls.Base

Public Class cpgReportOutputReader
	Inherits Core.Web.cCorePage
'=============================================================
	Protected errMsg As String
'=============================================================

	Protected Overrides Sub SetCache()
        ' Intentionally empty so that it does not run the SetCache in cCorePage for this one page.
    End Sub
    
'-------------------------------------------------------------

	Public ReadOnly Property ReportOutputID() As String
		Get
			ReportOutputID = Request.QueryString("ReportOutputID")
		End Get
	End Property

'-------------------------------------------------------------


	Public ReadOnly Property EntityID() As String
		Get
			EntityID = Request.QueryString("EntityID")
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property DefinitionID() As String
		Get
			DefinitionID = Request.QueryString("DefinitionID")
		End Get
	End Property

	Public ReadOnly Property Validate() As String
		Get
			If Request.QueryString("Validate") Is Nothing Then
				Validate = "True"
			Else
				Validate = Request.QueryString("Validate")
			End If
		End Get
	End Property

'=============================================================

	Protected Sub Redirect_To_InQueue()
		Dim aURL As String

		aURL = "pgReportOutputReader_Error.aspx?Status=InQueue"
		If Not ReportOutputID Is Nothing Then
			aURL = cWebLib.AddQuerystringParameter(aURL, "ReportOutputID", ReportOutputID, Server)
		Else
			aURL = cWebLib.AddQuerystringParameter(aURL, "EntityID", EntityID, Server)
			aURL = cWebLib.AddQuerystringParameter(aURL, "DefinitionID", DefinitionID, Server)
		End If
		Redirect(aURL)
	End Sub

'-------------------------------------------------------------

	Public Overrides Sub CorePage_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Dim aReportOutput As cReportOutput

		If (EntityID = "" OrElse DefinitionID = "") AndAlso ReportOutputID = "" Then
			errMsg = "Requested PDF is not available."
			Exit Sub
		End If

		If Validate = "False" Then
			aReportOutput = cReportOutput.ReportOutput_Get(WebSession.DataObjectFactory, _
							EntityID, DefinitionID, True)
		Else
			If Not ReportOutputID Is Nothing Then
				aReportOutput = cReportOutput.ReportOutput_Get(WebSession.DataObjectFactory, ReportOutputID)
			Else
				If Not WebSession.HasStaffUser AndAlso Validate = "True" Then

					'check if the current user is the applicant
					Dim aUser As cEGUser = CType(WebSession.User("cEGHomeUser"), cEGUser)
					Dim aDataObjList As cDataObjectList
					aDataObjList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "WfTaskAssignmentID", EntityID, "PersonID", aUser.PersonID.ToString)
					If aDataObjList.Count = 0 Then
						errMsg = "You are not authorized to view this file."
						'Exit Sub
					End If

					'check if the current user is a third party to the requesting final pdf
					Dim aGPID As Integer
					Dim aThirdPartyDOL As cDataObjectList
					Dim aWFTADO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", EntityID)
					If Not aWFTADO Is Nothing Then
						aGPID = aWFTADO.GetPropertyInt("GranteeProjectID")
						aThirdPartyDOL = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "GranteeProjectID", aGPID.ToString, "PersonID", aUser.PersonID.ToString)
						If aThirdPartyDOL.Count = 0 Then
							errMsg = "You are not authorized to view this file."
							'Exit Sub
						End If
					Else
						errMsg = "File not found."
					End If

					If aDataObjList.Count = 0 AndAlso aThirdPartyDOL.Count = 0 Then
						Exit Sub
					End If
				End If
				aReportOutput = cReportOutput.ReportOutput_Get(WebSession.DataObjectFactory, _
								EntityID, DefinitionID, True)
			End If
		End If

		If aReportOutput Is Nothing Then Exit Sub

		Select Case aReportOutput("GenStatus")
			Case -1
				OpenPDF(aReportOutput)
			'0, 1, 2, 3, -2 (not valid), -3 (exception caught)
			Case Else
				Redirect_To_InQueue()
			'Case 0, 1
			'	Redirect_To_InQueue()
			'Case -2, -3	'File not created - -2: not valid, -3: exception caught
			'	Redirect_To_InQueue()
			'Case -1
			'	OpenPDF(aReportOutput)
			'Case Else
			'	Redirect_To_InQueue()
		End Select

	End Sub


	Public Sub OpenPDF(ByVal aReportOutput As cReportOutput)
		Dim aSharePointDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SharePointIntegration", "Active", "True")(0)
		If aSharePointDO Is Nothing Then
			OpenPDFFromDatabase(aReportOutput)
		Else
			'Here if the sharePoint is active and if the file is available in sharepoint , then the file will be downloaded from sharepoint.
			'otherwise if the file is not available in sharepoint then the file will be downloaded from Database.
			If aReportOutput.GetPropertyString("SharepointConversionStatus") = "-1" Then
				'Here if the Fild is Stored in SharePoint , then the file will be accessed from Sharepoint
				Dim aSPUrl As String = cWebLib.GetFormattedUrl(aSharePointDO.GetPropertyString("SharePointURL"))

				Dim myCred As New System.Net.NetworkCredential(aSharePointDO("UserName"), aSharePointDO("Password"))
				Dim aWC As WebClient = New WebClient
				aWC.Credentials = myCred

				Dim awftaskAssignmentID As Integer = aReportOutput.GetPropertyInt("EntityID")
				Dim aReportOutputID As String = aReportOutput.GetPropertyString("ReportOutputID")
				Dim aFileNamePrefix As String = aReportOutput.GetRelatedPropertyString("WfTaskAssignment.WfProjectTask.WfProjectTaskPDF.FileNamePrefix")
				Dim aGPID As String = aReportOutput.GetRelatedPropertyString("WfTaskAssignment.GranteeProject.GranteeProjectID")

				Dim aGranteeProjectDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProject", "GranteeProjectID", aGPID)(0)
				Dim aFCFolderName As String = aGranteeProjectDO.GetRelatedPropertyString("WfProjectID") + "_" + TruncateSpecialCharacters(aSharePointDO, aGranteeProjectDO.GetRelatedPropertyString("WfProject.ShortName"))
				Dim aFOFolderName As String = aGranteeProjectDO.GetRelatedPropertyString("WfProject.CompetitionID") + "_" + TruncateSpecialCharacters(aSharePointDO, aGranteeProjectDO.GetRelatedPropertyString("WfProject.WfCompetition.ShortName"))
				Dim aProgramFolderName As String = aGranteeProjectDO.GetRelatedPropertyString("WfProject.WfCompetition.ProgramID") + "_" + TruncateSpecialCharacters(aSharePointDO, aGranteeProjectDO.GetRelatedPropertyString("WfProject.WfCompetition.WfProgram.ShortName"))
				Dim aGPFolderName As String = aGPID + "_EGID"
				Dim aUploadFileName As String = aReportOutputID + "_" + aFileNamePrefix
				Dim aSiteName As String = cWebLib.GetFormattedUrl(aSharePointDO.GetPropertyString("SiteName"))

				Dim aRemotePDFFileURL As String = aSPUrl + aSiteName + "Grants" + "/" + aProgramFolderName + "/" + aFOFolderName + "/" + aFCFolderName + "/" + aGPFolderName + "/" + "Reports" + "/" + aUploadFileName + ".PDF"

				Try
					Dim res As Byte() = aWC.DownloadData(aRemotePDFFileURL)

					Response.Buffer = True
					Response.ContentType = "application/pdf"
					Response.BinaryWrite(res)
				Catch we As System.Net.WebException
					If we.Status = WebExceptionStatus.ConnectFailure Then
						errMsg = aSharePointDO.GetPropertyString("SharepointUnreachableMessage", "Sharepoint Server is Down")
					Else
						errMsg = "The file you are trying to access has been deleted or removed."
						Exit Sub
					End If
				Catch ex As Exception
					
				End Try
			Else
				OpenPDFFromDatabase(aReportOutput)
			End If
		End If
	End Sub

	Public Sub OpenPDFFromDatabase(ByVal aReportOutput As cReportOutput)
		'If SharePoint is not Active , then documents(bytes) will be picked from database and opened.
			Response.Buffer = True
			Response.ContentType = aReportOutput.GetRelatedPropertyString("ReportOutputDefinition.OutputMIMEType")
			Select Case Response.ContentType
				Case "application/vnd.ms-word"
					Response.AddHeader("content-disposition", "attachment; filename=EGMailMerge.doc")
				Case "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
					Response.AddHeader("content-disposition", "attachment; filename=EGMailMerge.docx")
				Case "application/vnd.ms-excel"
					Response.AddHeader("content-disposition", "attachment; filename=StaffQueryReport.xls")
				Case "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
					Response.AddHeader("content-disposition", "attachment; filename=StaffQueryReport.xlsx")
			End Select
			Response.BinaryWrite(aReportOutput.GetRelatedPropertyValue("ReportOutputData.FileData"))

			If aReportOutput.GetRelatedPropertyBool("ReportOutputDefinition.DeleteOnView") Then
				'Ideally, we should delete the current reports and all deletable reports with a request date
				'earlier than the current one.
				'Peter Larsen 11/4/03
				aReportOutput.ReportOutput_Delete()
			End If
	End Sub
'=============================================================
End Class

End Namespace 'Easygrants_Web.Controls.Base