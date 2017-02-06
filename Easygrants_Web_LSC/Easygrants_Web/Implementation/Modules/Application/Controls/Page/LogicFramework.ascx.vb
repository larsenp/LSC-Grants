Imports System.Diagnostics
Imports System.Web.UI
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core.Web

Namespace Implementation.Modules.Application.Controls.Page
Public MustInherit Class cLogicFrameworkBase
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

	Protected ctlNewWindowOpener As cNewWindowOpener

	Public Sub ViewOutcomesandIndicatorsReport(ByVal aPageKey As String)
		Dim aNewWindowUrl = Request.Url.ToString
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "Page", aPageKey)
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "PageFrame", "Print")
		ctlNewWindowOpener.NewWindowURL() = aNewWindowUrl
		ctlNewWindowOpener.Open()
	End Sub

End Class
End Namespace