Imports System.Web.UI.HtmlControls
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Correspondence
Imports EasyGrants.Web.User

Namespace Implementation.Controls.PageSection
	Public Class cSendUnsubmitRequest
		Inherits Core_Web.Controls.Base.cDataPresenterCtl

		Protected spnLegacyOrganizationID As HtmlGenericControl
		Protected spnOrganizationName As HtmlGenericControl
		Protected spnYear As HtmlGenericControl
		Protected spnServiceArea As HtmlGenericControl
		Protected spnTask As HtmlGenericControl
		Protected txtAdditionalComments As cTextArea

		'Public Sub SendUnsubmissionRequest()
		'	Dim aCorrespondenceJob As cCorrespondenceJob
		'	Dim aCorrespondenceDefinition As cDataObject
		'	Dim aXmlDoc As cXMLDoc
		'	Dim aDataObjectNode As XmlNode
		'	Dim aFiltersNode As XmlNode
		'	Dim aUserID As Integer
		'	Dim aEGUser As cEGUser
		'	Dim aBody As String
		'	Dim aWfTA As cDataObject

		'	txtAdditionalComments = Me.GetControl("txtAdditionalComments")
		'	aUserID = 0
		'	aEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		'	If Not aEGUser Is Nothing Then
		'		If aEGUser.UserID > 0 Then
		'			aUserID = aEGUser.UserID
		'		Else
		'			If aEGUser.PersonID > 0 Then
		'				aUserID = aEGUser.PersonID
		'			End If
		'		End If
		'	End If

		'	aWfTA = DataObjectCollection("WfTaskAssignment")(0)

		'	aCorrespondenceJob = New cCorrespondenceJob(aUserID)
		'	aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("CorrespondenceDefinition", aDataObjectNode, aFiltersNode)
		'	aCorrespondenceDefinition = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
		'	aCorrespondenceDefinition("CorrespondenceFrom") = aWfTA.GetRelatedPropertyString("Person.User.UserName")
		'	aCorrespondenceDefinition("CorrespondenceTo") = aWfTA.GetRelatedPropertyString("GranteeProject.WfProject.ContentEmailAddress")
		'	If aCorrespondenceDefinition("CorrespondenceTo") Is Nothing Then
		'		aCorrespondenceDefinition("CorrespondenceTo") = "techsupport@lsc.gov"
		'	End If
		'	aCorrespondenceDefinition("CorrespondenceCC") = "techsupport@lsc.gov"
		'	aCorrespondenceDefinition("Subject") = "Request for Unsubmission - " + aWfTA.GetRelatedPropertyString("GranteeProject.PrimaryOrganization.LegacyOrganizationID") + _
		'			", " + aWfTA.GetRelatedPropertyString("WfTask.WfTask") + ", " + aWfTA.GetRelatedPropertyString("GranteeProject.WfProject.WfCompetition.CompetitionName")
		'	aBody = BuildEmailBody()
		'	aCorrespondenceDefinition("Body") = aBody
		'	aCorrespondenceDefinition("IsHtml") = False
		'	aCorrespondenceDefinition("IsLog") = True
		'	aCorrespondenceJob.CorrespondenceDefinition = aCorrespondenceDefinition
		'	aCorrespondenceJob.SendEmail(WebSession.WebAppl)
		'End Sub

		'Public Function BuildEmailBody() As String
		'	Dim aBody As String
		'	aBody = "Unsubmission has been requested for the following item:" + vbCrLf + vbCrLf
		'	aBody = "Recipient ID: " + spnLegacyOrganizationID.InnerText + vbCrLf
		'	aBody += "Applicant: " + spnOrganizationName.InnerText + vbCrLf
		'	aBody += "Competition Year: " + spnYear.InnerText + vbCrLf
		'	aBody += "Service Area: " + spnServiceArea.InnerText + vbCrLf
		'	aBody += "Submission: " + spnTask.InnerText + vbCrLf + vbCrLf
		'	If txtAdditionalComments.Value <> "" Then
		'		aBody += "Additional comments provided by user:" + vbCrLf + txtAdditionalComments.Value
		'	End If
		'	Return aBody
		'End Function

		Public Sub SendUnsubmissionRequestWithTemplate()

			Dim aUserID As Integer
			Dim aEGUser As cEGUser
			Dim aWfTAList As cDataObjectList
			Dim aCorrespondenceJob As cCorrespondenceJob
			Dim aCorrespondenceDefinition As cDataObject

			txtAdditionalComments = Me.GetControl("txtAdditionalComments")
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

			aWfTAList = DataObjectCollection("WfTaskAssignment")
			aCorrespondenceJob = New cCorrespondenceJob(aUserID)
			aCorrespondenceJob.EmailArgs = New cEmailArgsDataObject(aWfTAList)
			aCorrespondenceDefinition = DataObjectCollection("CorrespondenceDefinition")(0)
			If txtAdditionalComments.Value <> "" Then
				aCorrespondenceDefinition("Body") += "Additional comments provided by user:" + vbCrLf + txtAdditionalComments.Value
			End If
			aCorrespondenceJob.CorrespondenceDefinition = aCorrespondenceDefinition
			aCorrespondenceJob.SendEmail(Me.WebAppl)

		End Sub
	End Class
End Namespace
