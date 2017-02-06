Imports Core_Web.Controls.Base

Namespace Core_Web.Controls.PageFrame

Public MustInherit Class cModulePageFrame
	Inherits Core.Web.Modules.cModuleCtl
'=============================================================
    
    Protected rowHorizNavigation as HtmlTableRow
	Protected ctlHorizNavigation As cHorizNavigationCtl
	Protected ctlNavigation As cNavigationCtl

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
        
        ''Displays horizontal navigation for Staff members only (currently)
        If WebSession.HasStaffUser then
		    If Not ctlHorizNavigation Is Nothing Then
			    ctlHorizNavigation.MasterNavElement = ModulePage.ModuleUser.MasterNavElement
                ctlHorizNavigation.Visible = True
				rowHorizNavigation.Visible = True
			End If
		End If

		If Not ctlNavigation Is Nothing Then
			ctlNavigation.MasterNavElement = ModulePage.ModuleUser.MasterNavElement
		End If
	End Sub

'=============================================================
End Class 'cModulePageFrame

End Namespace 'Core_Web.Controls.PageFrame
