Imports Core.DataAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Web.Modules
Imports Core.Web.SvrCtls

Namespace Easygrants_Web.Modules.Application.Controls.Page
Public MustInherit Class cMainContent
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

'============================================================= 

	Protected ValidationHeader As HtmlTableRow
	Protected ValidationSummary As HtmlTableRow
	Protected ViewPDFLink As HtmlTableRow
	Protected ViewPDFInstructions As HtmlTableRow
	Protected TrProjectHeader As HtmlTableRow

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Dim aWfStatusID As Integer = CType(Page, cSubmissionModulePage).WfTaskAssignmentObject.GetPropertyInt("WfTaskStatusID", 1)
		If aWfStatusID = 1 Then
			ValidationHeader.Visible = True
			ValidationSummary.Visible = True
			ViewPDFInstructions.Visible = False
			ViewPDFLink.Visible = False
			TrProjectHeader.Visible = True
		Else
			ValidationHeader.Visible = False
			ValidationSummary.Visible = False
			ViewPDFInstructions.Visible = True
			ViewPDFLink.Visible = True
			TrProjectHeader.Visible = False
		End If
	End Sub

'=============================================================

End Class
End Namespace