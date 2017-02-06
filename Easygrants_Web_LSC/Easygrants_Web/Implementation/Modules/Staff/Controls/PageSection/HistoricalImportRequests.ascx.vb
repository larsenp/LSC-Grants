Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
    Partial Class cHistoricalImportRequests
        Inherits Core_Web.Controls.Base.cDataPresenterCtl

        '=============================================================

        Protected ctlShow As cNewWindowOpener

        '=============================================================

        Public Sub OnView(ByVal aImportedFileID As String, ByVal aImportTypeID As String)
            Dim BaseQueryString As String
            BaseQueryString = WebAppl.Build_RootURL("/Implementation/Modules/Staff/Controls/Page/Administration/pgImportViewHtml.aspx?")
            BaseQueryString = BaseQueryString & "ImportedFileID=" & aImportedFileID.ToString()
            BaseQueryString = BaseQueryString & "&ImportTypeID=" & aImportTypeID.ToString()
            ctlShow.NewWindowURL = BaseQueryString
            ctlShow.Open()
        End Sub

        '=============================================================
    End Class
End Namespace