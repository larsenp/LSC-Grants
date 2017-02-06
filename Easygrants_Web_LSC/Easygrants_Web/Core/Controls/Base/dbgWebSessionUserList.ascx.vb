Imports Core.User

Namespace Core_Web.Controls.Base

Public MustInherit Class cdbgWebSessionUserListCtl
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
	Protected lblUserList As HtmlContainerControl

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)

		Dim aEntry As DictionaryEntry

		For Each aEntry In CorePage.WebSession.Users
			lblUserList.InnerHtml = lblUserList.InnerHtml + _
										"<b>Key</b>:&nbsp; " + aEntry.Key + _
										",&nbsp;&nbsp;<b>Class</b>:&nbsp; " + aEntry.Value.GetType().ToString() + _
										",&nbsp;&nbsp;<b>AccessLevel</b>:&nbsp; " + CType(aEntry.Value, cUser).AccessLevel.ToString() + _
										"<br>"
		Next

		lblUserList.InnerHtml = lblUserList.InnerHtml + _
								"<br>" + "<b>HasStaffUser</b>:&nbsp; " + Me.WebSession.HasStaffUser.ToString() + _
								"<br>"
	End Sub

'=============================================================
End Class

End Namespace 'Core_Web.Controls.Base

