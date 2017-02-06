Namespace Implementation.Modules.Staff.Controls.PageSection
    Public MustInherit Class cOrgDetails
        Inherits Core_Web.Controls.Base.cDataPresenterCtl
        Protected tblCloseWindow As HtmlTable
        Protected spnCloseControl As HtmlGenericControl

        Public Sub CloseWindow()
            tblCloseWindow.Visible = True
            spnCloseControl.Visible = True
        End Sub
    End Class
End Namespace