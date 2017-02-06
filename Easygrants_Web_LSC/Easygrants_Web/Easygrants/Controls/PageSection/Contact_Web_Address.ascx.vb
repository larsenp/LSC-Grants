Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.Web.Modules
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports Core.Web

Namespace Easygrants_Web.Controls.PageSection
Public Class cContact_Web_Address
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

'============================================================= 

	Protected ctlNewWindowOpener As cNewWindowOpener
	
'============================================================= 

    Public Sub RedirectToURL(ByVal aURL As String)
		if aURL.IndexOf("://") = -1 then
			ctlNewWindowOpener.NewWindowURL = "http://" + aURL
		else
			ctlNewWindowOpener.NewWindowURL = aURL
		end if
		
        ctlNewWindowOpener.Open()
    End Sub    
   
'=============================================================


End Class 'cBudgetPeriod_Editor
End Namespace
