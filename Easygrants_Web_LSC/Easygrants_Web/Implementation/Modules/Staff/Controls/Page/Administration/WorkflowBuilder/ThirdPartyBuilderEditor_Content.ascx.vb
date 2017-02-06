Imports Core_Web.Controls.Base
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports Core.Web

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder

Public MustInherit Class cThirdPartyBuilderEditor_Content
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
    
    Protected ctlNextTask As cDropDown
	Protected ctlNextTaskStatus As cLabel
	Protected ctlNextTaskAssignTo As cLabel
	Protected ctlParentTask As cDropDown
	Protected ctlStartDate As cLabel
	Protected ctlOpenDate As cLabel
	Protected ctlDueDate As cLabel
	Protected ctlCloseDate As cLabel
	Protected ctlEndDate As cLabel
	Protected ctlNextTaskDefOutcome As cLabel
	Protected ctlNextTaskSubmittedOutcome As cLabel
	Private aWfTaskID As String
	Private aWfProjectTaskDO As cDataObject = Nothing
	
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		ctlParentTask = CType(FindControl("ctlParentTask"), cDropDown)
		ctlNextTask = CType(FindControl("ctlNextTask"), cDropDown)
		ctlNextTaskStatus = CType(FindControl("ctlNextTaskStatus"), cLabel)
		ctlNextTaskAssignTo = CType(FindControl("ctlNextTaskAssignTo"), cLabel)
		ctlStartDate = CType(FindControl("ctlStartDate"), cLabel)
		ctlOpenDate = CType(FindControl("ctlOpenDate"), cLabel)
		ctlDueDate = CType(FindControl("ctlDueDate"), cLabel)
		ctlCloseDate = CType(FindControl("ctlCloseDate"), cLabel)
		ctlEndDate = CType(FindControl("ctlEndDate"), cLabel)
		ctlNextTaskDefOutcome = CType(FindControl("ctlNextTaskDefOutcome"), cLabel)
		ctlNextTaskSubmittedOutcome = CType(FindControl("ctlNextTaskSubmittedOutcome"), cLabel)
		
		ctlNextTask.Attributes.Add("PostBack", "True")
		ctlNextTask.Set_ServerIndexChange(AddressOf ctlNextTask_IndexChange)
		'ctlParentTask.Set_ServerIndexChange(AddressOf ctlParentTask_IndexChange)
		If Not Page.IsPostBack Then
			'ctlNextTaskDefOutcome.Items.Clear()
			'ctlNextTaskDefOutcome.Items.Add(new ListItem("<Select>", ""))
			'ctlNextTaskSubmittedOutcome.Items.Clear()
			'ctlNextTaskSubmittedOutcome.Items.Add(new ListItem("<Select>", ""))
		End If
	End Sub
	
	Public ReadOnly Property WfTaskID() As String
	Get
        Return aWfTaskID
	End Get
	End Property
	
	Private Sub ctlNextTask_IndexChange(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Dim aNextWfPTaskDO As cDataObject
		If Not ctlNextTask.SelectedValue = "" AndAlso Not ctlNextTask.SelectedValue = "-1" Then
			aNextWfPTaskDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", ctlNextTask.SelectedValue)
			If Not aNextWfPTaskDO Is Nothing Then
				PrepopulateNextTaskInfo(aNextWfPTaskDO)
			End If
		Else
			ResetNextTaskinfo()
		End If
		
	End Sub
	
	Private Sub PrepopulateNextTaskInfo(ByVal aNextWfPTaskDO As cDataObject)

		'ctlNextTask.SelectedField = aNextWfPTaskDO("WfTaskID")
		ctlNextTaskDefOutcome.Value = aNextWfPTaskDO.GetRelatedPropertyString("DefaultOutcome.WfTaskOutcome")
		ctlNextTaskStatus.Value = aNextWfPTaskDO.GetRelatedPropertyString("DefaultStatus.WfTaskStatus")
		ctlNextTaskSubmittedOutcome.Value = aNextWfPTaskDO.GetRelatedPropertyString("SubmittedOutcome.WfTaskOutcome")
		ctlNextTaskAssignTo.Value = aNextWfPTaskDO.GetRelatedPropertyString("AssignToRoleWorkgroupStaffcontact.Description")
		ctlStartDate.Value = aNextWfPTaskDO.GetRelatedPropertyFormattedString("StartDate", "MM/dd/yyyy")
		ctlOpenDate.Value = aNextWfPTaskDO.GetRelatedPropertyFormattedString("OpenDate", "MM/dd/yyyy")
		ctlDueDate.Value = aNextWfPTaskDO.GetRelatedPropertyFormattedString("DueDate", "MM/dd/yyyy")
		ctlCloseDate.Value = aNextWfPTaskDO.GetRelatedPropertyFormattedString("CloseDate", "MM/dd/yyyy")
		ctlEndDate.Value = aNextWfPTaskDO.GetRelatedPropertyFormattedString("EndDate", "MM/dd/yyyy")

	End Sub
	
	Private Sub ResetNextTaskinfo()
		If Not ctlNextTask Is Nothing Then
			ctlNextTaskDefOutcome.Value = ""
			ctlNextTaskStatus.Value = ""
			ctlNextTaskSubmittedOutcome.Value = ""
			ctlNextTaskAssignTo.Value = ""
			ctlStartDate.Value = ""
			ctlOpenDate.Value = ""
			ctlDueDate.Value = ""
			ctlCloseDate.Value = ""
			ctlEndDate.Value = ""
		End If
	End Sub
	
	'Public Overrides Function DataPresenter_Save_And_NavigateToModulePageKey(ByVal aPageKey As String, ByVal WfProjectTaskOutcomeEventsID As String)
	'	If EventController_Save(True) Then
	'		aWfProjectTaskDO = CType(DataObjectCollection("WfProjectTask"), cDataObjectList)(0)
	'		Dim aWfProjectTaskOutcomeDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskOutcome", "WfProjectTaskID", aWfProjectTaskDO.GetPropertyString("WfProjectTaskID"), "TaskOutcomeID", aWfProjectTaskDO .GetPropertyString("SubmittedOutcomeID"))(0)
	'		If aWfProjectTaskOutcomeDO Is Nothing Then
	'			aWfProjectTaskOutcomeDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfProjectTaskOutcome")
	'		End If
	'		aWfProjectTaskOutcomeDO("WfProjectTaskID") = aWfProjectTaskDO("WfProjectTaskID")
	'		aWfProjectTaskOutcomeDO("TaskOutcomeID") = aWfProjectTaskDO("SubmittedOutcomeID")
	'		aWfProjectTaskOutcomeDO.SaveData()
	'		Dim aPageURL As String  = Request.Url.ToString
	'		aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "Page", aPageKey)
	'		aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "WfProjectTaskOutcomeID", aWfProjectTaskOutcomeDO.GetPropertyString("WfProjectTaskOutcomeID"))
	'		aPageURL = cWebLib.AddQuerystringParameter(aPageURL, WfProjectTaskOutcomeEventsID)
	'		'aPageURL = cWebLib.AddQuerystringParameter(aPageURL, WfProjectTaskID)
	'		Response.Redirect(aPageURL)
	'		'EventController_NavigateToModulePageKey(aPageKey, aQuery1, "WfProjectTaskOutcomeID=" + aWfProjectTaskOutcomeDO.GetPropertyString("WfProjectTaskOutcomeID"), aQuery2)
	'	End If
	'End Function
	
	Public Overrides Sub DataPresenter_SaveDataObjects()
		If Not ctlNextTask.SelectedValue = "" OrElse Not ctlNextTask.SelectedValue = "-1" Then
			aWfProjectTaskDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", ctlNextTask.SelectedValue)
			If Not ctlParentTask.SelectedValue = "" OrElse Not ctlParentTask.SelectedValue = "-1" Then
				aWfProjectTaskDO("ParentProjectTaskID") = Convert.ToInt32(ctlParentTask.SelectedValue)
				aWfProjectTaskDO.SaveData()
			End If
		End If
	End Sub
	
	Public Sub SavePageAndReload()
		If EventController_Save(True) Then
			Dim aPageURL As String  = Request.Url.ToString
			If Not aWfProjectTaskDO Is Nothing Then
				aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "WfProjectTaskID", aWfProjectTaskDO.GetPropertyString("WfProjectTaskID"))
			End If
			Response.Redirect(aPageURL)
		End If
	End Sub
	
        Public Sub SavePageAndClose(ByVal PageKey As String, ByVal QueryString1 As String, ByVal QueryString2 As String, ByVal QueryString3 As String, ByVal QueryString4 As String, ByVal QueryString5 As String)
            If EventController_Save(True) Then
                EventController_NavigateToModulePageKey(PageKey, QueryString1, QueryString2, QueryString3, QueryString4, QueryString5)
            End If
        End Sub
	
	Public Sub SavePageAndRedirect(ByVal PageKey As String, ByVal WfProjectTaskOutcomeEventsID As String, ByVal WfProjectTaskOutcomeID As String, ByVal WfProjectTaskID As String)
		If EventController_Save(True) Then
			Dim aPageURL As String  = Request.Url.ToString
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "Page", PageKey)
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, WfProjectTaskOutcomeEventsID)
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, WfProjectTaskOutcomeID)
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, WfProjectTaskID)
			Response.Redirect(aPageURL)
		End If
	End Sub
	
	Public Sub SavePageAndRedirect(ByVal PageKey As String, ByVal WfProjectTaskOutcomeEventsID As String, ByVal ThirdParty As String)
		If EventController_Save(True) Then
			Dim aPageURL As String  = Request.Url.ToString
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "Page", PageKey)
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, WfProjectTaskOutcomeEventsID)
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, ThirdParty)
			Response.Redirect(aPageURL)
		End If
	End Sub
	
	Public Function SaveForThirdPartyNotification() As cDataObject
		Dim aWfProjectTaskOutcomeDO As cDataObject
		If EventController_Save(True) Then
			If Not aWfProjectTaskDO IS Nothing Then
				aWfProjectTaskOutcomeDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskOutcome", "WfProjectTaskID", aWfProjectTaskDO.GetPropertyString("WfProjectTaskID"), "TaskOutcomeID", aWfProjectTaskDO .GetPropertyString("DefaultOutcomeID"))(0)
				If aWfProjectTaskOutcomeDO Is Nothing Then
					aWfProjectTaskOutcomeDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfProjectTaskOutcome")
				End If
				aWfProjectTaskOutcomeDO("WfProjectTaskID") = aWfProjectTaskDO("WfProjectTaskID")
				aWfProjectTaskOutcomeDO("TaskOutcomeID") = aWfProjectTaskDO("DefaultOutcomeID")
				aWfProjectTaskOutcomeDO.SaveData()
			End If
		Else
			Exit Function
		End If
		return aWfProjectTaskOutcomeDO
	End Function
	
	Public Function SaveForSubmissionCommunication() As cDataObject
		Dim aWfProjectTaskOutcomeDO As cDataObject
		If EventController_Save(True) Then
			If Not aWfProjectTaskDO IS Nothing Then
				aWfProjectTaskOutcomeDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskOutcome", "WfProjectTaskID", aWfProjectTaskDO.GetPropertyString("WfProjectTaskID"), "TaskOutcomeID", aWfProjectTaskDO .GetPropertyString("SubmittedOutcomeID"))(0)
				If aWfProjectTaskOutcomeDO Is Nothing Then
					aWfProjectTaskOutcomeDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfProjectTaskOutcome")
				End If
				aWfProjectTaskOutcomeDO("WfProjectTaskID") = aWfProjectTaskDO("WfProjectTaskID")
				aWfProjectTaskOutcomeDO("TaskOutcomeID") = aWfProjectTaskDO("SubmittedOutcomeID")
				aWfProjectTaskOutcomeDO.SaveData()
			End If
		Else
			Exit Function
		End If
		return aWfProjectTaskOutcomeDO
	End Function
	
	Public Sub RedirectToThirdPartyNotification(ByVal PageKey As String, ByVal WfProjectTaskOutcomeEventsID As String, ByVal WfProjectTaskID As String)
		Dim aPageURL As String  = Request.Url.ToString
		Dim aWfProjectTaskOutcomeDO As cDataObject = SaveForThirdPartyNotification()
		aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "Page", PageKey)
		If aWfProjectTaskOutcomeDO Is Nothing Then
			Exit Sub
		Else
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "WfProjectTaskOutcomeID", aWfProjectTaskOutcomeDO.GetPropertyString("WfProjectTaskOutcomeID"))
		End If
		aPageURL = cWebLib.AddQuerystringParameter(aPageURL, WfProjectTaskOutcomeEventsID)
		aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "WfProjectTaskID", aWfProjectTaskDO.GetPropertyString("WfProjectTaskID"))
		Response.Redirect(aPageURL)
	End Sub
	
	Public Sub RedirectToThirdPartyNotification(ByVal PageKey As String, ByVal WfProjectTaskOutcomeEventsID As String, ByVal WfProjectTaskOutcomeID As String, ByVal WfProjectTaskID As String)
		If EventController_Save(True) Then
			Dim aPageURL As String  = Request.Url.ToString
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "Page", PageKey)
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, WfProjectTaskOutcomeEventsID)
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, WfProjectTaskOutcomeID)
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, WfProjectTaskID)
			Response.Redirect(aPageURL)
		Else
			Exit Sub
		End If
	End Sub
	
	Public Sub RedirectToSubmissionCommunication(ByVal PageKey As String, ByVal WfProjectTaskOutcomeEventsID As String, ByVal ThirdParty As String)
		Dim aPageURL As String  = Request.Url.ToString
		Dim aWfProjectTaskOutcomeDO As cDataObject = SaveForSubmissionCommunication()
		aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "Page", PageKey)
		If aWfProjectTaskOutcomeDO Is Nothing Then
			Exit Sub
		Else
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "WfProjectTaskOutcomeID", aWfProjectTaskOutcomeDO.GetPropertyString("WfProjectTaskOutcomeID"))
		End If
		aPageURL = cWebLib.AddQuerystringParameter(aPageURL, WfProjectTaskOutcomeEventsID)
		aPageURL = cWebLib.AddQuerystringParameter(aPageURL, ThirdParty)
		aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "WfProjectTaskID", aWfProjectTaskDO.GetPropertyString("WfProjectTaskID"))
		Response.Redirect(aPageURL)
	End Sub
	
	Public Sub RedirectToSubmissionCommunication(ByVal PageKey As String, ByVal WfProjectTaskOutcomeEventsID As String, ByVal WfProjectTaskOutcomeID As String, ByVal ThirdParty As String)
		If EventController_Save(True) Then
			Dim aPageURL As String  = Request.Url.ToString
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "Page", PageKey)
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, WfProjectTaskOutcomeEventsID)
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, WfProjectTaskOutcomeID)
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, ThirdParty)
			Response.Redirect(aPageURL)
		Else
			Exit Sub
		End If
	End Sub
	
	'Private Sub ctlParentTask_IndexChange(ByVal sender As System.Object, ByVal e As System.EventArgs)
		
	'	Dim aWfTaskOutcomeDOL As cDataObjectList
	'	Dim aFiltersNode as XmlNode = Nothing
	'	Dim aDataObjectNode As XmlNode = Nothing
	'	Dim aXmlDoc As cXMLDoc
	'	Dim aSortNode as XmlNode
	'	Dim aWfProjectTaskDO, aWfTaskDO, aWfTaskOutcomeDO As cDataObject
		
	'	ctlNextTaskDefOutcome.Items.Clear()
	'	ctlNextTaskDefOutcome.Items.Add(new ListItem("<Select>", ""))
	'	ctlNextTaskSubmittedOutcome.Items.Clear()
	'	ctlNextTaskSubmittedOutcome.Items.Add(new ListItem("<Select>", ""))
		
	'	If Not ctlParentTask.SelectedValue = "" Then
	'		aWfProjectTaskDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", ctlParentTask.SelectedValue)
	'		aWfTaskID = aWfProjectTaskDO.GetPropertyString("WfTaskID")
	'		If Not aWfProjectTaskDO Is Nothing Then
	'			'Prepopulate the dates from the parent task
	'			ctlStartDate.myDate = aWfProjectTaskDO.GetPropertyDateTime("StartDate")
	'			ctlOpenDate.myDate = aWfProjectTaskDO.GetPropertyDateTime("OpenDate")
	'			ctlDueDate.myDate = aWfProjectTaskDO.GetPropertyDateTime("DueDate")
	'			ctlCloseDate.myDate = aWfProjectTaskDO.GetPropertyDateTime("CloseDate")
	'			ctlEndDate.myDate = aWfProjectTaskDO.GetPropertyDateTime("EndDate")
	'		End If
	'		aWfTaskDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTask", aWfTaskID)
	'		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskOutcome", aDataObjectNode, aFiltersNode)
	'		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aWfTaskID))
	'		aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
	'		aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskOutcome", ""))
	'		aWfTaskOutcomeDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
	'		for each aWfTaskOutcomeDO in aWfTaskOutcomeDOL
	'			ctlNextTaskDefOutcome.Items.Add(new ListItem(aWfTaskOutcomeDO.GetPropertyString("WfTaskOutcome"), aWfTaskOutcomeDO.GetPropertyString("WfTaskOutcomeID")))
	'		Next
	'		for each aWfTaskOutcomeDO in aWfTaskOutcomeDOL
	'			ctlNextTaskSubmittedOutcome.Items.Add(new ListItem(aWfTaskOutcomeDO.GetPropertyString("WfTaskOutcome"), aWfTaskOutcomeDO.GetPropertyString("WfTaskOutcomeID")))
	'		Next
	'	Else
	'		ctlStartDate.myDate = Nothing
	'		ctlOpenDate.myDate = Nothing
	'		ctlDueDate.myDate = Nothing
	'		ctlCloseDate.myDate = Nothing
	'		ctlEndDate.myDate = Nothing
	'	End If
		
	'End Sub
	
	'Public Sub SavePageAndReload()
	'	If SaveThirdParty Then
	'		Dim aPageURL As String  = Request.Url.ToString
	'		If Not aWfProjectTaskDO Is Nothing Then
	'			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "WfProjectTaskID", aWfProjectTaskDO.GetPropertyString("WfProjectTaskID"))
	'		End If
	'		Response.Redirect(aPageURL)
	'	End If
		
	'End Sub
	
	'Public Sub SavePageAndClose(ByVal PageKey As String, ByVal QueryString1 As String, ByVal QueryString2 As String, ByVal QueryString3 As String)
	'	If SaveThirdParty Then
	'		EventController_NavigateToModulePageKey(PageKey, QueryString1, QueryString2, QueryString3)
	'	End If
	'End Sub
	
	'Public Sub SaveAndRedirect(ByVal PageKey As String, ByVal WfProjectTaskOutcomeEventsID As String, ByVal ReturnURL As String)
	'	Dim aWfPTOutcomeDO As cDataObject = Nothing
	'	If SaveThirdParty Then
	'		Dim aPageURL As String  = Request.Url.ToString
	'		aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "Page", PageKey)
	'		If Not aWfProjectTaskDO Is Nothing Then
	'			aWfPTOutcomeDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskOutcome", "WfProjectTaskID", aWfProjectTaskDO.GetPropertyString("WfProjectTaskID"), "TaskOutcomeID", ctlNextTaskSubmittedOutcome.SelectedValue)(0)
	'			If aWfPTOutcomeDO Is Nothing Then
	'				aWfPTOutcomeDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfProjectTaskOutcome")
	'				aWfPTOutcomeDO("WfProjectTaskID") = aWfProjectTaskDO("WfProjectTaskID")
	'				aWfPTOutcomeDO("TaskOutcomeID") = ctlNextTaskSubmittedOutcome.SelectedValue
	'				aWfPTOutcomeDO.SaveData()
	'			End If
	'			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "WfProjectTaskOutcomeID",	aWfPTOutcomeDO.GetPropertyString("WfProjectTaskOutcomeID"))
	'		End If
	'		aPageURL = cWebLib.AddQuerystringParameter(aPageURL, WfProjectTaskOutcomeEventsID)
	'		aPageURL = cWebLib.AddQuerystringParameter(aPageURL, ReturnURL, Server)
	'		Response.Redirect(aPageURL)
	'	End If
	'End Sub
	
	'Public Function SaveThirdParty() As Boolean
	'	Page.Validate()
	'	If Not Page.IsValid Then
	'		Return False
	'	End If
	'	If Request.QueryString("WfProjectTaskID") = "0" Then
	'		aWfProjectTaskDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfProjectTask")
	'	Else If Not DataObjectCollection("WfProjectTask")(0) Is Nothing Then
	'		aWfProjectTaskDO = DataObjectCollection("WfProjectTask")(0)
	'	Else
	'		aWfProjectTaskDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfProjectTask")
	'	End If
	'	If Not aWfProjectTaskDO Is Nothing Then
	'		aWfProjectTaskDO("WfProjectID") = Convert.ToInt32(Request.QueryString("WfProjectID"))
	'		aWfProjectTaskDO("ParentProjectTaskID") = Convert.ToInt32(ctlParentTask.SelectedValue)
	'		aWfProjectTaskDO("WfTaskID") = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", ctlParentTask.SelectedValue).GetPropertyInt("WfTaskID")
	'		aWfProjectTaskDO("DefaultOutcomeID") = Convert.ToInt32(ctlNextTaskDefOutcome.SelectedValue)
	'		aWfProjectTaskDO("DefaultStatusID") = Convert.ToInt32(ctlNextTaskStatus.SelectedValue)
	'		aWfProjectTaskDO("SubmittedOutcomeID") = Convert.ToInt32(ctlNextTaskSubmittedOutcome.SelectedValue)
	'		aWfProjectTaskDO("AssignTo") = ctlNextTaskAssignTo.SelectedValue
	'		aWfProjectTaskDO("StartDate") = ctlStartDate.myDate
	'		aWfProjectTaskDO("OpenDate") = ctlOpenDate.myDate
	'		aWfProjectTaskDO("DueDate") = ctlDueDate.myDate
	'		aWfProjectTaskDO("CloseDate") = ctlCloseDate.myDate
	'		aWfProjectTaskDO("EndDate") = ctlEndDate.myDate
	'		aWfProjectTaskDO.SaveData()
	'	End If
	'	Return True
	'End Function
	
End Class

End Namespace
