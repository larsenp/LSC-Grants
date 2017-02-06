Imports Core.Web.Modules
Imports Core.Web.User
Imports Core.Web.Navigation.CrumbTrail
Imports Core.Web
Imports Core.DataAccess

Namespace Implementation.Modules.Staff.Controls.Page.Contacts

Public MustInherit Class cPersonContact
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		dim aURL as String = request.RawUrl.ToString()
		
		if request.QueryString("Origin") is nothing then
			aURL = cWebLib.AddQuerystringParameter(aURL, "Origin", "Person")
			response.Redirect(aURL)
		End If		
		
		If Not Request.QueryString("PersonID") Is Nothing And Request.QueryString("PersonID") = "-1" Then
			EventController_NavigateToModulePageKey("Contacts")
		else
			MyBase.CoreCtl_Load(sender, e)
        End If		
	End Sub
	
'=============================================================
End Class 'cStageDetail
End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
