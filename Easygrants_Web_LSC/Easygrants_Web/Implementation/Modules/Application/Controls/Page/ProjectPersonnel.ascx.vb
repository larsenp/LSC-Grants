Imports Core.Web
Imports Core.Web.Modules
Imports Core.Web.User
Imports Core.Web.Navigation.CrumbTrail
Imports System.Xml
imports  Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Web.User
Imports EasyGrants.Workflow

Namespace Easygrants_Web.Modules.ProgramReport.PageContent

Public MustInherit Class cProjectPersonnel
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
		
	End Sub

'=============================================================
End Class 'cStageDetail
End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
