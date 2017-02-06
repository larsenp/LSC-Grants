Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports Core.Web

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cGrant_InternalReview_ViewComments
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Private aWfTaskAssignmentReviewDO As cDataObject
	Protected ctlComments As cTextArea
	
	Public ReadOnly Property WfTaskAssignmentReviewID() As String
		Get
			If Not Request.QueryString("WfTaskAssignmentReviewID") Is Nothing Then Return Request.QueryString("WfTaskAssignmentReviewID")
			Return "0"
		End Get
	End Property
	
	Public Overrides Sub DataPresenter_SaveDataObjects()
		ctlComments = FindControl("ctlComments")
		If WfTaskAssignmentReviewID = "" OrElse WfTaskAssignmentReviewID = "0" Then
			aWfTaskAssignmentReviewDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskAssignmentReview")
			aWfTaskAssignmentReviewDO("WfTaskAssignmentID") = Convert.ToInt32(Request.QueryString("WfTaskAssignmentID"))
		Else
			aWfTaskAssignmentReviewDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignmentReview", WfTaskAssignmentReviewID)
		End If
		aWfTaskAssignmentReviewDO("Comments") = ctlComments.Value
		aWfTaskAssignmentReviewDO.SaveData()
	End Sub
	
	Public Sub SavePageAndReload()
		If EventController_Save(True) Then
			Dim aPageURL As String  = Request.Url.ToString
			If Not aWfTaskAssignmentReviewDO Is Nothing Then
				aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "WfTaskAssignmentReviewID", aWfTaskAssignmentReviewDO.GetPropertyString("WfTaskAssignmentReviewID"))
			End If
			Response.Redirect(aPageURL)
		End If
	End Sub
	
End Class
End Namespace