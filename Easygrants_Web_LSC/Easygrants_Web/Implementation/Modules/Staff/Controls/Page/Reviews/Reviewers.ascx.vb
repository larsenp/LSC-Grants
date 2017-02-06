Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports EasyGrants.Correspondence
Imports System.Xml
Imports Core.Web.User
Imports Core.Web.Navigation.CrumbTrail

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Reviews

	Public MustInherit Class cReviewers
		Inherits Core_Web.Controls.Base.cFilterListDataPresenterCtl

'=============================================================

	'Protected WithEvents ctlCrumbTrail As cCrumbTrailDisplay
	Protected tbSearchParameters As HtmlTable
	Protected spnShow As HtmlGenericControl
	Protected spnHide As HtmlGenericControl

'=============================================================

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)

		If Request.QueryString("Find") = "True" Then
			spnShow.Visible = False
			spnHide.Visible = True

			If Request.QueryString("ShowParams") <> "True" Then
				spnShow.Visible = True
				spnHide.Visible = False
				tbSearchParameters.Visible = False
			End If
		Else
			spnShow.Visible = False
			spnHide.Visible = True
		End If

   End Sub

'-------------------------------------------------------------------------

		Public Sub ShowSearchParameters()
			Dim aURL As String = cWebLib.AddQuerystringParameter(Request.Url().ToString(), "ShowParams", "True")
			Response.Redirect(aURL)
		End Sub

'-------------------------------------------------------------------------

		Public Sub HideSearchParameters()
			Dim aURL As String = cWebLib.AddQuerystringParameter(Request.Url().ToString(), "ShowParams", "False")
			Response.Redirect(aURL)
		End Sub

'=============================================================

	End Class
End Namespace


