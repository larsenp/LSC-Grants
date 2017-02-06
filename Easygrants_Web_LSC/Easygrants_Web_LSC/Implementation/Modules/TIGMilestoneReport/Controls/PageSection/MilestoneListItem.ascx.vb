Imports Core.Web
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.TIGMilestoneReport.Controls.PageSection
Public Class cMilestoneListItem
	Inherits cLSCDataPresenterCtl

	Protected ctlNewWindowOpener As cNewWindowOpener
	Public Overridable Sub DocumentList_ViewConvertedUploadedFile(ByVal aPrimaryKeyValue As String)

		Dim aHref As String

		aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
		aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aPrimaryKeyValue)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()

	End Sub
End Class
End Namespace