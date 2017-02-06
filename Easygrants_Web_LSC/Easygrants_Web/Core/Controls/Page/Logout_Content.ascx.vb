Imports Core.Web
Imports Core.Web.Modules
Imports Core_Web
Imports Core_Web.Controls.Base

Namespace Core_Web.Controls.Page

Public MustInherit Class cLogout_Content
	Inherits Core.Web.cCoreCtl
'=============================================================

	Protected ctlLogoutConfirm As cLogoutConfirmCtl
	Protected tblDebugHdr As HtmlTable

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)

		Dim aPage As cModulePage = CType(Me.CorePage, cModulePage)
		ctlLogoutConfirm.CancelRedirectURL = aPage.ModulePage_BuildPageKeyURL(aPage.ModuleDefaultPageKey)
'		If WebAppl.DebugSwitchEnabled Then tblDebugHdr.Visible = True
		If DebugSwitchEnabled Then tblDebugHdr.Visible = True
	End Sub

'=============================================================
End Class

End Namespace 'Core_Web.Controls.Page