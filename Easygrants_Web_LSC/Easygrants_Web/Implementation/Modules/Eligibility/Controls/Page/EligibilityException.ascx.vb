Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports System.Web.Mail
Imports System.Web.Mail.MailMessage
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Correspondence
Imports EasyGrants.Web.User
Imports EasyGrants.DataAccess
Imports EasyGrants.Workflow

Namespace Easygrants_Web.Implementation.Modules.Eligibility.Controls.Page
    Public MustInherit Class cEligibilityException
        Inherits Core_Web.Controls.Base.cDataPresenterCtl

        Protected spnFrom As HtmlGenericControl
		Protected spnTo As HtmlGenericControl
		Protected tblConfirm As HtmlTable
		Protected tblSenMail As HtmlTable
		Protected btnSave As cCSSButton

		Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
			MyBase.CoreCtl_Load(sender, e)
			btnSave = FindControl("btnSave")
			tblSenMail.Visible = True
			tblConfirm.Visible = False
		End Sub

		Public Sub SendEmail(ByVal aSubject As String, ByVal aMessageBody As String)
			Dim aMessage As MailMessage
			Dim aMail As SmtpMail
			Dim aCorrespondenceDefinitionList As cDataObjectList
			Dim aCorrespondenceDefinition As cDataObject
			Dim aEGUser As cEGUser
			Dim aUserID As Integer
			Dim aEGUserDataObj As cDataObject


			Page.Validate()
			If Not Page.IsValid Then
				Exit Sub
			End If
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

			aEGUserDataObj = GetEGUserDataObj(aUserID)
			aCorrespondenceDefinitionList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("CorrespondenceDefinition", "CorrespondenceKey", "EligibilityException")

			Dim aCorrespondenceJob As cCorrespondenceJob
			Try
				aCorrespondenceJob = New cCorrespondenceJob(aUserID)
				aCorrespondenceDefinition = aCorrespondenceDefinitionList.Item(0)
				aCorrespondenceDefinition("CorrespondenceFrom") = spnFrom.InnerText
				aCorrespondenceDefinition("CorrespondenceTo") = spnTo.InnerText
				aCorrespondenceDefinition("Subject") = aSubject
				aCorrespondenceDefinition("Body") = aMessageBody
			Catch
				EventController_NavigateToModulePageKey("EligibilityException")
			End Try

			aCorrespondenceJob.CorrespondenceDefinition = aCorrespondenceDefinition

			Try
				aCorrespondenceJob.EmailArgs = New cEmailArgsDataObject(aEGUserDataObj.DataObjectList)
			Catch
				EventController_NavigateToModulePageKey("EligibilityException")
			End Try

			''Send Email
			Try
				aCorrespondenceJob.SendEmail(WebSession.WebAppl)
			Catch
				EventController_NavigateToModulePageKey("EligibilityException")
			End Try
			tblSenMail.Visible = False
			tblConfirm.Visible = True
			btnSave.Visible = False
			'EventController_NavigateToModulePageKey("EligibilityException")
		End Sub

		Public Function GetEGUserDataObj(ByVal aUserID As Integer) As cDataObject
			Dim aXMLDoc As cXMLDoc
			Dim aDataObjNode As XmlNode
			Dim aFiltersNode As XmlNode

			aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("User", aDataObjNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "UserID", aUserID))
			Return WebSession.DataObjectFactory.GetDataObject(aDataObjNode)
		End Function

	End Class
End Namespace
