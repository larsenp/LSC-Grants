Imports Core.Web
Imports Core.DataAccess
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Controls.PageSection
Public Class cReviewCycleManager
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlCompetitionType As cDropDown
	Protected ctlNewWindowOpener As cNewWindowOpener

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		
		If Not Request.QueryString("CmptType") Is Nothing Then
			ctlCompetitionType.SelectedField = Request.QueryString("CmptType")
		End If
	End Sub

	Public Sub ViewApplicantPool(ByVal aReviewCycleID As String)
		Dim aHref As String
		'aHref = WebAppl.Build_RootURL("EasyGrants/Controls/PageSection/pgViewApplicantPool.aspx")
		aHref = cWebLib.AddQuerystringParameter(Request.RawUrl(), "Page", "ViewApplicantPool" + "&PageFrame=Option02")
		aHref = cWebLib.AddQuerystringParameter(aHref, "ReviewCycleID", aReviewCycleID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub
	
	Public Sub ViewCommitteePool(ByVal aReviewCycleID As String)
		Dim aHref As String
		'aHref = WebAppl.Build_RootURL("EasyGrants/Controls/PageSection/pgViewApplicantPool.aspx")
		aHref = cWebLib.AddQuerystringParameter(Request.RawUrl(), "Page", "ViewCommitteePool" + "&PageFrame=Option02")
		aHref = cWebLib.AddQuerystringParameter(aHref, "ReviewCycleID", aReviewCycleID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub
		
	Public Overloads Overrides Function EventController_Save() As Boolean
   		
   		If Not MyBase.EventController_Save() Then
			Exit Function
		End If
   		
   		dim aObj as cDataObject
   		dim aOutcome as cDataObject
   		dim aList as cDataObjectList
   		dim aTaskID as String
   		dim aProjectID as String
   		dim aTaskList as cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleProjectTask", _
   			"ReviewCycleID", me.Request.QueryString("ReviewCycleID"))
   		
   		if aTaskList.Count > 0 then
			for each aObj in aTaskList
				aList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleProjectTaskOutcome", _
   					"ReviewCycleProjectTaskID", aObj.GetPropertyString("ReviewCycleProjectTaskID"))
   		
   				if aList.Count = 0 then
					aList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", _
   						"WfProjectTaskID", aObj.GetPropertyString("WfProjectTaskID"))
   					aTaskID = aList(0).GetPropertyString("WfTaskID")
   					aProjectID = aList(0).GetPropertyString("WfProjectID")
					   'aList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskOutcome", _
						  ' "WfTaskID", aTaskID, "WfTaskOutcome_Abbr", "Submitted")
					   'If aList.Count > 0 Then
						aOutcome = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("ReviewCycleProjectTaskOutcome")
						aOutcome("ReviewCycleProjectTaskID") = aObj("ReviewCycleProjectTaskID")
						aOutcome("ReviewCycleID") = aObj("ReviewCycleID")
						aOutcome("WfTaskOutcomeID") = aList(0).GetPropertyString("SubmittedOutcomeID", "")
						aOutcome("WfTaskID") = aTaskID
						aOutcome("WfProjectID") = aProjectID
						aOutcome.SaveData()
					'End If
				End If
			Next			
		End If
		
		return True
	End Function
	
	Private Sub AddFilter(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Response.Redirect(cWebLib.AddQuerystringParameter(Request.RawUrl(), "CmptType", ctlCompetitionType.SelectedValue))
	End Sub

End Class
End Namespace
