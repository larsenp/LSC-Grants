Imports System.Web.UI
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core.Web

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder
Public MustInherit Class cWorkflowEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
	Private mTaskTypeID As String
    Private mWorkflowTypeID As String
    Private mWorkflowType As String
    Private mPrevTaskHeader As String = "Previous Task Information"
	Private aWfPTOutcomeDO As cDataObject = Nothing
	Private aNextWfPTaskDO As cDataObject = Nothing
	
	Protected ctlPrevTask As cDropDown
	Protected ctlPrevTaskOutcome As cDropDown
	Protected ctlAdvancedFilter As cTextArea
	Protected ctlNextTask As cDropDown
	
	Protected ctlNextTaskSubmittedOutcome As cLabel
	Protected ctlNextTaskStatus As cLabel
	Protected ctlNextTaskDefOutcome As cLabel
	Protected ctlNextTaskAssignTo As cLabel
	Protected ctlStartDate As cLabel
	Protected ctlOpenDate As cLabel
	Protected ctlDueDate As cLabel
	Protected ctlCloseDate As cLabel
	Protected ctlEndDate As cLabel
	
	Protected tblNextTaskInfo As HtmlTable
	Protected valValidateNextTask As CustomValidator
	
	Public ReadOnly Property WfProjectTaskOutcomeID() As String
	Get
		If Not Request.QueryString("WfProjectTaskOutcomeID") Is Nothing Then Return Request.QueryString("WfProjectTaskOutcomeID")
        Return ""
	End Get
	End Property
	
	Public ReadOnly Property NextWfProjectTaskID() As String
	Get
		If Not Request.QueryString("WfProjectTaskID") Is Nothing Then Return Request.QueryString("WfProjectTaskID")
        Return ""
	End Get
	End Property
	
	Public ReadOnly Property FilterArgumentID() As String
		Get
			If WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskOutcomeFilters", "WfProjectTaskOutcomeID", WfProjectTaskOutcomeID).Count > 0 Then
				Return WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskOutcomeFilters", "WfProjectTaskOutcomeID", WfProjectTaskOutcomeID)(0).GetPropertyString("FilterArgumentID")
			Else
				Return ""
			End If
		End Get
	End Property
	
	Public Property TaskTypeID() As String
		Get
			If Not Request.QueryString("TaskTypeID") = "" Then
				mTaskTypeID = Request.QueryString("TaskTypeID")
			Else
				mTaskTypeID = ""
			End If
			Return mTaskTypeID 
		End Get
		Set(ByVal value As String)
			mTaskTypeID = value
		End Set
	End Property
	
	Public ReadOnly Property PrevTaskHeader As String
		Get
			If TaskTypeID = "5" Then
				mPrevTaskHeader = "Eligibility"
			End If
			Return mPrevTaskHeader
		End Get
	End Property
	
	Public ReadOnly Property WorkflowTypeID() As String
		Get
			If Not Request.QueryString("WfBuilderPageKey") = "" Then
				mWorkflowType = Request.QueryString("WfBuilderPageKey")
				mWorkflowTypeID = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WorkflowType", "Description", mWorkflowType)(0).GetPropertyString("WorkflowTypeID")
				Return mWorkflowTypeID
			Else
				Return ""
			End If
		End Get
	End Property
	
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		Dim aPrevTaskListDO As cDataObject = Nothing
		Dim aNextTaskListDO As cDataObject = Nothing
		Dim aFiltersNode as XmlNode = Nothing
		Dim aDataObjectNode As XmlNode = Nothing
		Dim aXmlDoc As cXMLDoc = Nothing
		Dim aSortNode as XmlNode = Nothing
		Dim aPrevTaskListDOL As cDataObjectList = Nothing
		Dim aNextTaskListDOL As cDataObjectList = Nothing
		Dim aArgNode As XmlNode = Nothing
		
		ctlPrevTaskOutcome = CType(FindControl("ctlPrevTaskOutcome"), cDropDown)
		ctlAdvancedFilter = CType(FindControl("ctlAdvancedFilter"), cTextArea)
		ctlNextTask = CType(FindControl("ctlNextTask"), cDropDown)
		ctlNextTaskDefOutcome = CType(FindControl("ctlNextTaskDefOutcome"), cLabel)
		ctlNextTaskStatus = CType(FindControl("ctlNextTaskStatus"), cLabel)
		ctlNextTaskSubmittedOutcome = CType(FindControl("ctlNextTaskSubmittedOutcome"), cLabel)
		ctlNextTaskAssignTo = CType(FindControl("ctlNextTaskAssignTo"), cLabel)
		ctlStartDate = CType(FindControl("ctlStartDate"), cLabel)
		ctlOpenDate = CType(FindControl("ctlOpenDate"), cLabel)
		ctlDueDate = CType(FindControl("ctlDueDate"), cLabel)
		ctlCloseDate = CType(FindControl("ctlCloseDate"), cLabel)
		ctlEndDate = CType(FindControl("ctlEndDate"), cLabel)
		ctlPrevTask.Attributes.Add("PostBack", "True")
		ctlPrevTask.Set_ServerIndexChange(AddressOf ctlPrevTask_IndexChange)
		
		'Hide Next Task section for Review Workflow
		'If TaskTypeID = "2" OrElse TaskTypeID = "4" Then
		'	tblNextTaskInfo.Visible = False
		'Else
			ctlNextTask.Attributes.Add("PostBack", "True")
			ctlNextTask.Set_ServerIndexChange(AddressOf ctlNextTask_IndexChange)
		'End If
		
		If Not Page.IsPostBack Then
			ctlPrevTask.Items.Clear
			ctlPrevTask.Items.Add(new ListItem("<Select>", ""))
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfProjectTask", aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfProjectID", Request.QueryString("WfProjectID")))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WorkflowTypeID", WorkflowTypeID))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, "("))
			aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskTypeID", TaskTypeID, ""))
			aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "WfTask"))
			If Not TaskTypeID = "5" Then
				aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskTypeID", "7", "Or"))
				aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "WfTask"))
			End If
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, ")", ""))
			aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
			aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTask.WfTask", ""))
			aPrevTaskListDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
			For Each aPrevTaskListDO in aPrevTaskListDOL
				If ctlPrevTask.Items.FindByValue(aPrevTaskListDO.GetPropertyString("WfProjectTaskID")) Is Nothing Then
					ctlPrevTask.Items.Add(new ListItem(aPrevTaskListDO.GetRelatedPropertyString("WfTask.WfTask"), aPrevTaskListDO.GetPropertyString("WfProjectTaskID")))
				End If
			Next
			
			If ctlNextTask.Visible Then
				ctlNextTask.Items.Clear
				ctlNextTask.Items.Add(new ListItem("<Select>", ""))
				aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfProjectTask", aDataObjectNode, aFiltersNode)
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfProjectID", Request.QueryString("WfProjectID")))
				'Add WorkflowTypeID filter for tasks other than Eligibility 
				'If Not TaskTypeID = "5" AndAlso Not TaskTypeID = "4" AndAlso Not TaskTypeID = "8" Then
				'	aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WorkflowTypeID", WorkflowTypeID))
				'End If
				If TaskTypeID = "4" Then
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, "("))
					aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskTypeID", "4", "", "NotEqual"))
					aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "WfTask"))
					aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskTypeID", "5", "And", "NotEqual"))
					aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "WfTask"))
					aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskTypeID", "6", "And", "NotEqual"))
					aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "WfTask"))
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, ")", ""))
				ElseIf TaskTypeID = "8" Then
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, "("))
					aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskTypeID", "5", "", "NotEqual"))
					aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "WfTask"))
					aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskTypeID", "6", "And", "NotEqual"))
					aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "WfTask"))
					If Not ctlPrevTask.SelectedValue = "" Then
						aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfProjectTaskID", ctlPrevTask.SelectedValue, "And", "NotEqual"))
					End If
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, ")", ""))
				Else
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, "("))
					If TaskTypeID = "5" Then
						aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskTypeID", "1", ""))
						aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "WfTask"))
						aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskTypeID", "7", "Or"))
						aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "WfTask"))
					Else
						aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskTypeID", "4", "", "NotEqual"))
						aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "WfTask"))
						aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskTypeID", "5", "Or", "NotEqual"))
						aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "WfTask"))
						aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskTypeID", "6", "Or", "NotEqual"))
						aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXmlDoc, "WfTask"))
					End If
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, ")", ""))
				End If
				aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
				aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTask.WfTask", ""))
				aNextTaskListDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
				For Each aNextTaskListDO in aNextTaskListDOL
					If ctlNextTask.Items.FindByValue(aNextTaskListDO.GetPropertyString("WfProjectTaskID")) Is Nothing Then
						ctlNextTask.Items.Add(new ListItem(aNextTaskListDO.GetRelatedPropertyString("WfTask.WfTask"), aNextTaskListDO.GetPropertyString("WfProjectTaskID")))
					End If
				Next
				ctlNextTask.Items.Add(new ListItem("N/A", "-1"))
			End If
			
			If Not WfProjectTaskOutcomeID = "0" Then
				Dim aWfProjectTaskOutcomeDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTaskOutcome", WfProjectTaskOutcomeID)
				ctlPrevTask.SelectedField = aWfProjectTaskOutcomeDO.GetPropertyString("WfProjectTaskID")
				ctlPrevTaskOutcome.SelectedField = aWfProjectTaskOutcomeDO.GetPropertyString("TaskOutcomeID")
				aNextWfPTaskDO = aWfProjectTaskOutcomeDO.GetRelatedPropertyDataObject("WfProjectTaskOutcomeTasks")
				If Not aNextWfPTaskDO Is Nothing Then
					ctlNextTask.SelectedField = aNextWfPTaskDO.GetPropertyString("NextWfProjectTaskID")
					PrepopulateNextTaskInfo(aNextWfPTaskDO.GetRelatedPropertyDataObject("NextWfProjectTask"))
				Else
					ctlNextTask.SelectedField = "-1"
					ResetNextTaskinfo()
				End If
			Else
				If ctlPrevTaskOutcome.Items.FindByValue("-1") Is Nothing Then
					ctlPrevTaskOutcome.Items.Add(new ListItem("<Select>", "-1"))
				End If
			End If
			
		End If
		
		If WfProjectTaskOutcomeID <> "0" AndAlso Not ctlNextTask Is Nothing AndAlso ctlNextTask.SelectedValue = "" Then
			ctlNextTask.SelectedField = "-1"
		End If
		
	End Sub
	
	Public Sub SavePageAndReload()
		If SaveApplicationWorkflow Then
			Dim aPageURL As String  = Request.Url.ToString
			If Not aWfPTOutcomeDO Is Nothing Then
				aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "WfProjectTaskOutcomeID", aWfPTOutcomeDO.GetPropertyString("WfProjectTaskOutcomeID"))
			End If
			Response.Redirect(aPageURL)
		End If
		
	End Sub
	
	Public Sub SavePageAndClose(ByVal PageKey As String, ByVal QueryString1 As String, ByVal QueryString2 As String, ByVal QueryString3 As String, ByVal QueryString4 As String)
		If SaveApplicationWorkflow Then
			EventController_NavigateToModulePageKey(PageKey, QueryString1, QueryString2, QueryString3, QueryString4)
		End If
	End Sub
	
	Public Sub SaveAndRedirect(ByVal PageKey As String, ByVal WfProjectTaskOutcomeEventsID As String)
		If SaveApplicationWorkflow Then
			Dim aPageURL As String  = Request.Url.ToString
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "Page", PageKey)
			If Not aWfPTOutcomeDO Is Nothing Then
				aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "WfProjectTaskOutcomeID", aWfPTOutcomeDO.GetPropertyString("WfProjectTaskOutcomeID"))
			End If
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, WfProjectTaskOutcomeEventsID)
			Response.Redirect(aPageURL)
		End If
	End Sub

	Public Sub SaveAndRedirect(ByVal PageKey As String, ByVal WorkflowEventsID As String, ByVal WorkflowEventTypeID As String, ByVal ReturnURL As String)
		If SaveApplicationWorkflow() Then
			Dim aPageURL As String = Request.Url.ToString
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "Page", PageKey)
			If Not aWfPTOutcomeDO Is Nothing Then
				aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "WfProjectTaskOutcomeID", aWfPTOutcomeDO.GetPropertyString("WfProjectTaskOutcomeID"))
				aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "WorkflowID", aWfPTOutcomeDO.GetPropertyString("WfProjectTaskOutcomeID"))
				ReturnURL = cWebLib.AddQuerystringParameter(ReturnURL, "WfProjectTaskOutcomeID", aWfPTOutcomeDO.GetPropertyString("WfProjectTaskOutcomeID"))
			End If
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, WorkflowEventsID)
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, WorkflowEventTypeID)
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, ReturnURL, Server)
			Response.Redirect(aPageURL)
		End If
	End Sub
	
	Public Function SaveApplicationWorkflow() As Boolean
		Page.Validate()
        If Not Page.IsValid Then
            Return False
        End If
		Dim aPrevWfPTaskID As String
		Dim aNextWfPTaskID As String = ""
		Dim aWfPTaskOutcomeTaskDO As cDataObject
		Dim aWfPTaskOutcomeTaskDOL As cDataObjectList
		Dim aWfProjectTaskOutcomeID As String
		Dim aWfProjectTaskOutcomeFiltersDOL As cDataObjectList
		Dim aWfProjectTaskOutcomeFiltersDO As cDataObject
		Dim aFilterArgumentDO As cDataObject
		
		'When Previous task and outcome are selected, create/update the dataobjects WfProjectTaskOutcome and WfProjectTaskOutcomeTasks
		If Not ctlPrevTask.SelectedValue() = "" Then
			aPrevWfPTaskID = ctlPrevTask.SelectedValue
			If WfProjectTaskOutcomeID <> "" AndAlso WfProjectTaskOutcomeID <> "0" Then
				aWfPTOutcomeDO = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("WfProjectTaskOutcome", WfProjectTaskOutcomeID)(0)
			Else
				aWfPTOutcomeDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfProjectTaskOutcome")
			End If
			aWfPTOutcomeDO("WfProjectTaskID") = Convert.ToInt32(ctlPrevTask.SelectedValue)
			aWfPTOutcomeDO("TaskOutcomeID") = Convert.ToInt32(ctlPrevTaskOutcome.SelectedValue)
			If Not WorkflowTypeID = "" Then
				aWfPTOutcomeDO("WorkflowTypeID") = WorkflowTypeID
			End If
			aWfPTOutcomeDO.SaveData()
			aWfProjectTaskOutcomeID = aWfPTOutcomeDO.GetPropertyString("WfProjectTaskOutcomeID")
			'Create/update WfProjectTaskOutcomeTasks dataobject
			If Not ctlNextTask Is Nothing AndAlso Not ctlNextTask.SelectedValue = "" AndAlso Not ctlNextTask.SelectedValue = "-1" Then
				aWfPTaskOutcomeTaskDOL = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskOutcomeTasks", "WfProjectTaskOutcomeID", _
										aWfProjectTaskOutcomeID)
				If aWfPTaskOutcomeTaskDOL.Count > 0 AndAlso Not aWfPTaskOutcomeTaskDOL(0) Is Nothing Then
					aWfPTaskOutcomeTaskDO = aWfPTaskOutcomeTaskDOL(0)
				Else
					aWfPTaskOutcomeTaskDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfProjectTaskOutcomeTasks")
				End If
				aWfPTaskOutcomeTaskDO("WfProjectTaskOutcomeID") = Convert.ToInt32(aWfProjectTaskOutcomeID)
				aWfPTaskOutcomeTaskDO("NextWfProjectTaskID") = Convert.ToInt32(ctlNextTask.SelectedValue)
				aWfPTaskOutcomeTaskDO.SaveData()
			End If
			
			If WfProjectTaskOutcomeID <> "0" and ctlNextTask.SelectedValue = "-1" Then
				aWfPTaskOutcomeTaskDOL = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskOutcomeTasks", "WfProjectTaskOutcomeID", _
										aWfProjectTaskOutcomeID)
				WebSession.DataObjectFactory.DeleteData(aWfPTaskOutcomeTaskDOL)
			End If
			
			If Not ctlAdvancedFilter.TextArea = "" Then
				
				aWfProjectTaskOutcomeFiltersDOL = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskOutcomeFilters", "WfProjectTaskOutcomeID", aWfProjectTaskOutcomeID)
				'Delete all existing WfProjectTaskOutcomeFilters and their corresponding FilterArgument dataobjects for the current WfProjectTaskOutcomeID
				If aWfProjectTaskOutcomeFiltersDOL.Count > 0 Then
					For Each aWfProjectTaskOutcomeFiltersDO in aWfProjectTaskOutcomeFiltersDOL
						aFilterArgumentDO = aWfProjectTaskOutcomeFiltersDO.GetRelatedPropertyDataObject("FilterArgument")
						WebSession.DataObjectFactory.DeleteData(aFilterArgumentDO)
					Next
					WebSession.DataObjectFactory.DeleteData(aWfProjectTaskOutcomeFiltersDOL)
				End If
				aFilterArgumentDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("FilterArgument")
				aFilterArgumentDO("ArgType") = System.DBNull.Value
				aFilterArgumentDO("ArgTypeKey") = System.DBNull.Value
				aFilterArgumentDO("ArgPropertyKey") = System.DBNull.Value
				aFilterArgumentDO("ArgValue") = System.DBNull.Value
				aFilterArgumentDO("ArgBool") = System.DBNull.Value
				aFilterArgumentDO("ArgOperator") = System.DBNull.Value
				aFilterArgumentDO("RelatedPropertyKey") = System.DBNull.Value
				aFilterArgumentDO("JoinFilterArgumentID") = System.DBNull.Value
				aFilterArgumentDO("ArgXml") = ctlAdvancedFilter.TextArea
				aFilterArgumentDO.SaveData()
				aWfProjectTaskOutcomeFiltersDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfProjectTaskOutcomeFilters")
				aWfProjectTaskOutcomeFiltersDO("FilterArgumentID") = aFilterArgumentDO("FilterArgumentID")
				aWfProjectTaskOutcomeFiltersDO("WfProjectTaskOutcomeID") = aWfProjectTaskOutcomeID
				aWfProjectTaskOutcomeFiltersDO.SaveData()
			
			End If
		End If
		Return True
		
	End Function
		
	Private Sub ctlPrevTask_IndexChange(ByVal sender As System.Object, ByVal e As System.EventArgs)
	
		Dim aWfTaskOutcomeDO As cDataObject
		Dim aWfTaskOutcomeDOL As cDataObjectList
		Dim aFiltersNode as XmlNode = Nothing
		Dim aDataObjectNode As XmlNode = Nothing
		Dim aXmlDoc As cXMLDoc
		Dim aSortNode as XmlNode
		Dim aWfProjectTaskDO As cDataObject
		
		ctlPrevTaskOutcome.Items.Clear()
		If ctlPrevTaskOutcome.Items.FindByValue("-1") Is Nothing Then
			ctlPrevTaskOutcome.Items.Add(new ListItem("<Select>", "-1"))
		End If
		If Not ctlPrevTask.SelectedValue = "" Then
			aWfProjectTaskDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", ctlPrevTask.SelectedValue)
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskOutcome", aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aWfProjectTaskDO.GetPropertyString("WfTaskID")))
			aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
			aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "SortOrder", ""))
			aWfTaskOutcomeDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
			for each aWfTaskOutcomeDO in aWfTaskOutcomeDOL
				If ctlPrevTaskOutcome.Items.FindByValue(aWfTaskOutcomeDO.GetPropertyString("WfTaskOutcomeID")) Is Nothing Then
					ctlPrevTaskOutcome.Items.Add(new ListItem(aWfTaskOutcomeDO.GetPropertyString("WfTaskOutcome"), aWfTaskOutcomeDO.GetPropertyString("WfTaskOutcomeID")))
				End If
			Next
			
			'Remove the selected Previous task from the Next task dropdown.
			'ctlNextTask.RemoveItemByValue(ctlPrevTask.SelectedValue)
		End If
		
	End Sub
		
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

		ctlNextTaskDefOutcome.Value = aNextWfPTaskDO.GetRelatedPropertyString("DefaultOutcome.WfTaskOutcome")
		ctlNextTaskStatus.Value = aNextWfPTaskDO.GetRelatedPropertyString("DefaultStatus.WfTaskStatus")
		ctlNextTaskSubmittedOutcome.Value = aNextWfPTaskDO.GetRelatedPropertyString("SubmittedOutcome.WfTaskOutcome")
		ctlNextTaskAssignTo.Value = aNextWfPTaskDO.GetRelatedPropertyString("AssignToRoleWorkgroupStaffcontact.Description")
		ctlStartDate.Value = aNextWfPTaskDO.GetRelatedPropertyFormattedString("StartDate", "M/d/yyyy")
		ctlOpenDate.Value = aNextWfPTaskDO.GetRelatedPropertyFormattedString("OpenDate", "M/d/yyyy")
		ctlDueDate.Value = aNextWfPTaskDO.GetRelatedPropertyFormattedString("DueDate", "M/d/yyyy")
		ctlCloseDate.Value = aNextWfPTaskDO.GetRelatedPropertyFormattedString("CloseDate", "M/d/yyyy")
		ctlEndDate.Value = aNextWfPTaskDO.GetRelatedPropertyFormattedString("EndDate", "M/d/yyyy")

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
		
	Public Sub ValidateNextTask(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		valValidateNextTask.ErrorMessage = ""
		
		If ctlPrevTask.SelectedValue = "" Then 
			aArgs.IsValid = False
			valValidateNextTask.ErrorMessage += PrevTaskHeader + ": Task is required.<BR/>"
		End If
		If ctlPrevTaskOutcome.SelectedValue = "" OrElse ctlPrevTaskOutcome.SelectedValue = "-1" Then 
			aArgs.IsValid = False
			valValidateNextTask.ErrorMessage += PrevTaskHeader + ": Outcome is required.<BR/>"
		End If
		
		If ctlNextTask.Visible AndAlso ctlNextTask.SelectedValue = "" Then
			aArgs.IsValid = False
			valValidateNextTask.ErrorMessage += "Next Task Information: Task is required.<BR/>"
		End If
		
		If valValidateNextTask.ErrorMessage.Length > 0 AndAlso valValidateNextTask.ErrorMessage.LastIndexOf("<BR/>") > 0 Then
			valValidateNextTask.ErrorMessage = valValidateNextTask.ErrorMessage.Substring(0, valValidateNextTask.ErrorMessage.LastIndexOf("<BR/>"))
		End If
			
	End Sub
		
End Class

End Namespace