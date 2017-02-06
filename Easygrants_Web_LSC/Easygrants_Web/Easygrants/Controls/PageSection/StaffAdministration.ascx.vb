Imports System.Diagnostics
Imports System.Web.UI
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core.Web
Imports Core.Web.SvrCtls

Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cStaffAdministration
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'=============================================================

    Public Sub NavigateToStaffModule()
		'dim aIndex as Integer
		
        'aURL = request.Url.ToString
        'aIndex = aURL.IndexOf("Home")
        'aURL = aURL.Remove(aIndex, 9)
        'aURL = aURL.Insert(aIndex, "Staff/")
        'aIndex = aURL.IndexOf("Home")
        'aURL = aURL.Remove(aIndex, 4)
        'aURL = cWebLib.AddQuerystringParameter(aURL, "Config", "ModuleConfig")
        'response.Redirect(aURL)
        'me.ModulePage_RedirectToModule("Staff", "ModuleConfig", "Home_Content.ascx", "Home")
    End Sub    
    
'=============================================================

End Class
End Namespace