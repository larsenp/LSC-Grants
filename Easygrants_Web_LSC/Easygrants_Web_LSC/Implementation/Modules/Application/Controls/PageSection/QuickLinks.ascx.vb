Imports System.Web.UI.HtmlControls
Imports Core.DataAccess

Namespace Implementation.Modules.Application.Controls.PageSection
Public Class cQuickLinks
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected trNewApp As HtmlTableRow
	Protected trCurrGrantee As HtmlTableRow
	Protected trRenewalApp As HtmlTableRow
	Protected trPostPQV As HtmlTableRow

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Dim aList As cDataObjectList = Me.DataObjectCollection("QL1")
		If aList.Count > 0 Then
			Dim aTaskID As Integer = aList(0).GetPropertyInt("WfTaskID")
			Select Case aTaskID
				Case 1
					trNewApp.Visible = True
					trCurrGrantee.Visible = True
				Case 2
					trNewApp.Visible = True
					trCurrGrantee.Visible = True
				Case 4
					trRenewalApp.Visible = True
				Case 66
					trPostPQV.Visible = True
				Case 67
					trPostPQV.Visible = True
			End Select
		End If
	End Sub

End Class
End Namespace
