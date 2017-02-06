Imports Core.DataAccess
Imports Core.Web
Imports Core.Web.Modules
Imports EasyGrants.Web
Imports EasyGrants.Web.Modules
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page

	Public MustInherit Class cConflictsAndPreferences_Main
		Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
		
		Protected ctlList as cDataListCtl
		Protected ctlNewWindowOpener As cNewWindowOpener
		Protected IncompletePanel As Panel
		Protected CompletePanel As Panel
		
		Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
			MyBase.CoreCtl_Load(sender, e)
			Dim aUser As cEGUser
			aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			Dim aWftaDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "PersonID", aUser.PersonID, "WfTaskID", aUser.WfTaskID, "WfTaskStatusID", "1")
			If Not aWftaDOL Is Nothing AndAlso aWftaDOL.Count > 0 Then
				'Some task assignments for this review task are incomplete
				IncompletePanel.Visible = True
				CompletePanel.Visible = False
			Else
				'All task assignments for this review task are complete
				IncompletePanel.Visible = False
				CompletePanel.Visible = True
			End If
        End Sub
		
		Public Sub ViewParticipantSummary(ByVal aPageKey As String, ByVal aGranteeProjectID As String)
			Dim aNewWindowUrl As String = Request.Url.ToString
			aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "Page", aPageKey)
			aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "PageFrame=Print")
			aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, aGranteeProjectID)
			ctlNewWindowOpener.NewWindowURL() = aNewWindowUrl
			ctlNewWindowOpener.Open()
		End Sub
		
	End Class

End Namespace