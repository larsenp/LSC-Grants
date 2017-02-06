Imports Core.Web
Imports Core.Web.Modules
Imports Core.Web.User
Imports Core.Web.Navigation.CrumbTrail

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection

Public MustInherit Class cPersonContactsEL
    Inherits Core_Web.Controls.Base.cFilterListDataPresenterCtl

'=============================================================

	Public Sub NavigateToModulePageKey(ByVal aPageKey As String, ByVal aReturnURL As String)
		If aPageKey = "PersonEditor" Then
			aReturnURL = cWebLib.AddQuerystringParameter(aReturnURL, "Page", "PersonContact")
			aReturnURL = cWebLib.AddQuerystringParameter(aReturnURL, "PersonID", "0")
		Else
			aReturnURL = cWebLib.AddQuerystringParameter(aReturnURL, "Page", "OrganizationContact")
			aReturnURL = cWebLib.AddQuerystringParameter(aReturnURL, "OrganizationID", "0")
		End If

		EventController_NavigateToModulePageKey(aPageKey, aReturnURL)
	End Sub

'=============================================================
End Class 'cStageDetail
End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
