Imports System.Xml
Imports System.Diagnostics
Imports Core.Web.Navigation
Imports EasyGrants.Web.Modules
Imports EasyGrants.Web.User
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Workflow
Imports Core.Web.User
Imports EasyGrants.DataAccess
Imports EasyGrants.Web
Imports EasyGrants.Correspondence
Imports System.Text.RegularExpressions


Namespace Easygrants_Web.Modules.Login.Controls.Page

Public MustInherit Class cChangePasswordContent
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'============================================================= 

	Protected ctlNewPassword As cTextBox
	Protected ctlNewPasswordConfirm As cTextBox
	Protected txtNewPassword As cPasswordTextBox
	Protected ctlSecurityQuestion As cDropDown
	Protected ctlSecurityAnswer As cTextBox

'=================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		ctlNewPassword = CType(FindControl("txtNewPassword"), cTextBox)
		ctlNewPasswordConfirm = CType(FindControl("txtNewPasswordConfirm"), cTextBox)

	End Sub

'-------------------------------------------------------------

	Public Sub ChangePassword()
		Page.Validate()
		If Not Page.IsValid Then
			Exit Sub
		End If
		Dim aUser As cEGUser
		Dim aPersonID As String
		Dim aNewPassword As String
		Dim aUserDO As cDataObject
		Dim aUserDOList As cDataObjectList
		Dim aEGSession As cEGSession

		aUserDOList = DataObjectCollection("User")
		If aUserDOList.Count = 0 Then
			WebSession.LogoutAllUsers()
			EventController.EventController_NavigateToModulePageKey("Login")
		End If
		aUserDO = aUserDOList(0)

		aPersonID = aUserDO.GetPropertyString("PersonID")

		txtNewPassword = Me.FindControl("txtNewPassword")
		aNewPassword = txtNewPassword.Value

	


		'save to user data object
		aUserDO("Password") = aNewPassword
		aUserDO("ChangePasswordNextLogin") = False
		WebSession.DataObjectFactory.SaveDataObject(aUserDO)



		
		aEGSession = CType(WebSession, cEGSession)
		'The following line of code does a redirect and transfers control away from this method.
		aUser = aEGSession.LoginUserFromCredentials(aUserDO.GetPropertyString("UserName"), aUserDO.GetPropertyString("Password"), False, True)

		'This code is essentially an error handler and should never be hit.
		If aUser Is Nothing Then
			WebSession.LogoutAllUsers()
			EventController.EventController_NavigateToModulePageKey("Login")
		End If
	End Sub

'-------------------------------------------------------------

	Public Overrides Function EventController_GetArgumentValue(ByVal aArgumentNode As XmlNode, ByVal aDataObject As cDataObject) As String
		If cXMLDoc.AttributeToString(aArgumentNode, "Type") = "LoggedInUser" Then
			If Not WebSession.User("cEGStaffUser") Is Nothing Then
				Return CType(WebSession.User("cEGStaffUser"), cEGStaffUser).UserID.ToString
			End If
			If Not WebSession.User("cEGHomeUser") Is Nothing Then
				Return CType(WebSession.User("cEGHomeUser"), cEGHomeUser).UserID.ToString
			End If
		End If

		Return MyBase.EventController_GetArgumentValue(aArgumentNode, aDataObject)
	End Function

'=================================================
End Class
End Namespace