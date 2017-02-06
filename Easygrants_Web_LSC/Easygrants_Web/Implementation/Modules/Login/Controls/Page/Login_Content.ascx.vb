Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports EasyGrants.Web.User
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web

Namespace Easygrants_Web.Modules.Login.Controls.Page

Public MustInherit Class cLogin_Content
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlErrorMsg As cLabel
	Protected ctlLoginID As HtmlInputText
	Protected ctlPWord As HtmlInputText
	Protected spnLogin As HtmlGenericControl
	Protected spnNotificationText As HtmlGenericControl
		Protected ctlLoginTextMsg As cLabel
		Protected ctlPasswordTextMsg As cLabel
		Protected spnInfoText As HtmlGenericControl
		Private aUser As cEGUser

	Protected ctlNewWindowOpener As cNewWindowOpener
	Protected ctlFAQ As cLink
'=================================================


	Public Function LoginUser()
	Dim aInvalidInput As Boolean = False
	Dim aUserLogin As cDataObject
	Dim aUserDO As cDataObject
	Dim aModuleDoc As cXMLDoc
			ctlErrorMsg = CType(FindControl("ctlErrorMsg"), cLabel)
			ctlLoginTextMsg = CType(FindControl("ctlLoginTextMsg"), cLabel)
			ctlPasswordTextMsg = CType(FindControl("ctlPasswordTextMsg"), cLabel)

		Dim aEGSession As cEGSession

		aEGSession = CType(WebSession, cEGSession)

		ctlLoginID = CType(Me.FindControl("txtLoginID"), HtmlInputText)
			ctlPWord = CType(Me.FindControl("txtPWord"), HtmlInputText)

			If ctlLoginID.Value = Nothing Then
				ctlLoginTextMsg.Value = "Login ID is required."
				aInvalidInput = True
			End If
			If ctlPWord.Value = Nothing Then
				ctlPasswordTextMsg.Value = "Password is required."
				aInvalidInput = True
			End If

			If aInvalidInput Then
				Exit Function
			End If

			aUserLogin = WebSession.DataObjectFactory.GetDataObjectListWithFilter("User", "UserName", ctlLoginID.Value)(0)


			If Not aUserLogin Is Nothing Then
				If aUserLogin("FailedAttempts") Is System.DBNull.Value Then
					aUserLogin("FailedAttempts") = 0
				End If

				Dim MaxAttemps As Integer = WebAppl.MaxFailedLoginAttempts()
				If aUserLogin("FailedAttempts") < WebAppl.MaxFailedLoginAttempts() And aUserLogin.GetPropertyBool("IsLocked", False) <> True Then
						aUser = aEGSession.ValidateLoginCredentials(ctlLoginID.Value.ToString, ctlPWord.Value.ToString, False, True, aModuleDoc)
				Else
					ctlErrorMsg.Value = "Your account has been locked. Please use the support e-mail link at the bottom of the page to contact technical support."
					Exit Function
				End If


				If Not aUser Is Nothing Then
					aUserLogin("FailedAttempts") = 0
					aUserLogin("IsLocked") = False
					'aUserLogin.SaveData()
					If aUserLogin("EncryptionKey") Is System.DBNull.Value Then
						aUserLogin.EncryptPropertyValue("Password", aUserLogin("Password"))
					End If
					aUserLogin.EncryptPropertyValue("MD5Password", aUserLogin("Password"))
					aUserLogin.Modified = True
					aUserLogin.SaveData()

					aUserDO = aEGSession.DataObjectFactory.GetDataObjectFromPrimaryKey("User", aUser.UserID)

					If Not aUserDO Is Nothing Then
						If aUserDO.GetRelatedPropertyBool("ChangePasswordNextLogin") Then
						aEGSession.RedirectToModule("Login", "LoginModuleConfig", "ChangePassword")
							'EventController_NavigateToModulePageKey("ChangePassword")
						End If

							aUser = aEGSession.LoginUserFromCredentials(ctlLoginID.Value.ToString, ctlPWord.Value.ToString)
					End If

				Else

					If Not aUserLogin("FailedAttempts") Is System.DBNull.Value Then
						aUserLogin("FailedAttempts") += 1
					Else
						aUserLogin("FailedAttempts") = 1
					End If

					If aUserLogin.GetPropertyInt("FailedAttempts") >= WebAppl.MaxFailedLoginAttempts Then
						aUserLogin("IsLocked") = True
						ctlErrorMsg.Value = "Your account has been locked. Please use the support e-mail link at the bottom of the page to contact technical support."
					Else
					ctlLoginID.Value = Nothing
						ctlErrorMsg.Value = "You have entered an incorrect Login ID or password.  Please check your information and try again.  If you can't log in, please contact the Granting ~~Organization~~ using the information at the bottom of this page.  You must register first to create a Login ID and Password."
					End If

				End If

					aUserLogin.SaveData()
					If aUserLogin("EncryptionKey") Is System.DBNull.Value Then
						aUserLogin.EncryptPropertyValue("Password", aUserLogin("Password"))
					End If
					aUserLogin.EncryptPropertyValue("MD5Password", aUserLogin("Password"))
					aUserLogin.Modified = True
					aUserLogin.SaveData()


				'aEGSession.DataObjectFactory.SaveDataObject(aUserLogin)

			Else
			ctlLoginID.Value = Nothing
				ctlErrorMsg.Value = "You have entered an incorrect Login ID or password.  Please check your information and try again.  If you can't log in, please contact the Granting ~~Organization~~ using the information at the bottom of this page.  You must register first to create a Login ID and Password."
			End If


			'Validate login information
			'aUser = aEGSession.LoginUserFromCredentials(ctlLoginID.Value.ToString, ctlPWord.Value.ToString)
			'If aUser Is Nothing And ctlLoginID.Value <> "" Then
			'	ctlLoginID.Value = Nothing
			'	ctlErrorMsg.Value = "You have entered an incorrect Login ID or password.  Please check your information and try again.  If you can't log in, please contact the Granting Organization using the information at the bottom of this page.  You must register first to create a Login ID and Password."
			'End If

	End Function
'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		ctlFAQ = CType(Me.FindControl("ctlFAQ"), cLink)
		If Not ctlFAQ Is Nothing Then
			Dim aNewWindowUrl As String = Request.Url.ToString
			aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "Page", "FAQPublicView")
			aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "PageFrame", "Print")
			ctlFAQ.Href = aNewWindowUrl
		End If

		Dim aDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("MaintenanceNotifications", "1")
		If Not aDO Is Nothing Then
			If aDO.GetPropertyBool("DisplayNotification") Then
				spnNotificationText.Visible = True
			Else
				spnNotificationText.Visible = False
			End If
			If aDO.GetPropertyBool("AllowLogin") Then
				spnLogin.Visible = True
				spnInfoText.Visible = False
			Else
				spnLogin.Visible = False
				spnInfoText.Visible = False
				spnNotificationText.Visible = True
			End If

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



	'Public Sub ViewFAQ(ByVal aPageKey As String)
	'	Dim aNewWindowUrl As String = Request.Url.ToString
	'	aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "Page", aPageKey)
	'	aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "PageFrame", "Print")
	'	ctlNewWindowOpener.NewWindowURL() = aNewWindowUrl
	'	ctlNewWindowOpener.Open()
	'End Sub
'=================================================


	End Class
End Namespace