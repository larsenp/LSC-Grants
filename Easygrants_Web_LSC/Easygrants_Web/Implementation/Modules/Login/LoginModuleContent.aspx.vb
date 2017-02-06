Imports System.Xml
Imports System.Diagnostics
Imports Core.Web.Navigation
Imports EasyGrants.Web.Modules

Namespace Easygrants_Web.Modules.Login

Public Class cLoginModuleContent
    Inherits EasyGrants.Web.Modules.cPublicModulePage
'=============================================================

'=============================================================

	Public Overrides Sub CorePage_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		'Debug.WriteLine("cLoginModuleContent:CorePage_Load")
	   MyBase.CorePage_Load(aSrc, aEvent)

	End Sub

'=============================================================
End Class 'cLoginModuleContent

End Namespace 'Easygrants_Web.Modules.Login