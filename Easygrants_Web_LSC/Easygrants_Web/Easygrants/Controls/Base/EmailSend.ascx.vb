Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports EasyGrants.Web.User
Imports EasyGrants.Correspondence
Imports System.Xml

Namespace Easygrants_Web.Controls.Base

Public Class cEmailSend
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

#Region " Web Form Designer Generated Code "

	'This call is required by the Web Form Designer.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

	End Sub

	Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
		'CODEGEN: This method call is required by the Web Form Designer
		'Do not modify it using the code editor.
		InitializeComponent()
	End Sub

#End Region
    Private mCorrespondenceDefinitionID As String = ""
    Private mEmailArgs As IEmailArgs
    Protected spnDisplayName As HtmlGenericControl
    Protected spnDefinitionKey As HtmlGenericControl
    Protected spnCount As HtmlGenericControl
    Protected mCorrespondenceFrom As cTextBox
    Protected mCorrespondenceTo As cTextBox
    Protected mCorrespondenceCC As cTextBox
    Protected mCorrespondenceBCC As cTextBox
    Protected mEmailSubject As cTextBox
    Protected mBody As cTextArea
    Protected mIsHtml as cCheckBox
    Protected mTemplate As cDropDown
    Protected mIsLog as cCheckBox
	Protected trTo as HtmlTableRow
	Protected trToLabel as HtmlTableRow
    Protected spnToLabel As HtmlGenericControl
    Private mEmailArgsObjectBase As cEmailArgsDataObjectBase
    Protected tblSentMessage As HtmlTable
    Protected tblEmailRequiredMessage As HtmlTable
  
'=============================================================

    Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)
        
       if request.QueryString("CorrespondenceDefinitionID") is nothing then
			trTo.Visible = False
			trToLabel.Visible = True
		else
			trTo.Visible = True
			trToLabel.Visible = False
		end if

		Dim aReturnLink As cLink
		aReturnLink = CType(FindControl("lnkReturn"), cLink)
		mCorrespondenceFrom = FindControl("ctlCorrespondenceFrom")
		mCorrespondenceTo = FindControl("ctlCorrespondenceTo")
		mCorrespondenceCC = FindControl("ctlCorrespondenceCC")
		mCorrespondenceBCC = FindControl("ctlCorrespondenceBCC")
		mEmailSubject = FindControl("ctlEmailSubject")
		mBody = FindControl("ctlBody")
		mIsHtml = FindControl("ctlBodyFormat")
		mTemplate = FindControl("ctlTemplate")
		mIsLog = FindControl("ctlEmailLog")

		'b/c sending email clears EmailArgs, cannot use back button to this page
		mEmailArgs = CType(CType(WebSession.CurrentPage, cModulePage).ModuleUser, cEGStaffUser).EmailArgs

		If Not mEmailArgs Is Nothing Then
			spnDisplayName.InnerText = mEmailArgs.GetDisplayNameEmailList()
	        spnToLabel.InnerText = mEmailArgs.GetToEmailList()

            'mEmailArgsObjectBase.cEmailArgsDataObjectBase_EGConfig(aDataObjectList)

			aReturnLink.Caption = "Return to " & CType(WebSession.CurrentPage, cModulePage).ModulePage_GetTitle(Request.QueryString("ReturnPageKey"))

			spnDefinitionKey.InnerText = mEmailArgs.BaseDataObjList.DefinitionKey
			spnCount.InnerText = mEmailArgs.BaseDataObjList.Count

			'If template does not have To field populated, get e-mail address from the list
			'If mCorrespondenceTo.Value = "" Then
			'	mCorrespondenceTo.Value = mEmailArgs.GetToEmailList()
			'End If
			
			Dim aCorrespondenceDefinitionDO As cDataObject
			Dim aDefinitionKeyDO As cDataObject
			Dim ctlTemplate As cDropDown
			ctlTemplate = CType(FindControl("ctlTemplate"), cDropDown)
			
			Dim aLI As ListItem
			Dim aLIC As New ListItemCollection
			
			For Each aLI In ctlTemplate.Items
				aCorrespondenceDefinitionDO = Websession.DataObjectFactory.GetDataObjectFromPrimaryKey("CorrespondenceDefinition", aLI.Value)
                aDefinitionKeyDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("DefinitionKey", "Abbr", spnDefinitionKey.InnerText)(0)
				If Not aCorrespondenceDefinitionDO Is Nothing And Not aDefinitionKeyDO Is Nothing Then
                    If aCorrespondenceDefinitionDO.GetPropertyInt("DefinitionKeyID", 0) <> aDefinitionKeyDO.GetPropertyInt("DefinitionKeyID", 0) Then
                        aLIC.Add(aLI)
                    End If
                End If
			Next
			
			For Each aLI In aLIC
				ctlTemplate.Items.Remove(aLI)
			Next			
		End If

		tblSentMessage.Visible = False
		tblEmailRequiredMessage.Visible = False
    End Sub

