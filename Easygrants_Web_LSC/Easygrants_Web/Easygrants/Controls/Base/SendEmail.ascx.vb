Imports System.Xml
Imports System.Web.Mail
Imports System.Web.Mail.MailMessage
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Correspondence
Imports EasyGrants.Web.User

Namespace Easygrants_Web.Controls.Base

Public MustInherit Class cSendEmail
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
    
'=================================================

	Protected tblSentMessage as HtmlTable
	Protected tblMessage as HtmlTable
	Protected tblCloseWindow as HtmlTable
	Protected spnCloseControl as HtmlGenericControl
    Protected tblSubmit As HtmlTable
    Protected ctlFrom As cEmailTextBox
    Protected ctlCC As cEmailTextBox
    Protected ctlBCC As cEmailTextBox
    Private mEmailArgs As IEmailArgs
	
'-------------------------------------------------------------

    Public ReadOnly Property EmailAddr() As String
        Get
            return Request.QueryString("Email")
        End Get
    End Property
     
'-------------------------------------------------------------

    Public ReadOnly Property LoginID() As String
        Get
            LoginID = Request.QueryString("LoginID")
        End Get
    End Property
     
'-------------------------------------------------	

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
        MyBase.CoreCtl_Load(aSrc, aEvent)
    End Sub
    
'-------------------------------------------------	

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		
		dim aUser as cEGUser = CType(Ctype(Page, cModulePage).ModuleUser, cEGUser)
	    dim aPerson as cDataObject = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Person", aUser.PersonID.ToString())
	    
        ctlFrom = CType(FindControl("ctlFrom"), cEmailTextBox)
        If ctlFrom.Value.Trim() = ""
			ctlFrom.Value = aPerson.GetRelatedPropertyString("PersonPrimaryEMail.ContactValue1")
		End If
	End Sub

'-------------------------------------------------

	Public Sub SendEmail(aSubject as String, aMessageBody as String, aWftaID as String)
	    Dim aMessage As MailMessage
        Dim aMail As SmtpMail
        Dim aMessageText As String
		Dim aWfProjectDataObject As cDataObject
		Dim Email as String
        Dim aCorrespondenceDefinition As cDataObject
        Dim aXmlDoc As cXMLDoc
        Dim aDataObjectNode As XmlNode
        Dim aFiltersNode As XmlNode

        Page.Validate()
        If Not Page.IsValid Then
            Exit Sub
        End If

		Dim aEGUser as cEGUser
		Dim aUserID as Integer
		
		aUserID = 0
		aEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		If Not aEGUser Is Nothing Then
			if aEGUser.UserID > 0
				aUserID = aEGUser.UserID
			Else
				if aEGUser.PersonID > 0
					aUserID = aEGUser.PersonID
				End If		
			End If
		End If

        'aMessageText = ""
        'aMessageText += "Browser: " & Request.UserAgent
        'aMessageText += vbCrLf & vbCrLf & "IP Address: " & Request.UserHostAddress
        'aMessageText += vbCrLf & vbCrLf & "Message: " & aMessageBody

        aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("CorrespondenceDefinition", aDataObjectNode, aFiltersNode)
        aCorrespondenceDefinition = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)

		dim aDataObj as cDataObject = me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", request.QueryString("WfTaskAssignmentID"))
		
        aCorrespondenceDefinition("CorrespondenceTo") = aDataObj.GetRelatedPropertyString("GranteeProject.PrimaryPerson.PersonPrimaryEMail.ContactValue1")
        ctlFrom = CType(FindControl("ctlFrom"), cEmailTextBox)
        ctlCC = CType(FindControl("ctlCC"), cEmailTextBox)
        ctlBCC = CType(FindControl("ctlBCC"), cEmailTextBox)
        aCorrespondenceDefinition("CorrespondenceFrom") = ctlFrom.Value
        aCorrespondenceDefinition("CorrespondenceCC") = ctlCC.Value
        aCorrespondenceDefinition("CorrespondenceBCC") = ctlBCC.Value
        aCorrespondenceDefinition("Subject") = aSubject
        aCorrespondenceDefinition("Body") = aMessageBody   
		aCorrespondenceDefinition("IsHtml") = false   
		aCorrespondenceDefinition("IsLog") = true   

        Dim aCorrespondenceJob As cCorrespondenceJob
        aCorrespondenceJob = New cCorrespondenceJob(aUserID)

        aCorrespondenceJob.CorrespondenceDefinition = aCorrespondenceDefinition
        aCorrespondenceJob.EmailArgs = mEmailArgs

        Try
			aCorrespondenceJob.SendEmail(WebSession.WebAppl)
			Dim aRAD As cDataObject
			aRAD = Me.DataObjectCollection("ReviewAdditionalInformation")(0)
			aRAD("IsSend") = True
			WebSession.DataObjectFactory.SaveDataObject(aRAD)
		Catch
            
		End Try
		
		Response.Redirect(request.QueryString("ReturnURL"))

	End Sub	
	
'-------------------------------------------------
	
	Public Sub CloseWindow()
		tblCloseWindow.Visible = True
		spnCloseControl.Visible = True
		tblSubmit.Visible = False
	End Sub	

'=================================================
End Class
End Namespace