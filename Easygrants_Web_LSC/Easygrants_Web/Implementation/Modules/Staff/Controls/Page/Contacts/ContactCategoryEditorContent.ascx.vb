Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports EasyGrants.Correspondence
Imports System.Xml
Imports Core.Web.User
Imports Core.Web.Navigation.CrumbTrail

Namespace Implementation.Modules.Staff.Controls.Page.Contacts

Public MustInherit Class cContactCategoryEditorContent
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

'=============================================================

    Protected spnList As HtmlGenericControl

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
        
        if request.QueryString("ContactCategoryID") = 0 then
			spnList.Visible = False
		End If        
	End Sub

'=============================================================
End Class 'cStageDetail
End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
