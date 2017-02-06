Imports Core.DataAccess
Imports Core.Web
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cReviewStageAssign
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlAssignmentProcess As cDropDownText
	Protected ctlCheckConflict As cCheckBox
	Protected ctlNumReviewersPerApplicant As cTextBox
	Protected ctlNewWindowOpener As cNewWindowOpener

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub

	Public Sub Generate()
		ctlAssignmentProcess = CType(FindControl("ctlAssignmentProcess"), cDropDownText)
		
		Dim aAssignmentProcessDO as cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("AssignmentProcess", ctlAssignmentProcess.SelectedValue)
		Dim aType as String = aAssignmentProcessDO.GetPropertyString("StoredProcName")
		
		Dim aRequest as cDataObject = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("DataCommandRequest")
		aRequest("DataCommandXml") = "<DataCommand Key='" + aType + "' DataCommandDefinitionKey='" + aType + "' CommandTimeout='3000'><Parameters><Argument Type='QueryString' TypeKey='ReviewCycleStageID' ParameterKey='ReviewCycleStageID' Value='" _
			+ Request.QueryString("ReviewCycleStageID") + "' /></Parameters></DataCommand>"
		aRequest("DataCommandKey") = aType
		aRequest("Status") = 0
		aRequest("CreateDate") = System.DateTime.Now
		aRequest("CreateUser") = CType(CType(Page, cModulePage).ModuleUser, cEGUser).UserID
		aRequest("ReviewCycleStageID") = Request.QueryString("ReviewCycleStageID")
		aRequest("ProcessID") = aAssignmentProcessDO.GetPropertyInt("AssignmentProcessID")
		aRequest.SaveData
		CorePage.Redirect()
	End Sub

	Public Sub AssignmentByCommittee(aReviewCommitteeID As String, aReviewCycleStageID As String, aReviewCycleID As String)
		Dim aHref As String
		aHref = Request.RawUrl()
		aHref = aHref.Substring(0, aHref.IndexOf("&"))
		aHref = cWebLib.AddQuerystringParameter(aHref, "Page", "AssignmentByCommittee") 
		aHref = cWebLib.AddQuerystringParameter(aHref, "ReviewCommitteeID", aReviewCommitteeID) 
		aHref = cWebLib.AddQuerystringParameter(aHref, "ReviewCycleStageID", aReviewCycleStageID) 
		aHref = cWebLib.AddQuerystringParameter(aHref, "ReviewCycleID", aReviewCycleID) 
		aHref = cWebLib.AddQuerystringParameter(aHref, "PageFrame", "Print") 
		
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub	
	
	Public Sub AssignmentByReviewerSubcommittee(aReviewCycleStageID As String, aReviewCycleID As String)
		Dim aHref As String
		aHref = Request.RawUrl()
		aHref = aHref.Substring(0, aHref.IndexOf("&"))
		aHref = cWebLib.AddQuerystringParameter(aHref, "Page", "AssignmentByReviewerSubcommittee")
		aHref = cWebLib.AddQuerystringParameter(aHref, "ReviewCycleStageID", aReviewCycleStageID) 
		aHref = cWebLib.AddQuerystringParameter(aHref, "ReviewCycleID", aReviewCycleID) 
		aHref = cWebLib.AddQuerystringParameter(aHref, "PageFrame", "Print") 
		
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub	

	Public Sub ViewHistory(aPage As String, aReviewCycleStageID As String, aReviewCycleID As String)
		Dim aHref As String
		aHref = Request.RawUrl()
		aHref = aHref.Substring(0, aHref.IndexOf("&"))
		aHref = cWebLib.AddQuerystringParameter(aHref, "Page", aPage)
		aHref = cWebLib.AddQuerystringParameter(aHref, "ReviewCycleStageID", aReviewCycleStageID) 
		aHref = cWebLib.AddQuerystringParameter(aHref, "ReviewCycleID", aReviewCycleID) 
		aHref = cWebLib.AddQuerystringParameter(aHref, "PageFrame", "Print") 
		
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub	

End Class
End Namespace