Imports Core_Web.Controls.Base
Imports Core.Web
Imports Core.Web.Modules
Imports Core.DataAccess
Imports System.Web.UI.HtmlControls

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public Class cCommitteeMember
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl


Protected tdSubCmt As HtmlTableCell
Protected spnSubCommittee As HtmlGenericControl
Protected spnCommittee1 As HtmlGenericControl
Protected spnCommittee As HtmlGenericControl

Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		If Request.QueryString("ParentRCID") = "" Then
			spnSubCommittee.Visible = False
			spnCommittee1.Visible = False
		Else
			spnCommittee.Visible = False
		End If
	End Sub

End Class
End Namespace