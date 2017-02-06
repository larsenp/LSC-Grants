Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports EasyGrants.Correspondence

Namespace Implementation.Modules.Login.Controls.Page

	Public MustInherit Class cRegistration_Lsc
		'Inherits Core_Web.Controls.Base.cDataPresenterCtl
		Inherits Easygrants_Web.Modules.Login.Controls.Page.cRegistration

		Protected ctlUserName As cEmailTextBox
		Protected ctlConfirm As cPasswordTextBox

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			ctlUserName = CType(GetControl("ctlUserName"), cEmailTextBox)
			ctlConfirm = CType(GetControl("ctlConfirm"), cPasswordTextBox)
		End Sub

		Public Sub Register()
			'Send e-mail
			Dim aUserDO As cDataObject = CType(DataObjectCollection("User"), cDataObjectList)(0)
			Dim aPersonList As cDataObjectList = CType(DataObjectCollection("Person"), cDataObjectList)
			Dim aTemplateDO As cDataObject = CType(DataObjectCollection("CorrespondenceDefinition"), cDataObjectList)(0)
			Dim aUserID As Integer = aUserDO.GetPropertyInt("UserID")
			Dim aMail As cCorrespondenceJob = New cCorrespondenceJob(aUserID)
			aMail.EmailArgs = New cEmailArgsDataObject(aPersonList)
			aMail.CorrespondenceDefinition = aTemplateDO
			aMail.SendEmail(Me.WebAppl)

			CType(WebSession, cEGSession).LoginUserFromCredentials(ctlUserName.Value, ctlConfirm.Value)
		End Sub
	End Class
End Namespace