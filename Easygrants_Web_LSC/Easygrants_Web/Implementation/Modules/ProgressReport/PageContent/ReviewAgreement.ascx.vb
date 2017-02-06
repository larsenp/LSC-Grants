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

Namespace Easygrants_Web.Modules.ProgressReport.PageContent

Public Class cReviewAgreement
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

	Protected ctlReportOutcome As cDropDown
	Protected ctlNewWindowOpener As cNewWindowOpener
    Protected mForceGen As Boolean = True
    Protected spnErrorMessage as HtmlGenericControl

    Private aWfTaskModuleObject As cWfTaskAssignment
    

	'Public Property ForceGen() As Boolean
	'	Get
	'		Return mForceGen
	'	End Get
	'	Set(ByVal Value As Boolean)
	'		mForceGen = Value
	'	End Set
	'End Property

 '   Public ReadOnly Property SubmittedFileID() As String
	'	Get
	'		If Not Request.QueryString("SubmittedFileID") Is Nothing Then
	'			Return Request.QueryString("SubmittedFileID")
	'		Else
	'			Return ""
	'		End If
	'	End Get
	'End Property

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		      
  '      Dim aDataObject As cDataObject
  '      Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
         
		'aDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile", "EntityID", aUser.GranteeProjectID.ToString(), _
		'                "FileTypeID", "61")(0)
		'If Not aDataObject Is Nothing AndAlso aDataObject.GetPropertyInt("ConversionStatus", 0) = -1 Then
  '         spnErrorMessage.Visible = False 
  '      End If
	End Sub

	Public Sub ViewPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
		Dim aHref As String
		aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub

	Public Sub DocumentList_ViewConvertedUploadedFile()
        Dim aPrimaryKeyValue As String = ""
        Dim aGrantAgreementDO As cDataObject = Ctype(DataObjectCollection("CreateRASubmittedFile"), cDataObjectList)(0)
        If Not aGrantAgreementDO Is Nothing Then
            aPrimaryKeyValue = aGrantAgreementDO.GetPropertyString("SubmittedFileID")
        End If
        Dim aHref As String
		aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("ConvertedFileViewer"))
        aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aPrimaryKeyValue)
		ctlNewWindowOpener.NewWindowURL = aHref
        ctlNewWindowOpener.Open()
        'Response.Redirect(aHref)
    End Sub



	'Public Sub Submit()				
	'	Dim aSubmitPage As cSubmissionModulePage
		
	'	aSubmitPage = CType(Page, cSubmissionModulePage)
	'	aWfTaskModuleObject = aSubmitPage.WfTaskAssignmentObject
	'	'Set post-submission parameters. Navigate to default page of current module (i.e., the ApplicationChecklist page key, 
	'	'which uses SubmittedContent.ascx as its post-submission content control) 
	'	If aWfTaskModuleObject.GetRelatedPropertyDataObject("WfTask").HasProperty("WfTaskModuleConfig") AndAlso Not aWfTaskModuleObject.GetRelatedPropertyDataObject("WfTask.WfTaskModuleConfig") Is Nothing Then
	'	'If  Task is configured with Task Builder and Workflow builder
	'		aSubmitPage.PostSubmitModuleConfig = Request.QueryString("Config")
	'		aSubmitPage.PostSubmitModuleName = aWfTaskModuleObject.GetRelatedPropertyString("WfTask.WfTaskModule.ModuleName")
	'		aSubmitPage.Submit_UpdateData()
	'		aSubmitPage.Submit_Redirect("Home", "HomeModuleConfig")
	'	End If

	'	aSubmitPage.Submit(ForceGen)

	'End Sub

 '   Public Overrides Sub DataPresenter_SaveDataObjects()
	'	Update_Submitted_File()
	'End Sub

 '   Public Sub Update_Submitted_File()
 '       Dim aDataObject As cDataObject
 '       Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
	'	aDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("SubmittedFile", "EntityID", aUser.GranteeProjectID.ToString(), _
	'	                "FileTypeID", "61")(0)
	'	If Not aDataObject Is Nothing AndAlso aDataObject.GetPropertyInt("ConversionStatus", 0) = -1 Then
 '           spnErrorMessage.Visible = False
	'		WebSession.DataObjectFactory.SaveDataObject(aDataObject)
 '       else
 '           spnErrorMessage.Visible = True
 '           dim aURL as String = request.RawUrl.ToString()
 '           aURL = cWebLib.AddQuerystringParameter(aURL, "SubmittedFileID", "0")
 '           response.Redirect(aURL)
	'	End If
	'End Sub


	Public Sub Export_Word(ByVal aEntityID As String, ByVal aDefinitionID As String)
        Dim aURL As String
        'Dim aDefinitionID as String

        aURL = WebAppl.Build_RootURL("Core/Controls/Base/pgReportOutputReader.aspx")
        aURL = cWebLib.AddQuerystringParameter(aURL, "EntityID", aEntityID)
        'aDefinitionID = aKey
        aURL = cWebLib.AddQuerystringParameter(aURL, "DefinitionID", aDefinitionID)

	    ctlNewWindowOpener.NewWindowURL() = aURL
	    ctlNewWindowOpener.Open()

	End Sub		

End Class

End Namespace