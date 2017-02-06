Imports System.Xml
Imports System.Text
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports EasyGrants.Web.User

Namespace Core_Web.Controls.Page

Public Class cErrorDetails
	Inherits Core.Web.cCorePage

	'Protected Dim spnStyles As HtmlGenericControl
	Protected Dim errMsg As String
	Protected Dim errUrl As String
	Protected Dim errStackTrace As String
	Protected spnCloseWindow As HtmlGenericControl
	Protected btnClose As cCSSButton
	

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
		'CorePage_LoadStyles(spnStyles)
		spnCloseWindow.Visible = False
		btnClose.Set_ServerClick(AddressOf btnClose_Clicked)
		if not WebSession is nothing then
			errMsg = WebSession.CurrentException.Message
			errUrl = WebAppl.Build_RootURL(WebSession.CurrentUrl)
			errStackTrace = BuildStackTrace()
		else
			errMsg = "Your session has expired. Please logout and login again."
		End If
		
	End Sub

	Protected Function BuildStackTrace() As String
		If WebSession.CurrentException.StackTrace Is Nothing Then
			Return "Stack trace is not available for this exception."
		End If
		Dim aStackTrace As String = WebSession.CurrentException.StackTrace
		Dim aSB As StringBuilder
		Dim aChar As Char
		Dim aInCrLf As Boolean
		aSB = New StringBuilder("<ul><li>")
		For Each aChar In aStackTrace
			If aChar = vbCr Or aChar = vbLf Then
				If Not aInCrLf Then
					aSB.Append("</li><li>")
				End If
				aInCrLf = True
			Else
				aSB.Append(aChar)
				aInCrLf = False
			End If
		Next
		aSB.Append("</li></ul>")
		Return aSB.ToString
	End Function
	
	Private Sub btnClose_Clicked(ByVal sender As System.Object, ByVal e As System.EventArgs)
		spnCloseWindow.Visible = True
	End Sub

End Class

End Namespace 'Core_Web.Controls.Page