Imports System.Web.UI.HtmlControls
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.Page.Administration
	Public Class cEvaluationToolStructure
		Inherits Core_Web.Controls.Base.cDataPresenterCtl

		Protected divPerformanceAreas As HtmlGenericControl
		Protected ctlCompetitionYear As cdropdown

		Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
			MyBase.CoreCtl_Load(sender, e)
			If Request.QueryString("TimePeriodID") = "" Then
				divPerformanceAreas.Visible = False
			Else
				ctlCompetitionYear = Me.GetControl("ctlCompetitionYear")
				ctlCompetitionYear.SelectedField = Request.QueryString("TimePeriodID")
			End If
		End Sub

	End Class
End Namespace
