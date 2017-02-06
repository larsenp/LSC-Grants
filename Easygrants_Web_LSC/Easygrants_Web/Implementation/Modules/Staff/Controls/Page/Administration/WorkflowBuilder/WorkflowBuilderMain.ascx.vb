Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder

Public MustInherit Class cWorkflowBuilderMain
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
    
    Protected tblWorkflow As HtmlTable
    Protected tblThirdPartyTasks As HtmlTable
    Protected trAddWorkflow As HtmlTableRow
    Protected trWorkflowList As HtmlTableRow
    Protected trAddThirdPartyTasks As HtmlTableRow
    Protected trThirdPartyTaskList As HtmlTableRow
    Protected ctlNewWindowOpener As cNewWindowOpener
    Protected ctlTaskList As cDataListCtl
    Protected btnAdd As cCSSButton
    Private mTaskTypeID As String
    Private mTaskType As String
    
    
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
	
	Public ReadOnly Property TaskTypeHeader As String
		Get
			Select TaskTypeID
				Case "1"
					mTaskType = "Application Task"
				Case "3"
					mTaskType = "Grantee Reporting Task"
				Case "4"
					mTaskType = "Review Task"
				Case "5"
					mTaskType = "Eligibility Task"
				Case "8"
					mTaskType = "Grant Task"
				Case ""
					mTaskType = ""
			End Select
			Return mTaskType
		End Get
	End Property
	
	Public ReadOnly Property WorkflowHeader As String
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
					mTaskType = "Grant Task"
				Case ""
					mTaskType = ""
			End Select
			Return mTaskType
		End Get
	End Property
	
    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
    
		Dim aXmlDoc As cXMLDoc = Nothing
		Dim aFiltersNode as XmlNode = Nothing
		Dim aArgNode as XmlNode = Nothing
		Dim aTaskTypeIDArgumentNode As XmlNode = Nothing
		Dim aDataObjectFiltersNode As XmlNode = Nothing
		Dim aArgumentNode As XmlNode = Nothing
		
		aXmlDoc = new cXMLDoc()
		aXMLDoc.LoadFromXML(spnConfigXML.InnerText)
		'If TaskType is eligibility then display the Quiz button, or else hide it
		'If Not IsPostBack Then
			If Not TaskTypeID = "" AndAlso Not TaskTypeID = "5" Then
				Dim aQuizNode As XmlNode = Nothing
				Dim aDisplayPropertiesNode As XmlNode = aXmlDoc.DocElement.SelectSingleNode("DataObject[@Key='WfProjectTask']/DisplayProperties")
				Dim aTaskListNode As XmlNode = aDisplayPropertiesNode.SelectSingleNode("DisplayProperty/Control[@ID='ctlTaskList']")
				aQuizNode = aTaskListNode.SelectSingleNode("DisplayProperty/Control[@ID='btnQuiz']")
				If Not aQuizNode Is Nothing Then
					aTaskListNode.RemoveChild(aQuizNode.ParentNode)
					spnConfigXML.InnerText = aXMLDoc.DocElement.OuterXml
				End If
			End If
			
			'If Not TaskTypeID = "4" Then
			'	Dim aSendEmailNode As XmlNode = Nothing
			'	Dim aDisplayPropertiesNode As XmlNode = aXmlDoc.DocElement.SelectSingleNode("DataObject[@Key='WfProjectTask']/DisplayProperties")
			'	Dim aTaskListNode As XmlNode = aDisplayPropertiesNode.SelectSingleNode("DisplayProperty/Control[@ID='ctlTaskList']")
			'	aSendEmailNode = aTaskListNode.SelectSingleNode("DisplayProperty[@PropertyKey='WfProjectTaskOutcome.WfProjectTaskOutcomeEvents.EventKeyID']")
			'	If Not aSendEmailNode Is Nothing Then
			'		aTaskListNode.RemoveChild(aSendEmailNode)
			'		spnConfigXML.InnerText = aXMLDoc.DocElement.OuterXml
			'	End If
			'Else
			'	Dim aNextTaskNode As XmlNode = Nothing
			'	Dim aDisplayPropertiesNode As XmlNode = aXmlDoc.DocElement.SelectSingleNode("DataObject[@Key='WfProjectWorkflow']/DisplayProperties")
			'	Dim aTaskListNode As XmlNode = aDisplayPropertiesNode.SelectSingleNode("DisplayProperty/Control[@ID='ctlWorkflowTaskList']")
			'	aNextTaskNode = aTaskListNode.SelectSingleNode("DisplayProperty[@PropertyKey='WfProjectTaskOutcomeTasks.NextWfProjectTask.WfTask.WfTask']")
			'	If Not aNextTaskNode Is Nothing Then
			'		aTaskListNode.RemoveChild(aNextTaskNode)
			'		spnConfigXML.InnerText = aXMLDoc.DocElement.OuterXml
			'	End If
			'End If
			
			'If the TaskType is application or Grantee Reporting then change the filters
			'If TaskTypeID = "1" OrElse TaskTypeID = "3" Then
			'	'Delete the TaskTypeID filter that is using the querystring for all the DataObjectKeys
			'	aDataObjectFiltersNode = aXmlDoc.DocElement.SelectSingleNode("DataObject[@Key='WfProjectTask']/Filters")
			'	aTaskTypeIDArgumentNode = aDataObjectFiltersNode.SelectSingleNode("Argument[@TypeKey='TaskTypeID']")
			'	If Not aTaskTypeIDArgumentNode Is Nothing Then
			'		aDataObjectFiltersNode.RemoveChild(aTaskTypeIDArgumentNode)
			'		aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, "("))
			'		aArgNode = aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskTypeID", TaskTypeID, ""))
			'		aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "WfTask"))
			'		aArgNode = aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskTypeID", "7", "Or"))
			'		aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "WfTask"))
			'		aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, ")", ""))
			'	End If
			'	aDataObjectFiltersNode = Nothing
			'	aTaskTypeIDArgumentNode = Nothing
			'	'Delete the TaskTypeID filter that is using the querystring for all the DataObjectKeys
			'	aDataObjectFiltersNode = aXmlDoc.DocElement.SelectSingleNode("DataObject[@Key='WfProjectWorkflow']/Filters")
			'	aTaskTypeIDArgumentNode = aDataObjectFiltersNode.SelectSingleNode("Argument[@TypeKey='TaskTypeID']")
			'	If Not aTaskTypeIDArgumentNode Is Nothing Then
			'		aDataObjectFiltersNode.RemoveChild(aTaskTypeIDArgumentNode)
			'		aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, "("))
			'		aArgNode = aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskTypeID", TaskTypeID, ""))
			'		aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "WfProjectTask.WfTask"))
			'		aArgNode = aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskTypeID", "7", "Or"))
			'		aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "WfProjectTask.WfTask"))
			'		aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, ")", ""))
			'	End If
			'	aDataObjectFiltersNode = Nothing
			'	aTaskTypeIDArgumentNode = Nothing
			'	'Delete the TaskTypeID filter that is using the querystring for all the DataObjectKeys
			'	'aDataObjectFiltersNode = aXmlDoc.DocElement.SelectSingleNode("DataObject[@Key='ThirdPartyTasks']/Filters")
			'	'aTaskTypeIDArgumentNode = aDataObjectFiltersNode.SelectSingleNode("Argument[@TypeKey='TaskTypeID']")
			'	'If Not aTaskTypeIDArgumentNode Is Nothing Then
			'	'	aDataObjectFiltersNode.RemoveChild(aTaskTypeIDArgumentNode)
			'	'	aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, "("))
			'	'	aArgNode = aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskTypeID", TaskTypeID, ""))
			'	'	aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "WfTask"))
			'	'	aArgNode = aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskTypeID", "7", "Or"))
			'	'	aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "WfTask"))
			'	'	aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, ")", ""))
			'	'End If
			'	spnConfigXML.InnerText = aXMLDoc.DocElement.OuterXml
			'End If
		'End If
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Dim aWfProjectTaskDOL As cDataObjectList = CType(DataObjectCollection("WfProjectTask"), cDataObjectList)
		Dim aWfProjectTaskDO As cDataObject
		'Hide Delete button in the task list if there are no task assignments with status 1 or 2
		Dim aDeleteHash as Hashtable
		Dim aDeleteBtn as cCSSButton
		ctlTaskList = FindControl("ctlTaskList")
		btnAdd = FindControl("btnAdd")
		'Hide the Add button on Eligibility Task Info section if there is already an eligibility task
		If TaskTypeID = "5" AndAlso aWfProjectTaskDOL.Count > 0 Then 
			btnAdd.Visible = False
		End If
		If Not ctlTaskList Is Nothing Then
			aDeleteHash = ctlTaskList.DataListCtl_GetControlCollection("btnDeleteProjectTask")
			Dim aWfProjectTaskID As Integer
			For Each aWfProjectTaskDO in aWfProjectTaskDOL
				aWfProjectTaskID = aWfProjectTaskDO("WfProjectTaskID")
				aDeleteBtn = CType(aDeleteHash(aWfProjectTaskID), cCSSButton)
				
				Dim aDataObjectNode As XmlNode = Nothing
				Dim aWFTADOL As cDataObjectList
				aFiltersNode = Nothing
				aArgNode = Nothing
				aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aWfProjectTaskDO.GetPropertyString("WfTaskID")))
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, "("))
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskStatusID", "1", ""))
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskStatusID", "2", "Or"))
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfTaskStatusID", "4", "Or"))
				aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, ")", ""))
				aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXMLDoc, "Data", "WfProjectID", aWfProjectTaskDO.GetPropertyString("WfProjectID")))
				aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "GranteeProject"))
				
				aWFTADOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
				
				'check for wfprojecttaskoutcome dataobjects				
				Dim aWfProjectTaskOutcomeDOL As cDataObjectList = aWfProjectTaskDO.GetRelatedPropertyDataObjectList("WfProjectTaskOutcome")
				Dim aWfProjectTaskOutcomeTasksDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskOutcomeTasks", "NextWfProjectTaskID", aWfProjectTaskDO.GetPropertyString("WfProjectTaskID"))
				If aWfProjectTaskOutcomeTasksDOL.Count > 0 OrElse (Not aWFTADOL Is Nothing AndAlso aWFTADOL.Count > 0) OrElse aWfProjectTaskOutcomeDOL.Count > 0 OrElse Not aWfProjectTaskDO.GetPropertyString("ParentProjectTaskID", "") = "" Then
					If Not aDeleteBtn Is Nothing Then
						aDeleteBtn.Visible = False
					End If
				End If
			Next
		End If
		If Not aWfProjectTaskDOL Is Nothing AndAlso aWfProjectTaskDOL.Count > 0 Then
			tblWorkflow.Visible = True
			trAddWorkflow.Visible = True
			trWorkflowList.Visible = True
				If TaskTypeID = "1" OrElse TaskTypeID = "3" OrElse TaskTypeID = "8" Then
					tblThirdPartyTasks.Visible = True
					trAddThirdPartyTasks.Visible = True
					trThirdPartyTaskList.Visible = True
				Else
					tblThirdPartyTasks.Visible = False
					trAddThirdPartyTasks.Visible = False
					trThirdPartyTaskList.Visible = False
				End If
		Else
			tblWorkflow.Visible = False
			trAddWorkflow.Visible = False
			trWorkflowList.Visible = False
			tblThirdPartyTasks.Visible = False
			trAddThirdPartyTasks.Visible = False
			trThirdPartyTaskList.Visible = False
		End If
		
	End Sub
	
	Public Sub ViewWorkflow(ByVal aPageKey As String)
		Dim aNewWindowUrl As String = Request.Url.ToString
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "Page", aPageKey)
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "PageFrame=Print")
		ctlNewWindowOpener.NewWindowURL() = aNewWindowUrl
		ctlNewWindowOpener.Open()
	End Sub
	
	Public Sub DisconnectThirdParty(ByVal aWfProjectTaskID As String)
		Try
			Me.BeginTrans()

			Dim aWfProjectTaskDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", aWfProjectTaskID)
			If Not aWfProjectTaskDO Is Nothing Then
				aWfProjectTaskDO("ParentProjectTaskID") = System.DBNull.Value
				aWfProjectTaskDO.SaveData()
			End If
			Dim aWfProjectTaskOutcomeDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskOutcome", "WfProjectTaskID", aWfProjectTaskID)
			Dim aWfProjectTaskOutcomeDO As cDataObject
			For Each aWfProjectTaskOutcomeDO in aWfProjectTaskOutcomeDOL
				Dim aWfProjectTaskOutcomeEventsDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskOutcomeEvents", "WfProjectTaskOutcomeID", aWfProjectTaskOutcomeDO.GetPropertyString("WfProjectTaskOutcomeID"))
				Dim aWfProjectTaskOutcomeEventsDO As cDataObject
				For Each aWfProjectTaskOutcomeEventsDO in aWfProjectTaskOutcomeEventsDOL
					Dim aEventCorrespondenceDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("EventCorrespondence", "EventID", aWfProjectTaskOutcomeEventsDO.GetPropertyString("EventKeyID"))(0)
					WebSession.DataObjectFactory.DeleteData(aEventCorrespondenceDO)
					Dim aEventDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Event", aWfProjectTaskOutcomeEventsDO.GetPropertyString("EventKeyID"))
					WebSession.DataObjectFactory.DeleteData(aEventDO)
				Next
				WebSession.DataObjectFactory.DeleteData(aWfProjectTaskOutcomeEventsDOL)
			Next
			WebSession.DataObjectFactory.DeleteData(aWfProjectTaskOutcomeDOL)
			Me.CommitTrans()
		Catch ex As Exception
			Me.RollbackTrans()
			Throw (ex)
			Exit Sub
		End Try
		Response.Redirect(Request.Url.ToString)
	End Sub
    
End Class

End Namespace