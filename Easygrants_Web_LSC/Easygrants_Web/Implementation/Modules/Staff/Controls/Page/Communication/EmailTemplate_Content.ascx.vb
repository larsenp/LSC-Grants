Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports EasyGrants.Web.User
Imports EasyGrants.Correspondence
Imports System.Xml
Imports EasyGrants.DataAccess.Report

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Communication

    Public MustInherit Class cEmailTemplate_Content
        Inherits Core_Web.Controls.Base.cDataPresenterCtl

        '=============================================================

        Public Sub DisplayPageContent(ByVal Page As String, ByVal CorrespondenceDefinitionID As String)

            Dim aURL As String
            aURL = WebAppl.Root + "/" + Page
            aURL = cWebLib.AddQuerystringParameter(aURL, CorrespondenceDefinitionID)
            aURL = cWebLib.AddQuerystringParameter(aURL, "Page", "EmailTemplateEditor")
            Response.Redirect(aURL)

        End Sub

        '=============================================================

    End Class
End Namespace