'-------------------------------------------------------------

    Public Sub GetEmailTemplate(ByVal aCorrespondenceDefinitionID As String)
        Dim aNewURL As String

        mCorrespondenceDefinitionID = aCorrespondenceDefinitionID
        CorePage.Redirect("CorrespondenceDefinitionID", aCorrespondenceDefinitionID)
    End Sub

'-------------------------------------------------------------

   Public Function SetEmailTemplate() As cDataObject
        Dim aCorrespondenceDefinition As cDataObject
        Dim aXmlDoc As cXMLDoc
        Dim aDataObjectNode As XmlNode
        Dim aFiltersNode As XmlNode

        aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("CorrespondenceDefinition", aDataObjectNode, aFiltersNode)
        aCorrespondenceDefinition = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
		if mTemplate.SelectedValue <> "" then
			aCorrespondenceDefinition("CorrespondenceDefinitionID") = CType(mTemplate.SelectedValue, Integer)
		end if
        aCorrespondenceDefinition("CorrespondenceFrom") = mCorrespondenceFrom.Value
        
        'if request.QueryString("CorrespondenceDefinitionID") is nothing then
			'If Not mEmailArgs Is Nothing Then
				'aCorrespondenceDefinition("CorrespondenceTo") = mEmailArgs.GetSendEmailList()
			'end if
        'else
			aCorrespondenceDefinition("CorrespondenceTo") = mCorrespondenceTo.Value
		'end if
		
        aCorrespondenceDefinition("CorrespondenceCC") = mCorrespondenceCC.Value
        aCorrespondenceDefinition("CorrespondenceBCC") = mCorrespondenceBCC.Value
        aCorrespondenceDefinition("Subject") = mEmailSubject.Value
        aCorrespondenceDefinition("Body") = mBody.Value
        If mIsHtml.Value = True then
			aCorrespondenceDefinition("IsHtml") = true
		Else
			aCorrespondenceDefinition("IsHtml") = false
		End If		
        If mIsLog.Value = True Then
			aCorrespondenceDefinition("IsLog") = true
		Else
			aCorrespondenceDefinition("IsLog") = false
		End If

        SetEmailTemplate = aCorrespondenceDefinition
    End Function

'-------------------------------------------------------------

     Public Sub SendEmail()
   
        Page.Validate()
        If Not Page.IsValid Then
            Exit Sub
        End If

        Dim aCorrespondenceJob As cCorrespondenceJob
        Dim aReturnURL As String
        Dim aReturnPageKey As String
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
		
        aCorrespondenceJob = New cCorrespondenceJob(aUserID)

        aCorrespondenceJob.CorrespondenceDefinition = SetEmailTemplate()
        aCorrespondenceJob.EmailArgs = mEmailArgs

		Try
			aCorrespondenceJob.SendEmail(WebSession.WebAppl)
		Catch

		End Try

		aReturnURL = "ReturnURL=" & Request.QueryString("ReturnURL")
		aReturnPageKey = "ReturnPageKey=" & Request.QueryString("ReturnPageKey")

		Me.EventController_NavigateToModulePageKey("EmailSendConfirmation", aReturnURL, aReturnPageKey)

    End Sub
	 Public Sub SendTestEmail()

		Page.Validate()
		If Not Page.IsValid Then
			Exit Sub
		End If

		Dim ctlTestAddress As cEmailTextBox
		ctlTestAddress = FindControl("ctlTestAddress")
		Dim aTestAddress As String
		aTestAddress = ctlTestAddress.Value.Trim
		If aTestAddress = "" Then
			tblEmailRequiredMessage.Visible = True
			'Response.Write("<script language='JavaScript'>" + chr(13) + chr(10))
			'Response.Write("alert('Please provide test email address.');" + chr(13) + chr(10))
			'Response.Write("</script>")
			Exit Sub
		End If

		Dim aCorrespondenceJob As cCorrespondenceJob
		Dim aReturnURL As String
		Dim aReturnPageKey As String
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

		aCorrespondenceJob = New cCorrespondenceJob(aUserID)

		aCorrespondenceJob.CorrespondenceDefinition = SetEmailTemplate()
		aCorrespondenceJob.CorrespondenceDefinition("CorrespondenceTo") = aTestAddress
		aCorrespondenceJob.CorrespondenceDefinition("CorrespondenceCC") = ""
		aCorrespondenceJob.CorrespondenceDefinition("CorrespondenceBCC") = ""

		Try
			aCorrespondenceJob.SendEmail(WebSession.WebAppl)
			tblSentMessage.Visible = True
			'Response.Write("<script language='JavaScript'>" + chr(13) + chr(10))
			'Response.Write("alert('Test email was sent successfully.');" + chr(13) + chr(10))
			'Response.Write("</script>")
		Catch

		End Try
	End Sub

'=============================================================
End Class 'cEmailSend

End Namespace 'Easygrants_Web.Controls.Base
