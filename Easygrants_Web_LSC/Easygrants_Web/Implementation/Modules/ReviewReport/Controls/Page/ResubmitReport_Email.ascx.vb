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

Namespace Implementation.Modules.ReviewReport.Controls.Page
    Public MustInherit Class cResubmitReport_Email
        Inherits Core_Web.Controls.Base.cDataPresenterCtl

'===========================================================

	Private mCorrespondenceJob As cCorrespondenceJob

    Private ctlCC As cTextBox
    Private ctlBCC As cTextBox
    Private ctlSubject As cTextBox
    Private ctlText As cTextArea
    Private ctlTestAddr As cTextBox
    Private mEmailMessageDO As cDataObject
	
        Protected spnFrom As HtmlGenericControl
        Protected spnTo As HtmlGenericControl

'===========================================================

	Protected Property CorrespondenceJob As cCorrespondenceJob
		Get
			Return mCorrespondenceJob
		End Get
		Set
			mCorrespondenceJob = Value
		End Set
	End Property

'-----------------------------------------------------------

	Protected ReadOnly Property EmailMessageDO As cDataObject
		Get
			If mEmailMessageDO Is Nothing Then
				Dim aDataObjectList As cDataObjectList = DataObjectCollection("EmailMessage")
				If aDataObjectList.Count > 0 Then mEmailMessageDO = aDataObjectList(0)
			End If
			Return mEmailMessageDO
		End Get
	End Property

'===========================================================

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

   		Dim aUserID as Integer
		Dim aEGUser as cEGUser


        ctlCC = GetControl("ctlCC")
        ctlBCC = GetControl("ctlBCC")
        ctlSubject = GetControl("ctlSubject")
        ctlText = GetControl("ctlText")

		aEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		aUserID = aEGUser.UserID
		If CorrespondenceJob Is Nothing Then
			CorrespondenceJob = New cCorrespondenceJob(aUserID)
		End If
		If IsPostBack And EmailMessageDO.IsNewDataObject Then
			'Because the From address is not in a span, it is not preserved in the viewstate and must be retrieved based on the 
			'e-mail template being used.
			PopulateNewEmailMessage
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
        Dim aWfTaskAssignment As cDataObject
        Dim aCorrespondenceDefinition As cDataObject

        aWfTaskAssignment = CType(DataObjectCollection("WfTaskAssignment"), cDataObjectList)(0)
        aCorrespondenceDefinition = CType(DataObjectCollection("CorrespondenceDefinition"), cDataObjectList)(0)
        CorrespondenceJob.CorrespondenceDefinition = aCorrespondenceDefinition
        'following line of code needed so that EMAIL_LOG.recipient_person_id can be logged, kda 3/16/06
        'CorrespondenceJob.EmailArgs = New cEmailArgsDataObject(aWfTaskAssignment.DataObjectList)
        CorrespondenceJob.SetEmailParams(aWfTaskAssignment)
            spnFrom.InnerHtml = CorrespondenceJob.From
            spnTo.InnerHtml = CorrespondenceJob.To
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
		Page.Validate
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
	
'-----------------------------------------------------------

    Protected Overridable Sub Submit()
        Dim aSubmitPage As cSubmissionModulePage

        aSubmitPage = CType(Page, cSubmissionModulePage)
        aSubmitPage.PostSubmitModuleName = "Staff"
        aSubmitPage.PostSubmitModuleConfig = "ModuleConfig"
        aSubmitPage.Submit(False)
    End Sub

'===========================================================


    End Class
End Namespace
