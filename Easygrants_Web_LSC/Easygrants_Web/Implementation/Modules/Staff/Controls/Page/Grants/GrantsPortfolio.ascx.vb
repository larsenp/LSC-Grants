Imports Core.Web
Imports Core.Web.Modules
Imports Core.Web.User
Imports Core.Web.Navigation.CrumbTrail
Imports Core_Web.Controls.Base
Namespace Implementation.Modules.Staff.Controls.Page.Grants

    Public MustInherit Class cGrantsPortfolio
        Inherits Core_Web.Controls.Base.cFilterListDataPresenterCtl
        Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
            MyBase.CoreCtl_Load(sender, e)
        End Sub

    End Class
End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
