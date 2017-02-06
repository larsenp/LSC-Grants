Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports EasyGrants.Web



Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cContact_ApplicationTasks
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlNewWindowOpener As cNewWindowOpener
'========================================================================
	Public Sub ViewAppPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
		Dim aHref As String
		aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub
End Class
End Namespace