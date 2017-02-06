Namespace Core_Web.Controls.Base

Public MustInherit Class cLogoutConfirmCtl
	 Inherits Core.Web.cCoreCtl
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

'=============================================================

	Private mCancelRedirectURL As String
	Protected btnOK As cCSSButton
	Protected btnCancel As cCSSButton
'=============================================================

	Public WriteOnly Property CancelRedirectURL() As String
		Set(ByVal Value As String)
			mCancelRedirectURL = Value
		End Set
	End Property


'=============================================================

	Public Sub btnOk_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		WebSession.LogoutAllUsers()

		Request.Cookies.Clear()
		Response.Cookies.Clear()

		Response.Redirect(WebAppl.LogoutURL)
	End Sub

'-------------------------------------------------------------

	Public Sub btnCancel_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		Response.Redirect(mCancelRedirectURL)
	End Sub

'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
			btnOK.Set_ServerClick(AddressOf btnOk_Click)
			btnCancel.Set_ServerClick(AddressOf btnCancel_Click)

	End Sub
'=============================================================
End Class

End Namespace 'Core_Web.Controls.Base
