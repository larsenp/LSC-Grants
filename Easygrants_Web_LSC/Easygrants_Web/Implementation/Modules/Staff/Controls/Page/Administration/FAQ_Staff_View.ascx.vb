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

Namespace Easygrants_Web.Modules.Staff.Controls.Page
Public MustInherit Class cFAQ_Staff_View
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)


		End Sub

	Protected tblCloseWindow As HtmlTable
	Protected spnCloseControl As HtmlGenericControl

		Public Sub CloseWindow()
			tblCloseWindow.Visible = True
			spnCloseControl.Visible = True
		End Sub


End Class

End Namespace