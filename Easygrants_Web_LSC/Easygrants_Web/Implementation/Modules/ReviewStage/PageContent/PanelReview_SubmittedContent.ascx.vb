Imports Core.Web
Imports Core.Web.Modules
Imports Core.DataAccess
Imports EasyGrants.Web
Imports EasyGrants.Web.User
Imports EasyGrants.Web.Modules
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Implementation.Modules.ReviewStage.PageContent
Public MustInherit Class cPanelReview_SubmittedContent
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
	
'========================================================================

	protected spnSave as HtmlGenericControl
	protected tblSubmit as HtmlTable
	Protected ctlNewWindowOpener As cNewWindowOpener
	protected valScores as CustomValidator
	protected ctlScore as cMoneyTextBox
	protected ctlList as cDataListCtl
	protected valApplicants as CustomValidator
	protected valStreamLined as CustomValidator

'========================================================================

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)     
   End Sub	
	
'==============================================================

	Public Sub ViewAppPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
		Dim aHref As String
		aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub

'=============================================================

	Public Sub ViewComment(ByVal aWfTaskAssignmentID as String, ByVal aWfTaskID as String, ByVal aGranteeProjectID as String, ByVal aAppWfTaskAssignmentID as String, ByVal aReturnURL as String)

		dim aWftaDO as cDataObject
		dim aWftaDOList as cDataObjectList
		dim aWftaID as String
		dim aWfTaskAssignmentReviewDOList as cDataObjectList
		dim aWfTaskAssignmentReviewID as String
		dim aPersonID as Integer

		aPersonID = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser).PersonID
		aWftaID = aWfTaskAssignmentID
		aWfTaskAssignmentReviewDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentReview", "WfTaskAssignmentID", aWftaID)						
		
		if aWfTaskAssignmentReviewDOList.Count > 0 then
			aWfTaskAssignmentReviewID = "WfTaskAssignmentReviewID=" & aWfTaskAssignmentReviewDOList(0).GetPropertyInt("WfTaskAssignmentReviewID")
		else
			aWfTaskAssignmentReviewID = "WfTaskAssignmentReviewID=0" 
		end if
		aWfTaskAssignmentID = "WfTaskAssignmentID=" & aWftaID
		aWfTaskID = "WfTaskID=" & aWfTaskID
		aGranteeProjectID = "GranteeProjectID=" & aGranteeProjectID
		aAppWfTaskAssignmentID = "AppWfTaskAssignmentID=" & aAppWfTaskAssignmentID
		aReturnURL = "ReturnURL=" & aReturnURL
		EventController_NavigateToModulePageKey("PanelCommentsReadOnly", aWfTaskAssignmentReviewID, aWfTaskAssignmentID, aGranteeProjectID, aAppWfTaskAssignmentID, aReturnURL)
	End Sub

'========================================================================

End Class
End Namespace