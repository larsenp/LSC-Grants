Imports Core_Web.Controls.Base
Imports Core.Web

Namespace Easygrants_Web.Modules.ProgressReport.PageContent
Public MustInherit Class cPublicationsList
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

'=============================================================

	Protected ctlNewWindowOpener As cNewWindowOpener

'=============================================================
    Public Sub DocumentList_ViewConvertedUploadedFile(ByVal aPrimaryKeyValue As String)

		Dim aHref As String

		aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
		aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aPrimaryKeyValue)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
		'Response.Redirect(aHref)

	End Sub
'=============================================================

End Class
End Namespace