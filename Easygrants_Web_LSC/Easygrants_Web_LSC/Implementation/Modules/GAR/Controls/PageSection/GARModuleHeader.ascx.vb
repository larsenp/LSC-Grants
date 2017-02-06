Imports System.Web.UI.HtmlControls
Imports Core.DataAccess

Namespace Implementation.Modules.Gar.Controls.PageSection
	Public Class cGARModuleHeader
		Inherits Core_Web.Controls.Base.cDataPresenterCtl

		Protected spnGAR As HtmlGenericControl
		Protected spnStandard As HtmlGenericControl

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)

			Dim aPageKey As String = Request.QueryString("Page")
			If aPageKey = "Submission" Then
				spnGAR.Visible = False
			Else
				spnStandard.Visible = False
			End If

		End Sub
	End Class
End Namespace
