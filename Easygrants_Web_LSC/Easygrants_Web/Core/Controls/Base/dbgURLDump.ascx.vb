Namespace Core_Web.Controls.Base

Public MustInherit Class cdbgURLDumpCtl
	Inherits Core.Web.cdbgCtl
'=============================================================

#Region " Web Form Designer Generated Code "

	'This call is required by the Web Form Designer.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

	End Sub

	Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
		'CODEGEN: This method call is required by the Web Form Designer
		'Do not modify it using the code editor.
		InitializeComponent()
	End Sub

#End Region
	Protected lblList As HtmlContainerControl

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)

		lblList.InnerHtml = lblList.InnerHtml + _
			"<b>AbsolutePath</b>:&nbsp; " + Request.Url.AbsolutePath + "<br>" + _
			"<b>AbsoluteUri</b>:&nbsp; " + Request.Url.AbsoluteUri + "<br>" + _
			"<b>PathAndQuery</b>:&nbsp; " + Request.Url.PathAndQuery + "<br>" + _
			"<b>ApplicationPath</b>:&nbsp; " + Request.ApplicationPath + "<br>" + _
			"<b>Host</b>:&nbsp; " + Request.Url.Host + "<br>" + _
			"<b>SessionID</b>:&nbsp; " + Session.SessionID + "<br>" + _
			"<b>RootFileSystemPath</b>:&nbsp; " + WebAppl.RootFileSystemPath + "<br>"
	End Sub

'=============================================================
End Class

End Namespace 'Core_Web.Controls.Base
