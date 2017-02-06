Imports System.Xml
Imports System.Diagnostics
Imports Core_Web.Controls.Base
Imports System.Reflection
Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Web
Imports EasyGrants.Workflow
Imports Core.Web.SvrCtls
Imports EasyGrants.Web.Modules
Imports EasyGrants.DataAccess.Report

Namespace Easygrants_Web.Modules.ProgressReport.PageContent

Public Class cCreateAgreement
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

	Protected ctlReportOutcome As cDropDown
	Protected ctlNewWindowOpener As cNewWindowOpener
	Protected mForceGen As Boolean = True
	'Protected spnErrorMessage As HtmlGenericControl
	Private aWfTaskModuleObject As cWfTaskAssignment
	Protected UploadDetailsPanel As Panel
	'Protected UploadPanel As Panel
	Protected ctlAgreementUpload As cUpload
	Protected valTemplateType As RequiredFieldValidator
	Protected valUpload As CustomValidator

	Public Property ForceGen() As Boolean
		Get
			Return mForceGen
		End Get
		Set(ByVal Value As Boolean)
			mForceGen = Value
		End Set
	End Property

	Public ReadOnly Property SubmittedFileID() As String
		Get
			If Not Request.QueryString("SubmittedFileID") Is Nothing Then
				Return Request.QueryString("SubmittedFileID")
			Else
				Return ""
			End If
		End Get
	End Property

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		valTemplateType.Enabled = False
		valUpload.Enabled = False
	End Sub

	Public Sub ViewPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
		Dim aHref As String
		aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub

	Public Sub DocumentList_ViewConvertedUploadedFile()
		Dim aPrimaryKeyValue As String = ""
		Dim aGrantAgreementDO As cDataObject = CType(DataObjectCollection("SubmittedFile"), cDataObjectList)(0)
		If Not aGrantAgreementDO Is Nothing Then
			aPrimaryKeyValue = aGrantAgreementDO.GetPropertyString("SubmittedFileID")
		End If
		Dim aHref As String
		aHref = WebAppl.Build_RootURL("Core/Controls/Base/pgUploadReader.aspx")
		aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aPrimaryKeyValue)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
		'Response.Redirect(aHref)
	End Sub

	Public Sub CreateGrantAgreement(ByVal aTemplateSubmitedFileID As String, ByVal aDefinitionID As String, ByVal PersonID As String)
		Dim aSubmittedFileID As Integer
		Dim aHref As String
		Dim aSubmittedFileDOL As cDataObjectList
		Dim aEGUser As cEGUser
		valTemplateType.Enabled = True
		Page.Validate()
		If Not Page.IsValid = True Then
			Exit Sub
		End If
		aEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		Dim aTemplateSubmitedFileDO As cDataObject = Me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile", "SubmittedFileID", aTemplateSubmitedFileID)(0)

		aSubmittedFileDOL = Me.DataObjectCollection("SubmittedFileCreateAggrementList")
		If aSubmittedFileDOL.Count > 0 Then
			SubmittedFile_Delete(aSubmittedFileDOL(0)("SubmittedFileID"))
		End If
		'Inserting into Submitted File Table.
		Dim aSubmittedFileDO As cDataObject
		aSubmittedFileDO = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("SubmittedFile")
		aSubmittedFileDO("EntityID") = aEGUser.GranteeProjectID
		aSubmittedFileDO("FileTypeID") = 61
		aSubmittedFileDO("SourceFileMIMEType") = "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
		aSubmittedFileDO("StoredFilePath") = "BLOB"
		aSubmittedFileDO("SubmitDate") = Now()
		'aSubmittedFileDO("ConversionStatus") = 0
		aSubmittedFileDO("ConversionResult") = "Conversion in progress"
		aSubmittedFileDO("UploadedByID") = PersonID
		aSubmittedFileDO("WordmergeTemplateSubmittedFileId") = aTemplateSubmitedFileID
		Me.WebSession.DataObjectFactory.SaveDataObject(aSubmittedFileDO)

		'Here we are again updating the Submitted_File table for source File Name.
		aSubmittedFileID = aSubmittedFileDO.GetPropertyInt("SubmittedFileID")
		aSubmittedFileDO("SourceFileName") = aTemplateSubmitedFileDO.GetPropertyString("UploadTitle", "Temp") + ".docx"
		Me.WebSession.DataObjectFactory.SaveDataObject(aSubmittedFileDO)

		Dim aReportOutput As cReportOutput
		aReportOutput = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("ReportOutput")
		aReportOutput("EntityID") = 0
		aReportOutput("DefinitionID") = aDefinitionID
		aReportOutput("GenRequestDate") = DateTime.Now
		aReportOutput("GenStatus") = 0
		aReportOutput("RequestedByID") = CType(CType(Page, cModulePage).ModuleUser, cEGUser).UserID
		aReportOutput("GenResult") = "Report is in the queue to be generated."
		Dim aXmlDoc As cXMLDoc = New cXMLDoc()
		aXmlDoc.LoadFromXML("<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject'><Filters><Argument Type='' TypeKey='' PropertyKey='GranteeProjectID'/></Filters></DataObject>")
		cXMLDoc.AddAttribute_ToNode(aXmlDoc.XMLDocument.SelectSingleNode("//DataObject"), "TemplateSubmittedFileID", aTemplateSubmitedFileID)
		cXMLDoc.AddAttribute_ToNode(aXmlDoc.XMLDocument.SelectSingleNode("//DataObject"), "SubmittedFileID", aSubmittedFileID)
		cXMLDoc.AddAttribute_ToNode(aXmlDoc.XMLDocument.SelectSingleNode("//Argument"), "Value", aEGUser.GranteeProjectID)
		aReportOutput("ReportParametersXML") = aXmlDoc.XMLDocument.OuterXml
		Me.WebSession.DataObjectFactory.SaveDataObject(aReportOutput)
		aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
		aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aSubmittedFileID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub


	Public Sub Submit()
		valUpload.Enabled = True
		Page.Validate()
		If Page.IsValid = False Then
			Exit Sub
		End If
		Dim aSubmitPage As cSubmissionModulePage
		aSubmitPage = CType(Page, cSubmissionModulePage)
		aSubmitPage.PostSubmitModuleConfig = "ModuleConfig"
		aSubmitPage.PostSubmitModuleName = "Staff"
		aSubmitPage.Submit(False)

	End Sub

	'Public Overrides Sub DataPresenter_SaveDataObjects()
	'	Update_Submitted_File()
	'End Sub

	'Public Sub Update_Submitted_File()
	'	Dim aDataObject As cDataObject
	'	Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
	'	aDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile", "EntityID", aUser.GranteeProjectID.ToString(), _
	'					"FileTypeID", "61")(0)
	'	If Not aDataObject Is Nothing AndAlso aDataObject.GetPropertyInt("ConversionStatus", 0) = -1 Then
	'		spnErrorMessage.Visible = False
	'		WebSession.DataObjectFactory.SaveDataObject(aDataObject)
	'	Else
	'		spnErrorMessage.Visible = True
	'		spnErrorMessage.InnerHtml = "Upload is required."
	'		Dim aURL As String = Request.RawUrl.ToString()
	'		aURL = cWebLib.AddQuerystringParameter(aURL, "SubmittedFileID", "0")
	'		Response.Redirect(aURL)
	'	End If
	'End Sub


	Public Sub Export_Word(ByVal aEntityID As String, ByVal aKey As String)
		Dim aURL As String
		Dim aDefinitionID As String

		aURL = WebAppl.Build_RootURL("Core/Controls/Base/pgReportOutputReader.aspx")
		aURL = cWebLib.AddQuerystringParameter(aURL, "EntityID", aEntityID)
		aDefinitionID = aKey
		aURL = cWebLib.AddQuerystringParameter(aURL, "DefinitionID", aDefinitionID)

		ctlNewWindowOpener.NewWindowURL() = aURL
		ctlNewWindowOpener.Open()

	End Sub

	Public Sub DocumentList_ViewConvertedUploadedFile(ByVal aPrimaryKeyValue As String)
		Dim aHref As String
		aHref = WebAppl.Build_RootURL("Core/Controls/Base/pgUploadReader.aspx")
		aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aPrimaryKeyValue)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
		'Response.Redirect(aHref)
	End Sub

	Public Sub DocumentList_ViewUploadedFile(ByVal aPrimaryKeyValue As String)
		Dim aHref As String
		aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
		aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aPrimaryKeyValue)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
		'Response.Redirect(aHref)
	End Sub

	Public Sub DocumentList_Delete(ByVal aPrimaryKeyValue As String)

		'The above code is commented out because , we moved this code section to cDataPresenterCtl as if there is Sharepoint Integration , then we need to delete the File from sharepoint.
		'So the delete Functionality is placed at once place in cDataPresenterCtl Class.
		SubmittedFile_Delete(aPrimaryKeyValue)

		CorePage.Redirect()

	End Sub

	Public Sub ValidateUpload(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aSubmittedFileDOL As cDataObjectList
		aSubmittedFileDOL = Me.DataObjectCollection("SubmittedFileCreateAggrementList")
		If aSubmittedFileDOL.Count > 0 Then
			aArgs.IsValid = True
		Else
			aArgs.IsValid = False
		End If
		Exit Sub
		aArgs.IsValid = True
   End Sub

End Class

End Namespace