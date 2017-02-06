Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports Core.Web

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder
Public MustInherit Class cThirdPartyEmailEditor
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
    
    Protected ctlEmailTemplate As cDropDown
    Protected ctlRecepient As cDropDown
    Protected ctlAction As cDropDown
    Protected ctlNewWindowOpener As cNewWindowOpener
    Private aWfProjectTaskOutcomeEventsDO As cDataObject
    
    Public ReadOnly Property WfProjectTaskID() As String
		Get
			If Not Request.QueryString("WfProjectTaskID") Is Nothing Then Return Request.QueryString("WfProjectTaskID")
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
		ctlAction = FindControl("ctlAction")
		If WfProjectTaskOutcomeEventsID = "0" Or WfProjectTaskOutcomeEventsID = "" Then
		Else
			aWfProjectTaskOutcomeEventsDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTaskOutcomeEvents", WfProjectTaskOutcomeEventsID)
			ctlRecepient.SelectedField = aWfProjectTaskOutcomeEventsDO.GetPropertyString("EventRecipientID", "")
			aEventCorrespondenceDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("EventCorrespondence", "EventID", aWfProjectTaskOutcomeEventsDO("EventKeyID"))(0)
			ctlEmailTemplate.SelectedField = aEventCorrespondenceDO("TemplateID")
		End If
	End Sub

	Public Overrides Sub DataPresenter_SaveDataObjects()

		Dim aEventDO As cDataObject
		Dim aEventCorrespondenceDO As cDataObject		
		Dim aWfProjectTaskOutcomeDO As cDataObject
		Dim aWfTaskOutcomeDO As cDataObject
		Dim aWfProjectTaskDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", Request.QueryString("WfProjectTaskID"))
		If WfProjectTaskOutcomeEventsID = "0" Or WfProjectTaskOutcomeEventsID = "" Then
			'Create new event, event correspondence and WfProjectTaskOutcomeEvents
			aEventDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("Event")
			aEventDO("EventDescription") = ctlEmailTemplate.SelectedText
			aEventDO.SaveData()
			aEventCorrespondenceDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("EventCorrespondence")
			aEventCorrespondenceDO("EventID") = aEventDO.GetPropertyInt("EventID")
			aEventCorrespondenceDO("TemplateID") = Convert.ToInt32(ctlEmailTemplate.SelectedValue)
			aEventCorrespondenceDO.SaveData()
			aWfTaskOutcomeDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskOutcome", "WfTaskID", aWfProjectTaskDO.GetPropertyString("WfTaskID"), "ThirdPartyActionID", ctlAction.SelectedValue)(0)
			If aWfTaskOutcomeDO Is Nothing Then
				aWfTaskOutcomeDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskOutcome")
				aWfTaskOutcomeDO("WfTaskID") = aWfProjectTaskDO.GetPropertyString("WfTaskID")
				aWfTaskOutcomeDO("WfTaskOutcome") = ctlAction.SelectedText
				aWfTaskOutcomeDO("WfTaskOutcome_Abbr") = ctlAction.SelectedText
				aWfTaskOutcomeDO("ThirdPartyActionID") = ctlAction.SelectedValue
				aWfTaskOutcomeDO.SaveData()
			End If
			aWfProjectTaskOutcomeDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskOutcome", "WfProjectTaskID", aWfProjectTaskDO.GetPropertyString("WfProjectTaskID"), "TaskOutcomeID", aWfTaskOutcomeDO.GetPropertyString("WfTaskOutcomeID"))(0)
			If aWfProjectTaskOutcomeDO Is Nothing Then
				aWfProjectTaskOutcomeDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfProjectTaskOutcome")
				aWfProjectTaskOutcomeDO("WfProjectTaskID") = aWfProjectTaskDO.GetPropertyString("WfProjectTaskID")
				aWfProjectTaskOutcomeDO("TaskOutcomeID") = aWfTaskOutcomeDO.GetPropertyString("WfTaskOutcomeID")
				aWfProjectTaskOutcomeDO.SaveData()
			End If
			aWfProjectTaskOutcomeEventsDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfProjectTaskOutcomeEvents")
			aWfProjectTaskOutcomeEventsDO("WfProjectTaskOutcomeID") = aWfProjectTaskOutcomeDO("WfProjectTaskOutcomeID")
			aWfProjectTaskOutcomeEventsDO("EventKeyID") = aEventDO.GetPropertyInt("EventID")
			aWfProjectTaskOutcomeEventsDO("EventRecipientID") = Convert.ToInt32(ctlRecepient.SelectedValue)
			aWfProjectTaskOutcomeEventsDO("ActionID") = Convert.ToInt32(ctlAction.SelectedValue)
			aWfProjectTaskOutcomeEventsDO.SaveData()
		Else
			'Edit existing
			aWfTaskOutcomeDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskOutcome", "WfTaskID", aWfProjectTaskDO.GetPropertyString("WfTaskID"), "ThirdPartyActionID", ctlAction.SelectedValue)(0)
			If aWfTaskOutcomeDO Is Nothing Then
				aWfTaskOutcomeDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskOutcome")
				aWfTaskOutcomeDO("WfTaskID") = aWfProjectTaskDO.GetPropertyString("WfTaskID")
				aWfTaskOutcomeDO("WfTaskOutcome") = ctlAction.SelectedText
				aWfTaskOutcomeDO("WfTaskOutcome_Abbr") = ctlAction.SelectedText
				aWfTaskOutcomeDO("ThirdPartyActionID") = ctlAction.SelectedValue
				aWfTaskOutcomeDO.SaveData()
			End If
			aWfProjectTaskOutcomeEventsDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTaskOutcomeEvents", WfProjectTaskOutcomeEventsID)
			aWfProjectTaskOutcomeEventsDO("EventRecipientID") = Convert.ToInt32(ctlRecepient.SelectedValue)
			aWfProjectTaskOutcomeEventsDO("ActionID") = Convert.ToInt32(ctlAction.SelectedValue)
			aWfProjectTaskOutcomeEventsDO.SaveData()
			aEventCorrespondenceDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("EventCorrespondence", "EventID", aWfProjectTaskOutcomeEventsDO("EventKeyID"))(0)
			aEventCorrespondenceDO("TemplateID") = Convert.ToInt32(ctlEmailTemplate.SelectedValue)
			aEventCorrespondenceDO.SaveData()
			aWfProjectTaskOutcomeDO = aWfProjectTaskOutcomeEventsDO.GetRelatedPropertyDataObject("WfProjectTaskOutcome")
			aWfProjectTaskOutcomeDO("TaskOutcomeID") = aWfTaskOutcomeDO.GetPropertyString("WfTaskOutcomeID")
			aWfProjectTaskOutcomeDO.SaveData()
		End If
		'Return True
		'Dim aPageUrl As String = Request.QueryString("ReturnURL")
		'aPageUrl = cWebLib.AddQuerystringParameter(aPageUrl, "WfProjectTaskOutcomeID", aWfProjectTaskOutcomeDO.GetPropertyString("WfProjectTaskOutcomeID"), Server)
		'aPageUrl = cWebLib.AddQuerystringParameter(aPageUrl, "WfProjectTaskOutcomeEventsID", aWfProjectTaskOutcomeEventsDO.GetPropertyString("WfProjectTaskOutcomeEventsID"), Server)
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
		If EventController_Save(True) Then
			Dim aPageURL As String  = Request.Url.ToString
			If Not aWfProjectTaskOutcomeEventsDO Is Nothing Then
				aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "WfProjectTaskOutcomeEventsID", aWfProjectTaskOutcomeEventsDO.GetPropertyString("WfProjectTaskOutcomeEventsID"))
			End If
			Response.Redirect(aPageURL)
		End If
	End Sub
End Class
End Namespace