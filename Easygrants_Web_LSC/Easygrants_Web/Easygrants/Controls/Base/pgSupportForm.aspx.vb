Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.DataAccess

Namespace Easygrants_Web.Controls.Base

Public Class cpgSupportForm
	Inherits Core.Web.cCorePage

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

	Public Overrides Sub CorePage_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CorePage_Load(sender, e)
	End Sub

'=============================================================

End Class
End Namespace