Imports System.Xml
Imports System.Web.Mail
Imports System.Web.Mail.MailMessage
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Correspondence

Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cLoginRetrieveEmailer
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=================================================

    Public Sub RetrieveLostPassword(ByVal aUserID As String)
        Dim aEGUserDataObj As cDataObject
        Dim aEmailAddress As String = ""
        Dim aMessage As MailMessage
        Dim aMail As SmtpMail
        Dim aCorrespondenceDefinition As cDataObject
        Dim aCorrespondenceDefinitionList As cDataObjectList

        aCorrespondenceDefinitionList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("CorrespondenceDefinition","CorrespondenceKey","RetrieveLogin")
            Page.Validate()
            If Not Page.IsValid Then
                Exit Sub
            End If
            aEGUserDataObj = GetEGUserDataObj(aUserID)
           
            If aEGUserDataObj Is Nothing Or aUserID = "" Then
                EventController_NavigateToModulePageKey("LoginInfoNotSent")
                Exit Sub
            End If

            Dim aCorrespondenceJob As cCorrespondenceJob
            Try
                aCorrespondenceJob = New cCorrespondenceJob(aEGUserDataObj.GetPropertyInt("UserID", 0))
                aCorrespondenceDefinition = aCorrespondenceDefinitionList.Item(0)
                aEmailAddress = aEGUserDataObj.GetRelatedPropertyString("Person.PersonPrimaryEMail.ContactValue1")
                aCorrespondenceDefinition("CorrespondenceTo") = aEmailAddress
            Catch
                EventController_NavigateToModulePageKey("LoginInfoNotSent")
            End Try

            aCorrespondenceJob.CorrespondenceDefinition = aCorrespondenceDefinition

            Try
                aCorrespondenceJob.EmailArgs = New cEmailArgsDataObject(aEGUserDataObj.DataObjectList)
            Catch
                EventController_NavigateToModulePageKey("LoginInfoNotSent")
            End Try

            ''Send Email
            Try
                aCorrespondenceJob.SendEmail(WebSession.WebAppl)
            Catch
                EventController_NavigateToModulePageKey("LoginInfoNotSent")
            End Try
            EventController_NavigateToModulePageKey("LoginInfoSent")
        End Sub

        '-------------------------------------------------

        Public Function GetEGUserDataObj(ByVal aUserName As String) As cDataObject
            Dim aXMLDoc As cXMLDoc
            Dim aDataObjNode As XmlNode
            Dim aFiltersNode As XmlNode

            aXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("User", aDataObjNode, aFiltersNode)
            aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "UserName", aUserName))
            Return WebSession.DataObjectFactory.GetDataObject(aDataObjNode)
        End Function

        '=================================================

End Class

End Namespace
