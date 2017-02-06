Imports System.Web.UI.HtmlControls
Imports Core.Web.SvrCtls
Imports Core.DataAccess
Imports Implementation.Modules.ApplReview.Controls.PageSection

Namespace Implementation.Modules.ApplReview.Controls.Page

Public Class cReviewSummaryRFP
	Inherits Easygrants_Web.Controls.Base.cWfTADataPresenterCtl

	Protected spnContent As HtmlGenericControl

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		Dim aEval As cEvaluation
		Dim i As Integer
		Dim aInq As cDataObject
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Dim aInqList As cDataObjectList = DataObjectCollection("LscReviewInquiry")
		For i = 0 To aInqList.Count - 1
			aInq = aInqList(i)
			aEval = CType(Me.LoadControl("/Easygrants_Web_LSC/Implementation/Modules/ApplReview/Controls/PageSection/EvaluationForSummary.ascx"), cEvaluation)
			aEval.PA = aInq.GetRelatedPropertyString("LscReviewCriterion.LscReviewPerformanceArea.SortOrder")
			aEval.C = aInq.GetRelatedPropertyString("LscReviewCriterion.Abbr")
			aEval.Q = aInq.GetPropertyString("Abbr")
			'aEval.CoreCtl_Load(aSrc, aEvent)
			spnContent.Controls.Add(aEval)
		Next
	End Sub

End Class
End Namespace