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

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration
Public MustInherit Class cMaintenanceAlerts_content
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

	'Protected spnAdd As HtmlGenericControl
	
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		Dim aURL As String 
		aURL = WebAppl.Root + "/Easygrants/Controls/PageSection/MaintenanceAlerts_Editor.aspx"
		aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "Config", "ModuleConfig")
		Response.Redirect(aURL)
	End Sub

'=============================================================
End Class
End Namespace