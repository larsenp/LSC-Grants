Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration

    Partial Class cPaymentImportViewHtml
        Inherits Core_Web.Controls.Base.cDataPresenterCtl

        '====================================================


        '====================================================

        Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
            MyBase.CoreCtl_Load(sender, e)
            If spnImportResult.InnerHtml = "" Then
                spnImportResult.InnerHtml = "Processing"
            End If
        End Sub

        '-----------------------------------------------------

        Public Sub CloseWindow()
            tblCloseWindow.Visible = True
            spnCloseControl.Visible = True
        End Sub

        '====================================================

    End Class
End Namespace