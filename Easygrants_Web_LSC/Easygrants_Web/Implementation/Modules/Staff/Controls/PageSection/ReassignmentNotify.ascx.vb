Imports System.Xml
Imports Core.Web.Modules
Imports Core.Web.User
Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports EasyGrants.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Correspondence
Imports EasyGrants.Web

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
    Public MustInherit Class cReassignmentNotify
        Inherits Core_Web.Controls.Base.cDataPresenterCtl

        Private mCorrespondenceJob As cCorrespondenceJob

        Private ctlCC As cTextBox
        Private ctlBCC As cTextBox
        Private ctlSubject As cTextBox
        Private ctlText As cTextArea
        Private mEmailMessageDO As cDataObject
        Protected spnFrom As HtmlGenericControl
		Protected spnTo As HtmlGenericControl
		Dim aWfTaskAssignment As cDataObject

        Protected Property CorrespondenceJob() As cCorrespondenceJob
            Get
                Return mCorrespondenceJob
            End Get
            Set(ByVal Value As cCorrespondenceJob)
                mCorrespondenceJob = Value
            End Set

        End Property

        Protected ReadOnly Property EmailMessageDO() As cDataObject
            Get
                If mEmailMessageDO Is Nothing Then
                    Dim aDataObjectList As cDataObjectList = DataObjectCollection("EmailMessage")
                    If aDataObjectList.Count > 0 Then mEmailMessageDO = aDataObjectList(0)
                End If
                Return mEmailMessageDO
            End Get


        End Property

        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aEvent)

            Dim aUserID As Integer
            Dim aEGUser As cEGUser


            ctlCC = GetControl("ctlCC")
            ctlBCC = GetControl("ctlBCC")
            ctlSubject = GetControl("ctlSubject")
            ctlText = GetControl("ctlText")

			aWfTaskAssignment = CType(DataObjectCollection("WfTaskAssignment"), cDataObjectList)(0)
            aEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
            aUserID = aEGUser.UserID
            If CorrespondenceJob Is Nothing Then
				CorrespondenceJob = New cCorrespondenceJob(aUserID)
				CorrespondenceJob.EmailArgs = New cEmailArgsDataObject(aWfTaskAssignment)
				CorrespondenceJob.EmailArgs.RcptPersonIDPropertyKey = "PersonID"
            End If
            If IsPostBack And EmailMessageDO.IsNewDataObject Then
                'Because the From address is not in a span, it is not preserved in the viewstate and must be retrieved based on the 
                'e-mail template being used.
                PopulateNewEmailMessage()
            End If
        End Sub


        '-----------------------------------------------------------

        Public Overrides Sub CoreCtl_SetValues()
            MyBase.CoreCtl_SetValues()

            If EmailMessageDO.IsNewDataObject Then
                PopulateNewEmailMessage()
            End If
        End Sub

        '-----------------------------------------------------------


		Protected Sub PopulateNewEmailMessage()
			Dim aCorrespondenceDefinition As cDataObject
			Dim aWfta As cDataObject
			aWfTaskAssignment = CType(DataObjectCollection("WfTaskAssignment"), cDataObjectList)(0)
			'Dim aFromEmail As String = aWfTaskAssignment.GetRelatedPropertyString("Person.Email.ContactValue1")

			aCorrespondenceDefinition = CType(DataObjectCollection("CorrespondenceDefinition"), cDataObjectList)(0)
			CorrespondenceJob.CorrespondenceDefinition = aCorrespondenceDefinition
			aWfTaskAssignment("PersonID") = Request.QueryString("PersonID")
			CorrespondenceJob.SetEmailParams(aWfTaskAssignment)


			spnTo.InnerHtml = CorrespondenceJob.To
			aWfta = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "WfTaskAssignmentID", Request.QueryString("WfTaskAssignmentID"))(0)
			spnFrom.InnerHtml = aWfta.GetRelatedPropertyString("Person.Email.ContactValue1")
			'  spnFrom.InnerHtml = aFromEmail
			'When used on postback, this method serves only to populate the "From" address. The other values are preserved in the viewstate.
			If Not IsPostBack Then
				ctlCC.Value = CorrespondenceJob.Cc
				ctlBCC.Value = CorrespondenceJob.Bcc
				ctlSubject.Value = CorrespondenceJob.Subject
				ctlText.Value = CorrespondenceJob.BodyText
			End If
		End Sub

        '-----------------------------------------------------------

        Protected Overrides Sub DataPresenter_SetDataObjectValuesFromCtls(ByRef aDataObjectList As cDataObjectList, ByVal aDataObjectElement As XmlNode)
            MyBase.DataPresenter_SetDataObjectValuesFromCtls(aDataObjectList, aDataObjectElement)
            If cXMLDoc.AttributeToString(aDataObjectElement, "Key") = "EmailMessage" Then
                If EmailMessageDO.IsNewDataObject Then
                    EmailMessageDO("CorrespondenceFrom") = CorrespondenceJob.From
                    EmailMessageDO("CorrespondenceTo") = CorrespondenceJob.To
                End If
            End If
        End Sub

        '-----------------------------------------------------------

        Public Sub SendEmailAndSubmit()
            Page.Validate()
            If Not Page.IsValid Then Exit Sub

            If Not SendEmail() Then Exit Sub
            Submit()

        End Sub

        '-----------------------------------------------------------

		Protected Function SendEmail() As Boolean
			CorrespondenceJob.From = spnFrom.InnerHtml
			CorrespondenceJob.To = spnTo.InnerHtml
			CorrespondenceJob.Cc = ctlCC.Value
			CorrespondenceJob.Bcc = ctlBCC.Value
			CorrespondenceJob.Subject = ctlSubject.Value
			CorrespondenceJob.BodyText = ctlText.Value
			CorrespondenceJob.SetMailMessageParams(WebAppl)
			Return CorrespondenceJob.SendEmail(WebAppl, False)
		End Function

        Protected Overridable Sub Submit()
              CType(WebSession, cEGSession).RedirectToModule("Staff", "ModuleConfig", "Home")
		End Sub

		Public Sub Save()
			Page.Validate()
			If Not Page.IsValid Then Exit Sub
			Submit()
		End Sub

		Public Sub valFromEmail(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
			Dim aEmailDOL As cDataObjectList
			Dim aUserID As Integer
			Dim aEGUser As cEGUser
			aEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			aUserID = aEGUser.PersonID

			aEmailDOL = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Email", "EntityID", aUserID, "IsPrimary", "True", "EntityTypeID", "1")
			If aEmailDOL.Count > 0 Then
				aArgs.IsValid = True
			Else
				aArgs.IsValid = False
			End If
	   End Sub

	End Class
End Namespace

