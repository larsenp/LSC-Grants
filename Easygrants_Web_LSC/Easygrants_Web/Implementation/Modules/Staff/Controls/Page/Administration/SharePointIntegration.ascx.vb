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
Imports System.Net
Imports System.Text.RegularExpressions


Namespace Easygrants_Web.Modules.Staff.Controls.Page
Public MustInherit Class cSharePointIntegration
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlUserName As cTextBox
	Protected ctlPassword As cTextBox
	Protected ctlSharePointURL As cTextBox
	Protected btnTestConnection As cCSSButton
	Protected spnSuccess As HtmlGenericControl
	Protected spnFailed As HtmlGenericControl

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		ctlUserName = CType(Me.FindControl("ctlUserName"), cTextBox)
		ctlPassword = CType(Me.FindControl("ctlPassword"), cTextBox)
		ctlSharePointURL = CType(Me.FindControl("ctlSharePointURL"), cTextBox)
		btnTestConnection = CType(Me.FindControl("btnTestConnection"), cCSSButton)
		spnSuccess.Visible = False
		spnFailed.Visible = False

	End Sub

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()

		ctlPassword.Value = CType(CType(Me.DataObjectCollection("SharePointIntegration"), cDataObjectList)(0).GetPropertyString("Password"), String).ToString
	End Sub

	Public Overloads Overrides Function EventController_Save(ByVal aValidate As Boolean) As Boolean

		Page.Validate()
		If Page.IsValid Then
			If Not CheckSharepoint() Then
				Exit Function
			End If
			If Not MyBase.EventController_Save(False) Then
				Exit Function
			End If
		Else
			Return False
		End If
		Return True

	End Function

	Public Sub TestConnection()
		Page.Validate()
		If Page.IsValid Then
			If Not CheckSharepoint() Then
				Exit Sub
			End If
			If Not MyBase.EventController_Save(False) Then
				Exit Sub
			End If
		End If
	End Sub

	Public Function CheckSharepoint() As Boolean
		Dim aSPIntegrationList As cDataObject = CType(Me.DataObjectCollection("SharePointIntegration"), cDataObjectList)(0)
		Dim myCred As New System.Net.NetworkCredential(ctlUserName.Value, ctlPassword.Value)
		Dim aSPUrl As String = cWebLib.GetFormattedUrl(ctlSharePointURL.Value)

		Dim aWC As WebClient = New WebClient
		aWC.Credentials = myCred
		Dim r As Byte()
		Try
			r = aWC.DownloadData(aSPUrl & "_vti_bin/dws.asmx")
			spnSuccess.Visible = True
			spnFailed.Visible = False
		Catch ex As Exception
			spnFailed.Visible = True
			spnSuccess.Visible = False
			Return False
		End Try
		Return True
	End Function

	Public Sub ValidateURL(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim ctlSharePointURL As cTextBox

		ctlSharePointURL = CType(Me.FindControl("ctlSharePointURL"), cTextBox)
		If ctlSharePointURL.Value.Length >= 8 Then
			If ctlSharePointURL.Value.Substring(0, 7) = "http://" Or ctlSharePointURL.Value.Substring(0, 8) = "https://" Then
				aArgs.IsValid = True
			Else
				aArgs.IsValid = False
			End If
		Else
			aArgs.IsValid = False
		End If
	End Sub

End Class
End Namespace