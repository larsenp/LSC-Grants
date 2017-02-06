Imports System.Xml
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.Staff.Controls.Base

Public MustInherit Class cPageContentListing
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

	Protected btnClear As cCSSButton
	
	
	Public Sub DisplayPageContent(ByVal ReturnURL As String, ByVal PageContentID As String)

		Dim aURL As String = WebAppl.Build_BaseURL("Easygrants/Controls/PageSection/PageContent_Editor.aspx")
		aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, "Config", "ModuleConfig")
		aURL = Core.Web.cWebLib.AddQuerystringParameter(aURL, PageContentID)
		Response.Redirect(aURL)
		
	End Sub	
	
End Class


End Namespace 'Easygrants_Web.Modules.Staff.Controls.Base