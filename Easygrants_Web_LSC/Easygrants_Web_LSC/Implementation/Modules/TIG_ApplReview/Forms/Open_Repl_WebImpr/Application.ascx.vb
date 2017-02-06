Imports System.Web.UI.HtmlControls
Imports Core.DataAccess

Namespace Implementation.Modules.TIG_ApplReview.Forms

	Public Class cApplication
		Inherits Core_Web.Controls.Base.cDataPresenterCtl

		Protected divSecondary As HtmlGenericControl
		Protected divPrimary As HtmlGenericControl
		Protected spnSave As HtmlGenericControl
		Protected spnSaveContinue As HtmlGenericControl
		Protected spnContinue As HtmlGenericControl

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			Dim aReviewList As cDataObjectList = DataObjectCollection("ReviewWfTA")
			Dim aReviewWfTA As cDataObject = aReviewList(0)
			If Not aReviewWfTA Is Nothing AndAlso aReviewWfTA.GetPropertyInt("ReviewAssignmentTypeID") = 1 Then
				divSecondary.Visible = False
				divPrimary.Visible = True
				spnContinue.Visible = False
			Else
				spnSave.Visible = False
				spnSaveContinue.Visible = False
			End If
		End Sub

	End Class
End Namespace