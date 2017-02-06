Imports Core.Web
Imports Core.Web.Modules
Imports Core.Web.User
Imports Core.Web.Navigation.CrumbTrail
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Home.Controls.Page
    Public MustInherit Class cViewMyGrants
        Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
        Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
            MyBase.CoreCtl_Load(sender, e)
        End Sub

    End Class
End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
