Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.Web.Modules
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports Core.Web
Imports EasyGrants.Correspondence

Namespace Easygrants_Web.Controls.PageSection
Public Class cCrspndncEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'============================================================= 

        Protected spnBody As HtmlGenericControl
        Protected spnRecentResend As HtmlContainerControl
    
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			Dim aObj As cDataObject = Me.DataObjectCollection("EmailLog")(0)
			If ((aObj Is Nothing) = False) Then
				If (aObj.GetPropertyBool("IsHtml") = True) Then
					spnBody.InnerHtml = aObj.GetPropertyString("Body")
				Else
					spnBody.InnerHtml = aObj.GetPropertyString("Body").Replace(Chr(10), "<br>")
				End If

				Dim aResendDate As String = aObj.GetPropertyString("ResentDate")
				If aResendDate = "" Then
					spnRecentResend.InnerHtml = "N/A"
				Else
					spnRecentResend.InnerHtml = aObj.GetRelatedPropertyFormattedString("ResentDate", "M/d/yyyy")
				End If
			End If
	End Sub

'=============================================================

	Public Sub Resend()
		Dim aObj As cDataObject = Me.DataObjectCollection("EmailLog")(0)
		Dim aEGUser As cEGUser
		Dim aUserID As Integer

		aUserID = 0
		aEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		If Not aEGUser Is Nothing Then
			If aEGUser.UserID > 0 Then
				aUserID = aEGUser.UserID
			Else
				If aEGUser.PersonID > 0 Then
					aUserID = aEGUser.PersonID
				End If
			End If
		End If

		Dim aCorrespondenceJob As cCorrespondenceJob = New cCorrespondenceJob(aUserID)
		aCorrespondenceJob.To = aObj.GetPropertyString("CorrespondenceTo")
		aCorrespondenceJob.From = aObj.GetPropertyString("CorrespondenceFrom")
		aCorrespondenceJob.Cc = aObj.GetPropertyString("CorrespondenceCC")
		aCorrespondenceJob.Bcc = aObj.GetPropertyString("CorrespondenceBCC")
		aCorrespondenceJob.Subject = aObj.GetPropertyString("Subject")
		aCorrespondenceJob.BodyText = aObj.GetPropertyString("Body")
		aCorrespondenceJob.IsHtml = aObj.GetPropertyString("IsHtml")
		aCorrespondenceJob.SendEmail(WebSession.WebAppl, False)

		aObj("ResentDate") = System.DateTime.Now()
		WebSession.DataObjectFactory.SaveDataObject(aObj)

		'EventController_NavigateToModulePageKey("ContactCrspndnc", "PersonID=" + aObj.GetPropertyString("RecipientPersonID"))

	End Sub

'=============================================================
End Class 'cAddressEditor
End Namespace