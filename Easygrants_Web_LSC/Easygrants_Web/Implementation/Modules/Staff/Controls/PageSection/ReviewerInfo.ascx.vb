Namespace Implementation.Modules.Staff.Controls.PageSection
Public MustInherit Class cReviewerInfo
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

    Protected spnName As HtmlGenericControl
    Protected spnInst As HtmlGenericControl
    Protected spnCmt As HtmlGenericControl

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		If Request.QueryString("RevPersonID") = "-1" Then
			spnName.InnerText = "All"
			spnInst.InnerText = "All"
			spnCmt.InnerText = "All"
		End If
	End Sub
	
End Class
End Namespace
