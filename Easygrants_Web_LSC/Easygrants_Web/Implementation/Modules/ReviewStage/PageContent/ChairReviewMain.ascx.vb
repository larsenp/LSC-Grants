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

Namespace Implementation.Modules.ReviewStage.PageContent
Public MustInherit Class cChairReviewMain
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'========================================================================

	protected spnSave as HtmlGenericControl
	protected tblSubmit as HtmlTable
	Protected ctlNewWindowOpener As cNewWindowOpener
	protected valMinValue as CustomValidator
	protected valMaxValue as CustomValidator
	protected valStreamlined as CustomValidator
	protected ctlMinValue as cMoneyTextBox
	protected ctlMaxValue as cMoneyTextBox
	protected ctlList as cDataListCtl
	Protected btnEditComment As cCSSButton
	Protected btnEditComment2 As cCSSButton
	protected valApplicants as CustomValidator

'========================================================================

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)    
   End Sub	
   
'=============================================================

	Public Sub ViewAssignmentsByReviewer(ByVal aReviewCommitteeID As String, ByVal aReviewStageCycleID As String, ByVal aGranteeProjectID As String, ByVal aAppWfTaskAssignmentID As String)
		Dim aHref As String

		aHref = WebAppl.Build_RootURL("EasyGrants/Controls/PageSection/pgViewAssignmentsByReviewer.aspx")
		aHref = cWebLib.AddQuerystringParameter(aHref, "ReviewCommitteeID", aReviewCommitteeID)
		aHref = cWebLib.AddQuerystringParameter(aHref, "ReviewStageCycleID", aReviewStageCycleID)
		aHref = cWebLib.AddQuerystringParameter(aHref, "GranteeProjectID", aGranteeProjectID)
		aHref = cWebLib.AddQuerystringParameter(aHref, "AppWfTaskAssignmentID", aAppWfTaskAssignmentID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub
	
'==============================================================

	Public Sub ViewAssignmentsByApplicant(ByVal aReviewCommitteeID As String, ByVal aReviewStageCycleID As String, ByVal aGranteeProjectID As String, ByVal aAppWfTaskAssignmentID As String)
		Dim aHref As String

		aHref = WebAppl.Build_RootURL("EasyGrants/Controls/PageSection/pgViewAssignmentsByApplicant.aspx")
		aHref = cWebLib.AddQuerystringParameter(aHref, "ReviewCommitteeID", aReviewCommitteeID)
		aHref = cWebLib.AddQuerystringParameter(aHref, "ReviewStageCycleID", aReviewStageCycleID)
		aHref = cWebLib.AddQuerystringParameter(aHref, "GranteeProjectID", aGranteeProjectID)
		aHref = cWebLib.AddQuerystringParameter(aHref, "AppWfTaskAssignmentID", aAppWfTaskAssignmentID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub
	
'=============================================================

	Public Sub Submit()
		dim aWftaDOList as cDataObjectList
		dim aWftaDO as cDataObject
		dim aGranteeProjectID as Integer
		dim aUserGranteeProjectID as Integer
		dim aUser As cEGUser
		dim aUserPersonID as Integer
		dim aPersonID as Integer

        aUser = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser)
		aWftaDO = CType(DataObjectCollection("WfTaskAssignment"), cDataObjectList)(0)
		aWftaDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "WfTaskID", aWftaDO.GetPropertyInt("WfTaskID").ToString(), "ReviewCommitteeID", aWftaDO.GetPropertyInt("ReviewCommitteeID").ToString())
		if aWftaDOList.Count > 0 then
			for each aWftaDO in aWftaDOList
				aGranteeProjectID = aWftaDO.GetPropertyInt("GranteeProjectID")
				aPersonID = aWftaDO.GetPropertyInt("PersonID")
				aUserGranteeProjectID = aUser.GranteeProjectID
				aUserPersonID = aUser.PersonID
				if (aGranteeProjectID <> aUserGranteeProjectID) Or (aPersonID <> aUserPersonID) then
					'update each Chair review status to Complete and Outcome, except for ModuleUser
					aWftaDO("WfTaskStatusID") = 2
					aWftaDO("WfTaskOutcomeID") = 30  'Chair Review Task Submitted
					aWftaDO("SubmittedDate") = System.DateTime.Now
					WebSession.DataObjectFactory.SaveDataObject(aWftaDO)
				end if
			next
		end if
		
		'Submit Peer review task		
		Dim aSubmitPage as cSubmissionModulePage
		aSubmitPage = CType(Page, cSubmissionModulePage)
		aSubmitPage.PostSubmitModuleConfig = Request.QueryString("Config")
		aSubmitPage.PostSubmitModuleName = "ReviewStage"
		aSubmitPage.PostSubmitPageKey = "Main"
		aSubmitPage.Submit(False)
	
	End Sub
	
'========================================================================

End Class
End Namespace
