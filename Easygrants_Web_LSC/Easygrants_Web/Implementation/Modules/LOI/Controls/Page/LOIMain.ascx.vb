Imports Core.DataAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Web.Modules

Namespace Easygrants_Web.Modules.LOI.Controls.Page
Public MustInherit Class cLOIMain
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'============================================================= 

	Protected ValidationHeader as HtmlTableRow
	Protected ValidationSummary as HtmlTableRow
	Protected ViewPDFLink as HtmlTableRow
	Protected ViewPDFInstructions as HtmlTableRow

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Dim aWfStatusID As Integer = CType(Page, cSubmissionModulePage).WfTaskAssignmentObject.GetPropertyInt("WfTaskStatusID", 1)
		If aWfStatusID = 1 Then
			ValidationHeader.Visible = True
			ValidationSummary.Visible = True
			ViewPDFInstructions.Visible = False
			ViewPDFLink.Visible = False
		Else
			ValidationHeader.Visible = False
			ValidationSummary.Visible = False
			ViewPDFInstructions.Visible = True
			ViewPDFLink.Visible = True
		End If
	End Sub

'=============================================================

End Class
End Namespace