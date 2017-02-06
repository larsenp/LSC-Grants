Imports Core.Web.Modules
Imports Core.Web.User
Imports Core.Web.Navigation.CrumbTrail
Imports Core.Web

Namespace Implementation.Modules.Staff.Controls.Page.Contacts

Public MustInherit Class cOrganizationContact
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

'=============================================================

    'Protected WithEvents ctlCrumbTrail As cCrumbTrailDisplay

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		dim aURL as String = request.Url.ToString()
		
		if request.QueryString("Origin") is nothing then
			aURL = cWebLib.AddQuerystringParameter(aURL, "Origin", "Organization")
			response.Redirect(aURL)
		End If		
		
		If Not Request.QueryString("OrganizationID") Is Nothing And Request.QueryString("OrganizationID") = "-1" Then
			EventController_NavigateToModulePageKey("Contacts")
		Else
			MyBase.CoreCtl_Load(sender, e)
        End If
        
	End Sub
	
'=============================================================
End Class 'cStageDetail
End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
