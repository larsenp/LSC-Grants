Imports Core.Web

Namespace Implementation.Modules.Staff.Controls.Page.Reviews

Public MustInherit Class cApplicantsEL
	Inherits Core_Web.Controls.Base.cFilterListDataPresenterCtl

	Protected tbSearchParameters As HtmlTable
	Protected spnShow As HtmlGenericControl
	Protected spnHide As HtmlGenericControl
	Protected spnShowLink As HtmlGenericControl
	Protected spnHideLink As HtmlGenericControl

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)

		If Request.QueryString("Find") = "True" Then
            spnShow.Visible = False
            spnShowLink.Visible = False
            spnHide.Visible = True
            spnHideLink.Visible = True
            If Request.QueryString("ShowParams") <> "True" Then
                spnShow.Visible = True
                spnShowLink.Visible = True
                spnHide.Visible = False
                spnHideLink.Visible = False
                tbSearchParameters.Visible = False
            End If
        Else
            spnShow.Visible = False
            spnShowLink.Visible = False
            spnHide.Visible = True
            spnHideLink.Visible = True
        End If
	End Sub

	Public Sub ShowSearchParameters()
		Dim aURL As String = cWebLib.AddQuerystringParameter(Request.Url().ToString(), "ShowParams", "True")
		Response.Redirect(aURL)
	End Sub

	Public Sub HideSearchParameters()
		Dim aURL As String = cWebLib.AddQuerystringParameter(Request.Url().ToString(), "ShowParams", "False")
		Response.Redirect(aURL)
	End Sub

End Class
End Namespace
