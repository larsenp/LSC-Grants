Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports Core.Web

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder
Public MustInherit Class cWorkFlowBuilderEmailEditor_Content
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
    
    Protected ctlEmailTemplate As cDropDown
    Protected ctlRecepient As cDropDown
    Protected ctlNewWindowOpener As cNewWindowOpener
    Private aWfProjectTaskOutcomeEventsDO As cDataObject
    
    Public ReadOnly Property WfProjectTaskOutcomeID() As String
		Get
			If Not Request.QueryString("WfProjectTaskOutcomeID") Is Nothing Then Return Request.QueryString("WfProjectTaskOutcomeID")
			Return ""
		End Get
	End Property
	
	Public ReadOnly Property WfProjectTaskOutcomeEventsID() As String
		Get
			If Not Request.QueryString("WfProjectTaskOutcomeEventsID") Is Nothing Then Return Request.QueryString("WfProjectTaskOutcomeEventsID")
			Return ""
		End Get
	End Property
	
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Dim aEventCorrespondenceDO As cDataObject
		Dim aWfProjectTaskOutcomeEventsDO As cDataObject
		ctlEmailTemplate = FindControl("ctlEmailTemplate")
		ctlRecepient = FindControl("ctlRecepient")
		If WfProjectTaskOutcomeEventsID = "0" Or WfProjectTaskOutcomeEventsID = "" Then
		Else
			aWfProjectTaskOutcomeEventsDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTaskOutcomeEvents", WfProjectTaskOutcomeEventsID)
			ctlRecepient.SelectedField = aWfProjectTaskOutcomeEventsDO.GetPropertyString("EventRecipientID", "")
			aEventCorrespondenceDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("EventCorrespondence", "EventID", aWfProjectTaskOutcomeEventsDO("EventKeyID"))(0)
			ctlEmailTemplate.SelectedField = aEventCorrespondenceDO("TemplateID")
		End If
	End Sub

	Public Overrides Sub DataPresenter_SaveDataObjects()
			
		'Page.Validate()
  '      If Not Page.IsValid Then
  '          EventController_Save = False
  '          Exit Function
  '      End If
		
		Dim aEventDO As cDataObject
		Dim aEventCorrespondenceDO As cDataObject
		If WfProjectTaskOutcomeEventsID = "0" Or WfProjectTaskOutcomeEventsID = "" Then
			'Create new event, event correspondence and WfProjectTaskOutcomeEvents
			aEventDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Event")
			aEventDO("EventDescription") = ctlEmailTemplate.SelectedValue
			aEventDO.SaveData()
			aEventCorrespondenceDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("EventCorrespondence")
			aEventCorrespondenceDO("EventID") = Convert.ToInt32(aEventDO("EventID"))
			aEventCorrespondenceDO("TemplateID") = Convert.ToInt32(ctlEmailTemplate.SelectedValue)
			aEventCorrespondenceDO.SaveData()
			aWfProjectTaskOutcomeEventsDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfProjectTaskOutcomeEvents")
			aWfProjectTaskOutcomeEventsDO("WfProjectTaskOutcomeID") = Convert.ToInt32(WfProjectTaskOutcomeID)
			aWfProjectTaskOutcomeEventsDO("EventKeyID") = Convert.ToInt32(aEventDO("EventID"))
			aWfProjectTaskOutcomeEventsDO("EventRecipientID") = ctlRecepient.SelectedValue
			aWfProjectTaskOutcomeEventsDO.SaveData()
		Else
			'Edit existing
			aWfProjectTaskOutcomeEventsDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTaskOutcomeEvents", WfProjectTaskOutcomeEventsID)
			aWfProjectTaskOutcomeEventsDO("EventRecipientID") = ctlRecepient.SelectedValue
			aWfProjectTaskOutcomeEventsDO.SaveData()
			aEventCorrespondenceDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("EventCorrespondence", "EventID", aWfProjectTaskOutcomeEventsDO("EventKeyID"))(0)
			aEventCorrespondenceDO("TemplateID") = Convert.ToInt32(ctlEmailTemplate.SelectedValue)
			aEventCorrespondenceDO.SaveData()
		End If
		'Return True
		'Dim aPageUrl As String = Request.QueryString("ReturnURL")
		'aPageUrl = cWebLib.AddQuerystringParameter(aPageUrl, "WfProjectTaskOutcomeID", WfProjectTaskOutcomeID, Server)
		'Response.Redirect(aPageUrl)
	End Sub

	Public Sub ViewEmailTemplate(ByVal aPageKey As String, ByVal aCorrespondenceDefinitionID As String)
		Dim aNewWindowUrl As String = Request.Url.LocalPath
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "Config", Request.QueryString("Config"))
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "Page", aPageKey)
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, aCorrespondenceDefinitionID)
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "PageFrame=Print")
		ctlNewWindowOpener.NewWindowURL() = aNewWindowUrl
		ctlNewWindowOpener.Open()
	End Sub
	
	Public Sub SavePageAndReload()
		If EventController_Save() Then
			Dim aPageURL As String  = Request.Url.ToString
			If Not aWfProjectTaskOutcomeEventsDO Is Nothing Then
				aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "WfProjectTaskOutcomeEventsID", aWfProjectTaskOutcomeEventsDO.GetPropertyString("WfProjectTaskOutcomeEventsID"))
			End If
			Response.Redirect(aPageURL)
		End If
	End Sub
	
	Public Sub SavePageAndClose()
		If EventController_Save() Then
			ClosePage()
		End If
	End Sub
	
	Public Sub ClosePage()
		Dim aPageURL As String  = Request.Url.ToString
		Dim aThirdParty As String = ""
		aThirdParty = Request.QueryString("ThirdParty")
		If aThirdParty = "True" Then
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "Page", "ThirdPartyBuilderEditor")
		Else
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "Page", "WorkflowEditor")
		End If
		aPageURL = cWebLib.RemoveQuerystringParameter(aPageURL, "WfProjectTaskOutcomeEventsID")
		Response.Redirect(aPageURL)
	End Sub
	
End Class
End Namespace