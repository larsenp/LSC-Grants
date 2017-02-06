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

Namespace Implementation.Modules.ReviewReport.Controls.Page
Public MustInherit Class cEmailEditorLoader_Report
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

	'Protected spnAdd As HtmlGenericControl
	
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		Dim aURL As String
		Dim aHref As String
		aURL = Request.RawUrl
		aHref = WebAppl.Root + "/Implementation/Modules/ReviewReport/EmailEditor.aspx"
		If aURL.IndexOf("?") <> -1 Then
			aURL = aURL.Replace(aUrl.Substring(0, aURL.IndexOf("?")), aHref)
		End If
		aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "Config", Request.QueryString.Get("Config"))
		aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "ReturnURL", Request.QueryString.Get("ReturnURL"), Server)
		aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "Page", "EmailEditorPreview")
		aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "PageNavKey", WebSession.CurrentPage.PageNavKey)
		Response.Redirect(aURL)
	End Sub

'=============================================================
End Class
End Namespace