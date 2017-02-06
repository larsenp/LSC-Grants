Imports System.Xml
Imports System.Web.Mail
Imports System.Web.Mail.MailMessage
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports Core.Web.User
Imports EasyGrants.Correspondence
Imports EasyGrants.Web.User
Imports EasyGrants.Web

Namespace Easygrants_Web.Controls.Base

Public MustInherit Class cSupportForm
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
    
'=================================================

	Protected tblSentMessage as HtmlTable
	Protected tblMessage as HtmlTable
	Protected tblCloseWindow as HtmlTable
	Protected spnCloseControl as HtmlGenericControl
    Protected tblSubmit As HtmlTable
    Protected ctlCompetition As cDropDown    
    Private mEmailArgs As IEmailArgs
	
'-------------------------------------------------	

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		 If (Request.QueryString("Sent") = "1") Then
			tblMessage.Visible = False
			tblSubmit.Visible = False
			tblSentMessage.Visible = True
			tblCloseWindow.Visible = True
		Else
			tblMessage.Visible = True
			tblSubmit.Visible = True
			tblSentMessage.Visible = False
			tblCloseWindow.Visible = False
		End If        

        MyBase.CoreCtl_Load(aSrc, aEvent)        
    End Sub

'-------------------------------------------------------------

    Public ReadOnly Property LoginID() As String
        Get
            LoginID = Request.QueryString("LoginID")
        End Get
    End Property
     
'-------------------------------------------------

	Public Sub SendEmail(aFrom as String, aSubject as String, aCompetition as String, aMessageBody as String, aWfProjectID as String, aType as String)
		'Dim aMessage As MailMessage
	 '   Dim aMail As SmtpMail
        Dim aMessageText As String
		Dim aWfProjectDataObject As cDataObject
		Dim Email as String
        Dim aCorrespondenceDefinition As cDataObject
		'Dim aXmlDoc As cXMLDoc
		'Dim aDataObjectNode As XmlNode
		'Dim aFiltersNode As XmlNode

        Page.Validate()
        If Not Page.IsValid Then
            Exit Sub
        End If

        If aType = "Content" Then
            aWfProjectDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProject", aWfProjectID)
            Email = aWfProjectDataObject.GetPropertyString("ContentEmailAddress")
        Else If aType = "Tech" Then
            aWfProjectDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProject", aWfProjectID)
			'Email = aWfProjectDataObject.GetPropertyString("TechEmailAddress")
			'The above column TechEmailAddress is not used so this has been replaced with SupportEmailAddress.
			 Email = aWfProjectDataObject.GetPropertyString("SupportEmailAddress")
        Else
            aWfProjectDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProject", aWfProjectID)
            Email = aWfProjectDataObject.GetPropertyString("SupportEmailAddress")
        End If

		Dim aUserID as Integer
		aUserID = 0

		If WebSession.Users.Count > 0 Then
			Dim aEntry As DictionaryEntry
			Dim aUser As cEGUser
			For Each aEntry In WebSession.Users
				aUser = aEntry.Value
				aUserID = aUser.UserID
				Exit For
			Next
		End If		

        aMessageText = ""
        aMessageText += "Browser: " & Request.UserAgent
        aMessageText += vbCrLf & vbCrLf & "IP Address: " & Request.UserHostAddress
		aMessageText += vbCrLf & vbCrLf & "Funding Opportunity: " & aCompetition
        aMessageText += vbCrLf & vbCrLf & "Message: " & aMessageBody

        aCorrespondenceDefinition = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("CorrespondenceDefinition",15)

        aCorrespondenceDefinition("CorrespondenceFrom") = aFrom
        aCorrespondenceDefinition("CorrespondenceTo") = Email
        aCorrespondenceDefinition("CorrespondenceCC") = ""
        aCorrespondenceDefinition("CorrespondenceBCC") = ""
        aCorrespondenceDefinition("Subject") = aSubject
        aCorrespondenceDefinition("Body") = aMessageText   

        Dim aCorrespondenceJob As cCorrespondenceJob
        aCorrespondenceJob = New cCorrespondenceJob(aUserID)

        aCorrespondenceJob.CorrespondenceDefinition = aCorrespondenceDefinition
        aCorrespondenceJob.EmailArgs = mEmailArgs

        Try
			aCorrespondenceJob.SendEmail(WebSession.WebAppl)
		Catch
            
		End Try

		Response.Redirect("pgSupportForm.aspx?pgSupportForm.aspx&Sent=1")

	End Sub	
	
'-------------------------------------------------
	
	Public Sub CloseWindow()
		'Response.Write("<script language='JavaScript'>")
		'Response.Write("window.open('','_self','');")
		'Response.Write("window.close();")
		'Response.Write("</script>")
		tblCloseWindow.Visible = True
		spnCloseControl.Visible = True
		tblSubmit.Visible = False

	End Sub

'-------------------------------------------------

    Protected Sub ctlCompetition_LoadRows()
		'Dim aParamList As String
		'Dim aCompList As cDataObjectList
		'Dim aCompObject As cDataObject
		'Dim aCompNode As XmlNode
		'Dim aXMLDoc As cXMLDoc
        Dim aCompDropDown As cDropDown

        aCompDropDown = FindControl("ctlCompetition")
        aCompDropDown.BaseControl.Items(0).Text = "Both"

    End Sub
'=================================================
End Class
End Namespace