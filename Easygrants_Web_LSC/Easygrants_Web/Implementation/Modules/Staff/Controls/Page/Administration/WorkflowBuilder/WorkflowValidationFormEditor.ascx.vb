Imports Core_Web.Controls.Base
Imports Core.Web

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder

Public MustInherit Class cWorkflowValidationFormEditor
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
    
    Protected ctlNewWindowOpener As cNewWindowOpener
    
    Public Sub ViewFormValidation(ByVal aPageKey As String, ByVal aWfTaskModuleConfigNavElementID As String)
		Dim aNewWindowUrl As String = Request.Url.ToString
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "Page", aPageKey)
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, aWfTaskModuleConfigNavElementID)
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "PageFrame=Print")
		ctlNewWindowOpener.NewWindowURL() = aNewWindowUrl
		ctlNewWindowOpener.Open()
	End Sub

End Class

End Namespace