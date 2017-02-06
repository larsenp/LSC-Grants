Imports Core.DataAccess

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
	Public Class cReviewSummaryRedirect
		Inherits Core_Web.Controls.Base.cDataPresenterCtl

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			Dim aList As cDataObjectList = DataObjectCollection("WfTaskAssignment")
			If aList.Count > 0 Then
				Dim aWfTAID As String = aList(0).GetPropertyString("WfTaskAssignmentID")
				Select Case aList(0).GetPropertyInt("WfTaskID")
					Case 5 'app review
						Me.EventController_NavigateToModulePageKey("ApplReviewSummary", "WfTaskAssignmentID=" + aWfTAID)
					Case 6 'renewal review
						Me.EventController_NavigateToModulePageKey("RenewalReviewSummary", "WfTaskAssignmentID=" + aWfTAID)
				End Select
			End If
		End Sub
	End Class
End Namespace