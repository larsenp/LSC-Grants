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
Public Class cBudget_Editor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'============================================================= 

    Protected trType As HtmlTableRow
    
'=============================================================

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
        MyBase.CoreCtl_Load(aSrc, aEvent)

        If Not Request.QueryString("BudgetID") Is Nothing Then
			trType.Visible = True
		else if Request.QueryString("ReturnURL") Is Nothing Then
			dim aURL as String = me.Request.Url.ToString()
			aURL = cWebLib.AddQuerystringParameter(aURL, "ReturnURL", Server.UrlEncode(aURL))
			me.Response.Redirect(aURL)
		End If		
        
    End Sub    
    
'=============================================================
End Class 'cBudgetPeriod_Editor
End Namespace