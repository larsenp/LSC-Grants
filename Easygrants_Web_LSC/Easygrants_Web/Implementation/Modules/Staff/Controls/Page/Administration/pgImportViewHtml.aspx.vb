Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.Modules
Imports Core.Web.User
Imports EasyGrants.Web.User

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration

    Partial Class cpgImportViewHtml
        Inherits Core.Web.cCorePage
        '========================================================


        '========================================================

        Public Overrides Sub CorePage_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
            Select Case Request.QueryString("ImportTypeID")
                Case "1"
                    spnPaymentImportViewHtml.Visible = True
            End Select
        End Sub
        '========================================================

    End Class
End Namespace
