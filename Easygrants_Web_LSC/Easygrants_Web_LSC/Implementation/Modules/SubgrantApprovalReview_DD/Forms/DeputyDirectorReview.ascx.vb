Imports System.Web.UI
Imports Core.DataAccess

Namespace Implementation.Modules.SubgrantApprovalReview_DD
Public Class cDeputyDirectorReview
	Inherits Core_Web.Controls.Base.cLSCDataPresenterCtl

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Dim aOutcomeID As Integer
		Dim aWfTADOL As cDataObjectList = DataObjectCollection("WfTaskAssignment")
		If aWfTADOL.Count = 0 Then
			aOutcomeID = 0
		Else
			aOutcomeID = aWfTADOL(0).GetPropertyInt("WfTaskOutcomeID", 0)
		End If
		If aOutcomeID <> 138 Then 'Recommend for Full Approval 
			Remove("ctlFullApprovalLoader")
		End If
		If aOutcomeID <> 139 Then 'Recommend Part./Prov. Approv.
			Remove("ctlPartialProvisionalApprovalLoader")
		End If
		If aOutcomeID <> 140 Then 'Recommend Denial
			Remove("ctlDenialLoader")
		End If
	End Sub

	Protected Sub Remove(ByVal aCtlID As String)
		Dim aCtl As Control = FindControl(aCtlID)
		Me.Controls.Remove(aCtl)
	End Sub

End Class
End Namespace
