Imports Core.DataAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Web.User
Imports System.Text.RegularExpressions

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration.TaskBuilder
Public MustInherit Class cCopyTaskEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
	Protected ctlNewTaskName As cTextBox
	Protected ctlDescription As cTextBox
	'Protected valUniqueTaskName As CustomValidator
	
	Dim aWfTaskID As String = ""
	Dim aExistingWfTaskDO As cDataObject = Nothing
	
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		ctlNewTaskName = FindControl("ctlNewTaskName")
		ctlDescription = FindControl("ctlDescription")
		aWfTaskID = Request.QueryString("WfTaskID")
		aExistingWfTaskDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTask", "WfTaskID", aWfTaskID)(0)
		ctlNewTaskName.Value = aExistingWfTaskDO.GetPropertyString("WfTask")
		ctlDescription.Value = aExistingWfTaskDO.GetPropertyString("Comments")
	End Sub

	Public Overrides Sub DataPresenter_SaveDataObjects()
		
		aWfTaskID = Request.QueryString("WfTaskID")
		'Dim aExistingWfTaskDO As cDataObject
		If Not aExistingWfTaskDO Is Nothing Then
			Dim aNewWfTaskDO As cDataObject = WebSession.DataObjectFactory.CloneDataObject(aExistingWfTaskDO)
			aNewWfTaskDO("WfTask") = ctlNewTaskName.Value
			aNewWfTaskDO("Comments") = ctlDescription.Value
			'aNewWfTaskDO("WfTaskAbbr") = aExistingWfTaskDO("WfTaskAbbr")
			'aNewWfTaskDO("WfTaskTypeID") = aExistingWfTaskDO("WfTaskTypeID")
			'aNewWfTaskDO("HelpFile") = aExistingWfTaskDO("HelpFile")
			Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			aNewWfTaskDO("CreateUser") = aUser.UserID
			aNewWfTaskDO("CreateDate") = System.DateTime.Now
			aNewWfTaskDO.SaveData()
			
			Dim aNewWfTaskModuleDO As cDataObject = WebSession.DataObjectFactory.CloneDataObject(aExistingWfTaskDO.GetRelatedPropertyDataObject("WfTaskModule"))
			aNewWfTaskModuleDO("WfTaskID") = aNewWfTaskDO("WfTaskID")
			aNewWfTaskModuleDO("ModuleConfigFilename") = Regex.Replace(aNewWfTaskDO.GetPropertyString("WfTask") + aNewWfTaskDO.GetPropertyString("WfTaskID") + "Config", "[^\w\.@-]", "")
			aNewWfTaskModuleDO.SaveData()
			
			Dim aNewWfTaskModuleConfigDO As cDataObject = WebSession.DataObjectFactory.CloneDataObject(aExistingWfTaskDO.GetRelatedPropertyDataObject("WfTaskModuleConfig"))
			aNewWfTaskModuleConfigDO("WfTaskID") = aNewWfTaskDO("WfTaskID")
			aNewWfTaskModuleConfigDO.SaveData()
			
			Dim aExistingWfTaskOutcomeDOL As cDataObjectList = aExistingWfTaskDO.GetRelatedPropertyDataObjectList("WfTaskOutcome")
			Dim aExistingWfTaskOutcomeDO As cDataObject
			for each aExistingWfTaskOutcomeDO in aExistingWfTaskOutcomeDOL
				Dim aNewWfTaskOutcomeDO As cDataObject = WebSession.DataObjectFactory.CloneDataObject(aExistingWfTaskOutcomeDO)
				aNewWfTaskOutcomeDO("WfTaskID") = aNewWfTaskDO("WfTaskID")
				aNewWfTaskOutcomeDO.SaveData()
			Next
			
			Dim aExistingWfTaskModuleConfigNavElementDOL As cDataObjectList = aExistingWfTaskDO.GetRelatedPropertyDataObjectList("WfTaskModuleConfigNavElement")
			Dim aExistingWfTaskModuleConfigNavElementDO As cDataObject
			for each aExistingWfTaskModuleConfigNavElementDO in aExistingWfTaskModuleConfigNavElementDOL
				Dim aNewWfTaskModuleConfigNavElementDO As cDataObject = WebSession.DataObjectFactory.CloneDataObject(aExistingWfTaskModuleConfigNavElementDO)
				aNewWfTaskModuleConfigNavElementDO("WfTaskID") = aNewWfTaskDO("WfTaskID")
				aNewWfTaskModuleConfigNavElementDO.SaveData()
			Next
			
			Dim aExistingWfTaskModuleConfigPageFramesDOL As cDataObjectList = aExistingWfTaskDO.GetRelatedPropertyDataObjectList("WfTaskModuleConfigPageFrames")
			Dim aExistingWfTaskModuleConfigPageFramesDO As cDataObject
			for each aExistingWfTaskModuleConfigPageFramesDO in aExistingWfTaskModuleConfigPageFramesDOL
				Dim aNewWfTaskModuleConfigPageFramesDO As cDataObject = WebSession.DataObjectFactory.CloneDataObject(aExistingWfTaskModuleConfigPageFramesDO)
				aNewWfTaskModuleConfigPageFramesDO("WfTaskID") = aNewWfTaskDO("WfTaskID")
				aNewWfTaskModuleConfigPageFramesDO.SaveData()
			Next
			
		End If
	End Sub
	
	Public Sub ValidateUniqueTaskName(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aWfTaskDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTask", "WfTask", ctlNewTaskName.Value)
		If aWfTaskDOL.Count > 0 Then
			aArgs.IsValid = False
		End If
	End Sub
	
End Class

End Namespace