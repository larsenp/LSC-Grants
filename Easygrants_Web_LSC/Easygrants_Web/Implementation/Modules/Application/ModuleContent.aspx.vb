Imports System.Xml
Imports System.Diagnostics
Imports Core.Web.Navigation
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports Core.Web.Modules
Imports Implementation.Web

Namespace Easygrants_Web.Modules.Application

Public Class cModuleContent
	Inherits cValidationSubModulePageImpl

'=============================================================

	Public Overrides Sub CorePage_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		 MyBase.CorePage_Load(aSrc, aEvent)

		If not ModuleUser.MasterNavElement is Nothing Then
			dim aReturnHomeNavElement as cNavElement
			aReturnHomeNavElement = ModuleUser.MasterNavElement.Find_ChildElement("ReturnHome")
			if not aReturnHomeNavElement is Nothing Then
				aReturnHomeNavElement.Visible = true
				aReturnHomeNavElement.Enabled = true
				'aReturnHomeNavElement.SourceFile = WebAppl.Remove_RootFromURL(aModuleState.LastURL)
			end if

			dim aGuidelinesNavElement as cNavElement
			aGuidelinesNavElement = ModuleUser.MasterNavElement.Find_ChildElement("Guidelines")
			if not aGuidelinesNavElement is Nothing Then
				aGuidelinesNavElement.Visible = true
				aGuidelinesNavElement.Enabled = true
				'aGuidelinesNavElement.SourceFile = WebAppl.Remove_RootFromURL(aModuleState.LastURL)
			end if
		End If
	End Sub
	
'=============================================================
	

'=============================================================
End Class 'cModuleContent

End Namespace 'Easygrants_Web.Modules.Application