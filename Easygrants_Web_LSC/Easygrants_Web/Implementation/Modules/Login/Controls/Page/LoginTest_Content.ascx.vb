Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports EasyGrants.Web.User
Imports Core.DataAccess

Namespace Easygrants_Web.Modules.Login.Controls.Page

Public MustInherit Class cLoginTest_Content
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
	Protected ctlErrorMsg As cLabel
	Protected ctlLoginID As HtmlInputText
	Protected ctlPWord As HtmlInputText
	Protected spnLogin As HtmlGenericControl
	Protected spnNotificationText As HtmlGenericControl
	Protected spnInfoText As HtmlGenericControl

'=================================================
	Public Function LoginUser()
		ctlErrorMsg = CType(FindControl("ctlErrorMsg"), cLabel)
		Dim aUser As cEGUser
		Dim aEGSession As cEGSession

		aEGSession = CType(WebSession, cEGSession)

		ctlLoginID = CType(Me.FindControl("txtLoginID"), HtmlInputText)
		ctlPWord = CType(Me.FindControl("txtPWord"), HtmlInputText)

		'Validate login information
		aUser = aEGSession.LoginUserFromCredentials(ctlLoginID.Value.ToString, ctlPWord.Value.ToString)
		If aUser Is Nothing Then
			ctlLoginID.Value = Nothing
			ctlErrorMsg.Value = "You have entered an incorrect Login ID or password.  Please check your information and try again.  If you can't log in, please contact the Foundation using the information at the bottom of this page.  You must register first to create a Login ID and Password."
		End If

	End Function
'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		spnLogin.Visible = True

		Dim aDO as cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("MaintenanceNotifications", "1")
		If Not aDO Is Nothing Then
		'	If aDO.GetPropertyBool("DisplayNotification") Then
		'		spnNotificationText.Visible = True
		'	Else
		'		spnNotificationText.Visible = False
		'	End If
		'	If aDO.GetPropertyBool("AllowLogin") Then
		'		spnLogin.Visible = True
		'		spnInfoText.Visible = False
		'	Else
		'		spnLogin.Visible = False
		'		spnInfoText.Visible = False
		'		spnNotificationText.Visible = True
		'	End If
			
			'check times
			Dim aMinTime As Date = #1/1/1753#
			Dim aMaxTime As Date = #12/31/9999#
			Dim aStartTime As Date
			Dim aEndTime As Date
			If spnNotificationText.Visible Then
				aStartTime = aDO.GetPropertyDateTime("DisplayMessageStartTime", aMinTime)
				aEndTime = aDO.GetPropertyDateTime("DisplayMessageEndTime", aMaxTime)
				If aStartTime > Date.Now Or aEndTime < Date.Now Then
					spnNotificationText.Visible = False
				End If
			End If
			If Not spnLogin.Visible Then
				aStartTime = aDO.GetPropertyDateTime("DisableLoginStartTime", aMinTime)
				aEndTime = aDO.GetPropertyDateTime("DisplayMessageEndTime", aMaxTime)
				If aStartTime > Date.Now Or aEndTime < Date.Now Then
					spnLogin.Visible = True
					spnInfoText.Visible = False
				End If
			End If
		End If
	End Sub

'=================================================
End Class
End Namespace