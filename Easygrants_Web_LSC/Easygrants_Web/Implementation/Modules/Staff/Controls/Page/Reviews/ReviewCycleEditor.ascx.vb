Imports Core.DataAccess
Imports Core.Web
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public Class cReviewCycleEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
	Protected ctlProgram As cDropDown
	Protected ctlCompetition As cDropDown
	Protected ctlPreviousCycle As cDropDown

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub

	Public Sub OnProgramChange()
		ctlProgram = CType(Me.FindControl("ctlProgram"), cDropDown)
		Dim aURL As String = Request.RawUrl
		aURL = cWebLib.AddQuerystringParameter(aURL, "ProgramID", ctlProgram.SelectedValue)
		Response.Redirect(aURL)
	End Sub

	Public Sub OnCompetitionChange()
		ctlCompetition = CType(Me.FindControl("ctlCompetition"), cDropDown)
		Dim aURL As String = Request.RawUrl
		aURL = cWebLib.AddQuerystringParameter(aURL, "CompetitionID", ctlCompetition.SelectedValue)
		Response.Redirect(aURL)
	End Sub

	Public Sub Refresh()
		If Request.QueryString("ReviewCycleID") = "-1" Then
			Dim aURL As String = Request.RawUrl
			Dim aDOList As cDataObjectList = CType(DataObjectCollection("ReviewCycle"), cDataObjectList)
			aURL = cWebLib.AddQuerystringParameter(aURL, "ReviewCycleID", aDOList(0).GetPropertyInt("ReviewCycleID", 0))
			Response.Redirect(aURL)
		End If		
	End Sub

End Class 'cReviewCycleEditor
End Namespace
