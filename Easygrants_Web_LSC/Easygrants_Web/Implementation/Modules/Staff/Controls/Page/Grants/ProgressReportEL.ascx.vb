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

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Grants

	Public MustInherit Class cProgressReportEL
		Inherits Core_Web.Controls.Base.cFilterListDataPresenterCtl

'=============================================================

	'Protected WithEvents ctlCrumbTrail As cCrumbTrailDisplay
	Protected tbSearchParameters As HtmlTable
	Protected spnShow As HtmlGenericControl
        Protected WithEvents ctlCrumbTrail As Core.Web.Navigation.CrumbTrail.cCrumbTrailDisplay
        Protected WithEvents spnHideText As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnLastName As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnFirstName As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnOrganization As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnEmail As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnTask As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnStatus As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnOutcome As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnCompetition As System.Web.UI.HtmlControls.HtmlGenericControl
        Protected WithEvents spnFind As System.Web.UI.HtmlControls.HtmlGenericControl
		Protected spnHide As HtmlGenericControl
		Protected ctlNewWindowOpener As cNewWindowOpener

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

		Public Sub ViewAppPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
			Dim aHref As String
			aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID)
			ctlNewWindowOpener.NewWindowURL = aHref
			ctlNewWindowOpener.Open()
		End Sub

'=============================================================

        Private Sub InitializeComponent()

        End Sub
    End Class
End Namespace
