Imports System.Web
Imports System.Web.SessionState
Imports EasyGrants.Web
Imports Core.Web
Imports System.IO
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports System.Collections.Specialized

Namespace Easygrants_Web

Public Class [Global]
	Inherits System.Web.HttpApplication

#Region " Component Designer Generated Code "

	Public Sub New()
		MyBase.New()

		'This call is required by the Component Designer.
		InitializeComponent()

		'Add any initialization after the InitializeComponent() call

	End Sub

	'Required by the Component Designer
	Private components As System.ComponentModel.IContainer

	'NOTE: The following procedure is required by the Component Designer
	'It can be modified using the Component Designer.
	'Do not modify it using the code editor.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
		components = New System.ComponentModel.Container()
	End Sub

#End Region

	Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
		Application("gWebAppl") = New cEGAppl(Me, ConfigurationSettings.AppSettings("EGConfigFile"))
	End Sub 

	Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
		Session("gWebSession") = New cEGSession(Application("gWebAppl"))
	End Sub

	Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
		Dim aMaxFileLength As Integer = System.Configuration.ConfigurationSettings.AppSettings("EGmaxRequestLength")
		If ((aMaxFileLength > 0) AndAlso (Request.ContentLength > aMaxFileLength)) Then
				Dim i As Integer
				If Request.Files.Count > 0 Then
					For i = 0 To Request.Files.Count - 1
						If (Request.Files.Item(i).ContentLength > 0) Then
							Response.Redirect(System.Configuration.ConfigurationSettings.AppSettings("FileLengthError") & _
					  "?filesize=" & Request.Files.Item(i).ContentLength & _
					  "&ReturnURL=" & Server.UrlEncode(Request.Url.PathAndQuery))
						End If
					Next
				Else
					If (Request.ContentLength > 0) Then
							Response.Redirect(System.Configuration.ConfigurationSettings.AppSettings("FileLengthError") & _
					  "?filesize=" & Request.ContentLength & _
					  "&ReturnURL=" & Server.UrlEncode(Request.Url.PathAndQuery))
						End If
				End If
		End If
	End Sub


	Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
		' Fires upon attempting to authenticate the use
	End Sub

	Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
		' Fires when the session ends
	End Sub

	Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
		' Fires when the application ends
	End Sub

End Class

End Namespace 'Easygrants_Web