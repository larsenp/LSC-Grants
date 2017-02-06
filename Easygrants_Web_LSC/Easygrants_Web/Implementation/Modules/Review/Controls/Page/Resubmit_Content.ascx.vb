Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.Review.Controls.Page
Public MustInherit Class cResubmit_Content
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

'======================================================

	Protected valReopenCBList As CustomValidator

'======================================================

   Public Sub ValidateReopenCBList(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)

		aArgs.IsValid = True
		Dim ctlReopen As cCheckBoxList = GetControl("ctlReopen")
		Dim aCBValues As String = ctlReopen.RetrieveRows
		If aCBValues Is Nothing Then
			valReopenCBList.ErrorMessage = "You must select at least one requirement for resubmission."
			aArgs.IsValid = False
			Exit Sub
		End If
		'Budget Summary/Project Budget removed 7/23/2005 because Budget Summary is no longer part of Proposal Submission.
		'Commented out in case logic needs to be reused later.
		'Dim aBudgetSummaryIndex As Integer = aCBValues.IndexOf("BudgetSummary")
		'Dim aProjectBudgetIndex As Integer = aCBValues.IndexOf("ProjectBudget")

		'If aProjectBudgetIndex <> -1 And aBudgetSummaryIndex = -1 Then
		'	valReopenCBList.ErrorMessage = "You selected the Project Budget.  You must also select the Budget Summary."
		'	aArgs.IsValid = False
		'	Exit Sub
		'End If

		'If aBudgetSummaryIndex <> -1 And aProjectBudgetIndex = -1 Then
		'	valReopenCBList.ErrorMessage = "You selected the Budget Summary.  You must also select the Project Budget."
		'	aArgs.IsValid = False
		'End If

   End Sub

'======================================================

End Class
End Namespace