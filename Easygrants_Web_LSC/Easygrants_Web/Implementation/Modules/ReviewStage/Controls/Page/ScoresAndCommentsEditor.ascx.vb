Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web
Imports EasyGrants.Web.Modules
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports Core.Web
Imports System.Text

Namespace Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page
Public MustInherit Class cScoresandCommentsEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

'========================================================================

	Protected ctlNewWindowOpener As cNewWindowOpener
	Private mReportOuputDefinitionTypeID As String = "1"
	Private mDefinitionID As String
	Private mIsUserBased As Boolean = False

	Public Property ReportOuputDefinitionTypeID() As String
		Get
			Return mReportOuputDefinitionTypeID
		End Get
		Set(ByVal value As String)
			mReportOuputDefinitionTypeID = value
		End Set
	End Property

	Public Property IsUserBased() As Boolean
		Get
			Return mIsUserBased
		End Get
		Set(ByVal value As Boolean)
			mIsUserBased = value
		End Set
	End Property
'========================================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
		If Not IsPostBack Then
			Dim aRevWFTAID As String = Request.QueryString("RevWftaID")
			Dim aWFTAReviewDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentReview", "WfTaskAssignmentID", aRevWFTAID)(0)
			If Not aWFTAReviewDO Is Nothing Then
				Dim aCommentsUploadedFileID As String = aWFTAReviewDO.GetPropertyString("CommentsUploadedFileID", "0")
				If aCommentsUploadedFileID <> "0" Then
					Dim aSubmittedFileDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SubmittedFile", aCommentsUploadedFileID)
					If aSubmittedFileDO Is Nothing Then
						aWFTAReviewDO("CommentsUploadedFileID") = 0
						aWFTAReviewDO.SaveData()
					End If
				End If
			End If
		End If
	End Sub

	Public Sub ViewReviewerPDF(ByVal aExternalReviewApplicationsListDOL As cDataObject)

		Dim aHref As String
		Dim EntityID As String = aExternalReviewApplicationsListDOL.GetPropertyString("AppWftaID")
		Dim aWftaDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("WfTaskAssignment", EntityID)(0)
		If IsUserBased = True Then
			Dim aUser As cEGUser
			aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			Dim aUserDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("User", aUser.UserID)(0)
			If aUserDO.GetPropertyString("UserTypeID") = 1 Then
				mDefinitionID = aWftaDO.GetRelatedPropertyString("WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
			ElseIf aUserDO.GetPropertyString("UserTypeID") = 2 Or aUserDO.GetPropertyString("UserTypeID") = 3 Then
				mDefinitionID = aWftaDO.GetRelatedPropertyString("WfProjectTask.StaffPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
			End If
		ElseIf ReportOuputDefinitionTypeID = 1 Then
			mDefinitionID = aWftaDO.GetRelatedPropertyString("WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
		ElseIf ReportOuputDefinitionTypeID = 2 Then
			mDefinitionID = aWftaDO.GetRelatedPropertyString("WfProjectTask.RevPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
		ElseIf ReportOuputDefinitionTypeID = 3 Then
			mDefinitionID = aWftaDO.GetRelatedPropertyString("WfProjectTask.StaffPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
		End If

		aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(EntityID, mDefinitionID, "False")
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub
	
	Public Sub NavigateToUploadEditor(ByVal aPageKey As String, ByVal aUploadID As String, ByVal aReturnUrl As String)
		If Not EventController_Save() Then
			Exit Sub
		End If
		Dim aRevWFTAID As String = Request.QueryString("RevWftaID")
		Dim aWFTAReviewDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentReview", "WfTaskAssignmentID", aRevWFTAID)
		Dim aWFTAReviewDO As cDataObject
		If aWFTAReviewDOL.Count = 0 Then
			aWFTAReviewDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskAssignmentReview")
			aWFTAReviewDO("WfTaskAssignmentID") = Convert.ToInt32(aRevWFTAID)
			aWFTAReviewDO.SaveData()
		Else
			aWFTAReviewDO = aWFTAReviewDOL(0)
		End If
		Dim aCommentsUploadedFileID As String = aWFTAReviewDO.GetPropertyString("CommentsUploadedFileID", "0")
		EventController_NavigateToModulePageKey(aPageKey, "WfProjectTaskUploadID=" + aUploadID, "EntityDataObjectKey=WfTaskAssignment", "WfTaskAssignmentID=" + aWFTAReviewDO.GetPropertyString("WfTaskAssignmentID"), "SubmittedFileID=" + aCommentsUploadedFileID, "ReturnAfterDelete=False", aReturnUrl)
	End Sub
	
	Public Sub ViewParticipantSummary(ByVal aPageKey As String, ByVal aGranteeProjectID As String)
		If Not EventController_Save(True) Then
			Exit Sub
		End If
		Dim aNewWindowUrl As String = Request.Url.ToString
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "Page", aPageKey)
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "PageFrame=Print")
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, aGranteeProjectID)
		ctlNewWindowOpener.NewWindowURL() = aNewWindowUrl
		ctlNewWindowOpener.Open()
	End Sub

End Class
End Namespace