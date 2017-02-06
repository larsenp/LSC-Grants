Imports System.Web.UI.HtmlControls
Imports Core.DataAccess

Namespace Implementation.Modules.TIG_ApplReview.Forms.Open_Repl_WebImpr

	Public Class cBudget
		Inherits Core_Web.Controls.Base.cLSCDataPresenterCtl

		Protected divContracts As HtmlGenericControl
		Protected divReviewersComments As HtmlGenericControl
		Protected divReviewerComment As HtmlGenericControl

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			Dim aTigContracts As cDataObjectList = DataObjectCollection("NoContracts")
			If aTigContracts.Count = 0 Then
				divContracts.Visible = False
				divReviewersComments.Visible = False
				divReviewerComment.Visible = False
			End If
		End Sub

	End Class

End Namespace