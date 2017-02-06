Imports Core_Web.Controls.Base
Imports Core.Web.Navigation

Namespace Easygrants_Web.Controls.PageFrame

Public MustInherit Class cLoginTemplateCtl
    Inherits Core_Web.Controls.PageFrame.cModulePageFrame
'=============================================================

    'Protected jswMenuSource As cMenu


'=============================================================

    Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)
        'jswMenuSource.Add_LinkedDoc("Includes/mm_menu.js")
        'jswMenuSource.BaseNavElement = Me.ModulePage.ModuleUser.MasterNavElement

        'ctlNavigation.MasterNavElement = CType(Me.CorePage, Core.Web.cModulePage).ModuleUser.MasterNavElement
    End Sub

'=============================================================
End Class

End Namespace 'Easygrants_Web.Controls.PageFrame
