Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder

Public MustInherit Class cWorkflowProjectTaskEditor
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
    
    Private mTaskTypeID As String
    Private mTaskType As String
    Private mWorkflowTypeID As String
    Private mWorkflowType As String
    Protected trInGrantFile As HtmlTableRow
    Protected tblPDFInfo As HtmlTable
    Protected ctlNextTaskSubmittedOutcome As cDropDown
    Protected ctlNextTask As cDropDown
    Protected ctlNextTaskDefOutcome As cDropDown
    Protected trDefaultOutcome As HtmlTableRow
    Protected trSubmittedOutcome As HtmlTableRow
    Protected valValidateUniqueTask As CustomValidator
	Protected ctlInitialProjectTask As cCheckBox
	Protected ctlNextTaskAssignTo As cDropDown
    
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
	
	Public ReadOnly Property TaskType As String
		Get
			Select TaskTypeID
				Case "1"
					mTaskType = "Application"
				Case "3"
					mTaskType = "Grantee Reporting"
				Case "4"
					mTaskType = "Review"
				Case "5"
					mTaskType = "Eligibility"
				Case "8"
					mTaskType = "Grant"
				Case ""
					mTaskType = ""
			End Select
			Return mTaskType
		End Get
	End Property
	
		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)

			Dim aXmlDoc As cXMLDoc = Nothing
			Dim aFiltersNode As XmlNode = Nothing
			Dim aArgNode As XmlNode = Nothing
			Dim aTaskTypeIDArgumentNode As XmlNode = Nothing
			Dim aDataObjectFiltersNode As XmlNode = Nothing

			'If the TaskType is eligibility then remove the filter for internal review
			'If Not IsPostBack Then
			If TaskTypeID = "5" Then
				aXmlDoc = New cXMLDoc()
				aXmlDoc.LoadFromXML(spnConfigXML.InnerText)
				aDataObjectFiltersNode = aXmlDoc.DocElement.SelectSingleNode("DataObject/DisplayProperties/DisplayProperty/Control[@ID='ctlNextTask']/Filters")
				aTaskTypeIDArgumentNode = aDataObjectFiltersNode.SelectSingleNode("Argument[@Value='6']")
				If Not aTaskTypeIDArgumentNode Is Nothing Then
					aDataObjectFiltersNode.RemoveChild(aTaskTypeIDArgumentNode)
				End If
				aTaskTypeIDArgumentNode = aDataObjectFiltersNode.SelectSingleNode("Argument[@Value='7']")
				If Not aTaskTypeIDArgumentNode Is Nothing Then
					aDataObjectFiltersNode.RemoveChild(aTaskTypeIDArgumentNode)
				End If
				spnConfigXML.InnerText = aXmlDoc.DocElement.OuterXml
			ElseIf TaskTypeID = "2" OrElse TaskTypeID = "4" Then
				aXmlDoc = New cXMLDoc()
				aXmlDoc.LoadFromXML(spnConfigXML.InnerText)
				aDataObjectFiltersNode = aXmlDoc.DocElement.SelectSingleNode("DataObject/DisplayProperties/DisplayProperty/Control[@ID='ctlNextTask']/Filters")
				aTaskTypeIDArgumentNode = aDataObjectFiltersNode.SelectSingleNode("Argument[@Value='6']")
				If Not aTaskTypeIDArgumentNode Is Nothing Then
					aDataObjectFiltersNode.RemoveChild(aTaskTypeIDArgumentNode)
				End If
				spnConfigXML.InnerText = aXmlDoc.DocElement.OuterXml
			ElseIf TaskTypeID = "6" Then
				aXmlDoc = New cXMLDoc()
				aXmlDoc.LoadFromXML(spnConfigXML.InnerText)
				aDataObjectFiltersNode = aXmlDoc.DocElement.SelectSingleNode("DataObject/DisplayProperties/DisplayProperty/Control[@ID='ctlNextTaskAssignTo']/Filters")
				aTaskTypeIDArgumentNode = aDataObjectFiltersNode.SelectSingleNode("Argument[@Type='Data']")
				If Not aTaskTypeIDArgumentNode Is Nothing Then
					aDataObjectFiltersNode.RemoveChild(aTaskTypeIDArgumentNode)
				End If
				spnConfigXML.InnerText = aXmlDoc.DocElement.OuterXml
			'ElseIf TaskTypeID = "8" Then
			'	aXmlDoc = New cXMLDoc()
			'	aXmlDoc.LoadFromXML(spnConfigXML.InnerText)
			'	aDataObjectFiltersNode = aXmlDoc.DocElement.SelectSingleNode("DataObject/DisplayProperties/DisplayProperty/Control[@ID='ctlNextTask']/Filters")
			'	aTaskTypeIDArgumentNode = aDataObjectFiltersNode.SelectSingleNode("Argument[@Value='7']")
			'	If Not aTaskTypeIDArgumentNode Is Nothing Then
			'		aDataObjectFiltersNode.RemoveChild(aTaskTypeIDArgumentNode)
			'	End If
			'	spnConfigXML.InnerText = aXmlDoc.DocElement.OuterXml
			End If
			'End If
			MyBase.CoreCtl_Load(aSrc, aEvent)

			ctlNextTask = CType(FindControl("ctlNextTask"), cDropDown)
			ctlNextTaskDefOutcome = CType(FindControl("ctlNextTaskDefOutcome"), cDropDown)
			ctlNextTaskSubmittedOutcome = CType(FindControl("ctlNextTaskSubmittedOutcome"), cDropDown)
			ctlNextTaskAssignTo = FindControl("ctlNextTaskAssignTo")
			ctlInitialProjectTask = FindControl("ctlInitialProjectTask")
			ctlNextTask.Attributes.Add("PostBack", "True")
			ctlNextTask.Set_ServerIndexChange(AddressOf ctlNextTask_IndexChange)
			If TaskTypeID = "5" Then
				tblPDFInfo.Visible = False
				trSubmittedOutcome.Visible = False
				trDefaultOutcome.Visible = False
				ctlNextTaskDefOutcome.Visible = False
				ctlNextTaskSubmittedOutcome.Visible = False
				ctlInitialProjectTask.Value = True
			Else
				ctlInitialProjectTask.Value = False
			End If

			If IsPostBack AndAlso Not ctlNextTask.SelectedValue = "" AndAlso Not ctlNextTask.SelectedValue = "-1" Then
				ctlNextTaskAssignTo.Items.Clear()
				ctlNextTaskAssignTo.Items.Add(New ListItem("<Select>", ""))
				Dim aWfTaskDO As cDataObject
				Dim aDataObjectNode As XmlNode = Nothing
				Dim aSortNode As XmlNode
				Dim aAssignToRoleWorkgroupStaffcontactDO As cDataObject
				Dim aAssignToRoleWorkgroupStaffcontactDOL As cDataObjectList
				aWfTaskDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTask", ctlNextTask.SelectedValue)
				aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("AssignToRoleWorkgroupStaffcontact", aDataObjectNode, aFiltersNode)
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "TaskTypeID", aWfTaskDO.GetPropertyString("WfTaskTypeID")))
				If aWfTaskDO.GetPropertyString("WfTaskTypeID") <> 6 Then
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "TaskTypeID", "0", "Or"))
				End If
				aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
				aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "Description", ""))
				aAssignToRoleWorkgroupStaffcontactDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
				For Each aAssignToRoleWorkgroupStaffcontactDO In aAssignToRoleWorkgroupStaffcontactDOL
					ctlNextTaskAssignTo.Items.Add(New ListItem(aAssignToRoleWorkgroupStaffcontactDO.GetPropertyString("Description"), aAssignToRoleWorkgroupStaffcontactDO.GetPropertyString("AssignTo")))
				Next
			End If
			If TaskTypeID = "8" Then
				trInGrantFile.Visible = True
			Else
				trInGrantFile.Visible = False
			End If

		End Sub
	
        Public Sub ctlNextTask_IndexChange(ByVal sender As System.Object, ByVal e As System.EventArgs)

			If ctlNextTaskDefOutcome.Visible Then
				ctlNextTaskDefOutcome.Items.Clear()
				ctlNextTaskDefOutcome.Items.Add(New ListItem("<Select>", ""))
			End If
			If ctlNextTaskSubmittedOutcome.Visible Then
				ctlNextTaskSubmittedOutcome.Items.Clear()
				ctlNextTaskSubmittedOutcome.Items.Add(New ListItem("<Select>", ""))
			End If
			ctlNextTaskAssignTo.Items.Clear()
			ctlNextTaskAssignTo.Items.Add(New ListItem("<Select>", ""))
			If Not ctlNextTask.SelectedValue = "" AndAlso Not ctlNextTask.SelectedValue = "-1" Then
				Dim aWfTaskOutcomeDO As cDataObject
				Dim aWfTaskOutcomeDOL As cDataObjectList
				Dim aAssignToRoleWorkgroupStaffcontactDO As cDataObject
				Dim aAssignToRoleWorkgroupStaffcontactDOL As cDataObjectList
				Dim aFiltersNode As XmlNode = Nothing
				Dim aDataObjectNode As XmlNode = Nothing
				Dim aXmlDoc As cXMLDoc
				Dim aSortNode As XmlNode
				Dim aWfTaskDO As cDataObject
				aWfTaskDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTask", ctlNextTask.SelectedValue)
				'Populate the Default and Submitted Outcomes based on the Task selection
				If ctlNextTaskDefOutcome.Visible Or ctlNextTaskSubmittedOutcome.Visible Then
					aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskOutcome", aDataObjectNode, aFiltersNode)
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aWfTaskDO.GetPropertyString("WfTaskID")))
					aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
					aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskOutcome", ""))
					aWfTaskOutcomeDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
					If ctlNextTaskDefOutcome.Visible Then
						For Each aWfTaskOutcomeDO In aWfTaskOutcomeDOL
							ctlNextTaskDefOutcome.Items.Add(New ListItem(aWfTaskOutcomeDO.GetPropertyString("WfTaskOutcome"), aWfTaskOutcomeDO.GetPropertyString("WfTaskOutcomeID")))
						Next
					End If
					If ctlNextTaskSubmittedOutcome.Visible Then
						For Each aWfTaskOutcomeDO In aWfTaskOutcomeDOL
							ctlNextTaskSubmittedOutcome.Items.Add(New ListItem(aWfTaskOutcomeDO.GetPropertyString("WfTaskOutcome"), aWfTaskOutcomeDO.GetPropertyString("WfTaskOutcomeID")))
						Next
					End If
				End If
				'Populate AssignTo dropdown based on the Task selection
				aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("AssignToRoleWorkgroupStaffcontact", aDataObjectNode, aFiltersNode)
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "TaskTypeID", aWfTaskDO.GetPropertyString("WfTaskTypeID")))
				If aWfTaskDO.GetPropertyString("WfTaskTypeID") <> 6 Then
					aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "TaskTypeID", "0", "Or"))
				End If
				aSortNode = aDataObjectNode.AppendChild(aXmlDoc.CreateSortNode)
				aSortNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "Description", ""))
				aAssignToRoleWorkgroupStaffcontactDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
				For Each aAssignToRoleWorkgroupStaffcontactDO In aAssignToRoleWorkgroupStaffcontactDOL
					ctlNextTaskAssignTo.Items.Add(New ListItem(aAssignToRoleWorkgroupStaffcontactDO.GetPropertyString("Description"), aAssignToRoleWorkgroupStaffcontactDO.GetPropertyString("AssignTo")))
				Next
			End If

		End Sub
	
	Public Overrides Sub DataPresenter_SaveDataObjects()
		
		MyBase.DataPresenter_SaveDataObjects()
		
		Dim aWfProjectTaskDO As cDataObject = CType(DataObjectCollection("WfProjectTask"), cDataObjectList)(0)
		Dim aAssignToDO As cDataObject = aWfProjectTaskDO.GetRelatedPropertyDataObject("AssignToRoleWorkgroupStaffcontact")
		'There needs to be a row in WfTaskModule table for every combination of wftaskid and wftaskroleid that the admin creates thru workflow builder
		If aAssignToDO("Type") = "Role" Then
			Dim aWfTaskModuleDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModule", "WfTaskID", aWfProjectTaskDO.GetPropertyString("WfTaskID"), "WfTaskRoleID", aAssignToDO.GetPropertyString("ID"))(0)
			
			If aWfTaskModuleDO Is Nothing Then
				Dim aExistingWfTaskModuleDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModule", "WfTaskID", aWfProjectTaskDO.GetPropertyString("WfTaskID"))(0)
				If Not aExistingWfTaskModuleDO Is Nothing Then
					aWfTaskModuleDO = WebSession.DataObjectFactory.CloneDataObject(aExistingWfTaskModuleDO)
					aWfTaskModuleDO("WfTaskRoleID") = aAssignToDO.GetPropertyString("ID")
					aWfTaskModuleDO.SaveData()
				End If
			End If
			
		End If
		
		'If Initial Task is checked then set Initial Task to false to all other project tasks in this project
		If aWfProjectTaskDO.GetPropertyBool("InitialProjectTask") = True Then
			Dim aDataObjectNode, aFiltersNode As XmlNode
			Dim aExistingInitialWfProjectTaskDO As cDataObject
			Dim aExistingInitialWfProjectTaskDOL As cDataObjectList
			Dim aXmlDoc As cXMLDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfProjectTask", aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfProjectID", Request.QueryString("WfProjectID")))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "InitialProjectTask", "True"))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfProjectTaskID", aWfProjectTaskDO.GetPropertyString("WfProjectTaskID"), "And", "NotEqual"))
			aExistingInitialWfProjectTaskDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
			For Each aExistingInitialWfProjectTaskDO in aExistingInitialWfProjectTaskDOL
				aExistingInitialWfProjectTaskDO("InitialProjectTask") = False
				aExistingInitialWfProjectTaskDO.SaveData()
			Next
		End If
		
	End Sub
	
	Public Sub UpdateWfProjectTaskAndReload(ByVal PageKey As String, ByVal ProgramID As String, ByVal CompetitionID As String, ByVal WfProjectID As String, ByVal TaskTypeID As String, ByVal WfTaskTypeID As String, ByVal WfProjectTaskID As String, ByVal WfBuilderPageKey As String)
		If Request.QueryString("TaskTypeID") = "5" Then
			UpdateWfProjectTask()
		End If
		Dim aPageURL As String = Request.Url.ToString
		If Request.QueryString("WfTaskTypeID") Is Nothing OrElse Request.QueryString("WfTaskTypeID") = "" Then
			aPageURL = cWebLib.AddQuerystringParameter(aPageURL, "WfTaskTypeID=" + CType(DataObjectCollection("WfProjectTask"), cDataObjectList)(0).GetRelatedPropertyString("WfTask.WfTaskTypeID"))
		End If
		aPageURL = cWebLib.AddQuerystringParameter(aPageURL, WfProjectTaskID)
		Response.Redirect(aPageURL)
	End Sub
	
	Public Sub UpdateWfProjectTaskAndClose(ByVal WfBuilderPageKey As String, ByVal ProgramID As String, ByVal CompetitionID As String, ByVal WfProjectID As String, ByVal TaskTypeID As String, ByVal WfTaskTypeID As String)
		If Request.QueryString("TaskTypeID") = "5" Then
			UpdateWfProjectTask()
		End If
		EventController_NavigateToModulePageKey(WfBuilderPageKey, ProgramID, CompetitionID, WfProjectID, TaskTypeID, WfTaskTypeID)
	End Sub
	
	Private Sub UpdateWfProjectTask()
		Dim aWfProjectTaskDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfTaskID", ctlNextTask.SelectedValue, "WfProjectID", Request.QueryString("WfProjectID"))(0)
		If aWfProjectTaskDO.GetPropertyString("DefaultOutcomeID", "") = "" Then
			Dim aNotEligibleTaskOutcomeDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskOutcome", "WfTaskID", aWfProjectTaskDO.GetPropertyString("WfTaskID"), "WfTaskOutcome_Abbr", "NotEligible")(0)
			If Not aNotEligibleTaskOutcomeDO Is Nothing Then
				aWfProjectTaskDO("DefaultOutcomeID") = aNotEligibleTaskOutcomeDO("WfTaskOutcomeID")
			End If
		End If
		If aWfProjectTaskDO.GetPropertyString("SubmittedOutcomeID", "") = "" Then
			Dim aEligibleTaskOutcomeDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskOutcome", "WfTaskID", aWfProjectTaskDO.GetPropertyString("WfTaskID"), "WfTaskOutcome_Abbr", "Eligible")(0)
			If Not aEligibleTaskOutcomeDO Is Nothing Then
				aWfProjectTaskDO("SubmittedOutcomeID") = aEligibleTaskOutcomeDO("WfTaskOutcomeID")
			End If
		End If
		aWfProjectTaskDO.SaveData()
	End Sub
	
	Public Sub ValidateUniqueTask(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		'This method validates that a task is added to a funding cycle only once
		Dim aWfProjectTaskDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfTaskID", ctlNextTask.SelectedValue, "WfProjectID", Request.QueryString("WfProjectID"))
		If Request.QueryString("WfProjectTaskID") = "0" AndAlso aWfProjectTaskDOL.Count > 0 Then
			aArgs.IsValid = False
			Exit Sub
		Else If Not Request.QueryString("WfProjectTaskID") = "0" Then
			Dim aWfProjectTaskDO As cDataObject
			For Each aWfProjectTaskDO in aWfProjectTaskDOL
				If Not aWfProjectTaskDO.GetPropertyString("WfTaskID") = ctlNextTask.SelectedValue Then
					aArgs.IsValid = False
					Exit Sub
				End If
			Next
		End If
	End Sub
	
	Public Sub SaveAndRedirect(ByVal PageKey As String, ByVal WfProjectTaskPDFID As String, ByVal ProgramID As String, ByVal CompetitionID As String, ByVal WfProjectID As String, ByVal TaskTypeID As String, ByVal WfTaskTypeID As String, ByVal ReturnURL As String)
		If EventController_Save(True) Then
			Dim aWfProjectTaskDO As cDataObject = CType(DataObjectCollection("WfProjectTask"), cDataObjectList)(0)
			If Not aWfProjectTaskDO Is Nothing Then
				EventController_NavigateToModulePageKey(PageKey, WfProjectTaskPDFID, ProgramID, CompetitionID, WfProjectID, TaskTypeID, WfTaskTypeID, "WfProjectTaskID=" + aWfProjectTaskDO.GetPropertyString("WfProjectTaskID"), ReturnURL)
			End If

		End If
	End Sub

	Public Sub SaveAndRedirect(ByVal PageKey As String, ByVal WorkflowEventsID As String, ByVal WorkflowEventTypeID As String, ByVal ReturnURL As String)
		If EventController_Save(True) Then
			Dim aWfProjectTaskDO As cDataObject = CType(DataObjectCollection("WfProjectTask"), cDataObjectList)(0)
			If Not aWfProjectTaskDO Is Nothing Then
				ReturnURL = cWebLib.AddQuerystringParameter(ReturnURL, "WfProjectTaskID", aWfProjectTaskDO.GetPropertyString("WfProjectTaskID"))
				EventController_NavigateToModulePageKey(PageKey, WorkflowEventsID, WorkflowEventTypeID, "WorkflowID=" + aWfProjectTaskDO.GetPropertyString("WfProjectTaskID"), ReturnURL)
			End If

		End If
	End Sub

	Public Sub BaseCoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub
	
End Class

End Namespace