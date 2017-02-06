Imports Core.User

Namespace Core_Web.Controls.Base

Public MustInherit Class cdbgReleaseBuildDisplay
	Inherits Core.Web.cdbgCtl
'=============================================================

	Protected lblDisplay As HtmlContainerControl

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)

		lblDisplay.InnerHtml = WebAppl.ReleaseBuildVersionHTML
	End Sub

'=============================================================
End Class

End Namespace 'Core_Web.Controls.Base

