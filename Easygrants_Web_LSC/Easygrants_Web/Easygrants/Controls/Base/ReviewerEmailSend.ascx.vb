Imports System.Xml
Imports System.Text
Imports Core.Web.Modules
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Web.User
Imports EasyGrants.Correspondence
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Controls.Base

Public Class cReviewerEmailSend
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
    'Protected spnDefinitionKey As HtmlGenericControl
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
	Protected tblSentMessage As HtmlTable
	Protected tblEmailRequiredMessage As HtmlTable
    
    Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)
        
        if request.QueryString("CorrespondenceDefinitionID") is nothing then
			trTo.Visible = False
			trToLabel.Visible = False
		else
			trTo.Visible = False
			trToLabel.Visible = False
		end if
		
		'Dim aReturnLink As cLink
		'aReturnLink = CType(FindControl("lnkReturn"), cLink)
		mCorrespondenceFrom = FindControl("ctlCorrespondenceFrom")
		mCorrespondenceTo = FindControl("ctlCorrespondenceTo")
		mCorrespondenceCC = FindControl("ctlCorrespondenceCC")
		mCorrespondenceBCC = FindControl("ctlCorrespondenceBCC")
		mEmailSubject = FindControl("ctlEmailSubject")
		mBody = FindControl("ctlBody")
		mIsHtml = FindControl("ctlBodyFormat")
		mTemplate = FindControl("ctlTemplate")
		mIsLog = FindControl("ctlEmailLog")

        Dim aList as cDataObjectList = GetCommitteeMemberList()
		spnDisplayName.InnerText = GetDisplayNameEmailList(aList)
		spnCount.InnerText = aList.Count

		'b/c sending email clears EmailArgs, cannot use back button to this page
		mEmailArgs = CType(CType(WebSession.CurrentPage, cModulePage).ModuleUser, cEGStaffUser).EmailArgs

		If Not mEmailArgs Is Nothing Then
			'spnDisplayName.InnerText = mEmailArgs.GetDisplayNameEmailList()
	        spnToLabel.InnerText = mEmailArgs.GetToEmailList()
	        
			'aReturnLink.Caption = "Return to " & CType(WebSession.CurrentPage, cModulePage).ModulePage_GetTitle(Request.QueryString("ReturnPageKey"))

			'spnDefinitionKey.InnerText = mEmailArgs.BaseDataObjList.DefinitionKey
			'spnCount.InnerText = mEmailArgs.BaseDataObjList.Count

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
				aDefinitionKeyDO = Websession.DataObjectFactory.GetDataObjectListWithFilter("DefinitionKey", "Abbr", mEmailArgs.BaseDataObjList.DefinitionKey)(0)
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

	Public Function GetDisplayNameEmailList(aDOList As cDataObjectList) As String
		Dim aDisplayStr As String = ""
		Dim aSeparator As String = ""
		Dim aCount As Integer = 0
		Dim aObjectCount As Integer = aDOList.Count
		Dim aDO As cDataObject
		
		For Each aDO In aDOList
			If (aCount + 1 < aObjectCount) And (aCount + 1 = 5) Then
				aSeparator = " ..."
				aDisplayStr = aDisplayStr + "; " + aDO.GetRelatedPropertyString("Person.LastNameFirstName") + _
					" - " + aDO.GetRelatedPropertyString("Person.PersonPrimaryEMail.ContactValue1") + aSeparator
				Exit For
			ElseIf (aCount >= 1) Then
				aSeparator = "; "
				aDisplayStr = aDisplayStr + aSeparator + aDO.GetRelatedPropertyString("Person.LastNameFirstName") + _
					" - " + aDO.GetRelatedPropertyString("Person.PersonPrimaryEMail.ContactValue1")
			Else
				aDisplayStr = aDisplayStr + aDO.GetRelatedPropertyString("Person.LastNameFirstName") + _
					" - " + aDO.GetRelatedPropertyString("Person.PersonPrimaryEMail.ContactValue1")
			End If
			aCount += 1
		Next
	
		Return aDisplayStr
	End Function

    Public Sub GetEmailTemplate(ByVal aCorrespondenceDefinitionID As String)
        mCorrespondenceDefinitionID = aCorrespondenceDefinitionID
        CorePage.Redirect("CorrespondenceDefinitionID", aCorrespondenceDefinitionID)
    End Sub

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
        
        if request.QueryString("CorrespondenceDefinitionID") is nothing then
			If Not mEmailArgs Is Nothing Then
				aCorrespondenceDefinition("CorrespondenceTo") = mEmailArgs.GetSendEmailList()
			end if
        else
			aCorrespondenceDefinition("CorrespondenceTo") = mCorrespondenceTo.Value
		end if
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

    Public Sub SendEmail()
   
        Page.Validate()
        If Not Page.IsValid Then
            Exit Sub
        End If

        Dim aCorrespondenceJob As cCorrespondenceJob
        Dim aReturnURL As String
        Dim aReturnPageKey As String
		Dim aNameList As StringBuilder = new StringBuilder()
		Dim aEGUser as cEGUser
		Dim aUserID as Integer
		Dim aCnt as Integer = 0
		dim aObj as cDataObject
		
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
        dim aList as cDataObjectList = GetCommitteeMemberList()
		aCorrespondenceJob.EmailArgs = new cEmailArgsDataObject(aList)
		mEmailArgs = aCorrespondenceJob.EmailArgs
		mEmailArgs.RcptPersonIDPropertyKey = "PersonID"
		Try
			aCorrespondenceJob.SendEmail(WebSession.WebAppl)
		Catch

		End Try
		
		WriteToLog()

		for each aObj in aList
			aNameList.Append(aObj.GetRelatedPropertyString("Person.LastNameFirstName") + " - " + aObj.GetRelatedPropertyString("Person.PersonPrimaryEMail.ContactValue1") + "; ")
			aCnt = aCnt + 1
			
			if aCnt > 5 then exit For
		next

		aReturnURL = "ReturnURL=" & Request.QueryString("ReturnURL")
		aReturnPageKey = "ReturnPageKey=" & Request.QueryString("ReturnPageKey")
		
		'Me.EventController_NavigateToModulePageKey("Committees", aReturnURL, aReturnPageKey)
		Dim aURL As StringBuilder = new StringBuilder()
		Dim aRedirectUrl As String
		aURL.Append(WebAppl.Get_ModuleRoot("Staff") + "/" + "Staff" + "/" + "ModuleContent.aspx"  + "?Config=" + "ModuleConfig" + "&Page=" + "ReviewerEmailSendConfirmation")
		aRedirectUrl = Core.Web.cWebLib.AddQuerystringParameter(aURL.ToString, aReturnURL, Server)
		aRedirectUrl = Core.Web.cWebLib.AddQuerystringParameter(aRedirectUrl, aReturnPageKey, Server)
		aRedirectUrl = Core.Web.cWebLib.AddQuerystringParameter(aRedirectUrl, "cnt=" + aList.Count.ToString(), Server)
		if aCnt > 5 then
			aRedirectUrl = Core.Web.cWebLib.AddQuerystringParameter(aRedirectUrl, "list=" + aNameList.Remove(aNameList.ToString().LastIndexOf(";"), 1).ToString() + "...", Server)
		else
			aRedirectUrl = Core.Web.cWebLib.AddQuerystringParameter(aRedirectUrl, "list=" + aNameList.Remove(aNameList.ToString().LastIndexOf(";"), 2).ToString() + ".", Server)
		end if
		Response.Redirect(aRedirectUrl)

    End Sub
    
    Public Sub SendEmailAndClose(ByVal ReturnURL As String)
		Page.Validate()
        If Not Page.IsValid Then
            Exit Sub
        End If
        SendEmail()
        EventController_NavigateToURL(ReturnURL)
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
			'Response.Write("<script language='JavaScript'>"+chr(13)+chr(10))
			'Response.Write("alert('Please provide test email address.');"+chr(13)+chr(10))
			'Response.Write("</script>")
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
        aCorrespondenceJob.CorrespondenceDefinition("CorrespondenceTo") = aTestAddress
        aCorrespondenceJob.CorrespondenceDefinition("CorrespondenceCC") = ""
        aCorrespondenceJob.CorrespondenceDefinition("CorrespondenceBCC") = ""
        
		Try
			aCorrespondenceJob.SendEmail(WebSession.WebAppl)
			tblSentMessage.Visible = True
			'Response.Write("<script language='JavaScript'>"+chr(13)+chr(10))
			'Response.Write("alert('Test email was sent successfully.');"+chr(13)+chr(10))
			'Response.Write("</script>")
		Catch

		End Try
    End Sub

    Public Function GetCommitteeMemberList() As cDataObjectList
		Dim aReviewCommitteeMemberDOList As cDataObjectList
		If (Not Request.QueryString("ReviewCommitteeID") Is Nothing) AndAlso (Request.QueryString("ReviewCommitteeID") <> "") Then
			aReviewCommitteeMemberDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCommitteeMember", _
				"ReviewCommitteeID", Request.QueryString("ReviewCommitteeID"))
		Else
			aReviewCommitteeMemberDOList = New cDataObjectList(WebSession.DataObjectFactory)
			'Dim st As String = Request.QueryString("ReviewCycleStageID")
			'st = Request.QueryString("ReviewCommitteeID")
			Dim aReviewCycleNotificationDOList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleNotification", _
				"ReviewCycleStageID", Request.QueryString("ReviewCycleStageID"))
			Dim aReviewCycleNotificationDO As cDataObject
			Dim aTempReviewCommitteeMemberDOList As cDataObjectList
			Dim aTempReviewCommitteeMemberDO As cDataObject
			For Each aReviewCycleNotificationDO In aReviewCycleNotificationDOList
				aTempReviewCommitteeMemberDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCommitteeMember", _
					"ReviewCommitteeID", aReviewCycleNotificationDO.GetPropertyInt("ReviewCommitteeID", 0))
				For Each aTempReviewCommitteeMemberDO In aTempReviewCommitteeMemberDOList
					If Not Contains(aReviewCommitteeMemberDOList, aTempReviewCommitteeMemberDO.GetPropertyInt("PersonID", 0)) Then
						aReviewCommitteeMemberDOList.Add(aTempReviewCommitteeMemberDO)
					End If
				Next				
			Next			
		End If
		Return aReviewCommitteeMemberDOList
	End Function

    Public Function Contains(aDOList As cDataObjectList, aPersonID As Integer) As Boolean
		Dim aDO As cDataObject
		For Each aDO In aDOList
			If aDO.GetPropertyInt("PersonID", 0) = aPersonID Then
				Return True
			End If			
		Next		
		Return False
	End Function    

    Public Sub WriteToLog()
		If (Request.QueryString("ReviewCycleStageID") Is Nothing) OrElse (Request.QueryString("ReviewCycleStageID") = "") Then
			Return
		End If

		Dim aObj As cDataObject
		Dim aLogObj As cDataObject
		Dim aCommitteeObj As cDataObject
		Dim aTempList As cDataObjectList
		
		Dim aList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleNotification", _
			"ReviewCycleStageID", Request.QueryString("ReviewCycleStageID"))
			
		If aList.Count > 0 Then
			aTempList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("CorrespondenceDefinition", _
				"CorrespondenceDefinitionID", mTemplate.SelectedValue)
			
			Dim aReviewCycleStageDOList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleStage", "ReviewCycleStageID", Request.QueryString("ReviewCycleStageID"))
			
			aLogObj = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("ReviewCycleNotificationLog")
			aLogObj("ReviewCycleID") = aReviewCycleStageDOList(0).GetPropertyInt("ReviewCycleID", 0)
			aLogObj("ReviewCycleStageID") = Request.QueryString("ReviewCycleStageID")
			aLogObj("SendDate") = System.DateTime.Now
			aLogObj("SenderID") = CType(CType(Page, cModulePage).ModuleUser, cEGUser).PersonID
			If mTemplate.SelectedValue <> "" Then
				aLogObj("TemplateID") = mTemplate.SelectedValue
			End If
			aLogObj.SaveData()
			
			For Each aObj In aList
				aCommitteeObj = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("NotificationLogCommittee")
				aCommitteeObj("NotificationLogID") = aLogObj.GetPropertyString("ReviewCycleNotificationLogID")
				aCommitteeObj("ReviewCommitteeID") = aObj.GetPropertyString("ReviewCommitteeID")
				aCommitteeObj.SaveData()
			Next
		End If		
    End Sub    

End Class
End Namespace
