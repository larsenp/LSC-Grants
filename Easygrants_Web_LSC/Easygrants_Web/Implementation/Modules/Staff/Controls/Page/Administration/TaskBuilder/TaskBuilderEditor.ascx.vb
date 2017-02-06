Imports Core.DataAccess
Imports Core.Web
Imports System.Text.RegularExpressions
Imports Core_Web.Controls.Base
Imports System.Xml
Imports Core.DataAccess.XMLAccess

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration.TaskBuilder
Public MustInherit Class cTaskBuilderEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
	'Protected ctlStandardForms As cCheckBoxList
	Dim aWfTaskDO As cDataObject = Nothing
	Protected ctlTaskType As cDropDown
	Protected ctlFormType As cDropDown
	Protected CtlDuplicateMain As CustomValidator
	Protected CtlDuplicateReviewandSubmit As CustomValidator
	
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		ctlTaskType = CType(Me.FindControl("ctlTaskType"), cDropDown)
		ctlTaskType.Set_ServerIndexChange(AddressOf ctlTaskType_IndexChange)
		'ctlStandardForms = FindControl("ctlStandardForms")
		Dim aSelectedValues As String = ""
		Dim aWfTaskDO As cDataObject = CType(DataObjectCollection("WfTask"), cDataObjectList)(0)
		Dim aWfTaskModuleConfigNavElementDOL As cDataObjectList
		Dim aWfTaskModuleConfigNavElementDO As cDataObject
		Dim aDataObjectNode, aFiltersNode, aArgNode As XmlNode
		Dim aXmlDoc As cXMLDoc
		aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskModuleConfigNavElement", aDataObjectNode, aFiltersNode)
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aWfTaskDO.GetPropertyString("WfTaskID")))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, "("))
		aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "FormTypeID", "3", ""))
		aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "StandardForms"))
		aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "FormTypeID", "4", "Or"))
		aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "StandardForms"))
		aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, ")", ""))
		aWfTaskModuleConfigNavElementDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
		For Each aWfTaskModuleConfigNavElementDO in aWfTaskModuleConfigNavElementDOL
			If aSelectedValues = "" Then
				aSelectedValues = aWfTaskModuleConfigNavElementDO.GetRelatedPropertyString("StandardForms.FormTypeID")
			Else
				aSelectedValues = aSelectedValues + "," + aWfTaskModuleConfigNavElementDO.GetRelatedPropertyString("StandardForms.FormTypeID")
			End If
		Next
		'ctlStandardForms.SelectedCheckBoxes = aSelectedValues
	End Sub
	
	Public Overrides Sub DataPresenter_SaveDataObjects()
		MyBase.DataPresenter_SaveDataObjects()
		
		aWfTaskDO = CType(DataObjectCollection("WfTask"), cDataObjectList)(0)
		Dim aWfTaskRoleID As Integer
		Dim aWfTaskModuleConfigDO, aWfTaskModuleDO, aWfTaskModuleConfigPageFramesDO, aWfTaskRoleDO, aWfTaskOutcomeResubmissionRequestedDO As cDataObject
		'WfTaskModuleConfig table is used to save the Module and Class nodes of a module config file
		If Request.QueryString("WfTaskID") = "" OrElse Request.QueryString("WfTaskID") = "0" Then
			aWfTaskModuleConfigDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModuleConfig", "WfTaskID", aWfTaskDO.GetPropertyString("WfTaskID"))(0)
			If aWfTaskModuleConfigDO Is Nothing Then
				aWfTaskModuleConfigDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskModuleConfig")
			End If
			aWfTaskModuleConfigDO("WfTaskID") = aWfTaskDO.GetPropertyInt("WfTaskID")
			aWfTaskModuleConfigDO.SaveData()
			
			aWfTaskModuleDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModule", "WfTaskID", aWfTaskDO.GetPropertyString("WfTaskID"))(0)
			If aWfTaskModuleDO Is Nothing Then
				aWfTaskModuleDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskModule")
			End If
			aWfTaskRoleDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskRole", "TaskTypeID", aWfTaskDO.GetPropertyString("WfTaskTypeID"), "IsDefault", "True")(0)
			If Not aWfTaskRoleDO Is Nothing Then
				aWfTaskRoleID = aWfTaskRoleDO.GetPropertyInt("WfTaskRoleID")
			Else 
				aWfTaskRoleID = 1 'By Default RoleID = 1 for Application
			End If
			aWfTaskModuleDO("WfTaskRoleID") = aWfTaskRoleID
			aWfTaskModuleDO("WfTaskID") = aWfTaskDO.GetPropertyInt("WfTaskID")
			aWfTaskModuleDO("ModuleName") = aWfTaskDO.GetRelatedPropertyString("WfTaskType.WfTaskTypeAbbr")
			aWfTaskModuleDO("ModuleConfigFilename") = Regex.Replace(aWfTaskDO.GetPropertyString("WfTask") + aWfTaskDO.GetPropertyString("WfTaskID") + "Config", "[^\w\.@-]", "")
			aWfTaskModuleDO("OutcomeConfigFilename") = Regex.Replace(aWfTaskDO.GetPropertyString("WfTask") + aWfTaskDO.GetPropertyString("WfTaskID") + "OutcomeConfig", "[^\w\.@-]", "")
			aWfTaskModuleDO.SaveData()
			
			'WfTaskModuleConfigPageFrames table is used to save the PageFrames node of a module config file
			aWfTaskModuleConfigPageFramesDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModuleConfigPageFrames", "WfTaskID", aWfTaskDO.GetPropertyInt("WfTaskID"), "PageframeKey", "Option01")(0)
			If aWfTaskModuleConfigPageFramesDO Is Nothing Then
				aWfTaskModuleConfigPageFramesDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskModuleConfigPageFrames")
				aWfTaskModuleConfigPageFramesDO("WfTaskID") = aWfTaskDO.GetPropertyInt("WfTaskID")
				aWfTaskModuleConfigPageFramesDO("PageframeKey") = "Option01"
				aWfTaskModuleConfigPageFramesDO("PageframeCtl") = "Easygrants/Controls/PageFrame/ModuleBrowser01.ascx"
				aWfTaskModuleConfigPageFramesDO.SaveData()
			End If
			
			aWfTaskModuleConfigPageFramesDO = Nothing
			aWfTaskModuleConfigPageFramesDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModuleConfigPageFrames", "WfTaskID", aWfTaskDO.GetPropertyInt("WfTaskID"), "PageframeKey", "Option02")(0)
			If aWfTaskModuleConfigPageFramesDO Is Nothing Then
				aWfTaskModuleConfigPageFramesDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskModuleConfigPageFrames")
				aWfTaskModuleConfigPageFramesDO("WfTaskID") = aWfTaskDO.GetPropertyInt("WfTaskID")
				aWfTaskModuleConfigPageFramesDO("PageframeKey") = "Option02"
				aWfTaskModuleConfigPageFramesDO("PageframeCtl") = "Easygrants/Controls/PageFrame/EGModuleBrowser02.ascx"
				aWfTaskModuleConfigPageFramesDO.SaveData()
			End If
			
			aWfTaskModuleConfigPageFramesDO = Nothing
			aWfTaskModuleConfigPageFramesDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModuleConfigPageFrames", "WfTaskID", aWfTaskDO.GetPropertyInt("WfTaskID"), "PageframeKey", "Print")(0)
			If aWfTaskModuleConfigPageFramesDO Is Nothing Then
				aWfTaskModuleConfigPageFramesDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskModuleConfigPageFrames")
				aWfTaskModuleConfigPageFramesDO("WfTaskID") = aWfTaskDO.GetPropertyInt("WfTaskID")
				aWfTaskModuleConfigPageFramesDO("PageframeKey") = "Print"
				aWfTaskModuleConfigPageFramesDO("PageframeCtl") = "Easygrants/Controls/PageFrame/ModulePrint01.ascx"
				aWfTaskModuleConfigPageFramesDO.SaveData()
			End If

			If ctlTaskType.SelectedValue = 7 Then
				aWfTaskOutcomeResubmissionRequestedDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskOutcome", "WfTaskID", aWfTaskDO.GetPropertyInt("WfTaskID"), "WfTaskRoleID", aWfTaskRoleID, "WfTaskOutcome_Abbr", "ResubmissionRequested")(0)
				If aWfTaskOutcomeResubmissionRequestedDO Is Nothing Then
				aWfTaskOutcomeResubmissionRequestedDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskOutcome")
				aWfTaskOutcomeResubmissionRequestedDO("WfTaskID") = aWfTaskDO.GetPropertyInt("WfTaskID")
				aWfTaskOutcomeResubmissionRequestedDO("WfTaskRoleID") = aWfTaskRoleID
				aWfTaskOutcomeResubmissionRequestedDO("WfTaskOutcome_Abbr") = "ResubmissionRequested"
				aWfTaskOutcomeResubmissionRequestedDO("WfTaskOutcome") = "Resubmission Requested"
				aWfTaskOutcomeResubmissionRequestedDO.SaveData()
				End If
			End If

		End If
		
		'Dim aCheckBoxValues As String = ctlStandardForms.RetrieveRows
		'Dim aSelectedItems As String()
		'If Not aCheckBoxValues Is Nothing Then
		'	aSelectedItems = aCheckBoxValues.Split(",")
		'End If
		'Dim aWfTaskModuleConfigNavElementDOL As cDataObjectList
		'	Dim aDataObjectNode, aFiltersNode, aArgNode As XmlNode
		'	Dim aXmlDoc As cXMLDoc
		'	aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskModuleConfigNavElement", aDataObjectNode, aFiltersNode)
		'	aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aWfTaskDO.GetPropertyString("WfTaskID")))
		'	aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, "("))
		'	aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "FormTypeID", "3", ""))
		'	aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "StandardForms"))
		'	aArgNode = aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "FormTypeID", "4", "Or"))
		'	aArgNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentRelatedPropertyNode(aXMLDoc, "StandardForms"))
		'	aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, ")", ""))
		'	aWfTaskModuleConfigNavElementDOL = WebSession.DataObjectFactory.GetDataObjectList(aDataObjectNode)
		'If Not aSelectedItems Is Nothing AndAlso aSelectedItems.Length = 2 Then
		'	'If split length is 2 , then both Main and Review and Submit checkboxes are selected and we don't need to delete the existing ones.
		'	If aWfTaskModuleConfigNavElementDOL.Count <> 2 Then
		'		AddSelectedItems(aSelectedItems)
		'	End If
		'Else
		'	'Delete existing Main or review and Submit form and add only the ones that are checked
		'	If aWfTaskModuleConfigNavElementDOL.Count > 0 Then
		'		WebSession.DataObjectFactory.DeleteData(aWfTaskModuleConfigNavElementDOL)
		'	End If
		'	AddSelectedItems(aSelectedItems)

		'End If
		
	End Sub

	Private Sub ctlTaskType_IndexChange(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Dim aItem As ListItem
		If ctlTaskType.SelectedValue = "7" Then
			ctlFormType = CType(Me.FindControl("ctlFormType"), cDropDown)
			Dim aMasterFormTypeDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("MasterFormType", "MasterFormTypeID", "2")
			ctlFormType.Items.Clear()
			For Each aMasterFormTypeDO As cDataObject In aMasterFormTypeDOL
				aItem = New ListItem(aMasterFormTypeDO.GetPropertyString("Description"), aMasterFormTypeDO.GetPropertyString("MasterFormTypeID"))
				ctlFormType.Items.Add(aItem)
			Next
		End If
	End Sub
	
	'private Sub AddSelectedItems(ByVal aSelectedItems As String())
	'	Dim aSelectedItem As String
	'	If Not aSelectedItems Is Nothing AndAlso aSelectedItems.Length > 0 Then
	'		for each aSelectedItem in aSelectedItems
	'			Dim aStandardFormsDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("StandardForms", "FormTypeID", aSelectedItem)(0)
	'			If Not aStandardFormsDO Is Nothing Then
	'				Dim aWfTaskModuleConfigNavElementDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModuleConfigNavElement", "WfTaskID", aWfTaskDO.GetPropertyInt("WfTaskID"), "StandardFormsID", aStandardFormsDO.GetPropertyInt("StandardFormsID"))(0)
	'				If aWfTaskModuleConfigNavElementDO Is Nothing Then
	'					aWfTaskModuleConfigNavElementDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskModuleConfigNavElement")
	'					aWfTaskModuleConfigNavElementDO("WfTaskID") = aWfTaskDO.GetPropertyInt("WfTaskID")
	'					aWfTaskModuleConfigNavElementDO("StandardFormsID") = aStandardFormsDO.GetPropertyInt("StandardFormsID")
	'					aWfTaskModuleConfigNavElementDO("NavKey") = aStandardFormsDO.GetPropertyString("PageKey")
	'					aWfTaskModuleConfigNavElementDO("NavTitle") = aStandardFormsDO.GetPropertyString("PageTitle")
	'					aWfTaskModuleConfigNavElementDO("IsSubmissionSection") = False
	'					aWfTaskModuleConfigNavElementDO.SaveData()
	'				End If
	'			End If
	'		Next
	'	End If
	'End Sub
	
	Public Sub SavePageAndRedirect(ByVal PageKey As String, ByVal QueryString1 As String, ByVal QueryString2 As String, ByVal ValidateMasterPageType As String)
		If ValidateMasterPageType = "True" Then
			CtlDuplicateMain.Enabled = True
			CtlDuplicateReviewandSubmit.Enabled = True
		Else
			CtlDuplicateMain.Enabled = False
			CtlDuplicateReviewandSubmit.Enabled = False
		End If
		If EventController_Save(True) Then
			EventController_NavigateToModulePageKey(PageKey, QueryString1, QueryString2, "WfTaskID=" + aWfTaskDO.GetPropertyString("WfTaskID"))
		End If
	End Sub

	Public Sub ValidateDuplicateMain(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aWfTaskModuleConfigNavElementDOL As cDataObjectList
		ctlFormType = CType(Me.FindControl("ctlFormType"), cDropDown)
		If ctlFormType.SelectedValue = 1 Then
		aWfTaskModuleConfigNavElementDOL = Me.DataObjectCollection("WfTaskModuleConfigNavElementStandard")
		For Each aWfTaskModuleConfigNavElementDO As cDataObject In aWfTaskModuleConfigNavElementDOL
			If aWfTaskModuleConfigNavElementDO.GetRelatedPropertyString("StandardForms.FormTypeID") = 3 Then
				aArgs.IsValid = False
				Exit Sub
			End If
		Next
		End If
		aArgs.IsValid = True
   End Sub

	Public Sub ValidateDuplicateReviewandSubmit(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aWfTaskModuleConfigNavElementDOL As cDataObjectList
		ctlFormType = CType(Me.FindControl("ctlFormType"), cDropDown)
		If ctlFormType.SelectedValue = 3 Then
		aWfTaskModuleConfigNavElementDOL = Me.DataObjectCollection("WfTaskModuleConfigNavElementStandard")
		For Each aWfTaskModuleConfigNavElementDO As cDataObject In aWfTaskModuleConfigNavElementDOL
			If aWfTaskModuleConfigNavElementDO.GetRelatedPropertyString("StandardForms.FormTypeID") = 4 Then
				aArgs.IsValid = False
				Exit Sub
			End If
		Next
		End If
		aArgs.IsValid = True
   End Sub
End Class
End Namespace