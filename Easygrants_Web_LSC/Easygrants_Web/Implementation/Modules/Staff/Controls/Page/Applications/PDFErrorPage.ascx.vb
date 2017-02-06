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

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Applications

    Public MustInherit Class cPDFErrorPage
        Inherits Core_Web.Controls.Base.cDataPresenterCtl

        '=============================================================

        Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
            MyBase.CoreCtl_Load(sender, e)
        End Sub

        '=============================================================

        Public Sub Logout()
            Response.Redirect(WebAppl.LogoutURL)
        End Sub

        '=============================================================

    End Class
End Namespace
