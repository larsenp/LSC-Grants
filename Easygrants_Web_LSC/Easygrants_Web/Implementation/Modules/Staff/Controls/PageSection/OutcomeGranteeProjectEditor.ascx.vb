Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection

Public MustInherit Class cOutcomeGranteeProjectEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub

'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
		MyBase.DataPresenter_SaveDataObjects()
	End Sub
	
'=============================================================
End Class
End Namespace