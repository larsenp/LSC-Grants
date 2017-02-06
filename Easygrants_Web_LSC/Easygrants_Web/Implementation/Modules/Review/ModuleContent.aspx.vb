Imports System.Xml
Imports Core.Util
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Navigation
Imports Core.Web.User
Imports EasyGrants.Web.User
Imports Core.Web.Modules
Imports Implementation.Web

Namespace Easygrants_Web.Modules.Review

Public Class cReviewModuleContent
	Inherits cValidationSubModulePageImpl

	 Public Overrides Sub CorePage_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CorePage_Load(aSrc, aEvent)

	 End Sub

End Class

End Namespace