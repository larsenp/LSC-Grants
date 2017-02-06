Imports System.Xml
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core.Web.Modules

Namespace Core_Web.Controls.Base

Public Class cscrpRedirectToModulePage
Inherits Core.Web.Modules.cModulePage
'=============================================================

	Protected ReadOnly Property RedirectModuleName() As String
		Get
			RedirectModuleName = Request.QueryString("RedirectModuleName")
		End Get
	End Property

'-------------------------------------------------------------

	Public Overrides Sub CorePage_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		'don't call base load, not interested in a script control

		Dim aModuleState As cModuleState = WebSession.ModuleState(RedirectModuleName)

		If Not aModuleState Is Nothing Then
			WebSession.Remove_ModuleState(RedirectModuleName)
			aModuleState.Return(Me)
			Exit Sub
		End If

		Dim aModuleNode As XmlNode

		aModuleNode = WebAppl.Get_ModuleConfig_ModuleNode(Me, RedirectModuleName)
		ModulePage_RedirectToModule(aModuleNode)
	End Sub

'=============================================================
End Class

End Namespace 'Core.Controls.Base