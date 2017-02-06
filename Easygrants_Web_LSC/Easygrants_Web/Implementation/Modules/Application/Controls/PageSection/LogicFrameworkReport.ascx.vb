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
Imports EasyGrants.Web

Imports System.Web.UI.HtmlControls
Imports System.Web.UI.WebControls

Imports System.Reflection
Imports Core.Web.User

Imports Core.DataAccess.DBAccess

Imports Core.Web.SvrCtls

Imports Core.Util

Imports EasyGrants.Web.Modules


Namespace Implementation.Modules.Application.Controls.PageSection
Public MustInherit Class cLogicFrameworkReport
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

		Protected spnModuleName As HtmlGenericControl

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			 spnModuleName.InnerHtml = CType(Page, cModulePage).ModulePage_GetTitle
		End Sub
End Class
End Namespace

