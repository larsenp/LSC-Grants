Imports Core.DataAccess
Imports Core.Web
Imports System.Text.RegularExpressions
Imports Core_Web.Controls.Base
Imports System.Xml
Imports Core.DataAccess.XMLAccess

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration.TaskBuilder
Public MustInherit Class cEligibilityTaskBuilderEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
	'Protected ctlHelpFile As cTextBox
	
	'Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
	'	MyBase.CoreCtl_Load(aSrc, aEvent)
	'	ctlHelpFile = FindControl("ctlHelpFile")
		'If Not Request.QueryString("WfTaskID") = "" AndAlso Not Request.QueryString("WfTaskID") = "0" Then
		'	ctlHelpFile.Value = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModuleConfigNavElement", "WfTaskID", Request.QueryString("WfTaskID"))(0).GetPropertyString("HelpFile", "")
		'End If
	'End Sub
	
	Public Overrides Sub DataPresenter_SaveDataObjects()
		MyBase.DataPresenter_SaveDataObjects()
		
		Dim aWfTaskDO As cDataObject = CType(DataObjectCollection("WfTask"), cDataObjectList)(0)
		'Add module for eligiibility, NavigationKey named 'Eligibility', add outcomes Eligible and Ineligible
		
		Dim aWfTaskModuleConfigDO, aWfTaskModuleDO, aWfTaskModuleConfigPageFramesDO, aWfTaskModuleConfigNavElementDO, aWfTaskOutcomeEligibleDO, aWfTaskOutcomeNotEligibleDO, aWfTaskRoleDO As cDataObject
		Dim aWfTaskRoleID As Integer
		'WfTaskModuleConfig table is used to save the Module and Class nodes of a module config file
		If Request.QueryString("WfTaskID") = "" OrElse Request.QueryString("WfTaskID") = "0" Then
			aWfTaskModuleConfigDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModuleConfig", "WfTaskID", aWfTaskDO.GetPropertyString("WfTaskID"))(0)
			If aWfTaskModuleConfigDO Is Nothing Then
				aWfTaskModuleConfigDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskModuleConfig")
			End If
			aWfTaskModuleConfigDO("WfTaskID") = aWfTaskDO.GetPropertyInt("WfTaskID")
			aWfTaskModuleConfigDO("DefaultPageKey") = "Eligibility"
			aWfTaskModuleConfigDO("UniqueHashKey") = "_Eligibility"
			aWfTaskModuleConfigDO("PageName") = "EligibilityModuleContent.aspx"
			aWfTaskModuleConfigDO.SaveData()
			
			aWfTaskModuleDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModule", "WfTaskID", aWfTaskDO.GetPropertyString("WfTaskID"))(0)
			If aWfTaskModuleDO Is Nothing Then
				aWfTaskModuleDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskModule")
			End If
			aWfTaskRoleDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskRole", "TaskTypeID", aWfTaskDO.GetPropertyString("WfTaskTypeID"), "IsDefault", "True")(0)
			If Not aWfTaskRoleDO Is Nothing Then
				aWfTaskRoleID = aWfTaskRoleDO.GetPropertyInt("WfTaskRoleID")
			Else 
				aWfTaskRoleID = 11 'By Default RoleID = 11 for Eligibility
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
			
			'aWfTaskModuleConfigNavElementDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModuleConfigNavElement", "WfTaskID", aWfTaskDO.GetPropertyInt("WfTaskID"))(0)
			'If aWfTaskModuleConfigNavElementDO Is Nothing Then
			'	aWfTaskModuleConfigNavElementDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskModuleConfigNavElement")
			'	aWfTaskModuleConfigNavElementDO("WfTaskID") = aWfTaskDO.GetPropertyInt("WfTaskID")
			'	aWfTaskModuleConfigNavElementDO("StandardFormsID") = 8
			'	aWfTaskModuleConfigNavElementDO("NavKey") = "Eligibility"
			'	aWfTaskModuleConfigNavElementDO("NavTitle") = "Eligibility Quiz"
			'	aWfTaskModuleConfigNavElementDO("HelpFile") = ctlHelpFile.Value
			'	aWfTaskModuleConfigNavElementDO("SortOrder") = 1
			'	aWfTaskModuleConfigNavElementDO.SaveData()
			'End If
			
			aWfTaskOutcomeEligibleDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskOutcome", "WfTaskID", aWfTaskDO.GetPropertyInt("WfTaskID"), "WfTaskRoleID", aWfTaskRoleID, "WfTaskOutcome_Abbr", "Eligible")(0)
			If aWfTaskOutcomeEligibleDO Is Nothing Then
				aWfTaskOutcomeEligibleDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskOutcome")
				aWfTaskOutcomeEligibleDO("WfTaskID") = aWfTaskDO.GetPropertyInt("WfTaskID")
				aWfTaskOutcomeEligibleDO("WfTaskRoleID") = aWfTaskRoleID
				aWfTaskOutcomeEligibleDO("WfTaskOutcome_Abbr") = "Eligible"
				aWfTaskOutcomeEligibleDO("WfTaskOutcome") = "Eligible"
				aWfTaskOutcomeEligibleDO.SaveData()
			End If
			aWfTaskOutcomeNotEligibleDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskOutcome", "WfTaskID", aWfTaskDO.GetPropertyInt("WfTaskID"), "WfTaskRoleID", aWfTaskRoleID, "WfTaskOutcome_Abbr", "NotEligible")(0)
			If aWfTaskOutcomeNotEligibleDO Is Nothing Then
				aWfTaskOutcomeNotEligibleDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskOutcome")
				aWfTaskOutcomeNotEligibleDO("WfTaskID") = aWfTaskDO.GetPropertyInt("WfTaskID")
				aWfTaskOutcomeNotEligibleDO("WfTaskRoleID") = aWfTaskRoleID
				aWfTaskOutcomeNotEligibleDO("WfTaskOutcome_Abbr") = "NotEligible"
				aWfTaskOutcomeNotEligibleDO("WfTaskOutcome") = "Not Eligible"
				aWfTaskOutcomeNotEligibleDO.SaveData()
			End If
		End If
		
		
	End Sub
	
End Class
End Namespace