Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports EasyGrants.Web.User

Namespace Core_Web.Controls.Page

Public Class cPermissionErrorPage
	Inherits Core.Web.cCorePage
	
	Protected btnResume As cCSSButton
	Protected btnSend As cCSSButton
	Protected btnLogout As cCSSButton
	Protected lnkTechData As cLink
	'Protected WithEvents spnStyles As System.Web.UI.HtmlControls.HtmlGenericControl
	Protected Dim errMsg As String
	Protected errorEmailPageUrl As String = ConfigurationSettings.AppSettings("PermissionErrorEmail")
    Protected ctlShow As cNewWindowOpener

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

	End Sub

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

	Public Overrides Sub CorePage_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		btnResume.Set_ServerClick(AddressOf btnResume_Click)
		btnSend.Set_ServerClick(AddressOf btnSend_Click)
		btnLogout.Set_ServerClick(AddressOf btnLogout_Click)
	End Sub

	Public Sub btnResume_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		If Not WebSession Is Nothing Then
			If WebSession.CurrentUrl <> "" Then
				Response.Redirect(WebSession.CurrentUrl)
			Else
				Response.Write("<script language='JavaScript'>"+chr(13)+chr(10))
				Response.Write("history.go(-2);"+chr(13)+chr(10))
				Response.Write("</script>")
			End If
		Else
			Response.Redirect(WebAppl.LogoutURL)
		End If
	End Sub

	Public Sub btnSend_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		'Response.Redirect(Core.Web.cWebLib.AddQuerystringParameter(WebAppl.Build_RootURL(errorEmailPageUrl), "ReturnURL", Request.RawUrl.ToString()))
        Dim aURL As String
        aURL = WebAppl.Build_RootURL("Core/Controls/Page/PermissionErrorEmail.aspx")
		ctlShow.NewWindowURL() = aURL
		ctlShow.Open()
	End Sub

	Public Sub btnLogout_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		Response.Redirect(WebAppl.LogoutURL)
	End Sub
	
End Class 'cPermissionErrorPage

End Namespace 'Core_Web.Controls.Page