Imports Core_Web.Controls.Base
Imports Core.Web

Namespace Implementation.Modules.UploadCertification
	Public Class cPostSubmitContent
		Inherits Core_Web.Controls.Base.cDataPresenterCtl
	Protected ctlNewWindowOpener As cNewWindowOpener

	Public Sub DocumentList_ViewUploadedFile(ByVal aPrimaryKeyValue As String)

		Dim aHref As String

		aHref = WebAppl.Build_RootURL("Core/Controls/Base/pgUploadSrcReader.aspx")
		aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aPrimaryKeyValue)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
		'Response.Redirect(aHref)

	End Sub
	End Class
End Namespace