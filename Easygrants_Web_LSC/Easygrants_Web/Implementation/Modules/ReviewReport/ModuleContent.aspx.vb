Imports System.Xml
Imports System.Diagnostics
Imports Core.Web.Navigation
Imports Core.Web.Modules
Imports EasyGrants.Web.Modules
Imports EasyGrants.Web.User
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Workflow
Imports Core.Event

Namespace Easygrants_v4_CR_r1.Modules.ReviewReport

	Public Class cModuleContent
		Inherits Implementation.Web.cValidationSubModulePageImpl
	'=================================================

	'=================================================
		Public Overrides Sub CorePage_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CorePage_Load(aSrc, aEvent)
		End Sub
	'--------------------------------------------------------------

	'=================================================
	End Class
End Namespace
