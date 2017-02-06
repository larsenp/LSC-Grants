Imports System.Xml
Imports System.Diagnostics
Imports Core_Web.Controls.Base
Imports System.Reflection
Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Web

Imports Core.Web.SvrCtls
Imports EasyGrants.Web.Modules

Namespace Implementation.Modules.Review.Controls.Page


Partial Public Class cInternalReview
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

	Protected ctlReportOutcome As cDropDown
	Protected ctlNewWindowOpener As cNewWindowOpener

	Public Sub ViewPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
		Dim aHref As String
		aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub

	Public Sub DocumentList_ViewConvertedUploadedFile(ByVal aPrimaryKeyValue As String)

		Dim aHref As String
		aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
		aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aPrimaryKeyValue)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
		'Response.Redirect(aHref)
	End Sub


	Public Overridable Sub Submit()
            ctlReportOutcome = CType(Me.FindControl("ctlReportOutcome"), cDropDown)
            DataPresenter_SaveDataObjects()
		Dim aSubmitPage As cSubmissionModulePage
		aSubmitPage = CType(Page, cSubmissionModulePage)
		aSubmitPage.PostSubmitModuleConfig = "ModuleConfig"
		aSubmitPage.PostSubmitModuleName = "Staff"
		aSubmitPage.Submit(False)
	End Sub

End Class

End Namespace